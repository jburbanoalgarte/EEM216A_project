library verilog;
use verilog.vl_types.all;
entity centerScale2 is
    port(
        GlobalReset     : in     vl_logic;
        clk             : in     vl_logic;
        x_adc           : in     vl_logic_vector(20 downto 0);
        srdyi           : in     vl_logic;
        mean            : in     vl_logic_vector(31 downto 0);
        std             : in     vl_logic_vector(31 downto 0);
        x_centScale     : out    vl_logic_vector(31 downto 0);
        srdyo_o         : out    vl_logic;
        x_adc_latched   : out    vl_logic_vector(20 downto 0)
    );
end centerScale2;
