`include "uvm_macros.svh"
class Add extends Basic_Seq;
    `uvm_object_utils(Add)
    
    function new (input string name = "");
        super.new(name, 4'b0001);
    endfunction: new

    task body;
        case(mode)
            "ap" : super.all_ports();
            default : super.basic_body();
        endcase
    endtask: body
   
endclass: Add