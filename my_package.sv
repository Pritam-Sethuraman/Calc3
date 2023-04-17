package my_package;
    typedef enum logic [0:3] {
        ADD = 4'b0001,
        SUB = 4'b0010,
        SHL = 4'b0101,
        SHR = 4'b0110,
        STR = 4'b1001,
        FTC = 4'b1010,
        BIZ = 4'b1100,
        BIE = 4'b1101,
        ZER = 4'b0000
    } Cmd;

    typedef enum logic [0:1] {
        SUCC = 2'b01,
        OFUF = 2'b10,
        SKPD = 2'b11,
        ZERO = 2'b00
    } Resp;

    typedef struct {
        logic [0:1] tag_in;
        Cmd cmd;
        int d1_val, d2_val;
        logic d1_valid, d2_valid;
        int data_in;
    } Request;

    typedef struct {
        logic [0:1] tag_out;
        Resp resp;
        int data_out;
    } Response;

    `include "uvm_macros.svh"
    import uvm_pkg::*;
    `include "transaction.svh"
    typedef uvm_sequencer #(Transaction) Sequencer;
    `include "basic_seq.svh"

    `include "reset.svh"
    `include "store.svh"
    `include "fetch.svh"
    `include "add.svh"
    `include "br_if_eq.svh"
    `include "br_if_zero.svh"
    `include "full_rand.svh"
    `include "shl.svh"
    `include "shr.svh"
    `include "sub.svh"
    `include "clean.svh"
        
    `include "all_cmds.svh"
    `include "store_fetch.svh"
    `include "add16.svh"
    `include "store_add.svh"
    
    `include "golden_requestor.svh"
    `include "golden_model.svh"

    `include "driver.svh"
    `include "monitor.svh"
    `include "scoreboard.svh"
    `include "agent.svh"
    `include "subscriber.svh"
    `include "env.svh"
    `include "test.svh"

    `include "test1.svh"
    `include "test2.svh"
    `include "test3.svh"
    
endpackage: my_package