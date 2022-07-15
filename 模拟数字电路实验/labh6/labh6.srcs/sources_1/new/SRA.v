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
    output [14:0] raddr,
    output [11:0] pdata
    );
    reg [11:0] h,v;
    assign raddr=v*200+h;
    assign pdata=rdata;
    always @(*) begin
        if(h_addr<184||v_addr<29) begin
            h=0;
            v=0;
        end
        else begin
            h=(h_addr-184)/4;
            v=(v_addr-29)/4;
        end
    end
endmodule
