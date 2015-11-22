library verilog;
use verilog.vl_types.all;
entity control is
    port(
        GlobalReset     : in     vl_logic;
        clk             : in     vl_logic;
        srdyi           : in     vl_logic;
        coeff_sel       : out    vl_logic_vector(3 downto 0);
        sum_rst         : out    vl_logic;
        sum_en          : out    vl_logic;
        srdyo           : out    vl_logic
    );
end control;
