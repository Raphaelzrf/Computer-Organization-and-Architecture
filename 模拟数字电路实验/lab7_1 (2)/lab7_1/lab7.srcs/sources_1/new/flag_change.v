`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/12/19 20:28:19
// Design Name: 
// Module Name: flag_change
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


module flag_change (
  input clk,
  input rstn,
  input start,
  input [7:0] x,
  input [7:0] y,
  input [8:0] w1r,
  input [8:0] w2r,
  input [8:0] w3r,
  input [8:0] w4r,
  input [8:0] w5r,
  input [8:0] w6r,
  input [8:0] w1d,
  input [8:0] w2u,
  input [8:0] w3d,
  input [8:0] w4u,
  input [8:0] w5d,
  input [8:0] w6u,
  input win,
  output reg  [1:0] flag
);
parameter width = 3;
parameter height = 5;
always @(posedge clk) begin
  //×ó±ß½ç
  if(rstn) begin
    flag <= 0;
  end
  else if(start) flag <= 1;
  else if(win) begin
    flag <= 3;
  end
  else begin
  if((w1r-9 <= y-width && y-width <= w1r) && (w1d >= x-height)) flag <= 2;
  else if((w2r-9 <= y-width)&&( y-width <= w2r) && (w2u <= x+height)) flag <= 2;
  else if((w3r-9 <= y-width)&&( y-width <= w3r) && (w3d >= x-height)) flag <= 2;
  else if((w4r-9 <= y-width)&&( y-width <= w4r) && (w4u <= x+height)) flag <= 2;
  else if((w5r-9 <= y-width)&&( y-width <= w5r) && (w5d >= x-height)) flag <= 2;
  else if((w6r-9 <= y-width)&&( y-width <= w6r) && (w6u <= x+height)) begin
    flag <= 2;
  end
  //ÓÒ±ß½ç
   else if((w1r-9 <= y+width && y+width <= w1r) && (w1d >= x-height)) flag <= 2;
   else if ((w2r-9 <= y+width && y+width<= w2r) && (w2u <= x+height)) flag <= 2;
   else if((w3r-9 <= y+width&& y+width <= w3r) && (w3d >= x-height)) flag <= 2;
  else if((w4r-9 <= y+width && y+width<= w4r) && (w4u <= x+height)) flag <= 2;
   else if((w5r-9 <= y+width && y+width<= w5r) && (w5d >= x-height)) flag <= 2;
   else if((w6r-9 <= y+width&& y+width<= w6r) && (w6u <= x+height)) begin
    flag <= 2;
   end
 // end
 // else flag <= flag;*/
// assign flag = 1;
 end
end
endmodule
