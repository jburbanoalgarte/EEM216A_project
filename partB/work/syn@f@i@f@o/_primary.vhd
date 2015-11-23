library verilog;
use verilog.vl_types.all;
entity synFIFO is
    generic(
        bitwidth        : integer := 16;
        depth           : integer := 16;
        cntwidth        : integer := 5;
        adrWidth        : integer := 4;
        isFwftMode      : integer := 0
    );
    port(
        clk             : in     vl_logic;
        din             : in     vl_logic_vector;
        en              : in     vl_logic;
        we              : in     vl_logic;
        re              : in     vl_logic;
        grst            : in     vl_logic;
        rst             : in     vl_logic;
        dout            : out    vl_logic_vector;
        full            : out    vl_logic;
        empty           : out    vl_logic;
        itemcnt         : out    vl_logic_vector
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of bitwidth : constant is 1;
    attribute mti_svvh_generic_type of depth : constant is 1;
    attribute mti_svvh_generic_type of cntwidth : constant is 1;
    attribute mti_svvh_generic_type of adrWidth : constant is 1;
    attribute mti_svvh_generic_type of isFwftMode : constant is 1;
end synFIFO;
