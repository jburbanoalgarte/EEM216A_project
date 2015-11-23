library verilog;
use verilog.vl_types.all;
entity Fixed_to_FP is
    port(
        clk             : in     vl_logic;
        GlobalEnable1   : in     vl_logic;
        GlobalReset     : in     vl_logic;
        srdyo           : out    vl_logic;
        y               : out    vl_logic_vector(31 downto 0);
        srdyi           : in     vl_logic;
        x               : in     vl_logic_vector(31 downto 0)
    );
end Fixed_to_FP;
