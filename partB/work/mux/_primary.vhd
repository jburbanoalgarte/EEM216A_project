library verilog;
use verilog.vl_types.all;
entity mux is
    port(
        clk             : in     vl_logic;
        GlobalReset     : in     vl_logic;
        coeff0          : in     vl_logic_vector(31 downto 0);
        coeff1          : in     vl_logic_vector(31 downto 0);
        coeff2          : in     vl_logic_vector(31 downto 0);
        coeff3          : in     vl_logic_vector(31 downto 0);
        coeff4          : in     vl_logic_vector(31 downto 0);
        coeff5          : in     vl_logic_vector(31 downto 0);
        coeff6          : in     vl_logic_vector(31 downto 0);
        coeff7          : in     vl_logic_vector(31 downto 0);
        coeff8          : in     vl_logic_vector(31 downto 0);
        coeff9          : in     vl_logic_vector(31 downto 0);
        coeff10         : in     vl_logic_vector(31 downto 0);
        coeff_select    : in     vl_logic_vector(3 downto 0);
        coeff           : out    vl_logic_vector(31 downto 0)
    );
end mux;
