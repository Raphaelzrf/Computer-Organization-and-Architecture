`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/12/05 15:22:38
// Design Name: 
// Module Name: VDT
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


module VDT(
input clk,rst,//clk=65MHz
//output [9:0] h_addr,v_addr,
//output rd_vld,
input  [11:0] rd_data, //r[3:0],g[3:0],b[3:0]
output reg hs,vs,
output [11:0] vga_data,
output reg [10:0]  h_cnt,v_cnt
);
 reg  h_de,v_de;//data_enable
parameter H_CNT = 11'd1343; //136+160+1024+24=1345
parameter V_CNT = 11'd805;  //6+29+768+3=806;
reg         h_de,v_de;//data_enable
always@(posedge clk)
begin
    if(rst)
        h_cnt   <= 11'd0;
    else if(h_cnt>=11'd1343)
        h_cnt   <= 11'd0;
    else
        h_cnt   <= h_cnt + 11'd1;
end
always@(posedge clk)
begin
    if(rst)
        v_cnt   <= 11'd0;
    else if(h_cnt==11'd1343)
    begin
        if(v_cnt>=11'd805)
            v_cnt   <= 11'd0;
        else
            v_cnt   <= v_cnt + 11'd1;
    end
end
always@(posedge clk)
begin
    if(rst)
        h_de <= 1'b0;
    else if((h_cnt>=296)&&(h_cnt<=1319))
        h_de <= 1'b1;
    else
        h_de <= 1'b0;
end
always@(posedge clk)
begin
    if(rst)
        v_de <= 1'b0;
    else if((v_cnt>=35)&&(v_cnt<=802))
        v_de <= 1'b1;
    else
        v_de <= 1'b0;
end
always@(posedge clk)
begin
    if(rst)
        hs  <= 1'b1;
    else if(h_cnt<=11'd135)
        hs  <= 1'b0;
    else
        hs  <= 1'b1;
end
always@(posedge clk)
begin
    if(rst)
        vs  <= 1'b1;
    else if(v_cnt<=11'd5)
        vs  <= 1'b0;
    else
        vs  <= 1'b1;
end
assign vga_data = ((v_de==1)&&(h_de==1))? rd_data : 12'h0;
endmodule