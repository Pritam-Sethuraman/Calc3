library verilog;
use verilog.vl_types.all;
entity mux_out is
    port(
        out_data        : out    vl_logic_vector(0 to 31);
        out_resp        : out    vl_logic_vector(0 to 1);
        out_tag         : out    vl_logic_vector(0 to 1);
        scan_out        : out    vl_logic;
        a_clk           : in     vl_logic;
        adder_data      : in     vl_logic_vector(0 to 31);
        adder_resp      : in     vl_logic_vector(0 to 1);
        adder_tag       : in     vl_logic_vector(0 to 1);
        b_clk           : in     vl_logic;
        c_clk           : in     vl_logic;
        invalid_op      : in     vl_logic;
        invalid_op_tag  : in     vl_logic_vector(0 to 1);
        reset           : in     vl_logic;
        scan_in         : in     vl_logic;
        shift_data      : in     vl_logic_vector(0 to 31);
        shift_resp      : in     vl_logic_vector(0 to 1);
        shift_tag       : in     vl_logic_vector(0 to 1)
    );
end mux_out;
