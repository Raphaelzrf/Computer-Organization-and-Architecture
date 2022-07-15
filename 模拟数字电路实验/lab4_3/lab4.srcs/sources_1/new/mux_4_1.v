`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/11/14 15:57:08
// Design Name: 
// Module Name: mux_4_1
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


module mux_4_1(
    input [1:0] s,
    input [15:0] d,
    output reg [3:0] c
    );
    always @(*) begin
        case (s)
            2'b00: c<=d[3:0];
            2'b01: c<=d[7:4];
            2'b10: c<=d[11:8];
            2'b11: c<=d[15:12];
        endcase
    end
endmodule
