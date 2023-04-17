`include "uvm_macros.svh"
class Subscriber extends uvm_subscriber #(Transaction);
    `uvm_component_utils(Subscriber)

    logic [0:1] tag_in;
    logic [0:3] cmd, d1, d2, r1;
    logic [0:1] tag_out, resp;

    covergroup cover_bus;
        coverpoint tag_in {
            bins t0 = {0};
            bins t1 = {1};
            bins t2 = {2};
            bins t3 = {3};
        }
        coverpoint cmd {
            bins add_sub = {4'b0011, 4'b0010};
            bins shift = {4'b0101, 4'b0110};
            bins str_ftc = {4'b1001, 4'b1010};
            bins branch = {4'b1100, 4'b1101};
        }
        coverpoint d1;
        coverpoint d2;
        coverpoint r1;
        coverpoint tag_out {
            bins t0 = {0};
            bins t1 = {1};
            bins t2 = {2};
            bins t3 = {3};
        }
        coverpoint resp {
            bins success = {2'b01};
            bins oflow_uflow = {2'b10};
            bins skipped = {2'b11};
        }
    endgroup: cover_bus
    
    function new(input string name, uvm_component parent);
        super.new(name, parent);
        cover_bus = new;
    endfunction: new

    function void build_phase(input uvm_phase phase);
        super.build_phase(phase);
    endfunction: build_phase

    function void write(input Transaction t);
        `uvm_info("Subscriber", $sformatf("\n%s", t.str), UVM_LOW);
        for(int i=0; i<4; i++) begin
            tag_in = t.p[i].inp.tag_in;
            cmd = t.p[i].inp.cmd;
            d1 = t.p[i].inp.d1;
            d2 = t.p[i].inp.d2;
            r1 = t.p[i].inp.r1;
            tag_out = t.p[i].outp.tag_out;
            resp = t.p[i].outp.resp;
            cover_bus.sample();
        end
    endfunction: write

endclass: Subscriber