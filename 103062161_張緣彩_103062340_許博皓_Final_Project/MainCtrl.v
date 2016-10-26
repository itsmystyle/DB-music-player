`define MAIN_PLAY 2'd0
`define MAIN_CREDIT 2'd1
`define PLAYING 2'd2
`define CREDIT 2'd3

module MainCtrl(
    input clk,
    input reset,
    input arrow_up,
    input arrow_down,
    input enter,
    input esc,
    output reg [1:0] state
    );
    reg [1:0] next_state;
    
    always@(posedge clk, posedge reset) begin
        if(reset) state <= `MAIN_PLAY;
        else state <= next_state;
    end
    
    always@(*) begin
        case(state)
            `MAIN_PLAY: begin
                if(enter) next_state = `PLAYING;
                else if(arrow_up || arrow_down) next_state = `MAIN_CREDIT;
                else next_state = `MAIN_PLAY;
            end
            `MAIN_CREDIT: begin
                if(enter) next_state = `CREDIT;
                else if(arrow_up || arrow_down) next_state = `MAIN_PLAY;
                else next_state = `MAIN_CREDIT;
            end
            `PLAYING: begin
                next_state = `PLAYING;
            end
            `CREDIT: begin
                if(esc) next_state = `MAIN_PLAY;
                else next_state = `CREDIT;
            end
            default: begin
                next_state = `MAIN_PLAY;
            end
        endcase
    end
    
endmodule
