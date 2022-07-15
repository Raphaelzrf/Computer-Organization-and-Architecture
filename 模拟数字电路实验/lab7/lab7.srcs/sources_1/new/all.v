`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/12/19 10:22:47
// Design Name: 
// Module Name: all
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


`timescale 1ns / 1ps
//���������Ĳ���
module project_all (
  input clk,
  input rstn,
  input stop,
  input start,
  input up,
  input down,
  input left,
  input right,
  output h,
  output v,
  output [11:0] disp_rgb
);
wire vclk,win,pclk;
wire [7:0] x,y;
wire [8:0] w1r,w2r,w3r,w4r,w5r,w6r,cnt,w1d,w2u,w3d,w4u,w5d,w6u;
wire [1:0] flag;
//wire [14:0] raddr;
wire [11:0] vds_data;
wire [10:0] h_addr,v_addr;
p_move p1(.clk(vclk),.stop(stop),.up(up),.down(down),.left(left),.right(right),.flag(flag),.x(x),.y(y));
w_move w1(.clk(vclk),.stop(stop),.flag(flag),.w1r(w1r),.w2r(w2r),.w3r(w3r),.w4r(w4r),.w5r(w5r),.w6r(w6r));
flag_change f1(.clk(vclk),.start(start),.rstn(rstn),.x(x),.y(y),.w1r(w1r),.w2r(w2r),.w3r(w3r),.w4r(w4r),.w5r(w5r),.w6r(w6r),.w1d(w1d),.w2u(w2u),.w3d(w3d),.w4u(w4u),.w5d(w5d),.w6u(w6u),.win(win),.flag(flag));
counter c1(.clk(vclk),.flag(flag),.x(x),.y(y),.w1r(w1r),.w2r(w2r),.w3r(w3r),.w4r(w4r),.w5r(w5r),.w6r(w6r),.cnt(cnt),.win(win));
VDS v1(.stop(stop),.flag(flag),.h_addr(h_addr),.v_addr(v_addr),.rdata1(0),.rdata2(0),.rdata3(0),.w1r(w1r),.w2r(w2r),.w3r(w3r),.w4r(w4r),.w5r(w5r),.w6r(w6r),.w1d(w1d),.w2u(w2u),.w3d(w3d),.w4u(w4u),.w5d(w5d),.w6u(w6u),.x(x),.y(y),.pdata(vds_data));//.raddr
random r1(.clk(vclk),.w1r(w1r),.w2r(w2r),.w3r(w3r),.w4r(w4r),.w5r(w5r),.w6r(w6r),.w1d(w1d),.w2u(w2u),.w3d(w3d),.w4u(w4u),.w5d(w5d),.w6u(w6u));
VDT v2(.clk(pclk),.rst(0),.rd_data(vds_data),.hs(h),.vs(v),.vga_data(disp_rgb),.h_cnt(h_addr),.v_cnt(v_addr),.vclk(vclk));
clk_wiz_0 c2(.clk_in1(clk),.clk_out1(pclk),.reset(0));
endmodule