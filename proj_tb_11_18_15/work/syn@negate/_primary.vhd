library verilog;
use verilog.vl_types.all;
entity synNegate is
    generic(
        bitwidth        : integer := 16
    );
    port(
        inp             : in     vl_logic_vector;
        outp            : out    vl_logic_vector
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of bitwidth : constant is 1;
end synNegate;
