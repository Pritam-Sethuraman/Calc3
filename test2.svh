`include "uvm_macros.svh"
class Test2 extends Test;
    `uvm_component_utils(Test2)
 
    function new(input string name, uvm_component parent);
        super.new(name, parent);
    endfunction: new

    function void build_phase(input uvm_phase phase);
        super.build_phase(phase);
    endfunction: build_phase
     
    task run_phase(input uvm_phase phase);
        Store_Fetch sf;
        Add16 add16;

        sf = Store_Fetch::type_id::create("sf");
        add16 = Add16::type_id::create("add16");

//        phase.raise_objection(this);
//        add16.start(env.agent.sequencer);
//        repeat(20) @ (posedge _vi.c_clk);

        phase.raise_objection(this);
        sf.start(env.agent.sequencer);
        repeat(20) @ (posedge _vi.c_clk);
        
        phase.drop_objection(this);
    endtask: run_phase
endclass: Test2