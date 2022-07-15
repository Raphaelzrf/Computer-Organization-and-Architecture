`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/03/22 10:56:14
// Design Name: 
// Module Name: LCU
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

module LCU # (
    parameter AW = 3,		//地址宽度
    parameter DW = 4		//数据宽度
)
(
    input clk,rst,
    input [DW-1:0] in,
    input enq,deq,
    input [DW-1:0] rd0,
    output reg [DW-1:0] out,
    output reg [AW-1:0] ra0,wa,
    output reg [DW-1:0] wd,
    output reg [7:0] valid,
    output reg ful,emp,
    output reg we
);
    reg [2:0] head , tail;
    
    //描述时序逻辑
    always @(posedge clk) begin
        if(rst == 1)begin
            valid <= 0;
            out <= 0;
          //  ra0 <= 0;
            we <= 0;
            head <= 0;
            tail <= 0;
        end
        else if(enq == 1) begin
            if(valid != 8'hff) begin
                wa <= tail;
                wd <= in;
                we <= 1;
                valid <= valid + (1 << tail);
                tail <= (tail + 1) % 8;
            end
        end
        else if(deq == 1) begin
            if(valid != 0) begin
                we <= 0;
                 //  ra0 <= head;
                out <= rd0;
                valid <= valid - (1 << head);
                head <= (head + 1) % 8;
            end
        end
    end
    //描述组合逻辑
    always @(*) begin
        ra0 = head;
        if(valid == 8'hff) begin
            ful = 1;
            emp = 0;
        end
        else if(valid == 0) begin
            ful = 0;
            emp = 1;
        end
        else begin
            ful = 0;
            emp = 0;
        end
    end 
endmodule
