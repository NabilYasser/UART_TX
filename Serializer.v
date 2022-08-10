module Serializer #(
   parameter Data_Width=8
) (
    input wire [Data_Width-1:0] P_Data,
    input wire clk,
    input wire rst,
    input wire Ser_En,
    input wire Data_Valid,
    input wire [2:0] Counter,
    output wire Ser_Data
);
reg [Data_Width-1:0] Data;

always @(posedge clk or negedge rst) begin
    if (!rst) begin
        Data<='b0;
    end else if(Data_Valid) begin
        Data<=P_Data;
    end else if (Ser_En) begin
        Data<=Data>>1;
    end
end
assign Ser_Data=Data[0];
endmodule