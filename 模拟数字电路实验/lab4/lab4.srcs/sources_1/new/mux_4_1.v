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
            3'b000: c<=d[3:0];
            3'b001: c<=d[7:4];
            3'b010: c<=d[11:8];
            3'b011: c<=d[15:12];
            3'b000: c<=d[19:16];
            3'b001: c<=d[23:20];
            3'b010: c<=d[27:24];
            3'b011: c<=d[31:28];
        endcase
    end
endmodule
