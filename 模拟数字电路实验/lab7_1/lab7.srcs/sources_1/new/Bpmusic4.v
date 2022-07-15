`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/12/22 21:03:38
// Design Name: 
// Module Name: Bpmusic4
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


module Bpmusic4(
input key,
input clk,
output reg beep
);
parameter do = 47774; //1
parameter ri = 42568; //2
parameter mi = 37919; //3
parameter fa = 35791; //4
parameter so = 31888; //5
parameter la = 28410; //6
parameter xi = 25309; //7
reg [15:0] cnt;
reg [15:0] prediv;
reg [24:0] delay;

initial begin
cnt = 16'd0;
prediv = so;
delay = 0;
end

always @(posedge clk) begin
if (key == 1'b1) begin
	beep <= 1'b0;
	delay <= 13'd0;
	cnt <= 16'd0;
	prediv <= do;
end
else begin
	cnt <= cnt + 1'b1;
	if (cnt == prediv) begin
		beep <= ~beep;
		cnt <= 0;
		delay <= delay +1'b1;
		case(delay)
			1000:prediv <= do;
            2000:prediv <= ri;
            3000:prediv <= mi;
            4000:prediv <= fa;
            5000:prediv <= so;
            6000:prediv <= la;
            7000:prediv <= xi;
            8000:prediv <= la;
            9000:prediv <= so;
            10000:prediv <= fa;
            11000:prediv <= mi;
            12000:prediv <= ri;
			14000:begin 
			         prediv <= do;
			         delay <= 0;
			end
			/*13'd7000:begin
				prediv <= 16'hBA9E;
				delay <= 13'd0;
				end*/
			default : prediv <= prediv;
			endcase
	end
end 
end
endmodule

