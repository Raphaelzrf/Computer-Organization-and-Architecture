`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/11/19 16:47:12
// Design Name: 
// Module Name: decode4
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


module decode4(
    input [1:0] c, 
    output reg [3:0] an
    );
    always @(*) begin
        case (c)
            2'b00: an=4'b1111;
            2'b01: an=4'b1111;
            2'b10:an=4'b1011;
            2'b11: an=4'b0111;
        endcase
    end
endmodule
