`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/10/31 19:21:24
// Design Name: 
// Module Name: register1
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


module register1(
    input [3:0] in,
    input rst,
    input en,
    input clk,//…œ…˝—ÿ”––ß
    output reg [3:0] out
    );
    always @(posedge clk) begin
            if(rst==1) out<=4'b0001;
            else if(en==1) out<=in;
    end
endmodule
