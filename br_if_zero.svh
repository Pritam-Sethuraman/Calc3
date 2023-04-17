class Br_If_Zero extends Basic_Seq;
    `uvm_object_utils(Br_If_Zero)
    
    function new (string name = "");
        super.new(name, 4'b1100);
    endfunction: new

    task body;
        case(mode)
            "ap" : super.all_ports();
            default : super.basic_body();
        endcase
    endtask: body
   
endclass: Br_If_Zero