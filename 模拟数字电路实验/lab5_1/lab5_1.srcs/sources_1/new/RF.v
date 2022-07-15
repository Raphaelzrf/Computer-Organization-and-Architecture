`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/11/19 15:21:13
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
    parameter DW = 16		//数据宽度
)(
    input clk,			//时钟
    input rstn,
    input e_8,
    input [AW-1:0] ra0, ra1,		//读地址
    output [DW-1:0] rd0, rd1,	//读数据
    input [AW-1:0] wa, 		//写地址
    input [DW-1:0] wd,		//写数据
    input we,			//写使能
    output reg  [DW-1:0] t
   );
    reg [DW-1:0] rf [0: (1<<AW)-1];		//寄存器堆
    assign rd0 = rf[ra0], rd1 = rf[ra1];	//读操作
    always @(posedge clk) begin
        if(~rstn) begin
            t <= 0; 
        end
    else begin
    if(e_8) begin
        rf[ra1] <= rd0;
        rf[ra0] <= rd1;//并行指数
        t<= t+1;
    end
    else begin 
        if(we) rf[wa] <= wd;
    end
    end
end		
endmodule

