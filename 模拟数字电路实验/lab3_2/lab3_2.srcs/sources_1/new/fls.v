`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/11/06 15:52:50
// Design Name: 
// Module Name: fls
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


/*module fls(
    input clk,
    input rstn,
    input en,
    input [7:0] d,
    output reg [7:0] f,
    output reg err
    );
    wire [8:0] sum;
    reg [17:0] ns,cs;
    assign sum=cs[7:0]+cs[15:8];
    always  @(posedge clk)
        if (~rstn)begin
            cs<=17'h0;
            err<=0;
        end 
        else begin
            cs<=ns;
        end
    always  @(posedge clk)
        if (~rstn)begin
            f<=8'h0;
        end 
        else begin
                case ({ns[17],ns[16]})
                    2'b01:begin
                        f<=ns[7:0];
                    end 
                    2'b10:begin
                        if(sum[8]!=1)begin
                            f<=ns[15:8];
                        end
                    else err<=1;
                end
            endcase
        end
    always @(*)begin
        if(en==1)begin
            case ({cs[17],cs[16]})
                2'b00:begin
                    ns={10'h100,d[7:0]};
                end 
                2'b01:begin
                    ns={2'b10,d[7:0],cs[7:0]};
                end
                2'b10:begin
                    if(sum[8]!=1)begin
                        ns[7:0]=cs[15:8];
                        ns[15:8]=sum[7:0];
                    end
                end
            endcase
        end
    end

endmodule
*/
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
    assign sum=cs[7:0]+cs[15:8];
    always  @(posedge clk)
        if (~rstn)begin
            cs<=17'h0;
        end 
        else begin
            cs<=ns;
        end
    always @(*)begin
            case ({cs[17],cs[16]})
                2'b00:begin
                    err=0;
                    f=0;
                    if(en==1)begin
                        ns={10'h100,d[7:0]};
                    end
                    else ns=cs;
                    
                end 
                2'b01:begin
                    err=0;
                    f=cs[7:0];
                    if(en==1)begin
                        ns={2'b10,d[7:0],cs[7:0]};
                    end
                    else ns=cs;
                end
                2'b10:begin
                    f=cs[15:8];
                    if(en==1)begin
                        if(sum[8]!=1)begin
                            ns={2'b10,sum[7:0],cs[15:8]};
                            err=0;
                        end
                        else begin
                            err=1;
                            ns=cs;
                        end
                    end
                    else ns=cs;
                end
            endcase
    end
endmodule
/*module fls(
    input clk,
    input rstn,
    input en,
    input [7:0] d,
    output reg [7:0] f,
    output reg err
    );
    wire [8:0] sum;
    reg [17:0] ns,cs;
    assign sum=cs[7:0]+cs[15:8];
    always  @(posedge clk)
        if (~rstn)begin
            ns<=17'h0;
            f<=8'h0;
            err=0;
        end 
        else begin
            cs<=ns;
        end
    always @(*)begin
        if(en==1)begin
            case ({cs[17],cs[16]})
                2'b00:begin
                    ns={10'h100,d[7:0]};
                    f=ns[7:0];
                end 
                2'b01:begin
                    ns={2'b10,d[7:0],cs[7:0]};
                    f=ns[15:8];
                end
                2'b10:begin
                    if(sum[8]!=1)begin
                        ns[7:0]=cs[15:8];
                        ns[15:8]=sum[7:0];
                        f=ns[15:8];
                    end
                    else err=1;
                end
            endcase
        end
    end

endmodule
*/