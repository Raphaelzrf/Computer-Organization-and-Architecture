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
    input [15:0] rd1,rd2,
    input [4:0] ra,
    input [15:0] d,
    input exe,
    input bs,
    input pre,
    input next,
    output reg e_1, //��ARΪ0
    output reg e_2, //���ӼĴ����Ѷ��������ݴ浽DR��
    output reg e_3, //DR������
    output reg e_4, //DR������
    output reg e_5, //�Ĵ���дʹ��
    output reg e_6, //AR��һ
    output reg e_7, //AR��1
    output reg e_8,//���ݽ���
    output reg busy
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
            4'b0000: ns=cs+1;
            4'b0001: ns=cs+1;
            4'b0010: begin
                if(d!=0) ns=4'b0011;
                else if(exe==1) ns=4'b1001;
                else if(bs==1) ns=4'b0100;
                else if(next==1) ns=4'b0101;
                else if(pre==1) ns=4'b0110;
                else ns=cs;
            end
            4'b0011: ns=4'b0010;
            4'b0100: ns=4'b0010;
            4'b0101: ns=4'b0001;
            4'b0110: ns=4'b0001;
            4'b1001:begin
                busy = 0;
                if(rd1 > rd2) begin
                    ns= 4'b1010; 
                end 
                else begin
                    if(ra == 30) begin
                        ns = 4'b0010; 
                    end 
                    else begin
                        ns= 4'b1001;
                    end
                end
             end
             4'b1010:begin
                ns= 4'b1001;
            end
            default: ns=cs;
        endcase
    end


//���������״̬�Ĺ�ϵ
always @(*) begin
    case (cs)
        3'b0000: begin
            e_1=1;
            e_2=0;
            e_3=0;
            e_4=0;
            e_5=0;
            e_6=0;
            e_7=0;
            e_8=0;
            busy=0;
        end
        3'b0001: begin
            e_1=0;
            e_2=1;
            e_3=0;
            e_4=0;
            e_5=0;
            e_6=0;
            e_7=0;
            e_8=0;
            busy=0;
        end
        3'b0010: begin
            e_1=0;
            e_2=0;
            e_3=0;
            e_4=0;
            e_5=0;
            e_6=0;
            e_7=0;
            e_8=0;
            busy=0;
        end
        3'b0011: begin
            e_1=0;
            e_2=0;
            e_3=1;
            e_4=0;
            e_5=0;
            e_6=0;
            e_7=0;
            e_8=0;
            busy=0;
        end
        3'b0100: begin
            e_1=0;
            e_2=0;
            e_3=0;
            e_4=1;
            e_5=0;
            e_6=0;
            e_7=0;
            e_8=0;
            busy=0;
        end
        3'b0101: begin
            e_1=0;
            e_2=0;
            e_3=0;
            e_4=0;
            e_5=1;
            e_6=1;
            e_7=0;
            e_8=0;
            busy=0;
        end
        3'b0110: begin
            e_1=0;
            e_2=0;
            e_3=0;
            e_4=0;
            e_5=1;
            e_6=0;
            e_7=1;
            e_8=0;
            busy=0;
        end
        4'b1001:begin
        
            if(rd1 > rd2) begin
                busy=1;
                e_1=0;
                e_2=0;
                e_3=0;
                e_4=0;
                e_5=1;
                e_6=0;
                e_7=0;
                e_8=1;
            end 
            else begin
                e_8 = 0;
                if(ra == 30) begin
                    busy = 0;
                    e_1=1;
                    e_2=0;
                    e_3=0;
                    e_4=0;
                    e_5=0;
                    e_6=0;
                    e_7=0;
                    e_8=0;
                end 
                else begin
                    busy=1;
                    e_1=0;
                    e_2=0;
                    e_3=0;
                    e_4=0;
                    e_5=0;
                    e_6=1;
                    e_7=0;
                    e_8=0;
                end
            end
        end
        4'b1010:begin
            busy = 1;
            e_8 = 0;
            if(ra > 0)begin
                e_1=0;
                e_2=0;
                e_3=0;
                e_4=0;
                e_5=0;
                e_6=0;
                e_7=1;
                e_8=0;
            end else begin
                e_1=0;
            e_2=0;
            e_3=0;
            e_4=0;
            e_5=0;
            e_6=0;
            e_7=0;
            e_8=0;
            end
        end
        default:begin
            e_1=0;
            e_2=0;
            e_3=0;
            e_4=0;
            e_5=0;
            e_6=0;
            e_7=0;
            busy = 1;
            e_8 = 0;
        end
    endcase
    
end
    
endmodule
