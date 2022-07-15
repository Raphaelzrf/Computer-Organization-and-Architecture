`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/04/09 08:49:03
// Design Name: 
// Module Name: alu_control
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

module alu_control(
    input [1:0] aluop,
    input [3:0] instruction,
    output reg [2:0] alu_ctrl
);
always @ (*) begin
    case (aluop)
        0: alu_ctrl = 1;
        1: begin
            if(instruction[3]) begin
                alu_ctrl = 2;
            end
            else begin
                alu_ctrl = 1;
            end
        end
        2: begin
            if(instruction[2:0] == 3'b000) begin
                alu_ctrl = 3;
            end
            else if(instruction[2:0] == 3'b100) begin
                alu_ctrl = 4;
            end
            else begin
                alu_ctrl = 0;
            end
         end   
        default: alu_ctrl = 0;
    endcase
end
endmodule
