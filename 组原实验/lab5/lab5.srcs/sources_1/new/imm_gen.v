`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/04/19 21:45:26
// Design Name: 
// Module Name: imm_gen
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


module imm_gen(
    input [31:0] instruction,
    output reg [31:0] out
);
always @ (*) begin
    case (instruction[6:0])
        7'b0010011: out = {{21{instruction[31]}}, {instruction[30:20]}};//addi
        7'b1101111: out = {{14{instruction[31]}}, {instruction[19:12]}, {instruction[20]}, instruction[30:21]};//jal
        7'b1100011: out = {{21{instruction[31]}}, {instruction[7]}, {instruction[30:25]}, {instruction[11:8]}};//BEQ
        7'b0000011: out = {{21{instruction[31]}}, {instruction[30:20]}};//lw
        7'b0100011: out = {{21{instruction[31]}}, {instruction[30:25]},{instruction[11:7]}};//sw
        default: out = 0;
    endcase
end
endmodule
