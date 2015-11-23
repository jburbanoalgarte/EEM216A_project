library verilog;
use verilog.vl_types.all;
entity clock_gen is
    generic(
        cperiod         : integer := 20;
        rperiod         : integer := 100;
        cperiodDiv      : vl_notype
    );
    port(
        clk             : out    vl_logic;
        rst             : out    vl_logic
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of cperiod : constant is 1;
    attribute mti_svvh_generic_type of rperiod : constant is 1;
    attribute mti_svvh_generic_type of cperiodDiv : constant is 3;
end clock_gen;
