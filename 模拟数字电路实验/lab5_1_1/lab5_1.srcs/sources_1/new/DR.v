`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/11/22 00:19:48
// Design Name: 
// Module Name: DR
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


module DR (
    input clk,
    input rstn,
    input [3:0] d,
    input go,
    input left,
    input right,
    input [15:0] rd,
    output reg [15:0] DR
);
reg [15:0] ns;
always @(posedge clk) begin
    if(~rstn) DR <= 0;
    else DR <= ns;
end
always @(*) begin
    if(go) ns = rd;
    else if(left) ns= (DR<<4)+d;
    else if(right) ns = DR>>4;
    else ns= DR;
end
endmodule
