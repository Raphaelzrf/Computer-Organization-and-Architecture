`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/03/22 19:50:06
// Design Name: 
// Module Name: FIFO
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


module FIFO # (
    parameter AW = 3,		//地址宽度
    parameter DW = 4		//数据宽度
)
(
    input clk,rst,
    input [DW-1:0] in,
    input enq,deq,
    output [DW-1:0] out,
    output ful,emp,
    output [7:0] a,
    output [6:0] led
    );
    wire enq_1,deq_1;
    wire [AW-1:0] ra0,ra1,wa;
    wire [DW-1:0] rd0,rd1,wd;
    wire we;
    wire [7:0] valid;
    SEDG s1(.clk(clk), .a(enq), .p(enq_1));
    SEDG s2(.clk(clk), .a(deq), .p(deq_1));

    LCU l1(.clk(clk), .rst(rst), .in(in), .enq(enq_1), .deq(deq_1), .rd0(rd0), .out(out), .ra0(ra0), .wa(wa), .wd(wd), .we(we), .valid(valid), .ful(ful), .emp(emp));
    RF r1(.clk(clk), .ra0(ra0), .ra1(ra1), .rd0(rd0), .rd1(rd1), .wa(wa), .wd(wd), .we(we));
    SDU s3(.clk(clk), .rst(rst), .y(rd1), .cnt(ra1), .a(a), .led(led), .valid(valid));
endmodule
