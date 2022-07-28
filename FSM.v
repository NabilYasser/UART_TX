module FSM (
    input wire clk,
    input wire RST,
    input wire Data_Valid,
    input wire Par_En,
    input wire Ser_done,
    output reg Ser_En,
    output reg Busy,
    output reg [1:0] Mux_Sel

);

reg [1:0] Current_State;
reg [1:0] Next_State;

    localparam Idle =2'b00,
               Start=2'b01,
               Data=2'b11,
               Parity=2'b10;

always @(posedge clk or negedge RST) begin
    if (!RST) begin
        Current_State<=Idle;
    end else begin
        Current_State<=Next_State;
    end
end

always @(*) begin
    
    case (Current_State)
        Idle:begin
            Mux_Sel=2'b01;
            Busy=1'b0;
            Ser_En=1'b0;
            if (Data_Valid) begin
                Next_State=Start;
            end else begin
                Next_State=Idle;
            end
        end

        Start:begin
            Mux_Sel=2'b00;
            Busy=1'b1;
            Ser_En=1'b1;
            Next_State=Data;
        end

        Data:begin
            Mux_Sel=2'b10;
            Busy=1'b1;
            Ser_En=1'b1;
            if (!Ser_done) begin
                Next_State=Data;
            end else begin
                if (Par_En) begin
                     Next_State=Parity;
                end else begin
                    Next_State=Idle;
                end
            end
        end

        Parity:begin
            Mux_Sel=2'b11;
            Busy=1'b1;
            Ser_En=1'b0;
            Next_State=Idle;
        end 

    endcase
end

endmodule