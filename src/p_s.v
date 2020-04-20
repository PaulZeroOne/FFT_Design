//**********************************************************
// Author: Luo Tian, copyright 2020
// e-mail: luotian12345@sjtu.edu.cn
// School: Shanghai Jiao Tong University
//
// File Name: p_s
//
// Type: Combinational
//
// Purpose: <Specific Function Description>
// 
//
// Details:
//
//
// Release History:
// - Version 1.0 20/03/27: Create;
// - Version 1.1 20/02/20: Modify.
//
// Notes:
//
//**********************************************************
module p_s(clk,rst_n,data_in_3,p_s_flag_in,data_out_3);
  
  input clk;
  input rst_n;
  input p_s_flag_in;
  input data_in_3;
  
  output data_out_3;
  
  wire clk;
  wire rst_n;
  wire [135:0] data_in_3;
  wire p_s_flag_in;
  reg [33:0] data_out_3;
  
  reg [33:0] R0;
  reg [33:0] R1;
  reg [33:0] R2;
  reg [33:0] R3;
  reg [33:0] R4;
  reg [33:0] R5;
  reg [33:0] R6;
  reg [33:0] R7;
  reg [33:0] R8;
  reg [33:0] R9;
  reg [33:0] R10;
  reg [33:0] R11;
  reg [33:0] R12;
  reg [33:0] R13;
  reg [33:0] R14;
  reg [33:0] R15;
  
  reg [1:0] counter_1;
  reg [3:0] counter_2;
  reg [1:0] next_1;
  reg [3:0] next_2;
  
  reg p_s_flag_out;
  
  always @(posedge clk)begin
    if (!rst_n)begin
      counter_1 <= 0;
      end
    else if(!p_s_flag_in )begin
      counter_1 <= next_1;
      end
    else begin
      counter_1 <= counter_1;
      end
  end
  
  always @(posedge clk)begin
    if (!rst_n)begin
      next_1 <= 0;
      end
    else if(!p_s_flag_in )begin
      next_1 <= counter_1 + 1;
      end
    else begin
      next_1 <= next_1;
      end
  end
  
   always @(posedge clk)begin
    if(!p_s_flag_in )begin
     case(counter_1)
       2'b00:begin
             R0 <= data_in_3[33:0];
             R4 <= data_in_3[67:34];
             R8 <= data_in_3[101:68];
             R12 <= data_in_3[135:102];
             end
       2'b01:begin
             R1 <= data_in_3[33:0];
             R5 <= data_in_3[67:34];
             R9 <= data_in_3[101:68];
             R13 <= data_in_3[135:102];
             end
       2'b10:begin
             R2 <= data_in_3[33:0];
             R6 <= data_in_3[67:34];
             R10 <= data_in_3[101:68];
             R14 <= data_in_3[135:102];
             end
       2'b11:begin
             R3 <= data_in_3[33:0];
             R7 <= data_in_3[67:34];
             R11 <= data_in_3[101:68];
             R15 <= data_in_3[135:102];
             end
     endcase
   end
   end

always @(posedge clk)begin
    if (!rst_n)begin
      counter_2 <= 0;
      end
    else if(!p_s_flag_in )begin
      counter_2 <= next_2;
      end
    else begin
      counter_2 <= counter_2;
      end
  end
  
  always @(posedge clk)begin
    if (!rst_n)begin
      next_2 <= 0;
      end
    else if(!p_s_flag_in )begin
      next_2 <= counter_2 + 1;
      end
    else begin
      next_2 <= next_2;
      end
  end
  
   always @(posedge clk)begin
     if(!rst_n)begin
       p_s_flag_out <= 1'b0;
       end
     else if(!p_s_flag_in)begin 
       p_s_flag_out <= 1'b1;
     end
       begin
         p_s_flag_out <= p_s_flag_out;
       end
     end
         
   always @(posedge clk)begin
    if(p_s_flag_out)begin
       case(counter_2)
         4'b0000:begin
                 data_out_3 <= R0;
                 end
         4'b0001:begin
                 data_out_3 <= R4;
                 end
         4'b0010:begin
                 data_out_3 <= R8;
                 end
         4'b0011:begin
                 data_out_3 <= R12;
                 end
         4'b0100:begin
                 data_out_3 <= R1;
                 end
         4'b0101:begin
                 data_out_3 <= R5;
                 end
         4'b0110:begin
                 data_out_3 <= R9;
                 end
         4'b0111:begin
                 data_out_3 <= R13;
                 end
         4'b1000:begin
                 data_out_3 <= R2;
                 end
         4'b1001:begin
                 data_out_3 <= R6;
                 end
         4'b1010:begin
                 data_out_3 <= R10;
                 end
         4'b1011:begin
                 data_out_3 <= R14;
                 end
         4'b1100:begin
                 data_out_3 <= R3;
                 end
         4'b1101:begin
                 data_out_3 <= R7;
                 end
         4'b1110:begin
                 data_out_3 <= R11;
                 end
         4'b1111:begin
                 data_out_3 <= R15;
                 end
       endcase
     end
   end
   
endmodule
