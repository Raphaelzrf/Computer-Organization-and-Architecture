`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/11/19 15:27:52
// Design Name: 
// Module Name: PS
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

module PS (
    input clk,
    input s,
    output p
);
    reg m;
    always @(posedge clk) begin
        m<=s;
    end
    assign p=s*~m;
endmodule
