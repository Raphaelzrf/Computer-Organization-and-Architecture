`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/10/23 10:29:41
// Design Name: 
// Module Name: prioritydecode
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


module prioritydecode(
    input [3:0] I,
    input EI,
    output [7:0] n
    );
    assign n[0]=~((~I[0]&~I[1]&~I[3])|(~I[0]&~I[1]&I[2])|(~I[0]&I[1]&I[3])|(I[0]&~I[1]&~I[2])|(~I[0]&I[1]&I[2]&~I[3]))|~EI;
    assign n[1]=~((~I[0]&~I[1])|(~I[0]&~I[2]&~I[3])|(~I[0]&I[2]&I[3])|(I[0]&~I[1]&~I[2]))|~EI;
    assign n[2]=~((~I[0]&I[1])|(~I[0]&~I[2])|(~I[0]&I[3])|(~I[1]&~I[2]))|~EI;
    assign n[3]=~((~I[0]&~I[1]&~I[3])|(~I[0]&~I[1]&I[2])|(~I[0]&I[1]&~I[2]&I[3])|(~I[0]&I[1]&~I[2]&I[3])|(~I[0]&I[2]&~I[3])|(I[0]&~I[1]&~I[2]))|~EI;
    assign n[4]=~((~I[1]&~I[2]&~I[3])|(~I[0]&I[2]&~I[3]))|~EI;
    assign n[5]=~((~I[0]&~I[2]&~I[3])|(~I[0]&I[1]&~I[2])|(~I[0]&I[1]&~I[3])|(I[0]&~I[1]&~I[2]))|~EI;
    assign n[6]=~((~I[0]&~I[1]&I[2])|(~I[0]&I[1]&~I[2])|(~I[0]&I[2]&~I[3])|(I[0]&~I[1]&~I[2]))|~EI;
endmodule
