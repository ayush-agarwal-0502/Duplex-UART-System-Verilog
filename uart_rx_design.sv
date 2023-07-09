// Code your design here

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