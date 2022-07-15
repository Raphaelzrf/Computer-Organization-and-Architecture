`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/12/22 20:13:00
// Design Name: 
// Module Name: p_control2
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



module p_control2(
    input [7:0] ps2_byte,
    output reg up,
    output reg down,
    output reg left,
    output reg right,
    output reg rstn,
    output reg start,
    output reg stop
    );
    always @(*) begin
      case (ps2_byte)
        8'd87:begin
          up = 1;
          down = 0;
          left = 0;
          right = 0;
          rstn = 0;
          start = 0;
          stop = 0;
        end
        8'd83: begin
          up = 0;
          down = 1;
          left = 0;
          right = 0;
          rstn = 0;
          start = 0;
          stop = 0;
        end
        8'd65: begin
          up = 0;
          down = 0;
          left = 1;
          right = 0;
          rstn = 0;
          start = 0;
          stop = 0;
        end
        8'd68: begin
          up = 0;
          down = 0;
          left = 0;
          right = 1;
          rstn = 0;
          start = 0;
          stop = 0;
        end
        8'd82: begin
          up = 0;
          down = 0;
          left = 0;
          right = 0;
          rstn = 1;
          start = 0;
          stop = 0;
        end
        8'd66: begin
          up = 0;
          down = 0;
          left = 0;
          right = 0;
          rstn = 0;
          start = 1;
          stop = 0;
        end
        8'd72: begin
          up = 0;
          down = 0;
          left = 0;
          right = 0;
          rstn = 0;
          start = 0;
          stop = 1;
        end
        default: begin
          up = 0;
          down = 0;
          left = 0;
          right = 0;
          rstn = 0;
          start = 0;
          stop = 0;
        end
      endcase
    end
endmodule
