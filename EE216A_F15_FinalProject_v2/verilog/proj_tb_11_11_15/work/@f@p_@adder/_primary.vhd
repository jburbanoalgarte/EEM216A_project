library verilog;
use verilog.vl_types.all;
entity FP_Adder is
    port(
        clk             : in     vl_logic;
        GlobalEnable1   : in     vl_logic;
        GlobalReset     : in     vl_logic;
        srdyo           : out    vl_logic;
        z               : out    vl_logic_vector(31 downto 0);
        srdyi           : in     vl_logic;
        y               : in     vl_logic_vector(31 downto 0);
        x               : in     vl_logic_vector(31 downto 0)
    );
end FP_Adder;
