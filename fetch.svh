`include "uvm_macros.svh"
class Fetch extends Basic_Seq;
    `uvm_object_utils(Fetch)

    function new (input string name = "");
        super.new(name, 4'b1010);
    endfunction: new

    task _fetch_address(input logic [0:3] address);
        tx = Transaction::type_id::create("tx");
        start_item(tx);
        assert(tx.randomize() with {
            rst == 0;
            p[port_num].inp.cmd == cmd;
            p[port_num].inp.d1 == address;
        });
        finish_item(tx);
    endtask: _fetch_address

    task body;
        case(mode)
            "fa"    : _fetch_address(related_tx.p[port_num].inp.r1);
            "ap" : super.all_ports();
            default : super.basic_body();
        endcase
    endtask: body
   
endclass: Fetch