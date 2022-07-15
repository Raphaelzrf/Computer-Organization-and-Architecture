`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/04/23 17:56:28
// Design Name: 
// Module Name: pdu_cpu_tb
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


module pdu_cpu_tb(

    );
reg clk,rst,rstn;
//IO_BUS
wire run;
wire step;
wire valid;
wire [4:0] in;
wire [1:0] check;
wire [4:0] out0;
wire [7:0] a;
wire [6:0] led;
wire ready;

integer i=0;

assign step = 0;
assign run = 1;
assign valid = 0;
assign in = 1;


pdu_cpu p4(.clk(clk), .rst(rst), .rstn(rstn), .run(run), .step(step), .valid(valid), .in(in), .check(check), .out0(out0), .a(a), .led(led), .ready(ready));

initial begin
    rst = 1;
    rstn = 1;
    clk = 0;
    #5
    clk = 1;
    #5
    clk = 0;
    rst = 0;
    #5
    clk = 1;
    #5
    clk = 0;
    #5
    clk = 1;
    #5
    rstn = 0;
    #5
    clk = 0;
    for(i = 0; i < 100; i = i + 1) begin
        #10
        clk = ~clk;
        #10
        clk = ~clk;
    end
end
endmodule
