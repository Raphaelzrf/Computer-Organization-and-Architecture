`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/03/16 16:36:39
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


module alu #(parameter WIDTH = 32)
(
    input [WIDTH-1:0] a,
    input [WIDTH-1:0] b,
    input [2:0] s,
    output reg [WIDTH-1:0] y,
    output reg zf//¡„±Í÷æ
);
    wire [WIDTH-1:0] y_1,y_2;
    _32bit_adder_pre m1(a[WIDTH-1:0],b[WIDTH-1:0],0,y_1[WIDTH-1:0]);
    _32bit_adder_pre m2(a[WIDTH-1:0],-b[WIDTH-1:0],0,y_2[WIDTH-1:0]);
    always @(*) begin
        case (s)
            3'b000:begin
                y=y_1;
                if (y_1==0) begin
                    zf=1;
                end
                else zf=0;
            end
            3'b001:begin
                y=y_2;
                if(y_2==0)begin
                    zf=1;
                end
                else zf=0;
            end
            3'b100:begin
                y=a&b;
                if(y==0) zf=1;
                else zf=0;
            end
            3'b101:begin
                y=a|b;
                if(y==0) zf=1;
                else zf=0;
            end
            3'b110:begin
                y=a^b;
                if(y==0) zf=1;
                else zf=0;
            end
            3'b111:begin
                y=~a; 
                if(y==0) zf=1;
                else zf=0;
            end
            default:begin
                y=0;
                zf=1;
            end
        endcase
    end
endmodule
