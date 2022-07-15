`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/04/22 22:03:49
// Design Name: 
// Module Name: Forwarding_unit
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


module Forwarding_unit(
  input [4:0] rs1,
  input [4:0] rs2,
  input [4:0] rdm,
  input [4:0] rdw,
  input EX_MEM_reg_write,
  input MEM_WB_reg_write,
  output reg [1:0] forwarding_a,
  output reg [1:0] forwarding_b
);
//rs1
always @ (*) begin
  if((rs1 == rdm) && EX_MEM_reg_write) begin
    forwarding_a = 1;
  end
  else if((rs1 == rdw) && MEM_WB_reg_write) begin
    forwarding_a = 2;
  end
  else begin
    forwarding_a = 0;
  end
end

//rs2
always @ (*) begin
  if((rs2 == rdm) && EX_MEM_reg_write) begin
    forwarding_b = 1;
  end
  else if((rs2 == rdw) && MEM_WB_reg_write) begin
    forwarding_b = 2;
  end
  else begin
    forwarding_b = 0;
  end
end
endmodule
