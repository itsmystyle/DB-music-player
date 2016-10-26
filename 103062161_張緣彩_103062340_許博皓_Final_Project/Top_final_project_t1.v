module Top_final_project_t1(
    input clock,
    input reset,
    input play,
    input next,
    input prev,
    input mute,
    input Repeat,
    input [1:0] Quality,
    input [1:0] Speed,
    inout wire PS2_DATA,
    inout wire PS2_CLK,
    output wire [3:0] vgaRed,
    output wire [3:0] vgaGreen,
    output wire [3:0] vgaBlue,
    output wire hsync,
    output wire vsync,
    output wire pmod_JB_1,		
    output wire pmod_JB_2,        
    output wire pmod_JB_4,
    output wire pmod_JC_1,
    output wire pmod_JC_2,
    output wire pmod_JC_4,
    output wire[6:0] display,
    output wire[3:0] digit,
    output wire[6:0] Rled,
    output wire[6:0] Lled    
    );
    
    wire [1:0] song_sel;
    wire next_song_when_finish;
    wire pb_pause, onepulse_pause;
    wire pb_next, onepulse_next, pb_prev, onepulese_prev;
    wire clk_16_for_state;
    wire [31:0] RledDcd, LledDcd;
    wire forward, backward, forward_el, backward_el;
    wire clk_13;
    wire esc, enter, up, down, esc_el, enter_el, up_el, down_el;
    wire [1:0] state;
    wire as_play, as_next, as_prev;
    
    assign as_play = (state == 2'd2)? play: 1'b0;
    assign as_next = (state == 2'd2)? next: 1'b0;
    assign as_prev = (state == 2'd2)? prev: 1'b0;
    
    clock_divisor #(13) clk13(.clk(clock), .clk_out(clk_13));
        
    debounce pb_pause_inst(.pb_debounced(pb_pause), .pb(as_play), .clk(clk_13));
    onepulse op_pause_inst(.PB_single_pulse(onepulse_pause), .clock(clk_13), .PB_debounced(pb_pause));
    debounce pb_next_inst(.pb_debounced(pb_next), .pb(as_next), .clk(clk_13));
    onepulse op_next_inst(.PB_single_pulse(onepulse_next), .clock(clk_13), .PB_debounced(pb_next));
    debounce pb_prev_inst(.pb_debounced(pb_prev), .pb(as_prev), .clk(clk_13));
    onepulse op_prev_inst(.PB_single_pulse(onepulse_prev), .clock(clk_13), .PB_debounced(pb_prev));
    
    FSM_State Song_Sel(
        .clk(clk_13),
        .next(onepulse_next || next_song_when_finish),
        .prev(onepulse_prev),
        .reset(reset),
        .state(song_sel)
    );
    
    MainCtrl mainctrl_inst(
        .clk(clk_13),
        .reset(reset),
        .arrow_up(down_el),
        .arrow_down(up_el),
        .enter(enter_el),
        .esc(esc_el),
        .state(state)
    );

    CreateLargePulse #(
        .PULSE_SIZE(13) 
    ) escLarge(
        .large_pulse(esc_el),
        .small_pulse(esc),
        .rst(reset),
        .clk(clock)
    );
    
    CreateLargePulse #(
        .PULSE_SIZE(13) 
    ) enterLarge(
        .large_pulse(enter_el),
        .small_pulse(enter),
        .rst(reset),
        .clk(clock)
    );
    
    CreateLargePulse #(
        .PULSE_SIZE(13) 
    ) upLarge(
        .large_pulse(up_el),
        .small_pulse(up),
        .rst(reset),
        .clk(clock)
    ); 
    
    CreateLargePulse #(
        .PULSE_SIZE(13) 
    ) downLarge(
        .large_pulse(down_el),
        .small_pulse(down),
        .rst(reset),
        .clk(clock)
    );            
    
    CreateLargePulse #(
        .PULSE_SIZE(19) 
    ) forwardLarge(
        .large_pulse(forward_el),
        .small_pulse(forward),
        .rst(reset),
        .clk(clock)
    );
    
    CreateLargePulse #(
        .PULSE_SIZE(19) 
    )backwardLarge(
        .large_pulse(backward_el),
        .small_pulse(backward),
        .rst(reset),
        .clk(clock)
    );        
    
    Top_Audio Audio_inst(
        .clk(clock),
        .reset(reset),
        .pmod_JB_1(pmod_JB_1),       
        .pmod_JB_2(pmod_JB_2),      
        .pmod_JB_4(pmod_JB_4),
        .pmod_JC_1(pmod_JC_1),
        .pmod_JC_2(pmod_JC_2),        
        .pmod_JC_4(pmod_JC_4),      
        .Play_Pause(as_play),
        .forward(forward_el),
        .backward(backward_el),
        .Mute(mute),
        .Repeat(Repeat),
        .Quality(Quality),
        .Speed(Speed),
        .song_sel(song_sel),
        .song_finished(next_song_when_finish),
        .freq_JB(RledDcd),
        .freq_JC(LledDcd)
    );
    
    Top_Vga_control VGA_inst(
       .clk(clock),
       .rst(reset),
       .next(as_next || as_prev),
       .play(onepulse_pause),
       .forward(forward_el),
       .backward(backward_el),
       .speed(Speed),
       .mainstate(state),
       .vgaRed(vgaRed),
       .vgaGreen(vgaGreen),
       .vgaBlue(vgaBlue),
       .hsync(hsync),
       .vsync(vsync),
       .music_sel(song_sel)
    );
    
    Top_KeyBoardControl KeyBoardControl_inst(
        .fast_forward(forward),
        .back_forward(backward),
        .esc(esc),
        .enter(enter),
        .up(up),
        .down(down),
        .PS2_DATA(PS2_DATA),
        .PS2_CLK(PS2_CLK),
        .rst(reset),
        .clk(clock)
    );
        
    Top_State_7_seg_display Seg7_State_inst(
        .clock(clock),
        .reset(reset),
        .change_state(as_play),
        .display(display),
        .digit(digit)
     );        
     
     Top_Led_decoder Led_dcd_inst(
        .Rled(RledDcd),
        .Lled(LledDcd),
        .o_Rled(Rled),
        .o_Lled(Lled)
     );
        
endmodule
