library verilog;
use verilog.vl_types.all;
entity registers is
    port(
        adder_read_d1   : out    vl_logic_vector(0 to 63);
        adder_read_d2   : out    vl_logic_vector(0 to 63);
        shift_read_d1   : out    vl_logic_vector(0 to 63);
        shift_read_d2   : out    vl_logic_vector(0 to 63);
        a_clk           : in     vl_logic;
        b_clk           : in     vl_logic;
        c_clk           : in     vl_logic;
        adder_read_adr1 : in     vl_logic_vector(0 to 3);
        adder_read_adr2 : in     vl_logic_vector(0 to 3);
        adder_read_valid1: in     vl_logic;
        adder_read_valid2: in     vl_logic;
        adder_write_adr : in     vl_logic_vector(0 to 3);
        adder_write_data: in     vl_logic_vector(0 to 31);
        adder_write_valid: in     vl_logic;
        reset           : in     vl_logic;
        shift_read_adr1 : in     vl_logic_vector(0 to 3);
        shift_read_adr2 : in     vl_logic_vector(0 to 3);
        shift_read_valid1: in     vl_logic;
        shift_read_valid2: in     vl_logic;
        shift_write_adr : in     vl_logic_vector(0 to 3);
        shift_write_data: in     vl_logic_vector(0 to 31);
        shift_write_valid: in     vl_logic
    );
end registers;
