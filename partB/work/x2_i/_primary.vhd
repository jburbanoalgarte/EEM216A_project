library verilog;
use verilog.vl_types.all;
entity x2_i is
    port(
        clk             : in     vl_logic;
        GlobalEnable1   : in     vl_logic;
        GlobalReset     : in     vl_logic;
        y               : out    vl_logic_vector(31 downto 0);
        porty           : in     vl_logic_vector(31 downto 0)
    );
end x2_i;
