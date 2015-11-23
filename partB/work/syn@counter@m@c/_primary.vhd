library verilog;
use verilog.vl_types.all;
entity synCounterMC is
    generic(
        ch_no           : integer := 4;
        en_exists       : integer := 1;
        rst_exists      : integer := 1;
        ld_exists       : integer := 0;
        rdy_exists      : integer := 0;
        ctype           : integer := 2;
        ival            : integer := 0;
        ivalS           : vl_notype;
        ivalU           : vl_notype;
        tval            : integer := 127;
        bitwidth        : integer := 16;
        isSigned        : integer := 0
    );
    port(
        clk             : in     vl_logic;
        gen             : in     vl_logic;
        en              : in     vl_logic;
        grst            : in     vl_logic;
        rst             : in     vl_logic;
        up              : in     vl_logic;
        ld              : in     vl_logic;
        din             : in     vl_logic_vector;
        cnt             : out    vl_logic_vector;
        rdy             : out    vl_logic
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of ch_no : constant is 1;
    attribute mti_svvh_generic_type of en_exists : constant is 1;
    attribute mti_svvh_generic_type of rst_exists : constant is 1;
    attribute mti_svvh_generic_type of ld_exists : constant is 1;
    attribute mti_svvh_generic_type of rdy_exists : constant is 1;
    attribute mti_svvh_generic_type of ctype : constant is 1;
    attribute mti_svvh_generic_type of ival : constant is 1;
    attribute mti_svvh_generic_type of ivalS : constant is 3;
    attribute mti_svvh_generic_type of ivalU : constant is 3;
    attribute mti_svvh_generic_type of tval : constant is 1;
    attribute mti_svvh_generic_type of bitwidth : constant is 1;
    attribute mti_svvh_generic_type of isSigned : constant is 1;
end synCounterMC;
