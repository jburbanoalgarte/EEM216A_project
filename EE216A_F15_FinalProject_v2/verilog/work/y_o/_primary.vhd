library verilog;
use verilog.vl_types.all;
entity y_o is
    port(
        clk             : in     vl_logic;
        GlobalEnable1   : in     vl_logic;
        GlobalReset     : in     vl_logic;
        portx           : out    vl_logic_vector(31 downto 0);
        x               : in     vl_logic_vector(31 downto 0)
    );
end y_o;
