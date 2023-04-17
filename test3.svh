`include "uvm_macros.svh"
class Test3 extends Test;
    `uvm_component_utils(Test3)
 
    function new(input string name, uvm_component parent);
        super.new(name, parent);
    endfunction: new

    function void build_phase(input uvm_phase phase);
        super.build_phase(phase);
    endfunction: build_phase
     
    task run_phase(input uvm_phase phase);
        Store_Add sa;
        
        sa = Store_Add::type_id::create("sa");
        
        phase.raise_objection(this);
        sa.start(env.agent.sequencer);
        repeat(20) @ (posedge _vi.c_clk);
        phase.drop_objection(this);
    endtask: run_phase
endclass: Test3