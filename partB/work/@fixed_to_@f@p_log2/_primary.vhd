library verilog;
use verilog.vl_types.all;
entity Fixed_to_FP_log2 is
    port(
        clk             : in     vl_logic;
        GlobalEnable1   : in     vl_logic;
        GlobalReset     : in     vl_logic;
        Out1            : out    vl_logic_vector(4 downto 0);
        In1             : in     vl_logic_vector(21 downto 0)
    );
end Fixed_to_FP_log2;
