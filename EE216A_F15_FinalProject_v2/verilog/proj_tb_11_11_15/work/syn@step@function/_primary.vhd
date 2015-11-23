library verilog;
use verilog.vl_types.all;
entity synStepFunction is
    generic(
        bitwidth        : integer := 16;
        delaylength     : integer := 32;
        stepvalue       : integer := 1;
        cntWidth        : vl_notype;
        resetType       : string  := "synch"
    );
    port(
        clk             : in     vl_logic;
        en              : in     vl_logic;
        grst            : in     vl_logic;
        rst             : in     vl_logic;
        outp            : out    vl_logic_vector
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of bitwidth : constant is 1;
    attribute mti_svvh_generic_type of delaylength : constant is 1;
    attribute mti_svvh_generic_type of stepvalue : constant is 1;
    attribute mti_svvh_generic_type of cntWidth : constant is 3;
    attribute mti_svvh_generic_type of resetType : constant is 1;
end synStepFunction;
