`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/10/31 19:36:47
// Design Name: 
// Module Name: FIB
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


module FIB(
    input clk,rst,en,
    output [3:0] fn
    );
    wire [3:0] w1,w2,w3,w4;
    register1 r1(w1[3:0],rst,en,clk,w2[3:0]);
    register2 r2(w3[3:0],rst,en,clk,w1[3:0]);
    register2 r3(w3[3:0],rst,en,clk,fn[3:0]);
    alu A1(w2[3:0],w1[3:0],3'b000,w3[3:0]);
endmodule
