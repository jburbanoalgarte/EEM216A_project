library verilog;
use verilog.vl_types.all;
entity synRegister is
    generic(
        bitwidth        : integer := 16
    );
    port(
        clk             : in     vl_logic;
        D               : in     vl_logic_vector;
        en              : in     vl_logic;
        rst             : in     vl_logic;
        outp            : out    vl_logic_vector
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of bitwidth : constant is 1;
end synRegister;