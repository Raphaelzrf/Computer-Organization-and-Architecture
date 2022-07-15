`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/10/31 09:26:02
// Design Name: 
// Module Name: register3
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


module register3(
    input [2:0] in,
    input en,
    input clk,//…œ…˝—ÿ”––ß
    output reg [3:0] out
    );
    always @(posedge clk) begin
            if(en==1) out=in;
    end
endmodule

