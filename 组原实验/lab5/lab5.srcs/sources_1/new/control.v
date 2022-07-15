`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/04/19 21:47:10
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
    input [31:0] instruction,
    output [31:0] control
    
);
wire jal;
wire branch;
reg [1:0] reg_scr;
reg [1:0] aluop;
wire mem_read;
wire mem_write;
wire alu_scr;
wire reg_write;

//jal
assign jal = (instruction[6:0] == 7'b1101111);
//branch
assign branch = (instruction[6:0] == 7'b1100011);


//reg_scr
always @ (*) begin
    case (instruction[6:0])
        7'b0010011: reg_scr = 2'b00;//addi
        7'b0110011: reg_scr = 2'b00;//add
        7'b0000011: reg_scr = 2'b01;//lw
        7'b1101111: reg_scr = 2'b10;//jal
        default: reg_scr = 2'b00;
    endcase
end

//aluop
always @ (*) begin
    case (instruction[6:0])
        7'b0010011:  aluop = 2'b00;//addi
        7'b0100011:  aluop = 2'b00;//sw
        7'b0000011:  aluop = 2'b00;//lw
        7'b0110011:  begin
            aluop = 2'b00;//add
        end
        7'b1100011:  aluop = 2'b10;//beq
        default:  aluop = 2'b11;
    endcase
end
//mem_write
assign mem_write = (instruction[6:0] == 7'b0100011);//sw
//mem_read
assign mem_read = (instruction[6:0] ==7'b0000011);//lw

//alu_scr
assign alu_scr = (instruction[6:0] == 7'b0010011) | (instruction[6:0] == 7'b0000011) | (instruction[6:0] == 7'b0100011);//addi,sw,lw
//reg_write
assign reg_write = (instruction[6:0] == 7'b0010011) | (instruction[6:0] == 7'b0110011) | (instruction[6:0] == 7'b1101111) | (instruction[6:0] == 7'b0000011);//add,addi,sub,jal,lw

//control
assign control = {{13{1'b0}}, {reg_write}, {reg_scr}, {2'b00}, {mem_read}, {mem_write}, {2'b00}, {jal}, {branch}, {3'b000}, {alu_scr},{2'b00} ,{aluop}};

endmodule