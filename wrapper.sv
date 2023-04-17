module Wrapper(Interface _if);
    calc3_top _duv(
        _if.p[0].outp.data_out, _if.p[0].outp.resp, _if.p[0].outp.tag_out,
        _if.p[1].outp.data_out, _if.p[1].outp.resp, _if.p[1].outp.tag_out,
        _if.p[2].outp.data_out, _if.p[2].outp.resp, _if.p[2].outp.tag_out,
        _if.p[3].outp.data_out, _if.p[3].outp.resp, _if.p[3].outp.tag_out,

        _if.scan_out,
        _if.a_clk, _if.b_clk, _if.c_clk,

        _if.p[0].inp.cmd, _if.p[0].inp.d1, _if.p[0].inp.d2, _if.p[0].inp.data_in, _if.p[0].inp.r1, _if.p[0].inp.tag_in,
        _if.p[1].inp.cmd, _if.p[1].inp.d1, _if.p[1].inp.d2, _if.p[1].inp.data_in, _if.p[1].inp.r1, _if.p[1].inp.tag_in,
        _if.p[2].inp.cmd, _if.p[2].inp.d1, _if.p[2].inp.d2, _if.p[2].inp.data_in, _if.p[2].inp.r1, _if.p[2].inp.tag_in,
        _if.p[3].inp.cmd, _if.p[3].inp.d1, _if.p[3].inp.d2, _if.p[3].inp.data_in, _if.p[3].inp.r1, _if.p[3].inp.tag_in,
        
        _if.rst, _if.scan_in
    );
endmodule: Wrapper