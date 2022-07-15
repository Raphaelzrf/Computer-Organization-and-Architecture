`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/10/28 20:40:44
// Design Name: 
// Module Name: _4bit_adder
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


module _4bit_adder(
    input [3:0] A,
    input [3:0] B,
    input C_1,
    output [3:0] S,
    output C3,
    output C2
    );
    wire C0,C1;
    alladder a1(A[0],B[0],C_1,S[0],C0);
    alladder a2(A[1],B[1],C0,S[1],C1);
    alladder a3(A[2],B[2],C1,S[2],C2);
    alladder a4(A[3],B[3],C2,S[3],C3);
endmodule
