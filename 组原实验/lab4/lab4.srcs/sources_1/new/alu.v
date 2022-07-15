`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/04/07 15:32:57
// Design Name: 
// Module Name: alu
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

module alu (
    input [31:0] a, b,
    input [2:0] alu_ctrl, 
    output reg [31:0] alu_out,
    output reg zero
);
wire signed [31:0] signed_a, signed_b;

assign signed_a = a;
assign signed_b = b;

always @ (*) begin
    case (alu_ctrl)
        3'h1: begin
            alu_out = a + b; 
            zero = 0;
        end 
        3'h2: begin
            alu_out = a - b; 
            zero = 0;
        end
        3'h3: begin
            alu_out = 0;
            zero = (signed_a == signed_b) ? 1 : 0;
        end
        3'h4: begin
            alu_out = 0;
            zero = (signed_a < signed_b) ? 1 : 0;
        end
        default: begin
            alu_out = 0; 
            zero = 0;
        end
    endcase
end
endmodule