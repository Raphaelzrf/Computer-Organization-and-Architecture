`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/11/14 15:23:35
// Design Name: 
// Module Name: decode2
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



/*
module decode2(
    input [1:0] c,
    output reg [3:0] an
    );
    always @(*) begin
        case (c)
            2'b00: an=4'b1110;
            2'b01: an=4'b1101;
            2'b10:an=4'b1011;
            2'b11: an=4'b0111;
        endcase
    end
    
    assign an[0]=c[0]+c[1];
    assign an[1]=~c[0]+c[1];
    assign an[2]=c[0]+~c[1];
    assign an[3]=~c[0]*~c[1]+~c[0]*c[1]+c[0]*~c[1];
    
endmodule
*/
module decode2(
    input [2:0] c,
   // input [15:0] d,
    output reg [7:0] an
    );
    
    always @(*) begin
    /*
        if(d[15:12]==0)begin
            if(d[11:8]==0)begin
                if(d[7:4]==0)begin
                    case (c)
                        3'b000: an=8'b11111110;
                        3'b001: an=8'b11111111;
                        3'b010: an=8'b11111111;
                        3'b011: an=8'b11111111;
                        3'b100: an=8'b11111111;
                        3'b101: an=8'b11111111;
                        3'b110: an=8'b10111111;
                        3'b111: an=8'b01111111;
                    endcase
                end
                else begin
                    case (c)
                        3'b000: an=8'b11111110;
                        3'b001: an=8'b11111101;
                        3'b010: an=8'b11111111;
                        3'b011: an=8'b11111111;
                        3'b100: an=8'b11111111;
                        3'b101: an=8'b11111111;
                        3'b110: an=8'b10111111;
                        3'b111: an=8'b01111111;
                    endcase
                end
            end
            else begin
                case (c)
                    3'b000: an=8'b11111110;
                    3'b001: an=8'b11111101;
                    3'b010: an=8'b11111011;
                    3'b011: an=8'b11111111;
                    3'b100: an=8'b11111111;
                    3'b101: an=8'b11111111;
                    3'b110: an=8'b10111111;
                    3'b111: an=8'b01111111;
                endcase
            end
        end 
        else begin
            case (c)
                3'b000: an=8'b11111110;
                3'b001: an=8'b11111101;
                3'b010: an=8'b11111011;
                3'b011: an=8'b11110111;
                3'b100: an=8'b11111111;
                3'b101: an=8'b11111111;
                3'b110: an=8'b10111111;
                3'b111: an=8'b01111111;
            endcase    
        end
        */
        case (c)
                3'b000: an=8'b11111110;
                3'b001: an=8'b11111101;
                3'b010: an=8'b11111011;
                3'b011: an=8'b11110111;
                3'b100: an=8'b11111111;
                3'b101: an=8'b11111111;
                3'b110: an=8'b10111111;
                3'b111: an=8'b01111111;
            endcase    
    end
endmodule


