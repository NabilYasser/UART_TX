module Serializer #(
   parameter Data_Width=8
) (
    input wire [7:0] P_Data,
    input wire clk,
    input wire [2:0] Counter,
    output reg Ser_Data
);
    always @(posedge clk ) begin
        Ser_Data<=P_Data[Counter];
    end
endmodule