library verilog;
use verilog.vl_types.all;
entity synAddSub is
    generic(
        inp1_width      : integer := 16;
        inp2_width      : integer := 16;
        out_width       : integer := 16;
        opr             : string  := "add";
        dataType        : string  := "signed"
    );
    port(
        in1             : in     vl_logic_vector;
        in2             : in     vl_logic_vector;
        outp            : out    vl_logic_vector
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of inp1_width : constant is 1;
    attribute mti_svvh_generic_type of inp2_width : constant is 1;
    attribute mti_svvh_generic_type of out_width : constant is 1;
    attribute mti_svvh_generic_type of opr : constant is 1;
    attribute mti_svvh_generic_type of dataType : constant is 1;
end synAddSub;
