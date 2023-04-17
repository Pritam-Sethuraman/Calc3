`include "uvm_macros.svh"
class Clean extends Basic_Seq;
    `uvm_object_utils(Clean)
    
    function new (input string name = "");
        super.new(name);
    endfunction: new

    task body;
        tx = Transaction::type_id::create("tx");
        start_item(tx);
        tx.make_zero();
        finish_item(tx);
    endtask: body
   
endclass: Clean