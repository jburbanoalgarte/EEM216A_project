library verilog;
use verilog.vl_types.all;
entity FP_Adder_getmsbpos1_LZDP4 is
    port(
        clk             : in     vl_logic;
        GlobalEnable1   : in     vl_logic;
        GlobalReset     : in     vl_logic;
        y_sel           : out    vl_logic;
        y               : out    vl_logic_vector(3 downto 0);
        sel             : in     vl_logic_vector(3 downto 0)
    );
end FP_Adder_getmsbpos1_LZDP4;
