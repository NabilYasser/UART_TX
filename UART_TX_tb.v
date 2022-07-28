`timescale 1ns/100ps
module UART_TX_tb #(
    parameter Data_Width=8
) ();

    reg clk_tb;
    reg RST_tb;
    reg [7:0] P_Data_UART_tb;
    reg Data_Valid_UART_tb;
    reg Par_En_UART_tb;
    reg Par_Type_UART_tb;
    wire TX_Out_UART_tb;
    wire Busy_UART_tb;

parameter CLK_PERIOD =5 ;


  always  #(2.5) clk_tb = ~ clk_tb;  
 
   initial begin
     $dumpfile("UART_Tx.vcd");
     $dumpvars ;
   
     //initial values
     clk_tb = 1'b0;
     RST_tb=1'b0;
     P_Data_UART_tb=8'b10101010;
     Data_Valid_UART_tb=1'b0;
     Par_En_UART_tb=1'b0;
     Par_Type_UART_tb=1'b0;

     $display ("*** TEST CASE #1 ***");
     #CLK_PERIOD
     #CLK_PERIOD
     if(TX_Out_UART_tb)begin
        $display("RST Is Working PASSED");
     end else begin
        $display("RST Is Not Working FAILED");
     end

     $display ("*** TEST CASE #2 ***");
     RST_tb=1'b1;
     #CLK_PERIOD
     if(TX_Out_UART_tb)begin
        $display("Data Valid Is Working PASSED");
     end else begin
        $display("Data Valid Is Not Working FAILED");
     end

     $display ("*** TEST CASE #3 ***");
     Data_Valid_UART_tb=1'b1;
     #CLK_PERIOD
     #CLK_PERIOD
     if(!TX_Out_UART_tb)begin
        $display("Start Bit Is Working PASSED");
     end else begin
        $display("Start Bit Is Not Working FAILED");
     end

     $display ("*** TEST CASE #4 ***");
     Data_Valid_UART_tb=1'b0;
     #CLK_PERIOD
     if(!TX_Out_UART_tb)begin
        $display("b0 Is Working PASSED");
     end else begin
        $display("b0 Is Not Working FAILED");
     end
     $display ("*** TEST CASE #5 ***");
     #CLK_PERIOD
     if(TX_Out_UART_tb)begin
        $display("b1 Is Working PASSED");
     end else begin
        $display("b1 Is Not Working FAILED");
     end

     $display ("*** TEST CASE #6 ***");
     #CLK_PERIOD
     if(!TX_Out_UART_tb)begin
        $display("b2 Is Working PASSED");
     end else begin
        $display("b2 Is Not Working FAILED");
     end

     $display ("*** TEST CASE #7 ***");
     #CLK_PERIOD
     if(TX_Out_UART_tb)begin
        $display("b3 Is Working PASSED");
     end else begin
        $display("b3 Is Not Working FAILED");
     end

     $display ("*** TEST CASE #8 ***");
     #CLK_PERIOD
     if(!TX_Out_UART_tb)begin
        $display("b4 Is Working PASSED");
     end else begin
        $display("b4 Is Not Working FAILED");
     end

     $display ("*** TEST CASE #9 ***");
     #CLK_PERIOD
     if(TX_Out_UART_tb)begin
        $display("b5 Is Working PASSED");
     end else begin
        $display("b5 Is Not Working FAILED");
     end

     $display ("*** TEST CASE #10 ***");
     #CLK_PERIOD
     if(!TX_Out_UART_tb)begin
        $display("b6 Is Working PASSED");
     end else begin
        $display("b6 Is Not Working FAILED");
     end

     $display ("*** TEST CASE #11 ***");
     #CLK_PERIOD
     if(TX_Out_UART_tb)begin
        $display("b7 Is Working PASSED");
     end else begin
        $display("b7 Is Not Working FAILED");
     end

     $display ("*** TEST CASE #12 ***");
     #CLK_PERIOD
     if(TX_Out_UART_tb)begin
        $display("No Parity Bit Is Working PASSED");
     end else begin
        $display("No Parity Bit Is Not Working FAILED");
     end

     $display ("*** TEST CASE #13 ***");
     #CLK_PERIOD
     if(TX_Out_UART_tb)begin
        $display("Data Valid =0 line is ideal after finshing transmitting PASSED ");
     end else begin
        $display("Data Valid =0 line is NOT ideal after finshing transmitting FAILED");
     end

     $display ("*** TEST CASE #14 ***");
     Par_En_UART_tb=1'b1;
     Data_Valid_UART_tb=1'b1;
     #CLK_PERIOD
     #CLK_PERIOD
     #CLK_PERIOD
     #CLK_PERIOD
     #CLK_PERIOD
     #CLK_PERIOD
     #CLK_PERIOD
     #CLK_PERIOD
     #CLK_PERIOD
     #CLK_PERIOD
     #CLK_PERIOD

     if(!TX_Out_UART_tb)begin
        $display("Even Parity PASSED ");
     end else begin
        $display("Even Parity FAILED");
     end

     $display ("*** TEST CASE #15 ***");
     #CLK_PERIOD
     #CLK_PERIOD
     if(!TX_Out_UART_tb)begin
        $display("two consecutive Data valid PASSED ");
     end else begin
        $display("two consecutive Data valid FAILED");
     end
     
     


     $display ("*** TEST CASE #16 ***");
     Par_En_UART_tb=1'b1;
     Data_Valid_UART_tb=1'b1;
     #CLK_PERIOD
     #CLK_PERIOD
     #CLK_PERIOD
     #CLK_PERIOD
     #CLK_PERIOD
     #CLK_PERIOD
     #CLK_PERIOD
     #CLK_PERIOD
     if(TX_Out_UART_tb)begin
        $display("Odd Parity PASSED ");
     end else begin
        $display("Odd Parity PASSED FAILED");
     end

   
     
     #CLK_PERIOD


     $stop;




   end




    UART_TX_Top 
    #(
        .Data_Width (Data_Width )
    )
    u_UART_TX_Top(
    	.clk             (clk_tb             ),
        .RST             (RST_tb             ),
        .P_Data_UART     (P_Data_UART_tb     ),
        .Data_Valid_UART (Data_Valid_UART_tb ),
        .Par_En_UART     (Par_En_UART_tb     ),
        .Par_Type_UART   (Par_Type_UART_tb   ),
        .TX_Out_UART     (TX_Out_UART_tb     ),
        .Busy_UART       (Busy_UART_tb       )
    );
    
endmodule