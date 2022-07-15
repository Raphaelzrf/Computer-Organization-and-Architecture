`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/03/21 21:26:58
// Design Name: 
// Module Name: RF_tb
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


module  RF_tb # (
    parameter AW = 3,		//地址宽度
    parameter DW = 4		//数据宽度
);
    reg clk;			//时钟
    reg [AW-1:0] ra0, ra1;	//读地址
    wire [DW-1:0] rd0, rd1; 	//读数据
    reg [AW-1:0] wa;		//写地址
    reg  [DW-1:0] wd;		//写数据
    reg we;		//写使能
    RF r1(.clk(clk), .ra0(ra0), .ra1(ra1), .rd0(rd0), .rd1(rd1), .wa(wa), .wd(wd), .we(we));
    initial begin
    //1
        clk = 0;
        we = 1;
        ra0 = 0;
        ra1 = 0;
        wa = 0;
        wd = 1;
    #10;
        clk = ~clk;
    //2
    #10;
        clk = 0;
        wa = wa + 1;
        wd = wd + 1;
    #10;
        clk = 1;
        ra1 = ra1 + 1;
    //3
    #10;
        clk = 0;
        wa = wa + 1;
        wd = wd + 1;
    #10;
        clk = 1;
        ra0 = ra0 + 1;
        ra1 = ra1 + 1;
    //4
    #10;
        clk = 0;
        wa = wa + 1;
        wd = wd + 1;
    #10;
        clk = 1;
        ra0 = ra0 + 1;
        ra1 = ra1 + 1;
    //5
    #10;
        clk = 0;
        wa = wa + 1;
        wd = wd + 1;
    #10;
        clk = 1;
        ra0 = ra0 + 1;
        ra1 = ra1 + 1;
    //6
    #10;
        clk = 0;
        wa = wa + 1;
        wd = wd + 1;
    #10;
        clk = 1;
        ra0 = ra0 + 1;
        ra1 = ra1 + 1;
    //7
    #10;
        clk = 0;
        wa = wa + 1;
        wd = wd + 1;
    #10;
        clk = 1;
        ra0 = ra0 + 1;
        ra1 = ra1 + 1;
    //8
    #10;
        clk = 0;
        wa = wa + 1;
        wd = wd + 1;
    #10;
        clk = 1;
        ra0 = ra0 + 1;
        ra1 = ra1 + 1;
    #10;
        $finish;

    end
endmodule
