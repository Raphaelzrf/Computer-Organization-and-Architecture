`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/11/05 22:27:19
// Design Name: 
// Module Name: sir_tb
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 00//bbbbbbbbbbbbbbbbbbbbbb
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
/////////////////////////////////////////////////////////////////////////////////


module sir_tb(
    );
    reg clk,rstn,x;
    wire y;
    wire [7:0] rx,ry;
   sir s1(clk,rstn,x,y,rx[7:0],ry[7:0]);
  // sir s1(x,rstn,clk,y,rx[7:0],ry[7:0]);
    integer i;
    initial 
    begin
	   clk = 0;
	   rstn=0;
	   #5 clk=1;
	   #5 begin 
	       clk=0;
	       rstn=1;
	       x=0;
	   end
	   for(i = 0;i<16;i = i+1)
	   begin
		  #5 begin
		     clk <= ~clk; 
		     x<=0;
		  end
	   end
	   for(i = 0;i<16;i = i+1)
	   begin
		  #5 begin
		     clk <= ~clk; 
		     x<=1;
		  end
	   end
	   for(i = 0;i<16;i = i+1)
	   begin
		  #5 begin
		     clk <= ~clk; 
		     x<=0;
		  end
	   end
	   #5$finish;
    end
endmodule
