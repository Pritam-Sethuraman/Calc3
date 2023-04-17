interface Interface();
    typedef struct {
        struct {
            logic [0:1] tag_in;
            logic [0:3] cmd, d1, d2, r1;
            logic [0:31] data_in;
        } inp;
        struct {
            logic [0:1] tag_out, resp;
            logic [0:31] data_out;
        } outp;
    } Port;

    Port p[4];

    logic a_clk, b_clk, c_clk;
    logic rst;
    logic scan_in, scan_out;
endinterface: Interface