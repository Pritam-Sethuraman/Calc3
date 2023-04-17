`include "uvm_macros.svh"
class Full_Rand extends Basic_Seq;
    `uvm_object_utils(Full_Rand)
    
    function new (input string name = "");
        super.new(name);
    endfunction: new

    task body;
        tx = Transaction::type_id::create("tx");
        start_item(tx);
        assert(tx.randomize());
        finish_item(tx);
    endtask: body
   
endclass: Full_Rand