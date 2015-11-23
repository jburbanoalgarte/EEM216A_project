library verilog;
use verilog.vl_types.all;
entity synBusAdapter is
    generic(
        inp_width       : integer := 16;
        out_width       : integer := 16;
        datatype        : string  := "signed";
        preshift        : integer := 0;
        infrac          : integer := 0;
        outfrac         : integer := 0;
        round           : integer := 0;
        sat             : integer := 0;
        saType          : string  := "SS";
        tmpInpWidth     : vl_notype
    );
    port(
        inp             : in     vl_logic_vector;
        outp            : out    vl_logic_vector
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of inp_width : constant is 1;
    attribute mti_svvh_generic_type of out_width : constant is 1;
    attribute mti_svvh_generic_type of datatype : constant is 1;
    attribute mti_svvh_generic_type of preshift : constant is 1;
    attribute mti_svvh_generic_type of infrac : constant is 1;
    attribute mti_svvh_generic_type of outfrac : constant is 1;
    attribute mti_svvh_generic_type of round : constant is 1;
    attribute mti_svvh_generic_type of sat : constant is 1;
    attribute mti_svvh_generic_type of saType : constant is 1;
    attribute mti_svvh_generic_type of tmpInpWidth : constant is 3;
end synBusAdapter;
