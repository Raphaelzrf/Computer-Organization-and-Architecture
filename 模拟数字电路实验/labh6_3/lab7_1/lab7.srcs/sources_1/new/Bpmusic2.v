`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/12/22 21:01:43
// Design Name: 
// Module Name: Bpmusic2
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


module Bpmusic2(
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
	prediv <= so;
end
else begin
	cnt <= cnt + 1'b1;
	if (cnt == prediv) begin
		beep <= ~beep;
		cnt <= 0;
		delay <= delay +1'b1;
		case(delay)
			13'd1000:prediv <= so;
			1500:prediv <= so;
			1600:prediv <= so;
			13'd2000:prediv <= la;
			13'd3000:prediv <= so;
			4300:prediv <= fa;
			13'd4800:prediv <= mi;
			13'd6000:prediv <= ri;
			7000:prediv <= do;
			8500:prediv <= ri;
			9100:prediv <= so;
			10000:prediv <= so;
			11000:prediv <= so;
			12000:prediv <= la;
			13000:prediv <= so;
			14000:prediv <= do;
			15000:prediv <= mi;
			15500:prediv <= so;
			16500:prediv <= mi;
			17500:prediv <= la;
			19500:prediv <= so;
			20800:prediv <= la;
			21500:prediv <= so;
			22000:prediv <= mi;
			23000:prediv <= do;
			23500:prediv <= ri;
			24100:prediv <= mi;
			24600:prediv <= so;
			24900:prediv <= ri;
			25400:prediv <= ri;
			25900:prediv <= so;
			26200:prediv <= so;
			26300:prediv <= so;
			26800:prediv <= la;
			27300:prediv <= so;
			28000:prediv <= fa;
			29000:prediv <= mi;
			30000:prediv <= ri;
			31000:prediv <= do;
			34000:prediv <= ri;
			35000:prediv <= so;
			36000:prediv <= so;
			36100:begin 
			         prediv <= so;
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

