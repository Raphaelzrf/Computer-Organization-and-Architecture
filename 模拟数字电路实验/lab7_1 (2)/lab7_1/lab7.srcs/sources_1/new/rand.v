`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/12/19 20:34:07
// Design Name: 
// Module Name: rand
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

module random (
  input clk,
  input [8:0] w1r,
  input [8:0] w2r,
  input [8:0] w3r,
  input [8:0] w4r,
  input [8:0] w5r,
  input [8:0] w6r,
  output [8:0] w1d,
  output [8:0] w2u,
  output [8:0] w3d,
  output [8:0] w4u,
  output [8:0] w5d,
  output [8:0] w6u
);
reg[31:0]   rand1=32'b11001011010011010110101101100101;
reg[31:0]   rand2=32'b10100110010101010010110101010110;
reg [3:0] x1,x2,x3,x4,x5,x6;
assign w1d=x1 * 20;
assign w2u=150-x2 * 10 +1;
assign w3d=x3 * 10;
assign w4u=150-x4 * 10 +1;
assign w5d=x5 * 10;
assign w6u=150-x6 * 10 +1;

always @(posedge clk) begin
  if(w1r == 240||w1r<=0) 
    begin
      x1 <= (rand1 % 7) ? (rand1 % 7) : 5;
      if(rand1==0)
        rand1 <= 32'b11001011010011010110101101100101;  //每次左移数据后再取余，实现伪随机数
      else
        rand1 <= rand1 << 1; 
    end
  else
    x1<=x1;//70
end
always @(posedge clk) begin
  if(w2r == 240||w2r<=0) 
    begin
      x2 <= (rand2 % 7) ? (rand2 % 7) : 4;
      if(rand2==0)
        rand2 <= 32'b10100110010101010010110101010110;  //每次左移数据后再取余，实现伪随机数
      else
        rand2 <= rand2 << 1; 
    end
  else
    x2<=x2;//70
end
always @(posedge clk) begin
  if(w3r == 240||w3r<=0) 
    begin
      x3=x1+x2;
    end
  else
    x3<=x3;//140
end
always @(posedge clk) begin
  if(w4r == 240||w4r<=0) 
    begin
      x4=x1+x2/2;
    end
  else
    x4<=x4;//130
end
always @(posedge clk) begin
  if(w5r == 240||w5r<=0) 
    begin
      x5=x2+x1/2;
    end
  else
    x5<=x5;//100
end
always @(posedge clk) begin
  if(w6r == 240||w6r<=0) 
    begin
      x6=x2;
    end
  else
    x6<=x6;//70
end
  
endmodule
