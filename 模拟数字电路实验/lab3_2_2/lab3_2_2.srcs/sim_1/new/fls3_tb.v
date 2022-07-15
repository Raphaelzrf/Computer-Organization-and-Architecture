`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/11/07 08:31:42
// Design Name: 
// Module Name: fls3_tb
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


module fls_tb(
    );
    reg clk,rstn,en;
    reg [7:0] d;
    wire [7:0] f;
    wire err;
    integer i;
    fls fl(clk,rstn,en,d[7:0],f[7:0],err);
    initial 
    begin
	   clk = 0;
	   rstn=0;
	   #5 clk=1;
	   #2 begin 
	       clk=0;
	       rstn=1;
	       en=1;
	   end
	   #3 d=8'h02;
	   #5 begin
	       clk=~clk;
	   end
	   #5 begin
	       d=8'h03;
	       clk=~clk;
	   end
	   #5 begin
	       clk=~clk;
	   end
	   for(i = 0;i<50;i = i+1)
	   begin
		  #5 begin
		     clk = ~clk;
		  end
	   end
	   #5$finish;
    end
endmodule