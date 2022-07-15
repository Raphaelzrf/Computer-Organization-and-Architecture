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
    
        case (c)
                3'b000: an=8'b1111_1110;
                3'b001: an=8'b1111_1101;
                3'b010: an=8'b1111_1011;
                3'b011: an=8'b1111_0111;
                3'b100: an=8'b1011_1111;
                3'b101: an=8'b0111_1111;
                default: an=0;
            //    3'b110: an=8'b1011_1111;
             //  3'b111: an=8'b0111_1111;
            endcase    
    end
endmodule
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
