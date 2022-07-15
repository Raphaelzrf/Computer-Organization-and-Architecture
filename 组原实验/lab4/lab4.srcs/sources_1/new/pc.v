`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/04/07 15:03:30
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
    input [31:0] pc_next,
    output reg [31:0] pc
);
always @(posedge clk or posedge rst) begin
    if(rst) begin
        pc <= 32'h0000_0000;
    end
    else begin
        pc <= pc_next;
    end
end
endmodule

