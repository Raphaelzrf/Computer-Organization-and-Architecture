`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/04/23 10:45:23
// Design Name: 
// Module Name: cpu_pl
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


module  cpu_pl (
  input clk, 
  input rst,

  //IO_BUS
  output [7:0] io_addr,      //led和seg的地址
  output [31:0] io_dout,     //输出led和seg的数据
  output io_we,                 //输出led和seg数据时的使能信号
  input [31:0] io_din,        //来自sw的输入数据

  //Debug_BUS
  input [7:0] m_rf_addr,   //存储器(MEM)或寄存器堆(RF)的调试读口地址
  output [31:0] rf_data,    //从RF读取的数据
  output [31:0] m_data,    //从MEM读取的数据

  //PC/IF/ID 流水段寄存器
  output  [31:0] pc,
  output reg [31:0] pcd,
  output reg [31:0] ir,
  output reg [31:0] pcin,

  // ID/EX 流水段寄存器
  output reg [31:0] pce,
  output reg [31:0] a,
  output reg [31:0] b,
  output reg [31:0] imm,
  output reg [4:0] rd,
  output reg [31:0] ctrl,

  // EX/MEM 流水段寄存器
  output reg [31:0] y,
  output reg [31:0] bm,
  output reg [4:0] rdm,
  output reg [31:0] ctrlm,

  // MEM/WB 流水段寄存器
  output reg [31:0] yw,
  output reg [31:0] mdr,
  output reg [4:0] rdw,
  output reg [31:0] ctrlw
);

//io_bus
assign io_addr = y[7:0];
assign io_dout = bm;
assign io_we = y[10] & ctrlm[12];
//debug_bus

//IF
wire [31:0] pc_next, pc_4, instruction, pc_imm;
wire pc_write, pc_src;

assign pc_next = pc_src ? pc_imm : pc_4;
assign pc_4 = pc + 4;

pc p1(.clk(clk), .rst(rst), .pc_write(pc_write), .pc_next(pc_next), .pc(pc));
instrcution_memory i1(.a(pc >> 2), .spo(instruction));

//IF/ID
wire IF_ID_write;

always @(posedge clk) begin
  if(rst) begin
    pcd <= 0;
    pcin <= 0;
    ir <= 0;
  end
  else if(pc_src) begin
    pcd <= 0;
    pcin <= 0;
    ir <= 0;
  end
  else if(IF_ID_write) begin
    pcd <= pc;
    pcin <= pc_next;
    ir <= instruction;
  end
end

//ID
wire [31:0] control, control_last, Imm, RF_rs1, RF_rs2;
wire ctrl_mux;
reg [31:0] RF_wd;
reg [4:0] rs1, rs2;

assign control_last = ctrl_mux ?  0 : control;
RF r1(.clk(clk), .ra0(ir[19:15]), .ra1(ir[24:20]), .ra2(m_rf_addr), .rd0(RF_rs1), .rd1(RF_rs2), .rd2(rf_data), .wa(rdw), .wd(RF_wd), .we(ctrlw[18]));
Hazard_detection_unit h1(.ID_EX_MemRead(ctrl[13]), .rd(rd), .instruction(ir), .IF_ID_write(IF_ID_write), .pc_write(pc_write), .ctrl_mux(ctrl_mux));
control c1(.instruction(ir), .control(control));
imm_gen i2(.instruction(ir), .out(Imm));

//ID/EX     控制信号 ctrl_mux   pc_src
always @ (posedge clk) begin
  if(rst) begin
    pce <= 0;
    a <= 0;
    b <= 0;
    imm <= 0;
    rd <= 0;
    ctrl <= 0;
    rs1 <= 0;
    rs2 <= 0;
  end
  else if(pc_src) begin
    pce <= 0;
    a <= 0;
    b <= 0;
    imm <= 0;
    rd <= 0;
    ctrl <= 0;
    rs1 <= 0;
    rs2 <= 0;
  end
  else begin
    pce <= pcd;
    a <= RF_rs1;
    b <= RF_rs2;
    imm <= Imm;
    ctrl <= control_last;
    rd <= ir[11:7];
    rs1 <= ir[19:15];
    rs2 <= ir[24:20];

  end
end

//EX
wire [31:0] alu_a, alu_b_1, alu_b_2;
wire [1:0] forwarding_a, forwarding_b;
wire [31:0] alu_result;
wire zero;

assign pc_src = (ctrl[9]) | (ctrl[8] & zero);
assign pc_imm = pce + (imm << 1);
mux_2_32 m1(.a(alu_b_1), .b(imm), .s(ctrl[4]), .out(alu_b_2));
Forwarding_unit f1(.rs1(rs1), .rs2(rs2), .rdm(rdm), .rdw(rdw), .EX_MEM_reg_write(ctrlm[18]), .MEM_WB_reg_write(ctrlw[18]), .forwarding_a(forwarding_a), .forwarding_b(forwarding_b));
mux_3_32 m2(.forwarding(forwarding_a), .a(a), .b(y), .c(RF_wd), .result(alu_a));
mux_3_32 m3(.forwarding(forwarding_b), .a(b), .b(y), .c(RF_wd), .result(alu_b_1));
alu a1(.a(alu_a), .b(alu_b_2), .alu_ctrl(ctrl[1:0]), .alu_out(alu_result), .zero(zero));

//EX/MEM
reg [31:0] pcm;

always @ (posedge clk) begin
  if(rst) begin
    ctrlm <= 0;
    pcm <= 0;
    y <= 0;
    bm <= 0;
    rdm <= 0;
  end
  else begin
    ctrlm <= ctrl;
    pcm <= pce;
    y <= alu_result;
    bm <= alu_b_1;
    rdm <= rd;
  end
end

//MEM
wire [31:0] DM_rd;
wire we;
assign we = ~y[10] & ctrlm[12];
data_memory d1(.a(y), .d(bm), .dpra(m_rf_addr), .clk(clk), .we(we), .spo(DM_rd), .dpo(m_data));

// MEM/WB
reg [31:0] pcw;
always @ (posedge clk) begin
  if(rst) begin
    ctrlw <= 0;
    mdr <= 0;
    yw <= 0;
    rdw <= 0;
    pcw <= 0;
  end
  else begin
    ctrlw <= ctrlm;
    yw <= y;
    pcw <= pcm;
    rdw <= rdm;
    if(y[10]) mdr <= io_din;
    else mdr <= DM_rd;
  end
end

//WB
always @ (*) begin
  case (ctrlw[17:16])
    0: RF_wd = yw;
    1: RF_wd = mdr;
    2: RF_wd = pcw + 4;
    default: RF_wd = 0;
  endcase
end
endmodule
