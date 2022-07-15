`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/04/09 10:34:32
// Design Name: 
// Module Name: cpu
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


module  cpu (
  input clk, 
  input rst,

  //IO_BUS
  output [7:0] io_addr,      //led和seg的地址
  output [31:0] io_dout,     //输出led和seg的数据
  output io_we,                 //输出led和seg数据时的使能信号
  input [31:0] io_din,          //来自sw的输入数据

  //Debug_BUS
  input [7:0] m_rf_addr,   //存储器(MEM)或寄存器堆(RF)的调试读口地址
  output [31:0] rf_data,    //从RF读取的数据
  output [31:0] m_data,    //从MEM读取的数据
  output [31:0] pc,           //PC的内容
  ///debug
  output [31:0] imm_sext_debug,
  output [31:0] alu_a_debug,alu_b_debug,
  output [31:0]  r_read_data1_debug,instruction_debug
);



wire [31:0] pc_next,pc_4,pc_imm,pc_change;
wire [31:0] instruction,imm_sext,alu_result,alu_result_change, alu_a,alu_b;
wire [31:0] r_read_data1,r_read_data2,d_read_data1,d_read_data2;
wire [31:0] r_write_data, d_io_data;
wire [1:0] aluop,reg_scr;
wire jal, branch, pc_alu, mem_write, alu_scr, reg_write, zero, pc_mux, mem_write_io;
wire [2:0] alu_ctrl;

//debug
assign imm_sext_debug = imm_sext;
assign alu_a_debug = alu_a;
assign alu_b_debug = alu_b;
assign  r_read_data1_debug =  r_read_data1;
assign instruction_debug = instruction;

assign pc_change = pc >> 2;
assign pc_4 = pc + 4;
assign pc_imm = pc + (imm_sext << 1);
assign pc_mux = jal | (branch & zero);
assign mem_write_io = mem_write & (~alu_result[10]);
assign alu_result_change = alu_result >> 2;
//io
assign io_addr = alu_result[7:0];
assign io_dout = r_read_data2; 
assign io_we = mem_write & alu_result[10];



pc p1(.clk(clk), .rst(rst), .pc_next(pc_next), .pc(pc));
instruction_memory i1(.a(pc_change[7:0]), .spo(instruction));
RF r1(.clk(clk), .ra0(instruction[19:15]), .ra1(instruction[24:20]), .ra2(m_rf_addr[4:0]), .wa(instruction[11:7]), .wd(r_write_data), .rd0(r_read_data1), .rd1(r_read_data2), .rd2(rf_data), .we(reg_write));
control c1(.instruction(instruction[6:0]), .jal(jal), .branch(branch), .pc_alu(pc_alu), .reg_scr(reg_scr), .aluop(aluop), .mem_write(mem_write), .alu_scr(alu_scr), .reg_write(reg_write));
imm_gen_control i2(.instruction(instruction), .out(imm_sext));
mux_2_32 m1(.a(pc_4), .b(pc_imm), .s(pc_mux), .out(pc_next));
mux_2_32 m2(.a(r_read_data2), .b(imm_sext), .s(alu_scr), .out(alu_b));
mux_2_32 m3(.a(r_read_data1), .b(pc), .s(pc_alu), .out(alu_a));
mux_2_32 m4(.a(d_read_data1), .b(io_din), .s(alu_result[10]), .out(d_io_data));
mux_4_32 m5(.a(alu_result), .b(d_io_data), .c(pc_4),.s(reg_scr), .out(r_write_data));
alu a1(.a(alu_a), .b(alu_b), .alu_ctrl(alu_ctrl), .alu_out(alu_result), .zero(zero));
alu_control a2(.aluop(aluop), .instruction({{instruction[30]}, {instruction[14:12]}}), .alu_ctrl(alu_ctrl));
data_memory d1(.a(alu_result_change[7:0]), .dpra(m_rf_addr), .clk(clk), .we(mem_write_io), .d(r_read_data2), .spo(d_read_data1), .dpo(m_data));

endmodule
