`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/03/16 18:23:23
// Design Name: 
// Module Name: mux
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


module mux (
    input  cnt,
    input [6:0] y,
    output reg [3:0] d
);
always @(*) begin
    case (cnt)
        2'b00: d = y[3:0]; 
        2'b01: d ={2'b00 ,y[5:4] };
        default: d = 0;
    endcase
end 
endmodule
