`include "uvm_macros.svh"
class Store_Add extends uvm_sequence #(Transaction);
    `uvm_object_utils(Store_Add)
    `uvm_declare_p_sequencer(Sequencer)
    
    function new (input string name = "");
        super.new(name);
    endfunction: new

    task body;
        Reset reset;
        Store store;
        Add add;
        Clean clean;

        reset = Reset::type_id::create("reset");
        reset.start(p_sequencer, this);

        store = Store::type_id::create("store");
        store.mode = "ap";
        store.start(p_sequencer, this);

        add = Add::type_id::create("add");
        add.start(p_sequencer, this);

        clean = Clean::type_id::create("clean");
        clean.start(p_sequencer, this);
    endtask: body
   
endclass: Store_Add