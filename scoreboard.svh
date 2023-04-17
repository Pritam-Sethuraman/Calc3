`include "uvm_macros.svh"
class Scoreboard extends uvm_scoreboard;
`uvm_component_utils(Scoreboard)

    uvm_analysis_imp #(Transaction, Scoreboard) analysis_export;
    Golden_Model gm;

    Transaction reqs [4][4][$];
    Transaction resps [4][4][$];
    
    function new(input string name, uvm_component parent);
        super.new(name, parent);
    endfunction: new

    function void build_phase(input uvm_phase phase);
        super.build_phase(phase);
        analysis_export = new("analysis_export", this);
        gm = new();
    endfunction : build_phase

    function void write(input Transaction tx);
        for(int i=0; i<4; i++) begin
            if(tx.p[i].inp.cmd inside {ADD, SUB, SHL, SHR, STR, FTC, BIZ, BIE}) begin
                Transaction req;
                req = Transaction::type_id::create("req");
                req.copy(tx);
                req.zero_all_except(i);
                reqs[i][req.p[i].inp.tag_in].push_back(req);
            end
        end
        for(int i=0; i<4; i++) begin
            if(tx.p[i].outp.resp inside {SUCC, OFUF, SKPD}) begin
                Transaction resp;
                resp = Transaction::type_id::create("resp");
                resp.copy(tx);
                resp.zero_all_except(i);
                resps[i][resp.p[i].outp.tag_out].push_back(resp);
            end
        end        
    endfunction : write

    task run_phase (input uvm_phase phase);
        forever begin
            wait(resps[0][0].size > 0 ||
                resps[0][1].size > 0 ||
                resps[0][2].size > 0 ||
                resps[0][3].size > 0 ||
                resps[1][0].size > 0 ||
                resps[1][1].size > 0 ||
                resps[1][2].size > 0 ||
                resps[1][3].size > 0 ||
                resps[2][0].size > 0 ||
                resps[2][1].size > 0 ||
                resps[2][2].size > 0 ||
                resps[2][3].size > 0 ||
                resps[3][0].size > 0 ||
                resps[3][1].size > 0 ||  
                resps[3][2].size > 0 ||
                resps[3][3].size > 0
            );

            for(int p=0; p<4; p++) begin
                for(int t=0; t<4; t++) begin
                    if(resps[p][t].size > 0) begin
                        Transaction request;
                        Transaction response;
                        Transaction gm_tx;
                        response = resps[p][t].pop_front();
                        if(!(reqs[p][t].size > 0)) begin
                            `uvm_info("Scoreboard", "Failed\n", UVM_NONE);
                            `uvm_info("Scoreboard", "There is no coresponding legal request for following response:", UVM_NONE);
                            `uvm_info("Scoreboard", $sformatf("Port %d\tTag %d", p, t), UVM_NONE);
                            `uvm_info("Scoreboard", $sformatf("%s", response._port_output_str(p)), UVM_NONE);
                            $finish;
                        end
                        request = reqs[p][t].pop_front();
                        gm_tx = gm.eval(request);
                        if(response.p[p].outp.resp == gm_tx.p[p].outp.resp && response.p[p].outp.data_out == gm_tx.p[p].outp.data_out) begin
                            `uvm_info("Scoreboard", "Passed", UVM_NONE);
                        end
                        else begin
                            `uvm_info("Scoreboard", "Failed\n", UVM_NONE);
                            `uvm_info("Scoreboard", $sformatf("Port %d\tTag %d", p, t), UVM_NONE);
                            `uvm_info("Scoreboard", $sformatf("Request is:\n%s", request._port_input_str(p)), UVM_NONE);
                            `uvm_info("Scoreboard", $sformatf("Expected: \n%s", gm_tx._port_output_str(p)), UVM_NONE);
                            `uvm_info("Scoreboard", $sformatf("Got: \n%s", response._port_output_str(p)), UVM_NONE);
                            $finish;
                        end
                    end
                end
            end
        end
    endtask : run_phase

endclass: Scoreboard