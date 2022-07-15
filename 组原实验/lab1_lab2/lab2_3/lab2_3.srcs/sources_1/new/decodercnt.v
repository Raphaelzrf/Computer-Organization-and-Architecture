`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/03/22 19:32:16
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
    input [2:0] cnt,
    input [7:0] valid,
    output reg [7:0] q
    );
    always@(*)begin
        case(cnt)
            0: begin
                if(valid[0] == 1) begin
                    q = 8'b11111110;
                end
                else begin
                    q = 8'b11111111;
                end
            end 
            1: begin
                if(valid[1] == 1) begin
                    q = 8'b11111101;
                end
                else begin
                    q = 8'b11111111;
                end
            end 
            2: begin
                if(valid[2] == 1) begin
                    q = 8'b11111011;
                end
                else begin
                    q = 8'b11111111;
                end
            end
            3: begin
                if(valid[3] == 1) begin
                   q = 8'b11110111;
                end
                else begin
                    q = 8'b11111111;
                end
            end 
            4: begin
                if(valid[4] == 1) begin
                    q = 8'b11101111;
                end
                else begin
                    q = 8'b11111111;
                end
            end 
            5: begin
                if(valid[5] == 1) begin
                    q = 8'b11011111;
                end
                else begin
                    q = 8'b11111111;
                end
            end 
            6: begin
                if(valid[6] == 1) begin
                    q = 8'b10111111;
                end
                else begin
                    q = 8'b11111111;
                end
            end 
            7: begin
                if(valid[7] == 1) begin
                    q = 8'b01111111;
                end
                else begin
                    q = 8'b11111111;
                end
            end
            default:q = 8'b11111111;
        endcase
    end
endmodule
