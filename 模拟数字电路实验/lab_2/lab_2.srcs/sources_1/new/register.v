`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/10/31 08:37:27
// Design Name: 
// Module Name: register
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


module register(
    input [3:0] in,
    input en,
    input clk,//…œ…˝—ÿ”––ß
    output reg [3:0] out
    );
    always @(posedge clk) begin
            if(en==1) out=in;
    end
endmodule

