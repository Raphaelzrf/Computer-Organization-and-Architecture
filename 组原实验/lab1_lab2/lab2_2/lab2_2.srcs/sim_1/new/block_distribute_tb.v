`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/03/22 08:58:02
// Design Name: 
// Module Name: block_distribute_tb
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

module block_distribute_tb # (
    parameter AW = 4,		//地址宽度
    parameter DW = 8		//数据宽度
);
     reg clka;
     reg [AW-1:0] addra;//地址
     reg [DW-1:0] dina;//输入数据
     wire [DW-1:0] douta;//输出数据
     reg ena,wea;//使能信号
     reg clk;
     reg [AW-1:0] a;//地址
     reg [DW-1:0] d;//输入数据
     wire [DW-1:0] spo;//输出数据
     reg we;//使能信号
    blk_mem_gen_0 b1(.clka(clka), .dina(dina), .douta(douta), .addra(addra), .ena(ena), .wea(wea));
    dist_mem_gen_0 d1(.clk(clk), .a(a), .d(d), .spo(spo), .we(we));
    initial begin
        ena = 1;
         wea = 1;
         clka = 0;
         addra = 0;
         dina = 0;
         #10;
         clka = 1;
         addra = addra + 1;
         dina = dina + 1;
         #10;
         clka = 0;
         #10;
         clka = 1;
         addra = addra + 1;
         dina = dina + 1;
         #10;
         clka = 0;
         #10;
         clka = 1;
         addra = addra + 1;
         dina = dina + 1;
         #10;
         clka = 0;
         #10;
         clka = 1;
         addra = addra + 1;
         dina = dina + 1;
         #10;
         $finish;
     end
    initial begin
        we = 1;
        clk = 0;
        a = 0;
        d = 0;
        #10;
        clk = 1;
        a = a + 1;
        d = d + 1;
        #10;
        clk = 0;
        #10;
        clk = 1;
        a = a + 1;
        d = d + 1;
        #10;
        clk = 0;
        #10;
        clk = 1;
        a = a + 1;
        d = d + 1;
        #10;
        clk = 0;
        #10;
        clk = 1;
        a = a + 1;
        d = d + 1;
        #10;
        $finish;
    end
endmodule
