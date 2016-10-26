module Top_Audio(
	input clk,
	input reset,
	input Play_Pause,
    input Mute,
    input Repeat,
    input forward,
    input backward,
    input[1:0] Quality,
    input[1:0] Speed,
    input[1:0] song_sel,
	output pmod_JB_1,
	output pmod_JB_2,
	output pmod_JB_4,
	output pmod_JC_1,
	output pmod_JC_2,
	output pmod_JC_4,
	output song_finished,
	output wire[31:0] freq_JB,
	output wire[31:0] freq_JC
);

    parameter BEAT_FREQ = 32'd8;
    parameter DUTY_BEST = 10'd512;
    
    wire[31:0]freq1;
    wire[31:0]freq2;
    wire[31:0]freq3;
    wire[31:0]freq4_R;
    wire[31:0]freq4_L;
    wire[7:0] ibeatNum;
    wire beatFreq;
    wire ispause;
    wire de_reset, de_Play_Pause, onepulse_Play_Pause;
    wire clk_13;
    
    wire[31:0] speed;
    wire[9:0] quality;
    
    assign pmod_JB_2 = 1'd1;
    assign pmod_JB_4 = (Mute == 1 || ispause == 1) ? 1'b0 : 1'b1;
    assign pmod_JC_2 = 1'd1;
    assign pmod_JC_4 = (Mute == 1 || ispause == 1) ? 1'b0 : 1'b1;
    
    clock_divisor #(13) clk13(.clk(clk), .clk_out(clk_13));
    debounce St_debounce(.pb_debounced(de_reset), .pb(reset), .clk(clk));
    debounce Play_Pause_debounce(.pb_debounced(de_Play_Pause), .pb(Play_Pause), .clk(clk_13));
    onepulse Play_Pause_onepulse(.PB_single_pulse(onepulse_Play_Pause), .clock(clk_13), .PB_debounced(de_Play_Pause));
   
    PWM_gen btSpeedGen(.clk(clk), .reset(reset), .freq(speed), .duty(quality), .PWM(beatFreq));
    
    PlayerCtrl playerCtrl_00(.clk_sys(clk_13), .clk(beatFreq), .reset(de_reset), .Play_Pause(onepulse_Play_Pause), 
                                .Repeat(Repeat), .forward(forward), .backward(backward), .ispause(ispause), 
                                .ibeat(ibeatNum), .song_sel(song_sel), .song_finished(song_finished));
    
    Music1 music01(.ibeatNum(ibeatNum), .tone(freq1));
    Music2 music02(.ibeatNum(ibeatNum), .tone(freq2));
    Music3 music03(.ibeatNum(ibeatNum), .tone(freq3));
    Music4_R music04_R(.ibeatNum(ibeatNum), .tone(freq4_R));
    Music4_L music04_L(.ibeatNum(ibeatNum), .tone(freq4_L));
    
    PWM_gen toneGen_0(.clk(clk), .reset(reset), .freq(freq_JB), .duty(quality), .PWM(pmod_JB_1));
    PWM_gen toneGen_1(.clk(clk), .reset(reset), .freq(freq_JC), .duty(quality), .PWM(pmod_JC_1));
                                           
    assign freq_JC = (song_sel == 2'b00) ? freq2 :
                     (song_sel == 2'b01) ? freq1 :
                     (song_sel == 2'b10) ? freq3 :
                     (song_sel == 2'b11) ? freq4_L :
                     (song_sel == 2'b00 && song_finished == 1) ? freq1 :
                     (song_sel == 2'b01 && song_finished == 1) ? freq3 :
                     (song_sel == 2'b10 && song_finished == 1) ? freq4_L :
                     (song_sel == 2'b11 && song_finished == 1) ? freq2 :
                                                                   freq2;                                          
                                        
    assign freq_JB = (song_sel == 2'b00) ? freq2 :
                     (song_sel == 2'b01) ? freq1 :
                     (song_sel == 2'b10) ? freq3 :
                     (song_sel == 2'b11) ? freq4_R :
                     (song_sel == 2'b00 && song_finished == 1) ? freq1 :
                     (song_sel == 2'b01 && song_finished == 1) ? freq3 :
                     (song_sel == 2'b10 && song_finished == 1) ? freq4_R :
                     (song_sel == 2'b11 && song_finished == 1) ? freq2 :
                                                                   freq2;                                        
                                        
    assign speed = (Speed == 2'b00 && song_sel == 2'b00) ? BEAT_FREQ * 36 / 100: //0.5x
                    (Speed == 2'b00 && song_sel == 2'b01) ? BEAT_FREQ * 44 / 100: //0.5x
                    (Speed == 2'b00 && song_sel == 2'b10) ? BEAT_FREQ * 448 / 1000: //0.5x
                    (Speed == 2'b00 && song_sel == 2'b11) ? BEAT_FREQ * 4 / 10: //0.5x
                    (Speed == 2'b01 && song_sel == 2'b00) ? BEAT_FREQ * 72 / 100: //1x
                    (Speed == 2'b01 && song_sel == 2'b01) ? BEAT_FREQ * 88 / 100: //1x
                    (Speed == 2'b01 && song_sel == 2'b10) ? BEAT_FREQ * 896 / 1000: //1x
                    (Speed == 2'b01 && song_sel == 2'b11) ? BEAT_FREQ * 8 / 10: //1x
                    (Speed == 2'b11 && song_sel == 2'b00) ? BEAT_FREQ * 72 * 2 / 100: //2x
                    (Speed == 2'b11 && song_sel == 2'b01) ? BEAT_FREQ * 88 * 2 / 100: //2x
                    (Speed == 2'b11 && song_sel == 2'b10) ? BEAT_FREQ * 896 * 2 / 1000: //2x
                    (Speed == 2'b11 && song_sel == 2'b11) ? BEAT_FREQ * 8 * 2 / 10: //2x
                                                            BEAT_FREQ * 0.72;
                                                        
   /* assign speed = //(Speed == 3'b000) ? BEAT_FREQ / 10 : //0.1x
                    //(Speed == 3'b001) ? BEAT_FREQ / 4 : //0.25x
                    (Speed == 2'b00) ? BEAT_FREQ / 2 : //0.5x
                    //(Speed == 3'b011) ? BEAT_FREQ * 3 / 4 : //0.75x
                    (Speed == 2'b01) ? BEAT_FREQ : //1x
                    //(Speed == 3'b101) ? BEAT_FREQ * 5 / 4 : //1.25x
                    //(Speed == 3'b110) ? BEAT_FREQ * 3 / 2: //1.5x
                    (Speed == 2'b11) ? BEAT_FREQ * 2 : //2x
                                        BEAT_FREQ;   */                                                     
    
    assign quality = (Quality == 2'b00) ? DUTY_BEST / 4 :
                     (Quality == 2'b01) ? DUTY_BEST / 2 :
                     (Quality == 2'b10) ? DUTY_BEST * 3 / 4 :
                     (Quality == 2'b11) ? DUTY_BEST :
                                          DUTY_BEST ;

endmodule