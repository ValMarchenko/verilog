module dut(clk_i, rst_n_i, data_i, res_o);

   input clk_i;
   input rst_n_i;
   input data_i;
   

   output [23:0] res_o;
   
   
   crc_24_ble dut(.clk_i(clk_i), 
                  .rst_n_i(rst_n_i), 
                  .data_i(data_i), 
                  .res_o(res_o)
                  );
endmodule