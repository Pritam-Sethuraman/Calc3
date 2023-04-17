`include "uvm_macros.svh"
class Sub extends Basic_Seq;
    `uvm_object_utils(Sub)

    Transaction tx;
    
    function new (input string name = "");
        super.new(name, 4'b0010);
    endfunction: new

    task body;
        case(mode)
            "ap" : super.all_ports();
            default : super.basic_body();
        endcase
    endtask: body
   
endclass: Sub