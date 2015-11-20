library verilog;
use verilog.vl_types.all;
entity synBusSatRnd_sat is
    generic(
        inp_width       : integer := 16;
        out_width       : integer := 16;
        infrac          : integer := 0;
        outfrac         : integer := 0;
        round           : integer := 0;
        sat             : integer := 0;
        datatype        : string  := "SS";
        inputIntWidth   : vl_notype;
        outputIntWidth  : vl_notype;
        doRnd           : vl_notype;
        rounded         : vl_notype;
        doSat           : vl_notype;
        maximumWidth    : vl_notype;
        shiftLeftAmount : vl_notype;
        ShiftOutputWidth: vl_notype
    );
    port(
        inp             : in     vl_logic_vector;
        outp            : out    vl_logic_vector;
        outsp           : out    vl_logic
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of inp_width : constant is 1;
    attribute mti_svvh_generic_type of out_width : constant is 1;
    attribute mti_svvh_generic_type of infrac : constant is 1;
    attribute mti_svvh_generic_type of outfrac : constant is 1;
    attribute mti_svvh_generic_type of round : constant is 1;
    attribute mti_svvh_generic_type of sat : constant is 1;
    attribute mti_svvh_generic_type of datatype : constant is 1;
    attribute mti_svvh_generic_type of inputIntWidth : constant is 3;
    attribute mti_svvh_generic_type of outputIntWidth : constant is 3;
    attribute mti_svvh_generic_type of doRnd : constant is 3;
    attribute mti_svvh_generic_type of rounded : constant is 3;
    attribute mti_svvh_generic_type of doSat : constant is 3;
    attribute mti_svvh_generic_type of maximumWidth : constant is 3;
    attribute mti_svvh_generic_type of shiftLeftAmount : constant is 3;
    attribute mti_svvh_generic_type of ShiftOutputWidth : constant is 3;
end synBusSatRnd_sat;
