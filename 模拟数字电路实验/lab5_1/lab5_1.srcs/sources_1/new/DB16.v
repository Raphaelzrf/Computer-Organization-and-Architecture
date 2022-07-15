`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/11/14 19:30:58
// Design Name: 
// Module Name: DB
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


module DB16(
    input clk,
    input rstn,
    input [15:0] x,
    output reg [15:0] y
    );
    wire [19:0] q;
    reg eq;
    reg pe,ce;
    reg [1:0] cs,ns;
    counter20 c2(clk,rstn,pe,ce,0,q[19:0]);
    always @(*) begin
        if(q==999999) eq=1;
        else eq=0;
    end
    //描述输出与状态的关系
    always @(*) begin
        case (cs)
            2'b00: begin
                y=0;
                pe=1;
                ce=0;
            end
            2'b01: begin
                y=0;
                pe=0;
                ce=1;
            end
            2'b10: begin
                y=x;
                pe=1;
                ce=0;
            end
            2'b11: begin
                y=0;
                pe=0;
                ce=1;
            end
        endcase
    end
    //描述次态和输入和现态的关系
    always @(*) begin
        case (cs)
            2'b00: begin
                if(x==0) ns=cs;
                else ns=2'b01;
            end
            2'b01: begin
                if(x==0) ns=2'b00;
                else if(eq==1) ns=2'b10;
                else ns=cs;
            end
            2'b10: begin
                if(x!=1) ns=cs;
                else ns=2'b11;
            end
            2'b11: begin
                if(x!=1) ns=2'b01;
                else if(eq==1) ns=2'b00;
                else ns=cs;
            end
        endcase
    end
    //描述d触发器
    always @(posedge clk) begin
        if(~rstn) cs<=0;
        else begin
            cs<=ns;
        end  
    end
endmodule
