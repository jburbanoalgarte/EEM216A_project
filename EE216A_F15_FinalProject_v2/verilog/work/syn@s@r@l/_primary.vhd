library verilog;
use verilog.vl_types.all;
entity synSRL is
    generic(
        bitwidth        : integer := 16;
        depth           : integer := 16;
        swidth          : integer := 4
    );
    port(
        clk             : in     vl_logic;
        rst             : in     vl_logic;
        en              : in     vl_logic;
        Inp             : in     vl_logic_vector;
        Outp            : out    vl_logic_vector;
        cnt             : in     vl_logic_vector
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of bitwidth : constant is 1;
    attribute mti_svvh_generic_type of depth : constant is 1;
    attribute mti_svvh_generic_type of swidth : constant is 1;
end synSRL;
