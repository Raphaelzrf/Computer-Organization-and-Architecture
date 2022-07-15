`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/04/09 15:33:06
// Design Name: 
// Module Name: cpu_tb
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


module cpu_tb(
);
reg clk,rst;
//IO_BUS
wire [7:0] io_addr;
wire [31:0] io_dout;     //输出led和seg的数据
wire io_we;           //输出led和seg数据时的使能信号
wire [31:0] io_din;          //来自sw的输入数据
//Debug_BUS
wire [7:0] m_rf_addr;   //存储器(MEM)或寄存器堆(RF)的调试读口地址
wire [31:0] rf_data;    //从RF读取的数据
wire [31:0] m_data;    //从MEM读取的数据
wire [31:0] pc;             //PC的内容
///debug
wire [31:0] imm_sext_debug;
wire [31:0] alu_a_debug,alu_b_debug, r_read_data1_debug,instruction_debug;

integer i=0;

assign m_rf_addr = 0;

cpu c2(.instruction_debug(instruction_debug),.r_read_data1_debug( r_read_data1_debug),.alu_b_debug(alu_b_debug),.alu_a_debug(alu_a_debug),.imm_sext_debug(imm_sext_debug),.clk(clk), .rst(rst), .io_addr(io_addr), .io_dout(io_dout), .io_we(io_we), .io_din(io_din), .m_rf_addr(m_rf_addr), .rf_data(rf_data), .m_data(m_data), .pc(pc));


    initial begin
        rst = 1;
        clk = 0;
        #10
        clk = ~clk;
        #10
        clk = ~clk;
        rst = 0;
        
        for(i=0; i<30; i=i+1) begin
            #10
            clk = ~clk;
            #10
            clk = ~clk;
            
        end
   end

endmodule