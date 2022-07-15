`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/11/14 11:05:24
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


module  counter #(
    parameter W = 2, 
        RST_VLU = 0
)(
    input clk, rstn, pe, ce, 
    input [W-1:0] d,
    output reg [W-1:0] cnt
);
    always @(posedge clk) begin
        if (~rstn)  cnt <= RST_VLU;
        else if (pe)  cnt <= d;
        else if (ce)  cnt <= cnt + 1; 
//      else if (ce)  cnt <= cnt ¨C 1;
    end
endmodule

