library verilog;
use verilog.vl_types.all;
entity fp_to_smc_float is
    port(
        clk             : in     vl_logic;
        GlobalReset     : in     vl_logic;
        y_o_portx       : out    vl_logic_vector(31 downto 0);
        x_i             : in     vl_logic_vector(20 downto 0);
        srdyo_o         : out    vl_logic;
        srdyi_i         : in     vl_logic
    );
end fp_to_smc_float;
