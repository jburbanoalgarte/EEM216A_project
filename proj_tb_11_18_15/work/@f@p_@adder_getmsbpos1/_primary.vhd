library verilog;
use verilog.vl_types.all;
entity FP_Adder_getmsbpos1 is
    port(
        clk             : in     vl_logic;
        GlobalEnable1   : in     vl_logic;
        GlobalReset     : in     vl_logic;
        y               : out    vl_logic_vector(5 downto 0);
        x               : in     vl_logic_vector(23 downto 0)
    );
end FP_Adder_getmsbpos1;
