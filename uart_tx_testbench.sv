// Code your testbench here
// or browse Examples

module uart_tx_test;
  reg start , clk ;
  reg [7:0] data_in;
  wire data_out;
  
  uart_tx u_tx(start,clk,data_in,data_out);
  
  initial begin 
    // Dump waves
    $dumpfile("dump.vcd");
    $dumpvars(1);
    clk = 0 ;
    start = 0;
    #1;
    data_in = 7'b1001100;
    start = 1;
    #1;
    start = 0 ;
    #1;
    #47;
    $finish;
  end
  
  always begin 
    #3;
    clk = ~clk;
  end
endmodule