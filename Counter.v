module Counter #(
   parameter Data_Width=8
) (
    input wire RST,
    input wire clk,
    output reg [2:0] Counter,
    output reg Finish
);
wire DFlag;

    always @(posedge clk or negedge RST ) begin
       if (!RST) begin
        Counter<=3'b0;
       end
       else begin
        Counter<= Counter+1'b1;
       end
    end

    assign DFlag=(Counter==3'b111);

    always @(posedge clk ) begin
        Finish<=DFlag;
    end
endmodule