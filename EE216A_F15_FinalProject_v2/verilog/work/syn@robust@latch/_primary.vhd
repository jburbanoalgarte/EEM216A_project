library verilog;
use verilog.vl_types.all;
entity synRobustLatch is
    generic(
        ch_no           : integer := 1;
        bitwidth        : integer := 16
    );
    port(
        clk             : in     vl_logic;
        rst             : in     vl_logic;
        gEnable         : in     vl_logic;
        en              : in     vl_logic;
        inp             : in     vl_logic_vector;
        outp            : out    vl_logic_vector
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of ch_no : constant is 1;
    attribute mti_svvh_generic_type of bitwidth : constant is 1;
end synRobustLatch;
