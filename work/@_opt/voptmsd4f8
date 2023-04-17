library verilog;
use verilog.vl_types.all;
entity adder_input_stage is
    port(
        adder_cmd       : out    vl_logic_vector(0 to 3);
        adder_follow_branch: out    vl_logic_vector(0 to 4);
        adder_out_cmd   : out    vl_logic_vector(0 to 3);
        adder_read_adr1 : out    vl_logic_vector(0 to 3);
        adder_read_adr2 : out    vl_logic_vector(0 to 3);
        adder_read_valid1: out    vl_logic;
        adder_read_valid2: out    vl_logic;
        adder_result_reg: out    vl_logic_vector(0 to 4);
        adder_tag       : out    vl_logic_vector(0 to 3);
        scan_out        : out    vl_logic;
        a_clk           : in     vl_logic;
        b_clk           : in     vl_logic;
        c_clk           : in     vl_logic;
        prio_adder_cmd  : in     vl_logic_vector(0 to 3);
        prio_adder_data1: in     vl_logic_vector(0 to 4);
        prio_adder_data2: in     vl_logic_vector(0 to 4);
        prio_adder_follow_branch: in     vl_logic_vector(0 to 4);
        prio_adder_out_vld: in     vl_logic;
        prio_adder_result: in     vl_logic_vector(0 to 4);
        prio_adder_tag  : in     vl_logic_vector(0 to 3);
        reset           : in     vl_logic;
        scan_in         : in     vl_logic
    );
end adder_input_stage;
