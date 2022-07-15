`timescale 1ns / 100ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/10/23 15:00:48
// Design Name: 
// Module Name: sum_1_tb
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


module sum_1_tb(
    );
    reg [9:0] s;
    wire [9:0] y;
    wire [6:0] n;
    wire [8:0] t;
    sum1 M3(s[9:0],y[9:0],n[6:0],t[8:0]);
    initial begin
        s=10'b1111_1111_11;
        #10 s=10'b1111_1111_10;
        #10 s=10'b1111_1111_01;
        #10 s=10'b1111_1110_11;
        #10 s=10'b1111_1101_11;
        #10 s=10'b1111_1011_11;
        #10 s=10'b1111_0111_11;
        #10 s=10'b1110_1111_11;
        #10 s=10'b1101_1111_11;
        #10 s=10'b1011_1111_11;
        #10 s=10'b0111_1111_11;
        #10 $finish;
   end
endmodule
