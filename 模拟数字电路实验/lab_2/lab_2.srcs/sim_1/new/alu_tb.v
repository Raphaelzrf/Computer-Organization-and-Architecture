`timescale 1ns / 100ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/10/31 15:28:25
// Design Name: 
// Module Name: alu_tb
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////



module alu_tb( 
    );
    
reg[3:0] a,b;
reg[2:0] s;
wire[3:0] y;
wire cf,of,zf;
alu A1(a,b,s,y,cf,of,zf);

integer i=0;

initial begin
  s = 3'b000; 
  #10 ;
  for (i=0;i<10;i=i+1)
    begin
      #10	s=3'b000;
      #10 s=3'b001;
      #10	s=3'b010;
      #10 s=3'b011;
      #10 s=4'b100;
    end
end 

initial begin
  a = 4'h0 ; 
  b = 4'h0 ;
#10;

  a = 4'ha ; 
  b = 4'hb ;
#60;
  a = 4'h8; 
  b = 4'ha ;
#60;
  a = 4'hf ; 
  b = 4'hf ;
#60;
  a = 4'h7 ; 
  b = 4'h1 ;
#60;
  a = 4'h2 ; 
  b = 4'h3 ;
#60;
  a = 4'h5 ; 
  b = 4'hd ;
#60;
  a = 4'h0 ; 
  b = 4'h0 ;
#60;
  a = 4'h0 ; 
  b = 4'h3 ;
#60;
  a = 4'hb ; 
  b = 4'ha ;
#60;
  a = 4'h7 ; 
  b = 4'hf ;
end

endmodule
