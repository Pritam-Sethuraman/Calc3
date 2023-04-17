`include "uvm_macros.svh"
class Store_Fetch extends uvm_sequence #(Transaction);
    `uvm_object_utils(Store_Fetch)
    `uvm_declare_p_sequencer(Sequencer)
    
    function new (input string name = "");
        super.new(name);
    endfunction: new

    task body;
        Reset reset;
        Store store;
        Fetch fetch;
        Clean clean;

        reset = Reset::type_id::create("reset");
        reset.start(p_sequencer, this);

        store = Store::type_id::create("store");
        store.start(p_sequencer, this);

        fetch = Fetch::type_id::create("fetch");
        fetch.mode = "fa";
        fetch.port_num = store.port_num;
        fetch.related_tx = store.tx;
        fetch.start(p_sequencer, this);

        clean = Clean::type_id::create("clean");
        clean.start(p_sequencer, this);
    endtask: body
   
endclass: Store_Fetch