`include "uvm_macros.svh"
class Store extends Basic_Seq;
    `uvm_object_utils(Store)
    
    function new (input string name = "");
        super.new(name, 4'b1001);
    endfunction: new

    task body;
        case(mode)
            "ap" : super.all_ports();
            default : super.basic_body();
        endcase
    endtask: body
   
endclass: Store