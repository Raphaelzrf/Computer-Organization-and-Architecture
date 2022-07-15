`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/11/22 00:13:21
// Design Name: 
// Module Name: AR
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


module AR (
    input clk,
    input rstn,
    input add,
    input sub,
    output reg [4:0] ra
);
reg [4:0] ns;
always @(posedge clk) begin
    ra <= ns;
end
always @(*) begin
    if(rstn) ns= 0;
    else if(add) ns = ra+1;
    else if(sub) ns = ra-1;
    else ns = ra;
end
endmodule
