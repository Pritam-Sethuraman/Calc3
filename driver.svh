`include "uvm_macros.svh"
class Driver extends uvm_driver #(Transaction);
    `uvm_component_utils(Driver)

    
    virtual Interface _vi;

    function new(input string name, uvm_component parent);
        super.new(name, parent);
    endfunction: new

    function void build_phase(input uvm_phase phase);
        super.build_phase(phase);
        assert(uvm_config_db #(virtual Interface)::get(
            this, "", "_vi", _vi));
    endfunction : build_phase

    task run_phase(input uvm_phase phase);
        forever begin
            Transaction tx;
            seq_item_port.get(tx);
            tx.set_inp(_vi);
            @(posedge _vi.c_clk);
        end
    endtask: run_phase

endclass: Driver