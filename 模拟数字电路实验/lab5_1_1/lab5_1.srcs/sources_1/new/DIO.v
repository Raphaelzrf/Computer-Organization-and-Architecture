`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/11/19 19:14:59
// Design Name: 
// Module Name: DIO
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
module DIO(
    input clk,
    input rstn,
    input [15:0] d,
    input bs,
    input pre,
    input nxt,
    output [7:0] an,
    output [6:0] seg
    );

    //定义变量
    wire bs1,bs2,pre1,pre2,nxt1,nxt2,e_1,e_2,e_3,e_4,e_5,e_6,e_7;
    wire [15:0] d1,d2;
    wire [4:0] AR;//地址寄存器
    wire [15:0] DR;//数据寄存器
    wire [15:0] rd1,rd2;//读数据
    
    wire [3:0] c;

    //连接模块
    DIS(clk,rstn,AR,DR,an[7:0],seg[6:0]);
    RF(clk,AR[4:0],AR[4:0],rd1[15:0],rd2[15:0],AR[4:0],DR[15:0],e_5);
    ECD e1(d2[15:0],c[3:0]);
    FSM f1(clk,rstn,d2[15:0],bs2,pre2,nxt2,e_1,e_2,e_3,e_4,e_5,e_6,e_7);
    DR dd(clk,rstn,c[3:0],e_2,e_3,e_4,rd1,DR);
    AR aa(clk,e_1,e_6,e_7,AR);
    //去抖动和取边沿
    DB16 d11(clk,rstn,d[15:0],d1[15:0]);
    PS16 p1(clk,d1[15:0],d2[15:0]);
    DB d22(clk,rstn,bs,bs1);
    PS p2(clk,bs1,bs2);
    DB d3(clk,rstn,pre,pre1);
    PS p3(clk,pre1,pre2);
    DB d4(clk,rstn,nxt,nxt1);
    PS p4(clk,nxt1,nxt2);
    
 /*   //状态机FSM
    //描述次态与现态的转换
    always @(posedge clk) begin
        if(~rstn) begin
            cs<=0;
            AR<=0;
            we<=0;
        end
        else cs<=ns;    
    end
    
    //描述次态与输入和现态的关系
    always @(*) begin
        case (cs)
            3'b000: ns=cs+1;
            3'b001: ns=cs+1;
            3'b010: begin
                if(d2!=0) ns=3'b011;
                else if(bs2==1) ns=3'b100;
                else if((nxt2==1)&&(pre2==1)) ns=3'b101;
                else ns=cs;
            end
            3'b011: ns=3'b010;
            3'b100: ns=3'b010;
            3'b101: ns=3'b001;
            default: ns=cs;
        endcase
    end

    //描述输出
    always @(posedge clk) begin
        case (cs)
            3'b000: begin
                we<=0;
                DR<=rd;
            end
            3'b001: begin
                we<=0;
                T<={nxt2,pre2};
            end
            3'b010: begin
                we<=0;
                if(d!=0) DR<={DR[11:0],c[3:0]};
                if(bs==1) DR<={4'b0000,DR[15:4]};
                if(T[1]) begin
                    we<=1;
                    AR<=AR+1;
                end
                if(T[0]) begin
                    we<=1;
                    AR<=AR-1;
                end
            end
            3'b011: begin
                we<=0;
                T<={nxt2,pre2};
            end
            3'b100: begin
                we<=0;
                T<={nxt2,pre2};
            end
            3'b101: begin
                we<=0;
                DR<=rd;
            end
        endcase
    end
    
 */
endmodule
