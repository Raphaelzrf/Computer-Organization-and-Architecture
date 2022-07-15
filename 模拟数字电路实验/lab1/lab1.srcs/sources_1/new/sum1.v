`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/10/23 11:30:05
// Design Name: 
// Module Name: sum1
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

module sum1(
    input [9:0] s,
    output [9:0] y,
    output [6:0] n,
    output [8:0] t
    );
   wire  [3:0] z;
   wire GS;
   assign t=9'b1_1111_1110;
   normalcode0 M0 (s[9:0],z[3:0],GS);
   normaldecode M1(z[3:0],GS,y[9:0]);
   prioritydecode M2(z[3:0],GS,n[6:0]);
endmodule
