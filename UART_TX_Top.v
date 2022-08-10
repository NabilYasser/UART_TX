module UART_TX_Top #(
    parameter Data_Width=8
) (
    input wire clk,
    input wire RST,
    input wire [7:0] P_Data_UART,
    input wire Data_Valid_UART,
    input wire Par_En_UART,
    input wire Par_Type_UART,
    output wire TX_Out_UART,
    output wire Busy_UART
);

wire Ser_Done,Ser_Data_Top,Ser_En;
wire [1:0] Mux_Sel;
wire Par_Bit;
    

Serializer_Top #(
    .Data_Width (Data_Width )
)
u_Serializer_Top(
    .Ser_En       (Ser_En       ),
    .RST          (RST          ),
    .clk          (clk          ),
    .Data_Valid(Data_Valid_UART),
    .P_Data_Top   (P_Data_UART   ),
    .Ser_Data_Top (Ser_Data_Top ),
    .Ser_Done     (Ser_Done     )
);

FSM u_FSM(
    .clk        (clk        ),
    .RST        (RST        ),
    .Data_Valid (Data_Valid_UART ),
    .Par_En     (Par_En_UART     ),
    .Ser_done   (Ser_Done   ),
    .Ser_En     (Ser_En     ),
    .Busy       (Busy_UART       ),
    .Mux_Sel    (Mux_Sel    )
);

Parity_Unit u_Parity_Unit(
    .clk        (clk        ),
    .Data_Valid (Data_Valid_UART ),
    .P_Data     (P_Data_UART     ),
    .Par_Type   (Par_Type_UART   ),
    .Par_Bit    (Par_Bit    )
);

Mux_4 u_Mux_4(
    .clk      (clk      ),
    .Mux_Sel  (Mux_Sel  ),
    .Ser_Data (Ser_Data_Top ),
    .Par_Bit  (Par_Bit  ),
    .TX_Out   (TX_Out_UART   )
);



endmodule