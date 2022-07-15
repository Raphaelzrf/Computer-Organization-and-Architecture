`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/12/20 22:10:35
// Design Name: 
// Module Name: allrom
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


module allrom(
    input clk,
    input [14:0] raddr,
    output [11:0] rdata1,
    output [11:0] rdata2,
    output [11:0] rdata3,
    output [11:0] rdata4,
    output [11:0] rdata5
    );
    blk_mem_gen_0 bb1(.clka(clk),.addra(raddr),.douta(rdata1));
    rom2 rr2(.clka(clk),.addra(raddr),.douta(rdata2));
    rom3 rr23(.clka(clk),.addra(raddr),.douta(rdata3));
    rom4 rr4(.clka(clk),.addra(raddr),.douta(rdata4));
    rom5 rr5(.clka(clk),.addra(raddr),.douta(rdata5));
endmodule
