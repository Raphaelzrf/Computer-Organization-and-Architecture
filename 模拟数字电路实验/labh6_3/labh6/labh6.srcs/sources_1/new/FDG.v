`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/12/07 21:17:21
// Design Name: 
// Module Name: FDG
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

module FDG(
    input s,
    input clk,
    input rstn,         
    output reg out
    );
    parameter N=50000000;
    integer cnt=0;
    always @(posedge clk) begin
        if (rstn)  cnt <= 0;
        else if(cnt==N) cnt<=0;
        else if (s==1)  cnt<=cnt + 1;
        else  cnt <=0;
    end
    always @(posedge clk) begin
    if (rstn)  out <= 0;
    else if (cnt==N)  out <= 0;
    else  out <= s;
    end
// assign out = (cnt == (N-1));
endmodule
