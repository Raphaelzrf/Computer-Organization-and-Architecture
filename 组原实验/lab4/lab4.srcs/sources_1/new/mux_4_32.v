`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/04/07 23:24:36
// Design Name: 
// Module Name: mux_4_32
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


module mux_4_32(
    input [1:0] s,
    input [31:0] a,
    input [31:0] b,
    input [31:0] c,
    output reg [31:0] out
);
always @(*) begin
    case (s)
        0: out = a;
        1: out = b;
        2: out = c;
        default: out = 0;
    endcase
end
endmodule
