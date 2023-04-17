`include "uvm_macros.svh"
class Monitor extends uvm_monitor;
    `uvm_component_utils(Monitor)
    uvm_analysis_port #(Transaction) aport;
    
    virtual Interface _vi;

    function new(input string name, uvm_component parent);
      super.new(name, parent);
    endfunction: new
    
    function void build_phase(input uvm_phase phase);
        super.build_phase(phase);
        assert(uvm_config_db #(virtual Interface)::get(
            this, "", "_vi", _vi) );
        aport = new("aport", this);
    endfunction : build_phase
   
    task run_phase(input uvm_phase phase);
        forever begin
            Transaction tx;
            tx = Transaction::type_id::create("tx");
            tx.get(_vi);
            aport.write(tx);
            @(posedge _vi.c_clk);
        end
    endtask: run_phase

  endclass: Monitor