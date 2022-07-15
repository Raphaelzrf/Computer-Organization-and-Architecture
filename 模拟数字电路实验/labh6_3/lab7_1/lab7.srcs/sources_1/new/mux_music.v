`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/12/22 20:48:09
// Design Name: 
// Module Name: mux_music
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


module mux_music(
  input beep1,//start stop
  input beep2,//going
  input beep3,//victory
  input beep4,//dead
  input [1:0] flag,
  input stop,
  output reg beep
    );
  always @(*) begin
      if(stop) begin
    beep=beep1;
  end
  else begin
    if(flag == 0) begin
      beep=beep1;
    end
    else if(flag == 1) begin
      beep=beep2;
    end
    else if(flag == 2) begin
      beep=beep4;
    end
    else begin
      beep=beep3;
    end
  end
  end
endmodule
