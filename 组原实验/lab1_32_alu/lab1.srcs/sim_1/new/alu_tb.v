`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/03/16 16:58:59
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

module alu_tb #(parameter WIDTd=6)
( 
    );
    
reg[WIDTd-1:0] a,b;
reg[2:0] s;
wire[WIDTd-1:0] y;
wire cf,of,zf;
alu AA1(a,b,s,y,cf,of,zf);

integer i=0;

initial begin
  s = 3'b000; 
  
  for (i=0;i<10;i=i+1)
    begin
      #10 s=3'b000;
      #10 s=3'b001;
      #10 s=3'b100;
      #10 s=3'b101;
      #10 s=3'b110;
      #10 s=3'b111;
    end
end 

initial begin
  a = 6'd0 ; 
  b = 6'd0 ;
#10;

  a = 6'd30 ; 
  b = 6'd31 ;
#60;
  a = 6'd20; 
  b = 6'd20 ;
#60;
  a = 6'd20 ; 
  b = 6'd5 ;
#60;
  a = 6'd10 ; 
  b = 6'd25 ;
#60;
  a = 6'd10 ; 
  b = 6'd10 ;
#60;
  a = 6'd62 ; 
  b = 6'd63 ;
#60;
  a = 6'd40 ; 
  b = 6'd40 ;
#60;
  a = 6'd36 ; 
  b = 6'd30 ;
#60;
  a = 6'd14 ; 
  b = 6'd13 ;
#60;
  a = 6'd55 ; 
  b = 6'd55 ;
end

endmodule
