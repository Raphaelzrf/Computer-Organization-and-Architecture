`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/03/22 19:37:18
// Design Name: 
// Module Name: SDU
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

module SDU #(parameter WIDTd = 4)
(
    input clk,
    input rst,
    input [WIDTd-1:0] y,
    input [7:0] valid,
    output [2:0] cnt,
    output [7:0] a,
    output [6:0] led
);
wire clkd;
wire [3:0] dd;
fpq b0(rst,clk,clkd);
counter2 b1(clkd,rst,0,1,0,cnt);
decodercnt b4(cnt,valid,a);
decoder7 b3(y,led); 
endmodule
