`include "uvm_macros.svh"
class Shr extends Basic_Seq;
    `uvm_object_utils(Shr)
    
    function new (input string name = "");
        super.new(name, 4'b0110);
    endfunction: new

    task body;
        case(mode)
            "ap" : super.all_ports();
            default : super.basic_body();
        endcase
    endtask: body
   
endclass: Shr