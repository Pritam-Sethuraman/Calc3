library verilog;
use verilog.vl_types.all;
entity shifter is
    port(
        shift_out       : out    vl_logic_vector(0 to 63);
        shift_cmd       : in     vl_logic_vector(0 to 3);
        shift_places    : in     vl_logic_vector(0 to 63);
        shift_val       : in     vl_logic_vector(0 to 63);
        store_data_valid: in     vl_logic;
        store_val       : in     vl_logic_vector(0 to 63)
    );
end shifter;
