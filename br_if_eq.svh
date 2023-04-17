`include "uvm_macros.svh"
class Br_If_Eq extends Basic_Seq;
    `uvm_object_utils(Br_If_Eq)
    
    function new (input string name = "");
        super.new(name, 4'b1101);
    endfunction: new

    task body;
        case(mode)
            "ap" : super.all_ports();
            default : super.basic_body();
        endcase
    endtask: body
   
endclass: Br_If_Eq