`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/11/14 18:39:47
// Design Name: 
// Module Name: DIS_tb
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



module DIS_tb(
  );
  reg [15:0] d;
  reg clk,rstn;
  wire [3:0] an;
  wire [6:0] seg;
  integer i=0;
  DIS d1(d[15:0],clk,rstn,an[3:0],seg[7:0]);
  initial begin
      clk=0;
      rstn=0;
      #5 clk=1;
      #5 begin
          clk=0;
          rstn=1;
          d=16'h1234;
      end
      for (i=0;i<300000000;i=i+1) begin
          #5 clk=~clk;
      end
      $finish;
  end
endmodule   
