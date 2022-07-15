`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/11/19 16:28:22
// Design Name: 
// Module Name: DIS
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


module DIS(
    input clk,
    input rstn,
    input [4:0] ar,
    input [15:0] d,
    output [7:0] an,
    output [6:0] seg
    );
    wire clkd;
    wire [2:0] cnt;
    wire [3:0] c;
    wire [31:0] s;
    assign s={3'b000,ar[4:0],8'h00,d[15:0]};
    FD f1(clk,rstn,clkd);
    counter c1(clkd,rstn,0,1,0,cnt[2:0]);
    decode2 d21(cnt[2:0],an[7:0]);
    mux_4_1 m1(cnt[2:0],s[31:0],c[3:0]);
    decode7 d71(c[3:0],seg[6:0]);
    
endmodule
