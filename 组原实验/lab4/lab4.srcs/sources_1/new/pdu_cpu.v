`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/04/10 08:35:57
// Design Name: 
// Module Name: pdu_cpu
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

module pdu_cpu(
    input clk,
    input rst,
    input [4:0] in,
    input valid,
    input step,
    input run,
    output [1:0] check,
    output [4:0] out0,
    output [7:0] a,     //8¸öÊýÂë¹Ü
    output [6:0] led,
    output ready          //led7
    
);

wire clk_cpu;
//IO_BUS
wire [7:0] io_addr;
wire [31:0] io_dout;
wire io_we;
wire [31:0] io_din;

//debug bus
wire [7:0] m_rf_addr;
wire [31:0] rf_data,m_data,pc;

PDU p1(.clk(clk), .rst(rst), .run(run), .step(step), .clk_cpu(clk_cpu), .valid(valid), .in(in), .check(check), .out0(out0), .a(a), .led(led), .ready(ready), .io_addr(io_addr), .io_dout(io_dout), .io_we(io_we), .io_din(io_din), .m_rf_addr(m_rf_addr), .m_data(m_data), .rf_data(rf_data), .pc(pc));
cpu c6(.clk(clk_cpu), .rst(rst), .io_addr(io_addr), .io_dout(io_dout), .io_we(io_we), .io_din(io_din), .m_rf_addr(m_rf_addr), .m_data(m_data), .pc(pc),.rf_data(rf_data));

endmodule
