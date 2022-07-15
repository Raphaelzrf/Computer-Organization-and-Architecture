`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/04/23 15:18:02
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


module pdu_cpu (
  input clk,
  input rst,
  input rstn,
  //选择CPU工作方式
  input run,
  input step,
  //输入sw的端口
  input valid,
  input [4:0] in,
  //输出led和seg的端口 
  output [1:0] check,  //led6-5:查看类型
  output [4:0] out0,    //led4-0
  output [7:0] a,     //8个数码管
  output [6:0] led,
  output ready          //led7
);

wire clk_cpu;
//io_bus
wire [7:0] io_addr;
wire [31:0] io_dout;
wire io_we;
wire [31:0] io_din;

//Debug_BUS
wire [7:0] m_rf_addr;
wire [31:0] rf_data;
wire [31:0] m_data;

////增加流水线寄存器调试接口
wire [31:0] pcin, pc, pcd, pce;
wire [31:0] ir, imm, mdr;
wire [31:0] a_a, b, y, bm, yw;
wire [4:0]  rd, rdm, rdw;
wire [31:0] ctrl, ctrlm, ctrlw;

pdu p1(.clk(clk), .rst(rst), .run(run), .step(step), .clk_cpu(clk_cpu), .valid(valid),
      .in(in), .check(check), .out0(out0), .num(a), .led(led), .ready(ready), .io_addr(io_addr),
      .io_dout(io_dout), .io_we(io_we), .io_din(io_din), .m_rf_addr(m_rf_addr), .rf_data(rf_data),
      .m_data(m_data), .pcin(pcin), .pc(pc), .pcd(pcd), .pce(pce), .ir(ir), .imm(imm), .mdr(mdr),
      .a(a_a), .b(b), .y(y), .bm(bm), .yw(yw), .rd(rd), .rdm(rdm), .rdw(rdw), .ctrl(ctrl), .ctrlm(ctrlm), .ctrlw(ctrlw));

cpu_pl c1(.clk(clk_cpu), .rst(rstn), .io_addr(io_addr), .io_dout(io_dout), .io_we(io_we), .io_din(io_din), 
      .m_rf_addr(m_rf_addr), .rf_data(rf_data), .m_data(m_data), .pcin(pcin), .pc(pc), .pcd(pcd), .pce(pce), 
      .ir(ir), .imm(imm), .mdr(mdr), .a(a_a), .b(b), .y(y), .bm(bm), .yw(yw), .rd(rd), .rdm(rdm), .rdw(rdw), 
      .ctrl(ctrl), .ctrlm(ctrlm), .ctrlw(ctrlw));

endmodule
