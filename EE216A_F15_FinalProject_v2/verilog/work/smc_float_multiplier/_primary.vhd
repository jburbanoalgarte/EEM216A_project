library verilog;
use verilog.vl_types.all;
entity smc_float_multiplier is
    port(
        clk             : in     vl_logic;
        GlobalReset     : in     vl_logic;
        x_i_porty       : in     vl_logic_vector(31 downto 0);
        y_i_porty       : in     vl_logic_vector(31 downto 0);
        z_o_portx       : out    vl_logic_vector(31 downto 0);
        srdyo_o         : out    vl_logic;
        srdyi_i         : in     vl_logic
    );
end smc_float_multiplier;
