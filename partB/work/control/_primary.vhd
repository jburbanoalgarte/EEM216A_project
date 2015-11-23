library verilog;
use verilog.vl_types.all;
entity control is
    generic(
        centerScaleDelay: vl_logic_vector(0 to 7) := (Hi0, Hi0, Hi0, Hi1, Hi0, Hi0, Hi1, Hi0);
        hornerLoopSingleIterationDelay: vl_logic_vector(0 to 7) := (Hi0, Hi0, Hi0, Hi1, Hi0, Hi0, Hi0, Hi0);
        mux_a10         : vl_notype;
        mux_a9          : vl_notype;
        mux_a8          : vl_notype;
        mux_a7          : vl_notype;
        mux_a6          : vl_notype;
        mux_a5          : vl_notype;
        mux_a4          : vl_notype;
        mux_a3          : vl_notype;
        mux_a2          : vl_notype;
        mux_a1          : vl_notype;
        mux_a0          : vl_notype;
        hornerLoopEndToEndDelay: vl_logic_vector(0 to 7) := (Hi0, Hi0, Hi0, Hi1, Hi0, Hi0, Hi1, Hi1);
        assertSrdyo     : vl_notype
    );
    port(
        GlobalReset     : in     vl_logic;
        clk             : in     vl_logic;
        srdyi           : in     vl_logic;
        coeff_sel       : out    vl_logic_vector(3 downto 0);
        sum_rst         : out    vl_logic;
        sum_en          : out    vl_logic;
        srdyo           : out    vl_logic
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of centerScaleDelay : constant is 1;
    attribute mti_svvh_generic_type of hornerLoopSingleIterationDelay : constant is 1;
    attribute mti_svvh_generic_type of mux_a10 : constant is 3;
    attribute mti_svvh_generic_type of mux_a9 : constant is 3;
    attribute mti_svvh_generic_type of mux_a8 : constant is 3;
    attribute mti_svvh_generic_type of mux_a7 : constant is 3;
    attribute mti_svvh_generic_type of mux_a6 : constant is 3;
    attribute mti_svvh_generic_type of mux_a5 : constant is 3;
    attribute mti_svvh_generic_type of mux_a4 : constant is 3;
    attribute mti_svvh_generic_type of mux_a3 : constant is 3;
    attribute mti_svvh_generic_type of mux_a2 : constant is 3;
    attribute mti_svvh_generic_type of mux_a1 : constant is 3;
    attribute mti_svvh_generic_type of mux_a0 : constant is 3;
    attribute mti_svvh_generic_type of hornerLoopEndToEndDelay : constant is 1;
    attribute mti_svvh_generic_type of assertSrdyo : constant is 3;
end control;
