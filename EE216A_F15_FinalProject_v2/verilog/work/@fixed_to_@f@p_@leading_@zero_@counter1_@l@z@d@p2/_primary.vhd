library verilog;
use verilog.vl_types.all;
entity Fixed_to_FP_Leading_Zero_Counter1_LZDP2 is
    port(
        clk             : in     vl_logic;
        GlobalEnable1   : in     vl_logic;
        GlobalReset     : in     vl_logic;
        y_sel           : out    vl_logic;
        y               : out    vl_logic_vector(2 downto 0);
        sel             : in     vl_logic_vector(3 downto 0)
    );
end Fixed_to_FP_Leading_Zero_Counter1_LZDP2;
