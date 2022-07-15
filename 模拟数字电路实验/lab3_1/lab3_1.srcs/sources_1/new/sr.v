`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/11/10 21:47:40
// Design Name: 
// Module Name: sr
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


module sr(
    input S,
    input R,
    output reg Q,
    output reg q
    );
    always@(*) begin
        if(S==1&&R==1)begin
            q=0;
            Q=0;
        end
        else if(S==0&&R==0) begin
            Q=Q;
            q=q;
        end
        else if(R==1)begin
            Q=0;
            q=1;
        end
        else begin
            Q=1;
            q=0;
        end
    end
endmodule
