`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/03/22 19:47:10
// Design Name: 
// Module Name: SEDG
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


module SEDG(
    input clk,
    input a,
    output s,
    output p
    );
    SYN s1(.clk(clk), .a(a), .s(s));
    PS p1(.clk(clk), .s(s), .p(p));
endmodule
