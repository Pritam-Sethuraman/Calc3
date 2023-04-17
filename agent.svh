`include "uvm_macros.svh"
class Agent extends uvm_agent;
    `uvm_component_utils(Agent)
    uvm_analysis_port #(Transaction) aport;

    Sequencer sequencer;
    Driver  driver;
    Monitor monitor;
    
    function new(input string name, uvm_component parent);
        super.new(name, parent);
    endfunction: new
    
    function void build_phase(input uvm_phase phase);
        super.build_phase(phase);
        aport = new("aport", this);
        sequencer = Sequencer::type_id::create("sequencer", this);
        driver = Driver::type_id::create("driver", this);
        monitor = Monitor::type_id::create("monitor" , this);
    endfunction: build_phase
    
    function void connect_phase(input uvm_phase phase);
        driver.seq_item_port.connect(sequencer.seq_item_export);
        monitor.aport.connect(aport);
    endfunction: connect_phase
    
  endclass: Agent