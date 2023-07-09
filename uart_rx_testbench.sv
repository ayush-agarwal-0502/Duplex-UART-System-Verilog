// Code your testbench here
// or browse Examples
// Code your testbench here
// or browse Examples
module test_uart_rx;
  reg data_in,clk;
  wire [6:0] data_out;
  
  uart_rx u_rx(data_in,clk,data_out);
  
  initial begin 
    // Dump waves
    $dumpfile("dump.vcd");
    $dumpvars(1);
    data_in = 0 ;
    clk = 0 ;
    #5;
    data_in = 1;
    #6;
    data_in = 0;
    #6;
    data_in = 1;
    #6;
    data_in = 1;
    #6;
    data_in = 0;
    #6;
    data_in = 1;
    #6;
    data_in = 0;
    #6;
    data_in = 1;
    #6;
    // data ahead of this would go into next packet 
    data_in = 1;
    #12;
    $finish;
  end
  
  always begin 
    #3;
    clk=~clk;
  end
  
endmodule 