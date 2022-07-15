`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/03/21 21:21:08
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
    parameter AW = 3,		//��ַ���
    parameter DW = 4		//���ݿ��
)(
    input clk,			//ʱ��
    input [AW-1:0] ra0, ra1,		//����ַ
    output [DW-1:0] rd0, rd1,	//������
    input [AW-1:0] wa, 		//д��ַ
    input [DW-1:0] wd,		//д����
    input we			//дʹ��
);
    reg [DW-1:0] rf [0: (1<<AW)-1];		//�Ĵ�����
    assign rd0 = rf[ra0], rd1 = rf[ra1];	//������
    always @ (posedge clk)
        if (we)  rf[wa]  <=  wd;		//д����
endmodule

