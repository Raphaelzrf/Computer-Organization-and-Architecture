`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/11/19 19:25:06
// Design Name: 
// Module Name: PS16
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

module PS16 (
    input clk,
    input [15:0] s,
    output [15:0] p
);
    reg [15:0] m,t;
    always @(posedge clk) begin
        m<=s;
    end
    always @(posedge clk) begin
        t<=m;
    end
    assign p=s*~t;
endmodule
