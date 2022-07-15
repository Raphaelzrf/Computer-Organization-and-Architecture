`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/11/22 00:09:29
// Design Name: 
// Module Name: FSM
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


module FSM (
    input clk,
    input rstn,
    input [15:0] d,
    input bs,
    input pre,
    input next,
    output reg e_1, //��ARΪ0
    output reg e_2, //���ӼĴ����Ѷ��������ݴ浽DR��
    output reg e_3, //DR������
    output reg e_4, //DR������
    output reg e_5, //�Ĵ���дʹ��
    output reg e_6, //AR��һ
    output reg e_7 //AR��1
);
reg [2:0] ns,cs;

//������̬���̬�Ĺ�ϵ
always @(posedge clk) begin
    if(~rstn) cs<=0;
    else cs<=ns;
end

//������̬�ʹ�̬�Ĺ�ϵ
always @(*) begin
        case (cs)
            3'b000: ns=cs+1;
            3'b001: ns=cs+1;
            3'b010: begin
                if(d!=0) ns=3'b011;
                else if(bs==1) ns=3'b100;
                else if(next==1) ns=3'b101;
                else if(pre==1) ns=3'b110;
                else ns=cs;
            end
            3'b011: ns=3'b010;
            3'b100: ns=3'b010;
            3'b101: ns=3'b001;
            3'b110: ns=3'b001;
            default: ns=cs;
        endcase
    end


//���������״̬�Ĺ�ϵ
always @(*) begin
    case (cs)
        3'b000: begin
            e_1=1;
            e_2=0;
            e_3=0;
            e_4=0;
            e_5=0;
            e_6=0;
            e_7=0;
        end
        3'b001: begin
            e_1=0;
            e_2=1;
            e_3=0;
            e_4=0;
            e_5=0;
            e_6=0;
            e_7=0;
        end
        3'b010: begin
            e_1=0;
            e_2=0;
            e_3=0;
            e_4=0;
            e_5=0;
            e_6=0;
            e_7=0;
        end
        3'b011: begin
            e_1=0;
            e_2=0;
            e_3=1;
            e_4=0;
            e_5=0;
            e_6=0;
            e_7=0;
        end
        3'b100: begin
            e_1=0;
            e_2=0;
            e_3=0;
            e_4=1;
            e_5=0;
            e_6=0;
            e_7=0;
        end
        3'b101: begin
            e_1=0;
            e_2=0;
            e_3=0;
            e_4=0;
            e_5=1;
            e_6=1;
            e_7=0;
        end
        3'b110: begin
            e_1=0;
            e_2=0;
            e_3=0;
            e_4=0;
            e_5=1;
            e_6=0;
            e_7=1;
        end
        default:begin
            e_1=0;
            e_2=0;
            e_3=0;
            e_4=0;
            e_5=0;
            e_6=0;
            e_7=0;
        end
    endcase
    
end
    
endmodule
