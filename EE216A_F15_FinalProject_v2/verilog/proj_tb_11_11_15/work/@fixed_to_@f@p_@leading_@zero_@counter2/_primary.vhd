library verilog;
use verilog.vl_types.all;
entity Fixed_to_FP_Leading_Zero_Counter2 is
    port(
        clk             : in     vl_logic;
        GlobalEnable1   : in     vl_logic;
        GlobalReset     : in     vl_logic;
        y               : out    vl_logic_vector(6 downto 0);
        x               : in     vl_logic_vector(32 downto 0)
    );
end Fixed_to_FP_Leading_Zero_Counter2;
