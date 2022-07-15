`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/10/28 20:55:39
// Design Name: 
// Module Name: alu
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



module alu(
    input [3:0] a,
    input [3:0] b,
    input [2:0] s,
    output reg [3:0] y,
    output reg cf,//进位或借位标志
    output reg of,//溢出标志
    output reg zf//零标志
    );
    wire C3,C2,c3,c2,of_1,of_2;
    wire [3:0] y_1,y_2;
    _4bit_adder A1(a[3:0],b[3:0],0,y_1[3:0],C3,C2);
    _4bit_adder A2(a[3:0],-b[3:0],0,y_2[3:0],c3,c2);
    xor x1(of_1,C3,C2);
    xor x2(of_2,c3,c2);
    always @(*) begin
        case (s)
            3'b000:begin
                y<=y_1;
                cf<=C3;
                of<=of_1;
                if (y_1==4'b0000) begin
                    zf<=1;
                end
                else zf<=0;
            end
            3'b001:begin
                y<=y_2;
                cf<=~c3;
                of<=of_2;
                if(y_2==4'b0000)begin
                    zf<=1;
                end
                else zf<=0;
            end
            3'b100:begin
                y<=a&b;
                cf<=0;
                of<=0;
                if(y==4'b0000) zf<=1;
            end
            3'b101:begin
                y<=a|b;
                cf<=0;
                of<=0;
                if(y==4'b0000) zf<=1;
            end
            3'b110:begin
                y<=a^b;
                cf<=0;
                of<=0;
                if(y==4'b0000) zf<=1;
            end
            3'b111:begin
                y<=~a;
                cf<=0;
                of<=0;
                if(y==4'b0000) zf<=1;
            end
            default:begin
                y<=4'b0000;
                cf<=0;
                of<=0;
                zf<=1;
            end
        endcase
    end
endmodule