// Code your design here

module Duplex_UART(tx_data_in,tx_data_out,rx_data_in,rx_data_out,clk,start);
  input start, clk;
  input [6:0] tx_data_in;
  output tx_data_out;
  input rx_data_in;
  output [6:0] rx_data_out ;
  
  uart_tx u_tx(start,clk,tx_data_in,tx_data_out);
  uart_rx u_rx(rx_data_in,clk,rx_data_out);
  
endmodule

// UART Transmitter 
module uart_tx(start,clk,data_in,data_out);
  input start ,clk ;
  input [6:0] data_in;
  output data_out;
  
  reg active;
  integer count;
  wire [7:0] data_in_temp = {data_in,1'b1} ; 
  
  assign data_out = active ? data_in_temp[count] : 1'bx ;
  
  always @(posedge start) begin 
	active = 1;
    count = 0 ;
  end
  
  always @(posedge clk) begin
    
    if(count==7) begin
      active=0;
      count = 0;
    end
    if(active==1) begin
      count = count + 1;
    end
    
  end
  
endmodule

// UART Receiver 
module uart_rx(data_in,clk,data_out);
  input data_in, clk;
  output reg [6:0] data_out=0;
  reg [7:0] data_out_temp=0;
  integer count=0 ;
  reg active=0 ;
  
  always @(posedge data_in) begin 
    if(active==0) begin
      count = 0 ;
      active = 1 ;
    end
  end
  
  always @(posedge clk) begin 
    if(count==8) begin 
      count = 0 ;
      active = 0 ;
    end
    if(active==1) begin 
      data_out_temp[count] <= data_in;
      count = count + 1 ;
    end
  end
  
  always @(negedge active) begin 
    data_out = data_out_temp[7:1];
  end
  
endmodule