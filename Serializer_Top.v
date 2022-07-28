module Serializer_Top #(
    parameter Data_Width=8
) (
    input wire Ser_En,
    input wire RST,
    input wire clk,
    input wire [7:0] P_Data_Top,
    output wire Ser_Data_Top,
    output wire Ser_Done

);
wire [2:0] Counter_Top;
wire Counter_RST= Ser_En & RST;

Counter 
#(
    .Data_Width (Data_Width )
)
u_Counter(
    .RST     (Counter_RST     ),
    .clk     (clk     ),
    .Counter (Counter_Top ),
    .Finish  (Ser_Done  )
);

Serializer #(
    .Data_Width (Data_Width )
)
u_Serializer(
    .P_Data   (P_Data_Top   ),
    .clk      (clk      ),
    .Counter  (Counter_Top  ),
    .Ser_Data (Ser_Data_Top )
);


    
endmodule