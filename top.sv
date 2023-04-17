module top;
    import uvm_pkg::*;
    import my_package::*;
    Interface _if();
    Wrapper wrapper(_if);

    initial begin
        _if.c_clk = 0;
        forever #1 _if.c_clk = ~_if.c_clk;
    end

    initial begin
        uvm_config_db #(virtual Interface)::set(null, "uvm_test_top*", "_vi", _if);
        uvm_top.finish_on_completion = 1;
        run_test("Test1");
        run_test("Test2");
        run_test("Test3");
    end
endmodule: top