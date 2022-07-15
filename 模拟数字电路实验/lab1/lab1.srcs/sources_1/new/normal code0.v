`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/10/23 09:27:40
// Design Name: 
// Module Name: normal code0
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


module normalcode0(
    input [9:0] x,
    output [3:0] nd,
    output GS
    );
    assign nd[0]=~(x[9]&x[8]);
    assign nd[1]=~(x[6]&x[7]&x[5]&x[4]); 
    assign nd[2]=~(x[6]&x[7]&x[2]&x[3]);
    assign nd[3]= ~(x[9]&x[7]&x[5]&x[3]&x[1]);
    assign w=~(nd[0]|nd[1]|nd[2]|nd[3]);
    assign GS=~(x[0]&w);
endmodule
