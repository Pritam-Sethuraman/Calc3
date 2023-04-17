class Golden_Requestor;

    int number;
    bit _skip;

    function new(input int number);
        this.number = number;
        this._skip = 0;
    endfunction

    function Resp _check_resp(input Cmd cmd, reg[0:32] a=0, int b=0, logic d1_valid = 1, logic d2_valid = 1);
        if(this._skip == 1) begin
            this._skip = 0;
            return SKPD;
        end
        if (!d1_valid || !d2_valid) return OFUF;
        else if(cmd == ADD && a[0] == 1) return OFUF;
        else if(cmd == SUB && a < b) return OFUF;
        else return SUCC;
    endfunction

    function Response _add(input int d1_val, int d2_val, int tag_in, logic d1_valid, logic d2_valid);
        Response response;
        reg [0:32] result;
        response.tag_out = tag_in;
        result = d1_val + d2_val;
        response.resp = this._check_resp(ADD, result, .d1_valid(d1_valid), .d2_valid(d2_valid));
        if(response.resp == SUCC) response.data_out = result[1:32];
        else response.data_out = 0;
        return response;
    endfunction

    function Response _sub(input int d1_val, int d2_val, int tag_in, logic d1_valid, logic d2_valid);
        Response response;
        response.tag_out = tag_in;
        response.resp = this._check_resp(SUB, d1_val, d2_val, .d1_valid(d1_valid), .d2_valid(d2_valid));
        if(response.resp == SUCC) response.data_out = d1_val - d2_val;
        else response.data_out = 0;
        return response;
    endfunction

    function Response _shl(input int d1_val, int d2_val, int tag_in, logic d1_valid, logic d2_valid);
        Response response;
        response.tag_out = tag_in;
        response.resp = this._check_resp(SHL, .d1_valid(d1_valid), .d2_valid(d2_valid));
        if(response.resp == SUCC) response.data_out = d1_val <<< d2_val;
        else response.data_out = 0;
        return response;
    endfunction

    function Response _shr(input int d1_val, int d2_val, int tag_in, logic d1_valid, logic d2_valid);
        Response response;
        response.tag_out = tag_in;
        response.resp = this._check_resp(SHR, .d1_valid(d1_valid), .d2_valid(d2_valid));
        if(response.resp == SUCC) response.data_out = d1_val >>> d2_val;
        else response.data_out = 0;
        return response;
    endfunction

    function Response _store(input int data_in, int tag_in);
        Response response;
        response.tag_out = tag_in;
        response.resp = this._check_resp(STR);
        if(response.resp == SUCC) response.data_out = data_in;
        else response.data_out = 0;
        return response;
    endfunction

    function Response _fetch(input int d1_val, int tag_in, logic d1_valid);
        Response response;
        response.tag_out = tag_in;
        response.resp = this._check_resp(FTC, .d1_valid(d1_valid));
        if(response.resp == SUCC) response.data_out = d1_val;
        else response.data_out = 0;
        return response;
    endfunction

    function Response _branch_if_zero(input int d1_val, int tag_in, logic d1_valid);
        Response response;
        response.tag_out = tag_in;
        response.resp = this._check_resp(BIZ, .d1_valid(d1_valid));
        if(response.resp == SUCC && d1_val == 0) begin
            this._skip = 1;
            response.data_out = 1;
        end
        else response.data_out = 0;
        return response;
    endfunction

    function Response _branch_if_equal(input int d1_val, int d2_val, int tag_in, logic d1_valid, logic d2_valid);
        Response response;
        response.tag_out = tag_in;
        response.resp = this._check_resp(BIE, .d1_valid(d1_valid), .d2_valid(d2_valid));
        if(response.resp == SUCC && d1_val == d2_val) begin
            this._skip = 1;
            response.data_out = 1;
        end
        else response.data_out = 0;
        return response;
    endfunction
    
    function Response _zero();
        Response response;
        response.tag_out = 0;
        response.resp = ZERO;
        response.data_out = 0;
        return response;
    endfunction

    function Response request(input Request req);
        case(req.cmd)
            ADD: return this._add(req.d1_val, req.d2_val, req.tag_in, req.d1_valid, req.d2_valid);
            SUB: return this._sub(req.d1_val, req.d2_val, req.tag_in, req.d1_valid, req.d2_valid);
            SHL: return this._shl(req.d1_val, req.d2_val, req.tag_in, req.d1_valid, req.d2_valid);
            SHR: return this._shr(req.d1_val, req.d2_val, req.tag_in, req.d1_valid, req.d2_valid);
            STR: return this._store(req.data_in, req.tag_in);
            FTC: return this._fetch(req.d1_val, req.tag_in, req.d1_valid);
            BIZ: return this._branch_if_zero(req.d1_val, req.tag_in, req.d1_valid);
            BIE: return this._branch_if_equal(req.d1_val, req.d2_val, req.tag_in, req.d1_valid, req.d2_valid);
            default: return this._zero();
        endcase
    endfunction

endclass