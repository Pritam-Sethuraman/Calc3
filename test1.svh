`include "uvm_macros.svh"
class Test1 extends Test;
    `uvm_component_utils(Test1)
 
    function new(input string name, uvm_component parent);
        super.new(name, parent);
    endfunction: new

    function void build_phase(input uvm_phase phase);
        super.build_phase(phase);
    endfunction: build_phase
     
    task run_phase(input uvm_phase phase);
        All_Cmds all_cmds;

        all_cmds = All_Cmds::type_id::create("all_cmds");
        phase.raise_objection(this);
        all_cmds.start(env.agent.sequencer);
        repeat(20) @ (posedge _vi.c_clk);
        phase.drop_objection(this);
    endtask: run_phase
endclass: Test1