`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/12/05 18:46:32
// Design Name: 
// Module Name: SRA
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

module VDS(
    input stop,
    input [1:0] flag,
    input [10:0] h_addr,
    input [10:0] v_addr,
    input [11:0] rdata1,
    input [11:0] rdata2,
    input [11:0] rdata3,
    input [11:0] rdata4,
    input [11:0] rdata5,
    input [8:0] w1r,
    input [8:0] w2r,
    input [8:0] w3r,
    input [8:0] w4r,
    input [8:0] w5r,
    input [8:0] w6r,
    input [8:0] w1d,
    input [8:0] w2u,
    input [8:0] w3d,
    input [8:0] w4u,
    input [8:0] w5d,
    input [8:0] w6u,    
    input [7:0] x,
    input [7:0] y,
    output [14:0] raddr,
    output reg [11:0] pdata
    );
    reg [11:0] h,v;
    //计算地址
    assign raddr=v*200+h;
    always @(*) begin
        if(h_addr<184||v_addr<29) begin
            h=0;
            v=0;
        end
        else begin
            h=(h_addr-184)/4;
            v=(v_addr-29)/4;
        end
    end

    always @(*) begin
      if(flag == 0) begin
        pdata = rdata1;//rdata1;
      end
      else if(stop) begin
        pdata=rdata4;
      end
      else if(flag == 1) begin
      //马里奥
     //   if(x-5 == v+1 && y-3 <= h+1 && h+1 <= y+3) begin
     //    pdata=12'h003;
      //  end
     //   else if(x-4 == v+1 && ((y-1<= h+1 && h+1 <= y+1)||(y-3== h+1) || (h+1 == y+3))) begin
     //     pdata=12'h030;
     //   end
      //  else if(x-3 == v+1 && ((y-1== h+1) || ( h+1 == y+1)||(y-3== h+1) || (h+1 == y+3)))begin
        //  pdata=12'h300;
       // end
      //  else if(x-2 == v+1 && ((y-1<= h+1 && h+1 <= y+1)||(y-3== h+1) || (h+1 == y+3)))begin
       //   pdata=12'h033;
      //  end
       // else if(x-1 == v+1 && ((y== h+1)|| (y-3== h+1) || (h+1 == y+3))) begin
       //   pdata=12'h330;
        //end
        //else if(x == v+1 && y-3 <= h+1 && h+1 <= y+3) begin
         // pdata=12'h303;
        //end
       // else if(x+1 == v+1 && ((y-3== h+1) || ( h+1 == y+3)||(y-2== h+1) || (h+1 == y+2) || (h+1==y))) begin
        //  pdata=12'h007;
      //  end
      //  else if(x+2 == v+1 && ((y-3== h+1) || ( h+1 == y+3)||(y-2== h+1) || (h+1 == y+2) || (h+1==y))) begin
        //  pdata=12'h070;
       // end
      //  else if(x+3 == v+1 && ((y-3== h+1) || ( h+1 == y+3)||(y-1== h+1) || (h+1 == y+1) )) begin
       //   pdata=12'h700;
      //  end
       // else if(x+4 == v+1 && ((y-3== h+1) || ( h+1 == y+3)||(y-2== h+1) || (h+1 == y+2) )) begin
        ///  pdata=12'h077;
      //  end
      //  else if (x+5 == v+1 && y-3 <= h+1 && h+1 <= y+3) begin
       //   pdata=12'h707;
       // end
        if(x-5 == v+1 && y+3 == h+1) pdata=12'hf00;
        else if(x-4 == v+1 && y+2 == h+1) pdata=12'hf00;
        else if(x-3 == v+1 && y+1 == h+1) pdata=12'hf00;
        else if(x-2 == v+1 && y == h+1) pdata=12'hf00;
        
        else if(x-1 == v+1 && y-1 == h+1) pdata=12'hf00;
        else if(x-1 == v+1 && y+3 == h+1) pdata=12'hf00;
        
        else if(x == v+1 && (y-3 <= h+1&& h+1 <= y+3)) pdata=12'hf00;
        
        else if(x+5 == v+1 && y+3 == h+1) pdata=12'hf00;
        else if(x+4 == v+1 && y+2 == h+1) pdata=12'hf00;
        else if(x+3 == v+1 && y+1 == h+1) pdata=12'hf00;
        else if(x+2 == v+1 && y == h+1) pdata=12'hf00;
        
        else if(x+1 == v+1 && y-1 == h+1) pdata=12'hf00;
        else if(x+1 == v+1 && y+3 == h+1) pdata=12'hf00;
        //墙
        else if ((w1r-9 <= h+1 &&  h+1 <= w1r) && (w1d >= v+1)) pdata=rdata5;
        else if ((w2r-9 <= h+1 &&  h+1 <= w2r) && (w2u <= v+1)) pdata=rdata5;
        else if((w3r-9 <= h+1&& h+1 <= w3r) && (w3d >= v+1)) pdata=rdata5;
        else if((w4r-9 <= h+1&& h+1 <= w4r) && (w4u <= v+1)) pdata=rdata5;
        else if((w5r-9 <= h+1&& h+1 <= w5r) && (w5d >= v+1)) pdata=rdata5;
        else if((w6r-9 <= h+1&& h+1 <= w6r) && (w6u <= v+1)) begin
          pdata=rdata5;//墙
        end
        else begin 
          pdata=rdata2;//rdata1
        end
      end
      else if(flag == 2) begin
        pdata=rdata5;
      end
      else begin
        pdata=rdata3;
      end
    end
endmodule
