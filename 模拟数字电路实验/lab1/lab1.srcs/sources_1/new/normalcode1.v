`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/10/23 22:11:02
// Design Name: 
// Module Name: normalcode1
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


module normalcode1(
    input [3:0] j,
    input EI,
    output [9:0] y
    );
    wire [3:0] i;
    assign i[0]=j[3]&j[1]&~j[2];
    assign i[1]=(~j[1]&~j[0])|(j[3]&~j[1])|(j[0]&j[3]);
    assign i[2]=~j[2];
    assign i[3]=(~j[3]&~j[1]&j[0])|(~j[0]&j[1]&j[2]&~j[3])|(j[3]&~j[1]&~j[0])|(j[0]&j[1]&j[3])|(j[3]&~j[2]);
    assign y[0]=~i[0]&~i[1]&~i[2]&~i[3]&EI;
    assign y[1]=~i[0]&~i[1]&~i[2]&i[3]&EI;
    assign y[2]=~i[0]&~i[1]&i[2]&~i[3]&EI;
    assign y[3]=~i[0]&~i[1]&i[2]&i[3]&EI;
    assign y[4]=~i[0]&i[1]&~i[2]&~i[3]&EI;
    assign y[5]=~i[0]&i[1]&~i[2]&i[3]&EI;
    assign y[6]=~i[0]&i[1]&i[2]&~i[3]&EI;
    assign y[7]=~i[0]&i[1]&i[2]&i[3]&EI;
    assign y[8]=i[0]&~i[1]&~i[2]&~i[3]&EI;
    assign y[9]=i[0]&~i[1]&~i[2]&i[3]&EI;
endmodule
