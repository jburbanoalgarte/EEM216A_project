library verilog;
use verilog.vl_types.all;
entity synAccumulator is
    generic(
        bitwidth        : integer := 16;
        datatype        : string  := "signed";
        opr             : string  := "incr"
    );
    port(
        clk             : in     vl_logic;
        inp             : in     vl_logic_vector;
        en              : in     vl_logic;
        rst             : in     vl_logic;
        grst            : in     vl_logic;
        outp            : out    vl_logic_vector
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of bitwidth : constant is 1;
    attribute mti_svvh_generic_type of datatype : constant is 1;
    attribute mti_svvh_generic_type of opr : constant is 1;
end synAccumulator;
