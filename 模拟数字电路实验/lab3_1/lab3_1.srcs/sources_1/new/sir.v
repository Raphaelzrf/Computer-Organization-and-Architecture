`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/11/05 21:10:00
// Design Name: 
// Module Name: sir
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



module sir(
    input clk,
    input rstn,
    input x,
    output reg y,
    output reg [7:0] rx,
    output reg [7:0] ry
    );
    reg [3:0] ns,cs;
   reg py;
    //wire clo=0;
    //用时序电路描述cs,rx,ry
    always  @(posedge clk)
        if (~rstn)begin
            cs<=4'b0000;
            y<=0;
            rx<=8'b0;
            ry<=8'b0;
        end   //同步复位
        else begin
            cs<=ns;
            y<=py;
            rx<={x,rx[7:1]};
            ry<={y,ry[7:1]};
        end
    //用组合逻辑电路描述ns，y；
    always @(*) begin
        case(cs)
            4'h0:begin
                if(x==1)begin
                    ns=4'h2;
                    py=0;
                end
                else begin
                    ns=4'h1;
                    py=0;
                end
            end
            4'h1:begin
                if(x==1)begin
                    ns=4'h2;
                   
                end
                else begin
                    ns=4'h3;
                    
                end
            end
            4'h2:begin
                if(x==1)begin
                    ns=4'h7;
                
                end
                else begin
                    ns=4'h1;
                 
                end
            end
            4'h3:begin
                if(x==1)begin
                    ns=4'h2;
                   
                end
                else begin
                    ns=4'h4;
                  
                end
            end
            4'h4:begin
                if(x==1)begin
                    ns=4'h2;
                  
                end
                else begin
                    ns=4'h5;
                  
                end
            end
            4'h5:begin
                if(x==1)begin
                    ns=4'h2;
                  
                end
                else begin
                    ns=4'h6;
                  
                end
            end
            4'h6:begin
                if(x==1)begin
                    ns=4'h2;
                  
                end
                else begin
                    ns=4'h6;
                    py=0;
                end
            end
            4'h7:begin
                if(x==1)begin
                    ns=4'h8;
                    
                end
                else begin
                    ns=4'h1;
                     
                end
            end
            4'h8:begin
                if(x==1)begin
                    ns=4'h9;
                     
                end
                else begin
                    ns=4'h1;
                     
                end
            end
            4'h9:begin
                if(x==1)begin
                    ns=4'ha;
                     
                end
                else begin
                    ns=4'h1;
                     
                end
            end
            4'ha:begin
                if(x==1)begin
                    ns=4'ha;
                    py=1;
                end
                else begin
                    ns=4'h1;
                end
            end
        endcase
    end
endmodule


