`include "uvm_macros.svh"
class Basic_Seq extends uvm_sequence #(Transaction);
    `uvm_object_utils(Basic_Seq)

    Transaction tx;
    Transaction related_tx;
    rand int port_num;
    string mode;
    logic [0:3] cmd;

    constraint c_port_num {port_num >= 0; port_num < 4;}
    
    function new (input string name = "", logic [0:3] _cmd = 4'b0000);
        super.new(name);
        cmd = _cmd;
        related_tx = Transaction::type_id::create("related_tx");
    endfunction: new

    task basic_body;
        tx = Transaction::type_id::create("tx");
        start_item(tx);
        assert(this.randomize());
        assert(tx.randomize() with {
            rst == 0;
            p[port_num].inp.cmd == cmd;
        });
        finish_item(tx);
    endtask: basic_body

    task all_ports;
        tx = Transaction::type_id::create("tx");
        start_item(tx);
        assert(tx.randomize() with {
            rst == 0;
            p[0].inp.cmd == cmd;
            p[1].inp.cmd == cmd;
            p[2].inp.cmd == cmd;
            p[3].inp.cmd == cmd;
        });
        finish_item(tx);
    endtask: all_ports
    
endclass: Basic_Seq