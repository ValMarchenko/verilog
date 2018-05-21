library verilog;
use verilog.vl_types.all;
entity dut is
    port(
        clk_i           : in     vl_logic;
        rst_n_i         : in     vl_logic;
        data_i          : in     vl_logic;
        res_o           : out    vl_logic_vector(23 downto 0)
    );
end dut;
