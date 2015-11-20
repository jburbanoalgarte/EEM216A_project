library verilog;
use verilog.vl_types.all;
entity mux_tb is
    generic(
        ResetValue      : vl_logic_vector(0 to 1) := (Hi0, Hi1);
        HalfCycle       : integer := 5
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of ResetValue : constant is 1;
    attribute mti_svvh_generic_type of HalfCycle : constant is 1;
end mux_tb;
