`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/04/19 20:54:44
// Design Name: 
// Module Name: mux_2_32
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


module mux_2_32(
    input s,
    input [31:0] a,
    input [31:0] b,
    output  [31:0] out
);
assign out = s ? b : a;
endmodule
