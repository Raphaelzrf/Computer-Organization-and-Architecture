`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/03/16 23:02:47
// Design Name: 
// Module Name: _6bit_adder
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

module _6bit_adder #(parameter WIDTH = 6)
(
    
    input [WIDTH-1:0] A,
    input [WIDTH-1:0] B,
    input C_1,
    output [WIDTH-1:0] S,
    output C5,
    output C4
);
    wire C0,C1,C2,C3,C4,C5;
    alladder a1(A[0],B[0],C_1,S[0],C0);
    alladder a2(A[1],B[1],C0,S[1],C1);
    alladder a3(A[2],B[2],C1,S[2],C2);
    alladder a4(A[3],B[3],C2,S[3],C3);
    alladder a5(A[4],B[4],C3,S[4],C4);
    alladder a6(A[5],B[5],C4,S[5],C5);
endmodule
