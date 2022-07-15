`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/11/14 16:03:49
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


    module DIS(
    input [15:0] d,
    input clk,
    input rstn,
    output [3:0] an,
    output [6:0] seg
    );
    wire clkd;
    wire [1:0] cnt;
    wire [3:0] c;
    FD f1(clk,rstn,clkd);
    counter c1(clkd,rstn,0,1,d[15:0],cnt[1:0]);
    decode2 d21(cnt[1:0],d[15:0],an[3:0]);
    mux_4_1 m1(cnt[1:0],d[15:0],c[3:0]);
    decode7 d71(c[3:0],seg[6:0]);
endmodule
