library verilog;
use verilog.vl_types.all;
entity synMux is
    generic(
        inp_width       : integer := 2;
        inp_size        : integer := 3;
        sel_bits        : integer := 2
    );
    port(
        sel             : in     vl_logic_vector;
        inp             : in     vl_logic_vector;
        outp            : out    vl_logic_vector
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of inp_width : constant is 1;
    attribute mti_svvh_generic_type of inp_size : constant is 1;
    attribute mti_svvh_generic_type of sel_bits : constant is 1;
end synMux;
