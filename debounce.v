module debounce(
input clk_i,
input key_i,
output key_pressed_stb_o
);

parameter TIMER_POWER = 15;

reg key_pressed_stb_r;
reg [TIMER_POWER - 1: 0] timer;

always @(posedge clk_i)
begin
	if (key_i)
		begin
		timer <= 0;
		key_pressed_stb_r <= 0;
		end
	else
	if (&timer)
	 key_pressed_stb_r <= 0;
	 else
	if (&timer[TIMER_POWER - 1: 1])
	begin
		key_pressed_stb_r <= 1;
		timer <= timer + 1;
	end
	else
		timer <= timer +1;
end

assign key_pressed_stb_o = key_pressed_stb_r;

endmodule


	
