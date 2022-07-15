`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/11/07 08:30:46
// Design Name: 
// Module Name: fls3
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

module fls(
    input clk,
    input rstn,
    input en,
    input [7:0] d,
    output reg [7:0] f,
    output reg err
    );
    wire [8:0] sum;
    reg [17:0] ns,cs;
    reg perr;
    assign sum=cs[7:0]+cs[15:8];
    always  @(posedge clk)
        if (~rstn)begin
            cs<=17'h0;
        end 
        else begin
            cs<=ns;
        end
    always  @(posedge clk)
        if (~rstn)begin
            f<=0;
            err<=0;
        end 
        else begin
                case ({cs[17],cs[16]})
                    2'b00:begin
                        f<=0;
                        err<=0;
                    end 
                    2'b01:begin
                        f<=ns[7:0];
                        err<=0;
                    end
                    2'b10:begin
                        f<=ns[15:8];
                        err<=0;
                    end
                    2'b11:begin
                        f<=ns[15:8];
                        err<=1;
                    end
            endcase
        end
    always @(*)begin
        case ({cs[17],cs[16]})
                2'b00:begin
                    if(en==1)begin
                        ns={10'h100,d[7:0]};
                    end
                    else ns=cs;
                    
                end 
                2'b01:begin
                    if(en==1)begin
                        ns={2'b10,d[7:0],cs[7:0]};
                    end
                    else ns=cs;
                end
                2'b10:begin
                    if(en==1)begin
                        if(sum[8]!=1)begin
                            ns={2'b10,sum[7:0],cs[15:8]};
                        end
                        else begin
                            ns={2'b11,cs[15:0]};
                        end
                    end
                    else ns=cs;
                end
                2'b11:begin
                    ns<=cs;
                end
            endcase
    end

endmodule
