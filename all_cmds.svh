`include "uvm_macros.svh"
class All_Cmds extends uvm_sequence #(Transaction);
    `uvm_object_utils(All_Cmds)
    `uvm_declare_p_sequencer(Sequencer)
    
    function new (input string name = "");
        super.new(name);
    endfunction: new

    task body;
        Reset reset;
        Add add;
        Sub sub;
        Shl shl;
        Shr shr;
        Br_If_Eq br_if_eq;
        Br_If_Zero br_if_zero;
        Store store;
        Fetch fetch;
        Clean clean;

        reset = Reset::type_id::create("reset");
        reset.start(p_sequencer, this);

        add = Add::type_id::create("add");
        add.start(p_sequencer, this);

        sub = Sub::type_id::create("sub");
        sub.start(p_sequencer, this);

        shl = Shl::type_id::create("shl");
        shl.start(p_sequencer, this);

        shr = Shr::type_id::create("shr");
        shr.start(p_sequencer, this);

        br_if_eq = Br_If_Eq::type_id::create("br_if_eq");
        br_if_eq.start(p_sequencer, this);

        br_if_zero = Br_If_Zero::type_id::create("br_if_zero");
        br_if_zero.start(p_sequencer, this);

        store = Store::type_id::create("store");
        store.start(p_sequencer, this);

        fetch = Fetch::type_id::create("fetch");
        fetch.start(p_sequencer, this);

        clean = Clean::type_id::create("clean");
        clean.start(p_sequencer, this);
    endtask: body
   
endclass: All_Cmds