module PlayerCtrl(
	input clk_sys,
	input clk,
	input reset,
	input Play_Pause,
	input Repeat,
	input forward,
	input backward,
	output reg ispause,
	output reg[7:0] ibeat,
	input[1:0] song_sel,
	output reg song_finished
);

    reg[1:0] state;
    reg[1:0] next_state;
    reg[7:0] next_ibeat;
    parameter st  = 2'b00;
    parameter play = 2'b01;
    parameter pause = 2'b10;
    reg[1:0] pre_song_sel;
    wire[7:0] BEATLENGTH;
    reg enable;
    
    always@(posedge clk, posedge reset) begin
        if(reset || (pre_song_sel != song_sel)) begin
            ibeat <= 0;
        end
        else
            ibeat <= next_ibeat;
    end
    
    always@(posedge clk_sys, posedge reset) begin
        if(reset) begin
            state <= st;
        end
        else begin
            state <= next_state;
        end
    end
    
    always@(posedge clk, posedge reset) begin
        if(reset)
            pre_song_sel <= 0;
        else
            pre_song_sel <= song_sel;
    end
    
	assign BEATLENGTH = (song_sel == 2'b00) ? 127 :
						(song_sel == 2'b01) ? 215 :
						(song_sel == 2'b10) ? 231 :
						(song_sel == 2'b11) ? 255 :
												127;
    
    always@(*) begin
        case(state)
            st: begin
                if(Play_Pause == 1) begin
                    next_ibeat = 0;
                    next_state = play;
                    ispause = 0;
                    song_finished = 0;
                end
                else begin
                    next_ibeat = 0;
                    next_state = st;
                    ispause = 1;
                    song_finished = 0;
                end
            end
            play : begin
                if(Play_Pause == 1)begin
                    next_ibeat = ibeat + 1;
                    next_state = pause;
                    ispause = 0;
                    song_finished = 0;
                end
                else begin
                    if(ibeat == BEATLENGTH) begin
                        next_ibeat = 0;
                        if(Repeat == 1) begin
                            next_state = play;
                            ispause = 0;
                            song_finished = 0;
                        end
                        else begin
                            ispause = 0;
                            next_state = play;
                            song_finished = 1;
                        end
                    end
                    else begin
                        ispause = 0;
                        next_state = state;
                        song_finished = 0;
                        if(forward == 1 && backward == 0)begin
                            if(ibeat > BEATLENGTH - 8)
                                next_ibeat = BEATLENGTH;
                            else begin
                                next_ibeat = ibeat + 8;
                                song_finished = 0;
                            end
                        end
                        else if(forward == 0 && backward == 1)begin
                            if(ibeat < 8)
                                next_ibeat = 0;
                            else begin
                                next_ibeat = ibeat - 8;
                                song_finished = 0;
                            end
                        end
                        else
                            next_ibeat = ibeat + 1;
                    end
                end
            end
            pause : begin
                if(Play_Pause == 1) begin
                    next_ibeat = ibeat;
                    next_state = play;
                    ispause = 1;
                    song_finished = 0;
                end
                else begin
                    next_ibeat = ibeat;
                    next_state = pause;
                    ispause = 1;
                    song_finished = 0;
                end
            end
            default : begin
              next_ibeat = 0;
              next_state = st;
              ispause = 1;
              song_finished = 0;
           end
        endcase
    end

endmodule