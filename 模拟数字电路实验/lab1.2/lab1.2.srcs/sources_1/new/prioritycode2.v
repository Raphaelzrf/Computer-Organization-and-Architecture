`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/10/23 23:02:01
// Design Name: 
// Module Name: prioritydecode2
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


module prioritydecode2(
    input [3:0] j,
    input EI,
    output [6:0] n
    );
    wire [3:0] I;
    assign I[0]=j[3]&j[1]&~j[0];
    assign I[1]=(~j[1]&~j[0])|(j[3]&~j[1])|(j[0]&j[3]);
    assign I[2]=j[0];
    assign I[3]=(~j[3]&~j[1]&j[0])|(~j[0]&j[1]&j[2]&~j[3])|(j[3]&~j[1]&~j[0])|(j[0]&j[1]&j[3])|(j[3]&~j[2]);
    assign n[0]=~((~I[0]&~I[1]&~I[3])|(~I[0]&~I[1]&I[2])|(~I[0]&I[1]&I[3])|(I[0]&~I[1]&~I[2])|(~I[0]&I[1]&I[2]&~I[3]))|~EI;
    assign n[1]=~((~I[0]&~I[1])|(~I[0]&~I[2]&~I[3])|(~I[0]&I[2]&I[3])|(I[0]&~I[1]&~I[2]))|~EI;
    assign n[2]=~((~I[0]&I[1])|(~I[0]&~I[2])|(~I[0]&I[3])|(~I[1]&~I[2]))|~EI;
    assign n[3]=~((~I[0]&~I[1]&~I[3])|(~I[0]&~I[1]&I[2])|(~I[0]&I[1]&~I[2]&I[3])|(~I[0]&I[1]&~I[2]&I[3])|(~I[0]&I[2]&~I[3])|(I[0]&~I[1]&~I[2]))|~EI;
    assign n[4]=~((~I[1]&~I[2]&~I[3])|(~I[0]&I[2]&~I[3]))|~EI;
    assign n[5]=~((~I[0]&~I[2]&~I[3])|(~I[0]&I[1]&~I[2])|(~I[0]&I[1]&~I[3])|(I[0]&~I[1]&~I[2]))|~EI;
    assign n[6]=~((~I[0]&~I[1]&I[2])|(~I[0]&I[1]&~I[2])|(~I[0]&I[2]&~I[3])|(I[0]&~I[1]&~I[2]))|~EI;
endmodule
