`include "uvm_macros.svh"
class Transaction extends uvm_sequence_item;
`uvm_object_utils(Transaction)

    typedef struct {
        rand struct {
        rand logic [0:1] tag_in;
        rand logic [0:3] cmd, d1, d2, r1;
        rand logic [0:31] data_in;
        } inp;
        struct {
        logic [0:1] tag_out, resp;
        logic [0:31] data_out;
        } outp;
    } Port;

    rand Port p[4];
    rand logic scan_in, rst;
    logic scan_out;

    function new (input string name = "");
        super.new(name);
    endfunction: new
    
    function void copy(input Transaction tx);
        rst = tx.rst;
        scan_in = tx.scan_in;
        scan_out = tx.scan_out;
        for(int i=0; i<4; i++) begin
            p[i].inp.tag_in = tx.p[i].inp.tag_in;
            p[i].inp.cmd = tx.p[i].inp.cmd;
            p[i].inp.d1 = tx.p[i].inp.d1;
            p[i].inp.d2 = tx.p[i].inp.d2;
            p[i].inp.r1 = tx.p[i].inp.r1;
            p[i].inp.data_in = tx.p[i].inp.data_in;
            p[i].outp.resp = tx.p[i].outp.resp;
            p[i].outp.tag_out = tx.p[i].outp.tag_out;
            p[i].outp.data_out = tx.p[i].outp.data_out;
        end
    endfunction

    function void zero_all_except(input int port_num);
        for(int i=0; i<4; i++) begin
            if(i != port_num) begin
                _port_make_zero(i);
                {
                p[i].outp.tag_out,
                p[i].outp.resp,
                p[i].outp.data_out
                } = 0;
            end
        end

    endfunction

    function void _port_make_zero(input int i);
        {
        p[i].inp.tag_in,
        p[i].inp.cmd,
        p[i].inp.d1,
        p[i].inp.d2,
        p[i].inp.r1,
        p[i].inp.data_in
        } = 0;
    endfunction: _port_make_zero


    function void _port_get_inp(input virtual Interface _vi, int i);
        p[i].inp.tag_in = _vi.p[i].inp.tag_in;
        p[i].inp.cmd = _vi.p[i].inp.cmd;
        p[i].inp.d1 = _vi.p[i].inp.d1;
        p[i].inp.d2 = _vi.p[i].inp.d2;
        p[i].inp.r1 = _vi.p[i].inp.r1;
        p[i].inp.data_in = _vi.p[i].inp.data_in;
    endfunction: _port_get_inp

    function void _port_get_outp(input virtual Interface _vi, int i);
        p[i].outp.resp = _vi.p[i].outp.resp;
        p[i].outp.tag_out = _vi.p[i].outp.tag_out;
        p[i].outp.data_out = _vi.p[i].outp.data_out;
    endfunction: _port_get_outp



    function void _port_set_inp(input virtual Interface _vi, int i);
        _vi.p[i].inp.tag_in = p[i].inp.tag_in;
        _vi.p[i].inp.cmd = p[i].inp.cmd;
        _vi.p[i].inp.d1 = p[i].inp.d1;
        _vi.p[i].inp.d2 = p[i].inp.d2;
        _vi.p[i].inp.r1 = p[i].inp.r1;
        _vi.p[i].inp.data_in = p[i].inp.data_in;
    endfunction: _port_set_inp

    function void _port_set_outp(input virtual Interface _vi, int i);
        _vi.p[i].outp.resp = p[i].outp.resp ;
        _vi.p[i].outp.tag_out = p[i].outp.tag_out ;
        _vi.p[i].outp.data_out = p[i].outp.data_out;
    endfunction: _port_set_outp


    function void make_zero;
        {scan_in, rst} = 0;
        for (int i=0; i<4; i++)
            _port_make_zero(i);
    endfunction

    function void get_inp(input virtual Interface _vi);
        scan_in = _vi.scan_in;
        rst = _vi.rst;
        for (int i=0; i<4; i++)
            _port_get_inp(_vi, i);
    endfunction

    function void set_inp(input virtual Interface _vi);
        _vi.scan_in = scan_in;
        _vi.rst = rst;
        for (int i=0; i<4; i++) begin
            _port_set_inp(_vi, i);
        end

    endfunction

    function void get_outp(input virtual Interface _vi);
        scan_out = _vi.scan_out;
        for (int i=0; i<4; i++)
            _port_get_outp(_vi, i);
    endfunction

    function void set_outp(input virtual Interface _vi);
        _vi.scan_out = scan_out;
        for (int i=0; i<4; i++)
            _port_set_outp(_vi, i);
    endfunction


    function void get(input virtual Interface _vi);
        get_inp(_vi);
        get_outp(_vi);
    endfunction

    function void set(input virtual Interface _vi);
        set_inp(_vi);
        set_outp(_vi);
    endfunction


    function string _port_input_str(input int i);
        string s;
        $sformat(
            s,
            "[Inputs] tag_in=%d, cmd=%b, d1=%d, d2=%d, r1=%d, data_in=%d",
            p[i].inp.tag_in, p[i].inp.cmd, p[i].inp.d1, p[i].inp.d2, p[i].inp.r1, p[i].inp.data_in
        );
        return s;
    endfunction: _port_input_str

    function string _port_output_str(input int i);
        string s;
        $sformat(
            s,
            "[Outputs] resp=%b, tag_out=%d, data_out=%d",
            p[i].outp.resp, p[i].outp.tag_out, p[i].outp.data_out
        );
        return s;
    endfunction: _port_output_str

    function string _port_str(input int i);
        string s;
        $sformat(
            s,
            "[Port%0d]\n\t%s\n\t%s",
            i+1, _port_input_str(i), _port_output_str(i)
        );
        return s;
    endfunction: _port_str

    function string str;
        string s;
        $sformat(
            s,
            "rst=%b, scan_in=%b, scan_out=%b\n%s\n%s\n%s\n%s\n",
            rst, scan_in, scan_out, _port_str(0), _port_str(1), _port_str(2), _port_str(3)
        );
        return s;
    endfunction: str

endclass: Transaction