`include "uvm_macros.svh"
class Reset extends Basic_Seq;
    `uvm_object_utils(Reset)
    
    function new (input string name = "");
        super.new(name);
    endfunction: new

    task body;
        Transaction tx;

        repeat(7) begin
            tx = Transaction::type_id::create("tx");
            start_item(tx);
            tx.make_zero();
            tx.rst = 1;
            finish_item(tx);
        end
    endtask: body
   
endclass: Reset