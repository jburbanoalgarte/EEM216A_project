library verilog;
use verilog.vl_types.all;
entity synCSAUnit is
    generic(
        bitwidth        : integer := 16
    );
    port(
        a               : in     vl_logic_vector;
        b               : in     vl_logic_vector;
        c               : in     vl_logic_vector;
        slow            : out    vl_logic_vector;
        shigh           : out    vl_logic_vector
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of bitwidth : constant is 1;
end synCSAUnit;
