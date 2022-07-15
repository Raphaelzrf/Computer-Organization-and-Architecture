`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/03/16 18:22:38
// Design Name: 
// Module Name: decodercnt
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


module decodercnt(
    input  cnt,
    output reg [7:0] q  
    );
    always@(*)begin
        case(cnt)
            2'b00: q = 8'b11111110;
            2'b01: q = 8'b11111101;
            default:q = 8'b11111111;
        endcase
    end
endmodule
