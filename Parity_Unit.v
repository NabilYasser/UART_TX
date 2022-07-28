module Parity_Unit (
    input wire clk,
    input wire Data_Valid,
    input wire [7:0] P_Data,
    input wire Par_Type,
    output reg Par_Bit
);
always @(posedge clk ) begin
    if (!Par_Type) begin
        Par_Bit<=^P_Data; 

    end
    else begin
        Par_Bit<=~^P_Data; 
    end
    
end
    
endmodule