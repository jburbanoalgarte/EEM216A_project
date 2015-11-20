library verilog;
use verilog.vl_types.all;
entity synCounterSync is
    generic(
        tval            : integer := 127;
        bitwidth        : integer := 16;
        sample_offset   : integer := 0
    );
    port(
        clk             : in     vl_logic;
        en              : in     vl_logic;
        grst            : in     vl_logic;
        rdy             : out    vl_logic
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of tval : constant is 1;
    attribute mti_svvh_generic_type of bitwidth : constant is 1;
    attribute mti_svvh_generic_type of sample_offset : constant is 1;
end synCounterSync;
