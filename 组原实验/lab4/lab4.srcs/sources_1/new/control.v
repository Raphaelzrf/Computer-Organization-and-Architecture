`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/04/07 22:23:53
// Design Name: 
// Module Name: control
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


module control(
    input [6:0] instruction,
    output jal,
    output branch,
//    output reg [2:0] imm_gen,
    output pc_alu,
    output reg [1:0] reg_scr,
    output reg [1:0] aluop,
    output mem_write,
    output alu_scr,
    output reg_write
);
//jal
assign jal = (instruction == 7'b1101111) | (instruction == 7'b1100111);
//branch
assign branch = (instruction == 7'b1100011);
//imm_gen
//always @ (*) begin
//    case (instruction)
//        7'b0010011: imm_gen = 3'b000;
//        7'b0010011: imm_gen = 3'b001;
//        7'b1100011: imm_gen = 3'b010;
//        7'b0000011: imm_gen = 3'b011;
//        7'b0100011: imm_gen = 3'b100;
//        default: imm_gen = 3'b111;
//    endcase
//end
//pc_alu
assign pc_alu = (instruction == 7'b0010111);
//reg_scr
always @ (*) begin
    case (instruction)
        7'b0010011: reg_scr = 2'b00;
        7'b0110011: reg_scr = 2'b00;
        7'b0010111: reg_scr = 2'b00;
        7'b0000011: reg_scr = 2'b01;
        7'b1100111: reg_scr = 2'b10;
        7'b1101111: reg_scr = 2'b10;
        default: reg_scr = 2'b00;
    endcase
end

//aluop
always @ (*) begin
    case (instruction)
        7'b0010011:  aluop = 2'b00;//addi
        7'b0010111:  aluop = 2'b00;//auipc
        7'b0100011:  aluop = 2'b00;//sw
        7'b0000011:  aluop = 2'b00;//lw
        7'b0110011:  aluop = 2'b01;//add,sub
        7'b1100011:  aluop = 2'b10;//beq,blt
        default:  aluop = 2'b11;
    endcase
end
//mem_write
assign mem_write = (instruction == 7'b0100011);

//alu_scr
assign alu_scr = (instruction == 7'b0010011) | (instruction == 7'b0010111) | (instruction == 7'b0000011) | (instruction == 7'b0100011);
//reg_write
assign reg_write = (instruction == 7'b0010011) | (instruction == 7'b0110011) | (instruction == 7'b0010111) | (instruction == 7'b1101111) | (instruction == 7'b1100111) | (instruction == 7'b0000011);

endmodule

