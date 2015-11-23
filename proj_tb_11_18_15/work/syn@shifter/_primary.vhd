library verilog;
use verilog.vl_types.all;
entity synShifter is
    generic(
        inpBitW         : integer := 16;
        outBitW         : integer := 16;
        shfBitW         : integer := 16;
        datatype        : string  := "signed";
        opr             : string  := "leftshift"
    );
    port(
        inp             : in     vl_logic_vector;
        shf             : in     vl_logic_vector;
        outp            : out    vl_logic_vector
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of inpBitW : constant is 1;
    attribute mti_svvh_generic_type of outBitW : constant is 1;
    attribute mti_svvh_generic_type of shfBitW : constant is 1;
    attribute mti_svvh_generic_type of datatype : constant is 1;
    attribute mti_svvh_generic_type of opr : constant is 1;
end synShifter;
