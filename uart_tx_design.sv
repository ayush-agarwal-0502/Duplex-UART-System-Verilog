// Code your design here

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
    
    