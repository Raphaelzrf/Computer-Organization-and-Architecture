`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/03/15 23:42:30
// Design Name: 
// Module Name: alladder
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


module alladder(
    input A,
    input B,
    input Ci,
    output S,
    output C0
    );
    wire w1,w2,w3;
    HalfAdder h0(A,B,w1,w2);
    HalfAdder h1(w1,Ci,S,w3);
    or o0(C0,w2,w3);
endmodule
