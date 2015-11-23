library verilog;
use verilog.vl_types.all;
entity synComparator is
    generic(
        bitwidth        : integer := 16;
        datatype        : string  := "signed";
        opr             : string  := "equ"
    );
    port(
        inpA            : in     vl_logic_vector;
        inpB            : in     vl_logic_vector;
        outp            : out    vl_logic
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of bitwidth : constant is 1;
    attribute mti_svvh_generic_type of datatype : constant is 1;
    attribute mti_svvh_generic_type of opr : constant is 1;
end synComparator;
