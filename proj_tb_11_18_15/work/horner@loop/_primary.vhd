library verilog;
use verilog.vl_types.all;
entity hornerLoop is
    port(
        GlobalReset     : in     vl_logic;
        clk             : in     vl_logic;
        x_adc_smc       : in     vl_logic_vector(31 downto 0);
        srdyi_i         : in     vl_logic;
        coeff           : in     vl_logic_vector(31 downto 0);
        sum_en          : in     vl_logic;
        sum_rst         : in     vl_logic;
        x_lin           : out    vl_logic_vector(20 downto 0)
    );
end hornerLoop;
