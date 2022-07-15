`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/03/16 23:02:00
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


module alu #(parameter WIDTH = 6)
(
    input [WIDTH-1:0] a,
    input [WIDTH-1:0] b,
    input [2:0] s,
    output reg [WIDTH-1:0] y,
    output reg cf,//进位或借位标志
    output reg of,//溢出标志
    output reg zf//零标志
);
    wire C3,C2,c3,c2,of_1,of_2;
    wire [WIDTH-1:0] y_1,y_2;
    _6bit_adder A1(a[WIDTH-1:0],b[WIDTH-1:0],0,y_1[WIDTH-1:0],C3,C2);
    _6bit_adder A2(a[WIDTH-1:0],-b[WIDTH-1:0],0,y_2[WIDTH-1:0],c3,c2);
    xor x1(of_1,C3,C2);
    xor x2(of_2,c3,c2);
    always @(*) begin
        case (s)
            3'b000:begin
                y=y_1;
                cf=C3;
                of=of_1;
                if (y_1==4'b0000) begin
                    zf=1;
                end
                else zf=0;
            end
            3'b001:begin
                y=y_2;
                cf=~c3;
                of=of_2;
                if(y_2==4'b0000)begin
                    zf=1;
                end
                else zf=0;
            end
            3'b100:begin
                y=a&b;
                cf=0;
                of=0;
                if(y==4'b0000) zf=1;
                else zf=0;
            end
            3'b101:begin
                y=a|b;
                cf=0;
                of=0;
                if(y==4'b0000) zf=1;
                else zf=0;
            end
            3'b110:begin
                y=a^b;
                cf=0;
                of=0;
                if(y==4'b0000) zf=1;
                else zf=0;
            end
            3'b111:begin
                y=~a;
                cf=0;
                of=0;
                if(y==4'b0000) zf=1;
                else zf=0;
            end
            default:begin
                y=4'b0000;
                cf=0;
                of=0;
                zf=1;
            end
        endcase
    end
endmodule

