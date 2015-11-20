library verilog;
use verilog.vl_types.all;
entity synMultiRateFIFO is
    generic(
        bitwidth        : integer := 16;
        depth           : integer := 32;
        cntwidth        : integer := 6;
        adrwidth        : integer := 5;
        isFwftMode      : integer := 0
    );
    port(
        wclk            : in     vl_logic;
        wge             : in     vl_logic;
        wgrst           : in     vl_logic;
        rclk            : in     vl_logic;
        rge             : in     vl_logic;
        rgrst           : in     vl_logic;
        din             : in     vl_logic_vector;
        we              : in     vl_logic;
        re              : in     vl_logic;
        dout            : out    vl_logic_vector;
        full            : out    vl_logic;
        empty           : out    vl_logic
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of bitwidth : constant is 1;
    attribute mti_svvh_generic_type of depth : constant is 1;
    attribute mti_svvh_generic_type of cntwidth : constant is 1;
    attribute mti_svvh_generic_type of adrwidth : constant is 1;
    attribute mti_svvh_generic_type of isFwftMode : constant is 1;
end synMultiRateFIFO;
