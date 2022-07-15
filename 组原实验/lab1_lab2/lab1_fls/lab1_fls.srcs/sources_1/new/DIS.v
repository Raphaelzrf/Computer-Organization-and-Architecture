`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/03/16 23:04:53
// Design Name: 
// Module Name: DIS
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

module DIS #(parameter WIDTd = 6)
(
    input clk,
    input rst,
    input [WIDTd-1:0] y,
    output [7:0] a,
    output [6:0] led
);
wire clkd;
wire [3:0] dd;
wire  cnt;
fpq b0(rst,clk,clkd);
counter2 b1(clkd,rst,0,1,0,cnt);
decodercnt b4(cnt,a);
mux b2(cnt,y,dd);
decoder7 b3(dd,led); 
endmodule
