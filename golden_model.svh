class Golden_Model;

    string name;
    int _regs [16];
    logic _valid[16];
    Golden_Requestor _reqs [4];
    
    Request request;
    Response response;

    function new(input string name="Golden_Model");
        this.name = name;
        this._regs = '{default: 0};
        this._valid = '{default: 0};
        for(int i=0; i<4; i++) begin
            this._reqs[i] = new(i);
        end

    endfunction

    function Request _make_req(input Transaction tx, int port_num);
        Request req;
        req.tag_in = tx.p[port_num].inp.tag_in;
        req.cmd = Cmd'(tx.p[port_num].inp.cmd);
        req.d1_val = this._regs[tx.p[port_num].inp.d1];
        req.d2_val = this._regs[tx.p[port_num].inp.d2];
        req.data_in = tx.p[port_num].inp.data_in;
        req.d1_valid = this._valid[tx.p[port_num].inp.d1];
        req.d2_valid = this._valid[tx.p[port_num].inp.d2];
        return req;
    endfunction

    function Transaction eval(input Transaction tx);
        for(int i=0; i<4; i++) begin
            request = _make_req(tx, i);
            response = _reqs[i].request(request);
            tx.p[i].outp.resp = response.resp;
            tx.p[i].outp.tag_out = response.tag_out;
            if(request.cmd inside {ADD, SUB, SHL, SHR, STR}) begin
                tx.p[i].outp.data_out = 0;
                if (response.resp == SUCC) begin
                    this._valid[tx.p[i].inp.r1] = 1;
                    this._regs[tx.p[i].inp.r1] = response.data_out;
                end
            end
            else
                tx.p[i].outp.data_out = response.data_out;
        end
        return tx;
    endfunction
endclass