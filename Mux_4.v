module Mux_4 (
    input wire clk,
    input wire [1:0] Mux_Sel,
    input wire Ser_Data,
    input wire Par_Bit,
    output reg TX_Out

);

wire Start_Bit=1'b0;
wire Stop_Bit=1'b1;

always @(posedge clk ) begin
    case (Mux_Sel)
    2'b00: begin
        TX_Out<=Start_Bit;
    end
    
    2'b01: begin
        TX_Out<=Stop_Bit;
    end

    2'b10: begin
        TX_Out<=Ser_Data;
    end

    2'b11: begin
        TX_Out<=Par_Bit;
    end
endcase
end

    
endmodule