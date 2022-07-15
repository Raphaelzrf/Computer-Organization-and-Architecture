`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/12/19 15:11:07
// Design Name: 
// Module Name: p_move
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

module p_move(
    input clk,
    input stop,
    input up,
    input down,
    input left,
    input right,
    input [1:0] flag,
    output reg [7:0] x,
    output reg [7:0] y
  );
  parameter width = 3;
  parameter height = 5;
  parameter pspeed = 2;
  always @(posedge clk) begin
    if(stop) begin
      x <= x;
      y <= y;
    end
    else begin
      if(flag != 1) begin
        x <= 75;
        y <= 200-7;
      end
      else begin
        if(up && x > height+pspeed) begin
          x <= x-pspeed;
          y <= y;
        end
        else if(down && x< 150-height-pspeed) begin
          x <= x+pspeed;
          y <= y;
        end
        else if(left && y > width + pspeed) begin
          x <= x;
          y <= y-pspeed;
        end
       else  if (right && y < 200 - width - pspeed) begin
          x <= x;
          y <= y+pspeed;
        end
       else begin
           if(x+height<150) begin
            x <= x+1;
            y <= y;
           end
       end
      end
    end
    
  end
endmodule
