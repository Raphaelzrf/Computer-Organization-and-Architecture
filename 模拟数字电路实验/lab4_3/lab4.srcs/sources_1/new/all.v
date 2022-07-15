`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/11/17 16:43:34
// Design Name: 
// Module Name: all
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


module all(
    input x,
    input rstn,
    input clk,
    output [3:0] an,
    output [6:0] seg
    );
    wire y,s,ce,z;
    wire [15:0] cnt;
    DB d1(x,rstn,clk,y);
    FDG fd(y,clk,rstn,z);
    SYN s1(clk,z,s);
    PS p1(s,clk,ce);
    counter16 c3(clk,rstn,0,ce,0,cnt[15:0]);
    DIS d4(cnt[15:0],clk,rstn,an[3:0],seg[6:0]);
endmodule
