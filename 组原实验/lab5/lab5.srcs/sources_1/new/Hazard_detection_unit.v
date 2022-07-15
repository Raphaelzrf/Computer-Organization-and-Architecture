`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/04/22 21:13:09
// Design Name: 
// Module Name: Hazard_detection_unit
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


module Hazard_detection_unit(
  input ID_EX_MemRead,
  input [4:0] rd,
  input [31:0] instruction,
  output reg IF_ID_write,
  output reg pc_write,
  output reg ctrl_mux
);
always @(*) begin
  case (instruction[6:0])
    7'b0010011: begin   //addi
      if(ID_EX_MemRead && (rd == instruction[19:15])) begin
        IF_ID_write = 0;
        pc_write = 0;
        ctrl_mux = 1;
      end
      else begin
        IF_ID_write = 1;
        pc_write = 1;
        ctrl_mux = 0;
      end
    end
    7'b0110011: begin   //add
      if(ID_EX_MemRead && ((rd == instruction[19:15]) || (rd == instruction[24:20]))) begin
        IF_ID_write = 0;
        pc_write = 0;
        ctrl_mux = 1;
      end
      else begin
        IF_ID_write = 1;
        pc_write = 1;
        ctrl_mux = 0;
      end
    end
    7'b1100011: begin   //beq
      if(ID_EX_MemRead && ((rd == instruction[19:15]) || (rd == instruction[24:20]))) begin
        IF_ID_write = 0;
        pc_write = 0;
        ctrl_mux = 1;
      end
      else begin
        IF_ID_write = 1;
        pc_write = 1;
        ctrl_mux = 0;
      end
    end
    7'b0100011: begin   //sw
      if(ID_EX_MemRead && ((rd == instruction[19:15]) || (rd == instruction[24:20]))) begin
        IF_ID_write = 0;
        pc_write = 0;
        ctrl_mux = 1;
      end
      else begin
        IF_ID_write = 1;
        pc_write = 1;
        ctrl_mux = 0;
      end
    end
    7'b0100011: begin   //lw
      if(ID_EX_MemRead && (rd == instruction[19:15])) begin
        IF_ID_write = 0;
        pc_write = 0;
        ctrl_mux = 1;
      end
      else begin
        IF_ID_write = 1;
        pc_write = 1;
        ctrl_mux = 0;
      end
    end
    default:  begin
      IF_ID_write = 1;
      pc_write = 1;
      ctrl_mux = 0;
    end
  endcase
end
endmodule
