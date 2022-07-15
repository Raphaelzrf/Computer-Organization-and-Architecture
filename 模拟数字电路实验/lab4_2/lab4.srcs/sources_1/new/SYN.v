`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/11/17 16:39:23
// Design Name: 
// Module Name: SYN
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


module SYN (
    input clk,
    input a,
    output reg s
);
    reg t;
    always @(posedge clk) begin
        t<=a;
        end
    always @(posedge clk) begin
        s<=t;
    end   
endmodule
