`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/12/05 19:12:27
// Design Name: 
// Module Name: Print
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

module  Print (
    input clk, rstn,		//时钟, 复位 (低电平有效)
    input up,		//移动方向 (dir)：上
    input down,		//移动方向 (dir)：下
    input left,		//移动方向 (dir)：左
    input right,		//移动方向 (dir)：右
    input [3:0] red,  	//画笔颜色 (rgb)：红
    input [3:0] green, 	//画笔颜色 (rgb)：绿
    input [3:0] blue, 	//画笔颜色 (rgb)：蓝
    input draw,		//绘画开关：1-绘画
    output [3:0] pred,	//像素颜色 (prgb)：红
    output [3:0] pgreen, 	//像素颜色 (prgb)：绿
    output [3:0] pblue, 	//像素颜色 (prgb)：蓝
    output hs,		//行同步
    output vs		//场同步
);
wire [3:0] dir;
wire [11:0] rgb;
wire [14:0] waddr,raddr;
wire [11:0] wdata,rdata,pdata,outputdata;
wire [10:0] h_addr,v_addr;
wire we,pclk;
wire up_2,down_2,left_2,right_2,up_3,down_3,left_3,right_3;

assign dir={up_3,down_3,left_3,right_3};
assign rgb={red,green,blue};
assign pred=outputdata[3:0];
assign pgreen=outputdata[7:4];
assign pblue=outputdata[11:8];

DB d1(up,rstn,clk,up_2);
DB d2(down,rstn,clk,down_2);
DB d3(left,rstn,clk,left_2);
DB d4(right,rstn,clk,right_2);

PS p1(up_2,clk,up_3);
PS p2(down_2,clk,down_3);
PS p3(left_2,clk,left_3);
PS p4(right_2,clk,right_3);

clk50 c1(.clk_in1(clk),.reset(0),.clk_out1(pclk));
PCU p5(.clk(clk),.rstn(rstn),.rgb(rgb),.dir(dir),.draw(draw),.waddr(waddr),.wdata(wdata),.we(we));
VRAM v1(.addra(0),.clka(clk),.dina(0),.wea(0),.addrb(raddr),.clkb(clk),.doutb(rdata));
SRA s1(.h_addr(h_addr),.v_addr(v_addr),.rdata(rdata),.raddr(raddr),.pdata(pdata));
VDT v2(.clk(pclk),.rst(rstn),.rd_data(pdata),.hs(hs),.vs(vs),.vga_data(outputdata),.h_cnt(h_addr),.v_cnt(v_addr));
endmodule