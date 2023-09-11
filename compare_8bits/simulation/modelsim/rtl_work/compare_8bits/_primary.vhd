library verilog;
use verilog.vl_types.all;
entity compare_8bits is
    port(
        a               : in     vl_logic_vector(7 downto 0);
        b               : in     vl_logic_vector(7 downto 0);
        gt              : out    vl_logic;
        lt              : out    vl_logic;
        eq              : out    vl_logic
    );
end compare_8bits;
