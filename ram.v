module ram(clka_i, rsta_i, wrena_i, wr_data_a_i, rd_data_a_o, wr_add_a_i, rd_add_a_i,
			  clkb_i, rstb_i, wrenb_i, wr_data_b_i, rd_data_b_o, wr_add_b_i, rd_add_b_i);
				
parameter DATA_A_WIDTH = 32;
parameter ADDR_A_WIDTH = 16;
parameter DATA_B_WIDTH = 32;
parameter ADDR_B_WIDTH = 16;

input clka_i, rsta_i, wrena_i, clkb_i, rstb_i, wrenb_i;
input [DATA_A_WIDTH-1 : 0] wr_data_a_i;
input [DATA_B_WIDTH-1 : 0] wr_data_b_i;
input [ADDR_A_WIDTH-1 : 0] wr_add_a_i, rd_add_a_i;
input [ADDR_B_WIDTH-1 : 0] wr_add_b_i, rd_add_b_i;

output [DATA_A_WIDTH-1 : 0] rd_data_a_o;
output [DATA_B_WIDTH-1 : 0] rd_data_b_o;

reg [DATA_A_WIDTH-1 : 0] ram_a[ADDR_A_WIDTH-1 : 0];
reg [DATA_B_WIDTH-1 : 0] ram_b[ADDR_B_WIDTH-1 : 0];

integer i;
integer j;

always @(posedge clka_i or negedge rsta_i)
if (!rsta_i)
	begin
		for (i = 0; i < ADDR_A_WIDTH; i = i + 1)
		ram_a[i] <= 0;
		end
	else
	if (wrena_i)
	begin
		ram_a[wr_add_a_i] = wr_data_a_i;
		end


always @(posedge clkb_i or negedge rstb_i)
if (!rstb_i)
	begin
		for (j = 0; j < ADDR_B_WIDTH; j = j + 1)
		ram_b[j] <= 0;
		end
	else
	if (wrenb_i)
	begin
		ram_b[wr_add_b_i] = wr_data_b_i;
		end
		
		
assign rd_data_a_o = ram_a[rd_add_a_i];
assign rd_data_b_o = ram_b[rd_add_b_i];

endmodule