library verilog;
use verilog.vl_types.all;
entity adder_output_stage is
    port(
        add_shift_branch_data: out    vl_logic_vector(0 to 15);
        adder_out_data1 : out    vl_logic_vector(0 to 31);
        adder_out_data2 : out    vl_logic_vector(0 to 31);
        adder_out_data3 : out    vl_logic_vector(0 to 31);
        adder_out_data4 : out    vl_logic_vector(0 to 31);
        adder_out_resp1 : out    vl_logic_vector(0 to 1);
        adder_out_resp2 : out    vl_logic_vector(0 to 1);
        adder_out_resp3 : out    vl_logic_vector(0 to 1);
        adder_out_resp4 : out    vl_logic_vector(0 to 1);
        adder_out_tag1  : out    vl_logic_vector(0 to 1);
        adder_out_tag2  : out    vl_logic_vector(0 to 1);
        adder_out_tag3  : out    vl_logic_vector(0 to 1);
        adder_out_tag4  : out    vl_logic_vector(0 to 1);
        adder_write_adr : out    vl_logic_vector(0 to 3);
        adder_write_data: out    vl_logic_vector(0 to 31);
        adder_write_valid: out    vl_logic;
        scan_out        : out    vl_logic;
        a_clk           : in     vl_logic;
        adder_follow_branch: in     vl_logic_vector(0 to 4);
        adder_out_cmd   : in     vl_logic_vector(0 to 3);
        adder_overflow  : in     vl_logic;
        adder_result    : in     vl_logic_vector(0 to 63);
        adder_result_reg: in     vl_logic_vector(0 to 4);
        adder_tag       : in     vl_logic_vector(0 to 3);
        b_clk           : in     vl_logic;
        c_clk           : in     vl_logic;
        reset           : in     vl_logic;
        scan_in         : in     vl_logic
    );
end adder_output_stage;
