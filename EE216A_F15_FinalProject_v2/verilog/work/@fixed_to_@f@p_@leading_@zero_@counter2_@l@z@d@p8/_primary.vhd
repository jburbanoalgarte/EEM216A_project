library verilog;
use verilog.vl_types.all;
entity Fixed_to_FP_Leading_Zero_Counter2_LZDP8 is
    port(
        clk             : in     vl_logic;
        GlobalEnable1   : in     vl_logic;
        GlobalReset     : in     vl_logic;
        y               : out    vl_logic_vector(4 downto 0);
        sel             : in     vl_logic_vector(3 downto 0)
    );
end Fixed_to_FP_Leading_Zero_Counter2_LZDP8;
