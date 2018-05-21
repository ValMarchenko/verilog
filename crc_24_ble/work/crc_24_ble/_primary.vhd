library verilog;
use verilog.vl_types.all;
entity crc_24_ble is
    generic(
        POLYNOM         : integer := 16778843
    );
    port(
        clk_i           : in     vl_logic;
        rst_n_i         : in     vl_logic;
        data_i          : in     vl_logic;
        res_o           : out    vl_logic_vector
    );
end crc_24_ble;
