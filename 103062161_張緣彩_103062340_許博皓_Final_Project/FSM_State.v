`define TIGER 2'd0
`define BIRTHDAY 2'd1
`define PAYPHONE 2'd2
`define ARBOR 2'd3

module FSM_State(
    input clk,
    input next,
    input prev,
    input reset,
    output reg[1:0] state
    );
    reg [1:0]next_state;
    
    always@(posedge clk or posedge reset) begin
        if(reset) begin
            state <= `TIGER;
        end else state <= next_state;
    end
    
    always@(*) begin
        case(state)
            `TIGER: begin
                if(next) next_state = `BIRTHDAY;
                else if(prev) next_state = `ARBOR;
                else next_state = state;
            end
            `BIRTHDAY: begin
                if(next) next_state = `PAYPHONE;
                else if(prev) next_state = `TIGER;
                else next_state = state;
            end
            `PAYPHONE: begin
                if(next) next_state = `ARBOR;
                else if(prev) next_state = `BIRTHDAY;
                else next_state = state;
            end
            `ARBOR: begin
                if(next) next_state = `TIGER;
                else if(prev) next_state = `PAYPHONE;
                else next_state = state;
            end
            default: begin
                next_state = `TIGER;
            end
        endcase
    end
    
endmodule
