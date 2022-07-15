`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/11/14 15:43:54
// Design Name: 
// Module Name: decode7
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



module decode7(
    input [3:0] d,
    output reg [6:0] seg
    );
    always @(*) begin
        case (d)
            4'h0: seg=7'b1000000;
            4'h1: seg=7'b1111001;
            4'h2: seg=7'b0100100;
            4'h3: seg=7'b0110000;
            4'h4: seg=7'b0011001;
            4'h5: seg=7'b0010010;
            4'h6: seg=7'b0000010;
            4'h7: seg=7'b1111000;
            4'h8: seg=7'b0000000;
            4'h9: seg=7'b0010000;
            4'ha: seg=7'b0001_000;
            4'hb: seg=7'b0000_011;
            4'hc: seg=7'b1000_110;
            4'hd: seg=7'b0100_001;
            4'he: seg=7'b0000_110;
            4'hf: seg=7'b0001_110;
            //default: seg=7'b1111111;
        endcase
        
    end
endmodule
