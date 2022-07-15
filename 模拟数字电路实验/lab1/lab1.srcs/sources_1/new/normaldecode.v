`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/10/23 10:06:52
// Design Name: 
// Module Name: normaldecode
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


module normaldecode(
    input [3:0] i,
    input EI,
    output [9:0] y
    );
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
