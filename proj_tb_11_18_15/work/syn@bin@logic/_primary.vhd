library verilog;
use verilog.vl_types.all;
entity synBinLogic is
    generic(
        bitwidth        : integer := 16;
        opr             : string  := "ANDD"
    );
    port(
        inpA            : in     vl_logic_vector;
        inpB            : in     vl_logic_vector;
        outp            : out    vl_logic_vector
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of bitwidth : constant is 1;
    attribute mti_svvh_generic_type of opr : constant is 1;
end synBinLogic;
