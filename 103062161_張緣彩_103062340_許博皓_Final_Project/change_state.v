module change_state(
    input clock,
    input reset,
    input changestate,
    input opreset,
    output reg[1:0] state,
    output reg oreset
    );
    reg[1:0] next_state, prestate;
    
    always@(opreset or state or prestate)begin
        if(opreset) oreset = 1'd1;
        else if(state != prestate) oreset = 1'd1;
        else oreset = 1'd0;
    end
    
    always@(posedge clock) begin
        prestate <= state;
    end
    
    always@(posedge clock or posedge reset or posedge changestate) begin
        if(reset) begin
            next_state <= 2'd0;
        end else if(changestate) begin
            if(state == 2'd0) next_state <= 2'd1;
            else if(state == 2'd1) next_state <= 2'd2;
            else next_state <= 2'd1;
        end else state <= next_state;
    end
    
endmodule
