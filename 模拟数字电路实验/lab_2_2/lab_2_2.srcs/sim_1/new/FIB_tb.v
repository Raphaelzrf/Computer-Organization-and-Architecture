`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/10/31 19:55:39
// Design Name: 
// Module Name: FIB_tb
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


module FIB_tb(
);

    reg rst,en;
    wire [3:0] fn;
    reg clk;
    parameter CYCLE = 10, Number = 20;// 时钟周期和个数
    FIB f1(clk,rst,en,fn[3:0]);
    initial  begin
     clk = 0;
     rst=1;
     en=1;
     #5 clk=~clk;
     #5 rst=0;
     repeat (2*Number)begin
         # 5 clk=~clk;
     end
     #5 $finish;
    end
endmodule
