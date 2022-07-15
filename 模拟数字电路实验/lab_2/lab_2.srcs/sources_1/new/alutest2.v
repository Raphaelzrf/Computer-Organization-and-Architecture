`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/10/31 16:04:56
// Design Name: 
// Module Name: alutest2
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


module alutest(
    input [3:0] a,
    input [3:0] b,
    input [2:0] s,
    input en,
    input clk,
    output [3:0] y,
    output [2:0] f
    );
    wire [2:0] w1,w4;
    wire [3:0] w2,w3,w5;
    register3 r1(s[2:0],en,clk,w1[2:0]);
    register R1(a[3:0],en,clk,w2[3:0]);
    register r2(b[3:0],en,clk,w3[3:0]);
    alu a1(w2[3:0],w3[3:0],w1[2:0],w5[3:0],w4[0],w4[1],w4[2]);
    register3 R2(w4[2:0],en,clk,f[2:0]);
    register r3(w5[3:0],en,clk,y[3:0]);
endmodule

