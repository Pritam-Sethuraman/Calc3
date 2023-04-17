`include "uvm_macros.svh"
class Add16 extends uvm_sequence #(Transaction);
    `uvm_object_utils(Add16)
    `uvm_declare_p_sequencer(Sequencer)
    
    function new (input string name = "");
        super.new(name);
    endfunction: new

    task body;
        Reset reset;
        Add add;
        Clean clean;

        reset = Reset::type_id::create("reset");
        reset.start(p_sequencer, this);

        for (int i=0; i<4; i++) begin
            add = Add::type_id::create("add");
            add.mode = "ap";
            add.start(p_sequencer, this);
        end

        clean = Clean::type_id::create("clean");
        clean.start(p_sequencer, this);
    endtask: body
   
endclass: Add16