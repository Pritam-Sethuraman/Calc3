`include "uvm_macros.svh"
class Test extends uvm_test;
`uvm_component_utils(Test)

    virtual Interface _vi;
    Env env;

    function new(input string name, uvm_component parent);
        super.new(name, parent);
    endfunction: new

    function void build_phase(input uvm_phase phase);
        super.build_phase(phase);
        assert(uvm_config_db #(virtual Interface)::get(
            this, "", "_vi", _vi));
        env = Env::type_id::create("env", this);
    endfunction: build_phase

endclass: Test