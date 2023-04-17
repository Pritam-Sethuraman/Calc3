library verilog;
use verilog.vl_types.all;
entity shift_input_stage is
    port(
        scan_out        : out    vl_logic;
        shift_cmd       : out    vl_logic_vector(0 to 3);
        shift_follow_branch: out    vl_logic_vector(0 to 4);
        shift_out_cmd   : out    vl_logic_vector(0 to 3);
        shift_read_adr1 : out    vl_logic_vector(0 to 3);
        shift_read_adr2 : out    vl_logic_vector(0 to 3);
        shift_read_valid1: out    vl_logic;
        shift_read_valid2: out    vl_logic;
        shift_result_reg: out    vl_logic_vector(0 to 4);
        shift_tag       : out    vl_logic_vector(0 to 3);
        store_data_valid: out    vl_logic;
        store_val       : out    vl_logic_vector(0 to 63);
        a_clk           : in     vl_logic;
        b_clk           : in     vl_logic;
        c_clk           : in     vl_logic;
        prio_shift_cmd  : in     vl_logic_vector(0 to 3);
        prio_shift_data1: in     vl_logic_vector(0 to 4);
        prio_shift_data2: in     vl_logic_vector(0 to 4);
        prio_shift_data : in     vl_logic_vector(0 to 31);
        prio_shift_follow_branch: in     vl_logic_vector(0 to 4);
        prio_shift_out_vld: in     vl_logic;
        prio_shift_result: in     vl_logic_vector(0 to 4);
        prio_shift_tag  : in     vl_logic_vector(0 to 3);
        reset           : in     vl_logic;
        scan_in         : in     vl_logic
    );
end shift_input_stage;
