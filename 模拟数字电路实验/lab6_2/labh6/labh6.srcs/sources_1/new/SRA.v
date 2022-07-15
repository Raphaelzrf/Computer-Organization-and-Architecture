`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/12/05 18:46:32
// Design Name: 
// Module Name: SRA
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


module SRA(
    input [10:0] h_addr,
    input [10:0] v_addr,
    input [11:0] rdata,
    input [7:0] x,
    input [7:0] y,
    output [15:0] raddr,
    output reg [11:0] pdata
    );
    reg [11:0] h,v;
    assign raddr=v*256+h;
    always @(*) begin
        if(h_addr<296||v_addr<35) begin
            h=0;
            v=0;
        end
        else begin
            h=(h_addr-296)/4;
            v=(v_addr-35)/4;
        end
    end
    always @(*) begin
        if(v==x&&h==y) begin
            pdata=12'hfff;
        end
        else if(v==x&&h==y+1) begin
            pdata=12'hfff;
        end
        else if(v==x&&h==y-1) begin
            pdata=12'hfff;
        end
        else if(v==x+1&&h==y) begin
            pdata=12'hfff;  
        end
        else if(v==x-1&&h==y) begin
            pdata=12'hfff;  
        end
        else begin
            pdata=rdata;
        end
    end
endmodule
