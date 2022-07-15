`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/12/19 20:27:28
// Design Name: 
// Module Name: w_move
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


module w_move(
    input clk,
    input stop,
    input [1:0] flag,
    output reg [8:0] w1r,
    output reg [8:0] w2r,
    output reg [8:0] w3r,
    output reg [8:0] w4r,
    output reg [8:0] w5r,
    output reg [8:0] w6r
  );
  parameter width = 5;
  parameter height = 3;
  parameter pspeed = 2;
  integer r2=-40,r3=-80,r4=-120,r5=-160,r6=-200;
  always @(posedge clk) begin
    if(stop) begin
      w1r<=w1r;
      w2r<=w2r;
      w3r<=w3r;
      w4r<=w4r;
      w5r<=w5r;
      w6r<=w6r;  
    end
    else begin
      if(flag != 1) begin
        r2<=-40;
        r3<=-80;
        r4<=-120;
        r5<=-160;
        r6<=-200;
        w1r<=0;
        w2r<=0;
        w3r<=0;
        w4r<=0;
        w5r<=0;
        w6r<=0;  
      end
      else if(flag == 1) begin
        if(w1r == 240) begin
          w1r <= 1;
        end
        else begin
          w1r <= w1r + 1;
        end
        if(w2r == 240) begin
          w2r <= 1;
        end
        else if(r2 < 0) begin
            r2 <= r2+1;
            w2r<=0;
        end
        else begin
          w2r <= w2r + 1;
        end
        if(w3r == 240) begin
          w3r <= 1;
        end
        else if(r3 < 0) begin
            r3 <= r3+1;
            w3r<=0;
        end
        else begin
          w3r <= w3r + 1;
        end
        if(w4r == 240) begin
          w4r <= 1;
        end
        else if(r4 < 0) begin
            r4 <= r4+1;
            w4r<=0;
        end
        else begin
          w4r <= w4r + 1;
        end
        if(w5r == 240) begin
          w5r <= 1;
        end
        else if(r5 < 0) begin
            r5 <= r5+1;
            w5r<=0;
        end
        else begin
          w5r <= w5r + 1;
        end
        if(w6r == 240) begin
          w6r <= 1;
        end
        else if(r6 < 0) begin
            r6 <= r6+1;
            w6r<=0;
        end
        else begin
          w6r <= w6r + 1;
        end
      end
    end
   end
endmodule

