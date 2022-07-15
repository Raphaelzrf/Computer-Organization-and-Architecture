`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/12/19 20:31:43
// Design Name: 
// Module Name: counter
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


module counter (
  input clk,
  input [1:0] flag,
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
  output reg [11:0] cnt,
  output reg win
);
parameter winnum = 19;
always @(posedge clk) begin
 if(flag==1) begin
  if((y == w1r-10 && w1d != 0)|| (y == w2r-10 && w2u != 151) || (y == w3r-10 && w3d != 0) || (y == w4r-10 && w4u != 151) || (y == w5r-10 && w5d != 0) || (y == w6r-10 && w6u != 151)) begin
    if(cnt == 20) begin
      cnt <= cnt;
      win <= 1;
    end
    else begin
      cnt <= cnt +1;
      win <= 0;
    end
  end
 end
 else if(flag == 0)begin
    cnt <= 0;
    win <= 0;
 end
 else begin
    cnt<=cnt;
    win<=0;
 end
end

endmodule