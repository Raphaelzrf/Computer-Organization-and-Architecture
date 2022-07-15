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


module mux_2_1(
    input [1:0] s,
    input [4:0] d,
    output reg [3:0] c
    );
    always @(*) begin
        case (s)
            2'b00: c<=0;
            2'b01: c<=0;
            2'b10: c<=d[3:0];
            2'b11: c<={3'b000,d[4]};
        endcase
    end
endmodule
