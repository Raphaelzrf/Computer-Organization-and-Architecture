`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/10/23 23:16:41
// Design Name: 
// Module Name: sum2_tb
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


module sum2_tb(
    );
    reg [9:0] s;
    wire [9:0] y;
    wire [6:0] n;
    sum2 M3(s[9:0],y[9:0],n[6:0]);
    initial begin
        s=10'b0000_0000_00;
        #10 s=10'b1000_0000_00;
        #10 s=10'b0100_0000_00;
        #10 s=10'b0010_0000_00;
        #10 s=10'b0001_0000_00;
        #10 s=10'b0000_1000_00;
        #10 s=10'b0000_0100_00;
        #10 s=10'b0000_0010_00;
        #10 s=10'b0000_0001_00;
        #10 s=10'b0000_0000_10;
        #10 s=10'b0000_0000_01;
        #10 $finish;
   end
endmodule
