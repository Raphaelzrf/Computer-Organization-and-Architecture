`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/04/07 14:49:02
// Design Name: 
// Module Name: RF
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


module  RF # (
    parameter AW = 5,		//地址宽度
    parameter DW = 32		//数据宽度
)(
    input clk,			//时钟
    input [AW-1:0] ra0, ra1, ra2,		//读地址
    output [DW-1:0] rd0, rd1, rd2,	//读数据
    input [AW-1:0] wa, 		//写地址
    input [DW-1:0] wd,		//写数据
    input we			//写使能
);
    reg [DW-1:0] rf [0: (1<<AW)-1];		//寄存器堆
    assign rd0 = rf[ra0], rd1 = rf[ra1], rd2 = rf[ra2];	//读操作
    always @ (posedge clk) begin
        if (we)  begin
              rf[wa]  <=  wd;		//写操作
        end
        rf[0] <= 0;
    end
endmodule

