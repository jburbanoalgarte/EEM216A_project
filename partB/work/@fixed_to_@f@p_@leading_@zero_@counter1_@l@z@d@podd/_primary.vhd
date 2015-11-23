library verilog;
use verilog.vl_types.all;
entity Fixed_to_FP_Leading_Zero_Counter1_LZDPodd is
    port(
        clk             : in     vl_logic;
        GlobalEnable1   : in     vl_logic;
        GlobalReset     : in     vl_logic;
        y               : out    vl_logic_vector(4 downto 0);
        x               : in     vl_logic_vector(3 downto 0);
        msb             : in     vl_logic
    );
end Fixed_to_FP_Leading_Zero_Counter1_LZDPodd;
