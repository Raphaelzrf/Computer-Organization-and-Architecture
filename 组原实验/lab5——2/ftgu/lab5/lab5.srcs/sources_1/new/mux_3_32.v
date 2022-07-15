`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/04/22 22:14:53
// Design Name: 
// Module Name: mux_3_32
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


module mux_3_32(
  input [1:0] forwarding,
  input [31:0] a,
  input [31:0] b,
  input [31:0] c,
  output reg [31:0] result
);
always @ (*) begin
  if(forwarding == 0) begin
    result = a;
  end
  else if(forwarding == 1) begin
    result = b;
  end
  else if(forwarding == 2) begin
    result = c;
  end
  else begin
    result = 0;
  end
end
endmodule
