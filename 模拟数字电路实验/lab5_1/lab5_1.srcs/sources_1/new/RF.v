`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/11/19 15:21:13
// Design Name: 
// Module Name: RF
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


module  RF # (
    parameter AW = 5,		//��ַ���
    parameter DW = 16		//���ݿ��
)(
    input clk,			//ʱ��
    input rstn,
    input e_8,
    input [AW-1:0] ra0, ra1,		//����ַ
    output [DW-1:0] rd0, rd1,	//������
    input [AW-1:0] wa, 		//д��ַ
    input [DW-1:0] wd,		//д����
    input we,			//дʹ��
    output reg  [DW-1:0] t
   );
    reg [DW-1:0] rf [0: (1<<AW)-1];		//�Ĵ�����
    assign rd0 = rf[ra0], rd1 = rf[ra1];	//������
    always @(posedge clk) begin
        if(~rstn) begin
            t <= 0; 
        end
    else begin
    if(e_8) begin
        rf[ra1] <= rd0;
        rf[ra0] <= rd1;//����ָ��
        t<= t+1;
    end
    else begin 
        if(we) rf[wa] <= wd;
    end
    end
end		
endmodule

