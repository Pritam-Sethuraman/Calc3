`include "uvm_macros.svh"
class Env extends uvm_env;
    `uvm_component_utils(Env)

    UVM_FILE file;
    Agent agent;
    Subscriber subscriber;
    Scoreboard scoreboard;

    function new(input string name, uvm_component parent);
        super.new(name, parent);
    endfunction: new

    function void build_phase(input uvm_phase phase);
        super.build_phase(phase);
        agent = Agent::type_id::create("agent", this);
        subscriber = Subscriber::type_id::create("subscriber", this);
        scoreboard = Scoreboard::type_id::create("scoreboard", this);
    endfunction: build_phase

    function void connect_phase(input uvm_phase phase);
        agent.aport.connect(subscriber.analysis_export);
        agent.aport.connect(scoreboard.analysis_export);
    endfunction: connect_phase
      
    function void start_of_simulation_phase(input uvm_phase phase);
        uvm_top.set_report_verbosity_level_hier(UVM_HIGH);
        file = $fopen("log/uvm.log", "w");
        uvm_top.set_report_default_file_hier(file);
        uvm_top.set_report_severity_action_hier(UVM_INFO, UVM_DISPLAY + UVM_LOG);
    endfunction: start_of_simulation_phase
    
endclass: Env