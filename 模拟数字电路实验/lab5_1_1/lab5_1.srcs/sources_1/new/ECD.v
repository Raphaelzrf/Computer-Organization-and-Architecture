`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/11/19 16:08:35
// Design Name: 
// Module Name: ECD
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


module ECD(
   
    input [15:0] s,
    output  reg [3:0] c
    );
   // reg [3:0] c;
always @(*) begin
    case (s)
        16'h0000: c=4'b0000;
        16'h0001: c=4'b0000;
        16'h0002: c=4'b0001;
        16'h0004: c=4'b0010;
        16'h0008: c=4'b0011;
        16'h0010: c=4'b0100;
        16'h0020: c=4'b0101;
        16'h0040: c=4'b0110;
        16'h0080: c=4'b0111;
        16'h0100: c=4'b1000;
        16'h0200: c=4'b1001;
        16'h0400: c=4'b1010;
        16'h0800: c=4'b1011;
        16'h1000: c=4'b1100;
        16'h2000: c=4'b1101;
        16'h4000: c=4'b1110;
        16'h8000: c=4'b1111;
        default: c=0;
    endcase
end
//always @(posedge clk) begin
//     d<=c;
//end
endmodule
