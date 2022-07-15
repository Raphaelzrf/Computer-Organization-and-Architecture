`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/12/05 15:22:08
// Design Name: 
// Module Name: PCU
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


module PCU(
    input clk,
    input rstn,
    input [11:0] rgb,
    input [4:0] dir,
    input [11:0] romdata,
    input draw,
    input delete,
    output [15:0] waddr,
    output reg [11:0] wdata,
    output reg we,
    output reg [7:0] x,y
    );
    assign waddr=x*256+y;
    always @(*) begin
        if(draw) begin
            we=1;
            wdata=rgb;
        end
        else if(delete) begin
            we=1;
            wdata=romdata;
        end
        else begin
            we=0;
            wdata=rgb;
        end
    end
    always @(posedge clk) begin
        if(rstn)begin
            x<=96;
            y<=128;
        end
        else begin
            if(dir[0]) begin
                if(x>0) begin
                    x<=x-1;
                end
            end
            else if(dir[1]) begin
                if(x<191) begin
                   x<=x+1;
                end
            end 
            else if(dir[2]) begin
                if(y>0) begin
                    y<=y-1;
                end
            end 
            else if(dir[3]) begin
                if(y<255) begin
                    y<=y+1;
                end    
            end
        end
    end
endmodule
