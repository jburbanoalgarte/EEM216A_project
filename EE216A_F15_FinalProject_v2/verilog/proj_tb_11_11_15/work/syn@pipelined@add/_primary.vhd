library verilog;
use verilog.vl_types.all;
entity synPipelinedAdd is
    generic(
        bitwidth        : integer := 16;
        hbw             : vl_notype;
        lbw             : vl_notype
    );
    port(
        clk             : in     vl_logic;
        gReset          : in     vl_logic;
        gEnable         : in     vl_logic;
        a               : in     vl_logic_vector;
        b               : in     vl_logic_vector;
        Sum             : out    vl_logic_vector
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of bitwidth : constant is 1;
    attribute mti_svvh_generic_type of hbw : constant is 3;
    attribute mti_svvh_generic_type of lbw : constant is 3;
end synPipelinedAdd;
