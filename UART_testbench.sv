// Code your testbench here
// or browse Examples
module test_uart;
  reg start, clk;
  reg [6:0] tx_data_in;
  wire tx_data_out;
  reg rx_data_in;
  wire [6:0] rx_data_out ;
  
  Duplex_UART d_uart(tx_data_in,tx_data_out,rx_data_in,rx_data_out,clk,start);
  
  initial begin 
    // Dump waves
    $dumpfile("dump.vcd");
    $dumpvars(1);
    clk = 0 ;
    start = 0;
    #1;
    rx_data_in = 0;
    tx_data_in = 7'b1001100;
    start = 1;
    #1;
    start = 0 ;
    #1;
    #5;
    rx_data_in = 1;
    #6;
    rx_data_in = 1;
    #6;
    rx_data_in = 1;
    #6;
    rx_data_in = 0;
    #6;
    rx_data_in = 1;
    #6;
    rx_data_in = 0;
    #6;
    rx_data_in = 1;
    #6;
    #30;
    $finish;
  end
  
  always begin 
    #3;
    clk=~clk;
  end
  
endmodule
  
  
  