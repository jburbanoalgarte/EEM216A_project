library verilog;
use verilog.vl_types.all;
entity synDelayWithEnableGeneric is
    generic(
        preferRAMImpl   : integer := 1;
        bitwidth        : integer := 16;
        delaylength     : integer := 100;
        decompRegs      : integer := 2;
        decompThresholdMin: integer := 9;
        ramThreshold    : integer := 68;
        forceRAMThreshold: integer := 4000;
        cntWidth        : vl_notype;
        decompThresholdBW: vl_notype;
        delayNRLen      : vl_notype;
        resetType       : string  := "synch"
    );
    port(
        clk             : in     vl_logic;
        grst            : in     vl_logic;
        rst             : in     vl_logic;
        en              : in     vl_logic;
        inp             : in     vl_logic_vector;
        outp            : out    vl_logic_vector
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of preferRAMImpl : constant is 1;
    attribute mti_svvh_generic_type of bitwidth : constant is 1;
    attribute mti_svvh_generic_type of delaylength : constant is 1;
    attribute mti_svvh_generic_type of decompRegs : constant is 1;
    attribute mti_svvh_generic_type of decompThresholdMin : constant is 1;
    attribute mti_svvh_generic_type of ramThreshold : constant is 1;
    attribute mti_svvh_generic_type of forceRAMThreshold : constant is 1;
    attribute mti_svvh_generic_type of cntWidth : constant is 3;
    attribute mti_svvh_generic_type of decompThresholdBW : constant is 3;
    attribute mti_svvh_generic_type of delayNRLen : constant is 3;
    attribute mti_svvh_generic_type of resetType : constant is 1;
end synDelayWithEnableGeneric;
