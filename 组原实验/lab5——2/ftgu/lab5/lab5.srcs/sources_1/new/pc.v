`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/04/19 20:42:12
// Design Name: 
// Module Name: pc
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


module pc(
    input clk,
    input rst,
    input pc_write,
    input [31:0] pc_next,
    output reg [31:0] pc
);
always @(posedge clk or posedge rst) begin
    if(rst) begin
        pc <= 32'h0000_0000;
    end
    else if(pc_write) begin
        pc <= pc_next;
    end
end
endmodule
