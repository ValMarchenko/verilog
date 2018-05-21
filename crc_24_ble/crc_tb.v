`timescale 1ns/1ps
module crc_tb;
    
    reg clk;
    reg rst_n;
    reg data;
    reg [4:0] res, res_inv;
    wire [4:0] result;
    integer i;
    
    reg [11:0] initial_data;
    
    initial
    begin
    
       initial_data = 12'b101001100000;
       data = 0;
       @(negedge clk)
       rst_n = 1;
       @(negedge clk)
       rst_n = 0;
       @(negedge clk)
       rst_n = 1;
       for (i = 0; i < 12; i = i + 1)
       begin
        @(negedge clk)
        begin
          data = initial_data[11];
          initial_data = initial_data << 1;
      end
       end 
       res = result;
  //     for (i = 0; i < 24; i = i + 1)
  //     res_inv[i] = res[23 - i];
       initial_data = {7'b1010011 , res};
       rst_n = 1;
       @(negedge clk)
       rst_n = 0;
       @(negedge clk)
       rst_n = 1;
       for (i = 0; i < 11; i = i + 1)
       begin
        @(negedge clk)
        begin
          data = initial_data[11];
          initial_data = initial_data << 1;
      end
       end 
         for (i = 0; i < 64; i = i + 1)
 @(negedge clk);
       $finish;
   end
   
   initial 
   begin
   clk = 0;
   forever #25 clk = ~clk;
   end       
   
   dut dut1 (.clk_i(clk), 
             .rst_n_i(rst_n), 
             .data_i(data), 
             .res_o(result)
             );
   
   
   endmodule