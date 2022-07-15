`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/10/23 21:15:27
// Design Name: 
// Module Name: prioritycode
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


module prioritycode(
    input [9:0] x,
    output [3:0] nd,
    output GS
    );
    assign nd[0]=~x[9]&~x[8]&(x[7]|x[6]|(~x[5]&~x[4]&x[3])|(~x[5]&~x[4]&x[2]));       
    assign nd[1]= x[9]|x[8]|x[7]|((~x[6]&~x[5]&~x[4]&~x[3])&(x[2]|x[1]|x[0]));        
    assign nd[2]=~x[9]&(x[8]|x[7]|x[6]|x[5]|x[4]|x[3]|x[2]|x[1]);                     
    assign nd[3]= (x[9]|x[8]|x[7]|x[6]|x[5]);                                         
    assign GS=x[9]|x[8]|x[7]|x[6]|x[5]|x[4]|x[3]|x[2]|x[1]|x[0];                      
endmodule
