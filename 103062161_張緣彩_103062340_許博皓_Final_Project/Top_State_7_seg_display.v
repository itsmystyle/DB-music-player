`define STOP 2'd0
`define PLAY 2'd1
`define PAUSE 2'd2

module Top_State_7_seg_display(
    input clock,
    input reset,
    input change_state,
    output wire[6:0] display,
    output wire[3:0] digit
    );
    wire oreset;
    wire clk_13, clk_26;
    wire [3:0] BCD0, BCD1, BCD2, BCD3;
    wire [3:0] BCD0_play, BCD1_play, BCD2_play, BCD3_play, BCD0_pause, BCD1_pause, BCD2_pause, BCD3_pause, BCD0_hello, BCD1_hello, BCD2_hello, BCD3_hello;
    
    assign {BCD0,BCD1,BCD2,BCD3} = (state == `STOP)? {BCD0_hello, BCD1_hello, BCD2_hello, BCD3_hello} :
                                    (state == `PLAY)? {BCD0_play, BCD1_play, BCD2_play, BCD3_play} :
                                     {BCD0_pause, BCD1_pause, BCD2_pause, BCD3_pause};
               
    clock_divisor #(26) clk26(.clk(clock), .clk_out(clk_26));                                
    clock_divisor #(13) clk13(.clk(clock), .clk_out(clk_13));
    
    FSM_controller_play play_inst(.clock(clk_26), .reset(reset||oreset), .BCD0(BCD0_play), .BCD1(BCD1_play), .BCD2(BCD2_play), .BCD3(BCD3_play));
    FSM_controller_pause pause_inst(.clock(clk_26), .reset(reset||oreset), .BCD0(BCD0_pause), .BCD1(BCD1_pause), .BCD2(BCD2_pause), .BCD3(BCD3_pause));
    FSM_controller_hello hello_inst(.clock(clk_26), .reset(reset||oreset), .BCD0(BCD0_hello), .BCD1(BCD1_hello), .BCD2(BCD2_hello), .BCD3(BCD3_hello));
    LED7SEG decoder(.DIGIT(digit), .DISPLAY(display), .clk(clk_13), .BCD3(BCD3), .BCD2(BCD2), .BCD1(BCD1), .BCD0(BCD0));
    
    wire dbchange_state, opchange_state;
    wire dbreset, opreset;
    wire [1:0] state;
    
    debounce dbchangestate_inst(.pb_debounced(dbchange_state), .pb(change_state), .clk(clk_13));
    onepulse opchange_state_inst(.PB_single_pulse(opchange_state), .clock(clk_13), .PB_debounced(dbchange_state));
    debounce dbreset_inst(.pb_debounced(dbreset), .pb(reset), .clk(clock));
    onepulse opreset_inst(.PB_single_pulse(opreset), .clock(clock), .PB_debounced(dbreset));
    change_state cs(.clock(clk_13), .reset(reset), .opreset(opreset), .changestate(opchange_state), .state(state), .oreset(oreset));
    
endmodule
