module crc_24_ble(clk_i, rst_n_i, data_i, res_o);
   
   parameter POLYNOM = 64'b1000000000000011001011011;

   integer i;

   function [63:0] REG_WIDTH_COUNTER;

      integer i;
      
      input [63:0] polynom;
      
      for (i = 0; i <64; i = i + 1) 
	if (polynom[i])
	  REG_WIDTH_COUNTER = i;
   endfunction // REG_WIDTH_COUNTER
      
   localparam REG_WIDTH = REG_WIDTH_COUNTER(POLYNOM);
  
   input 			clk_i;
   input 			rst_n_i;
   input 			data_i;
   
   output [REG_WIDTH-1:0] 	res_o;   

   reg    [REG_WIDTH-1:0] 	crc_gen;
   
   wire 			xor_v;


   always @(posedge clk_i or negedge rst_n_i)
     if (!rst_n_i)
       begin
	  crc_gen <= 0;
       end
     else
       begin
	  crc_gen[0] <=  xor_v;
	  for (i = 1; i <= REG_WIDTH; i = i + 1)
	    if (POLYNOM[i])
	      crc_gen[i] <= xor_v ^ crc_gen[i-1];
	    else
	      crc_gen[i] <= crc_gen[i-1];	      
       end

   assign res_o = crc_gen;
   assign xor_v = POLYNOM[0] ? crc_gen[REG_WIDTH-1] ^ data_i : crc_gen[REG_WIDTH-1] ;
   
   endmodule
