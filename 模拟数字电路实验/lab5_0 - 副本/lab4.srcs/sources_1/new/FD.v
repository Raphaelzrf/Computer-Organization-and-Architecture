`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/11/14 14:30:02
// Design Name: 
// Module Name: FD
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


module FD(
    input clk,
    input rstn,
    output out
    );
    parameter N=200000;
   // reg [17:0] cnt;
   integer cnt=0;
    always @(posedge clk or negedge rstn) begin
    if (~rstn)  cnt <= 0;
    else if (cnt == (N-1))  cnt <= 0;
    else  cnt <= cnt + 1;
/*
  if (rst)  cnt <= N-1;
  else if (cnt == 0)  cnt <= N - 1;
  else  cnt <= cnt - 1;
*/
    end
    /*always @(posedge clk or negedge rstn) begin
    if (~rstn)  out <= 0;
    else if (cnt == (N-2))  out <= 1;
    else  out <= 0;
    end
    */
    assign out = (cnt == (N-1));
endmodule
