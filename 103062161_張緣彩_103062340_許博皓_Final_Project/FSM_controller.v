`define S1 4'd0
`define S2 4'd1
`define S3 4'd2
`define S4 4'd3
`define S5 4'd4
`define S6 4'd5
`define S7 4'd6
`define S8 4'd7
`define S0 4'd8

`define SP1 4'd0
`define SP2 4'd1
`define SP3 4'd2
`define SP4 4'd3
`define SP5 4'd4
`define SP6 4'd5
`define SP7 4'd6
`define SP8 4'd7
`define SP0 4'd8

`define SH1 4'd0
`define SH2 4'd1
`define SH3 4'd2
`define SH4 4'd3
`define SH5 4'd4
`define SH6 4'd5
`define SH7 4'd6
`define SH8 4'd7
`define SH0 4'd8

module FSM_controller_play(
    input clock,
    input reset,
    output reg[3:0] BCD0,
    output reg[3:0] BCD1,
    output reg[3:0] BCD2,
    output reg[3:0] BCD3
    );
    reg [3:0] state, next_state;
    
    always@(posedge clock or posedge reset) begin
        if(reset) state <= `S0;
        else state <= next_state;
    end
    
    always@(*) begin
        case(state)
            `S0: begin
                BCD0 = 4'd9;
                BCD1 = 4'd9;
                BCD2 = 4'd9;
                BCD3 = 4'd9;
                next_state = `S1;
            end
            `S1: begin
                BCD0 = 4'd0;
                BCD1 = 4'd9;
                BCD2 = 4'd9;
                BCD3 = 4'd9;
                next_state = `S2;
            end
            `S2: begin
                BCD0 = 4'd1;
                BCD1 = 4'd0;
                BCD2 = 4'd9;
                BCD3 = 4'd9;
                next_state = `S3;            
            end
            `S3: begin
                BCD0 = 4'd2;
                BCD1 = 4'd1;
                BCD2 = 4'd0;
                BCD3 = 4'd9;
                next_state = `S4;
            end
            `S4: begin
                BCD0 = 4'd3;
                BCD1 = 4'd2;
                BCD2 = 4'd1;
                BCD3 = 4'd0;
                next_state = `S5;
            end
            `S5: begin
                BCD0 = 4'd9;
                BCD1 = 4'd3;
                BCD2 = 4'd2;
                BCD3 = 4'd1;
                next_state = `S6;
            end
            `S6: begin
                BCD0 = 4'd0;
                BCD1 = 4'd9;
                BCD2 = 4'd3;
                BCD3 = 4'd2;
                next_state = `S7;
            end
            `S7: begin
                BCD0 = 4'd1;
                BCD1 = 4'd0;
                BCD2 = 4'd9;
                BCD3 = 4'd3;
                next_state = `S8;
            end
            `S8: begin
                BCD0 = 4'd2;
                BCD1 = 4'd1;
                BCD2 = 4'd0;
                BCD3 = 4'd9;
                next_state = `S4;
            end
            default: next_state = `S0;
        endcase
    end
endmodule

module FSM_controller_pause(
    input clock,
    input reset,
    output reg[3:0] BCD0,
    output reg[3:0] BCD1,
    output reg[3:0] BCD2,
    output reg[3:0] BCD3
    );
    reg [3:0] state, next_state;
    
    always@(posedge clock or posedge reset) begin
        if(reset) state <= `SP0;
        else state <= next_state;
    end
    
    always@(*) begin
        case(state)
            `SP0: begin
                BCD0 = 4'd9;
                BCD1 = 4'd9;
                BCD2 = 4'd9;
                BCD3 = 4'd9;
                next_state = `SP1;
            end
            `SP1: begin
                BCD0 = 4'd0;
                BCD1 = 4'd9;
                BCD2 = 4'd9;
                BCD3 = 4'd9;
                next_state = `SP2;
            end
            `SP2: begin
                BCD0 = 4'd2;
                BCD1 = 4'd0;
                BCD2 = 4'd9;
                BCD3 = 4'd9;
                next_state = `SP3;            
            end
            `SP3: begin
                BCD0 = 4'd4;
                BCD1 = 4'd2;
                BCD2 = 4'd0;
                BCD3 = 4'd9;
                next_state = `SP4;
            end
            `SP4: begin
                BCD0 = 4'd5;
                BCD1 = 4'd4;
                BCD2 = 4'd2;
                BCD3 = 4'd0;
                next_state = `SP5;
            end
            `SP5: begin
                BCD0 = 4'd6;
                BCD1 = 4'd5;
                BCD2 = 4'd4;
                BCD3 = 4'd2;
                next_state = `SP6;
            end
            `SP6: begin
                BCD0 = 4'd9;
                BCD1 = 4'd6;
                BCD2 = 4'd5;
                BCD3 = 4'd4;
                next_state = `SP7;
            end
            `SP7: begin
                BCD0 = 4'd0;
                BCD1 = 4'd9;
                BCD2 = 4'd6;
                BCD3 = 4'd5;
                next_state = `SP8;
            end
            `SP8: begin
                BCD0 = 4'd2;
                BCD1 = 4'd0;
                BCD2 = 4'd9;
                BCD3 = 4'd6;
                next_state = `SP3;
            end
            default: next_state = `SP0;
        endcase
    end
endmodule

module FSM_controller_hello(
    input clock,
    input reset,
    output reg[3:0] BCD0,
    output reg[3:0] BCD1,
    output reg[3:0] BCD2,
    output reg[3:0] BCD3
    );
    reg [3:0] state, next_state;
    
    always@(posedge clock or posedge reset) begin
        if(reset) state <= `SH0;
        else state <= next_state;
    end
    
    always@(*) begin
        case(state)
            `SH0: begin
                BCD0 = 4'd9;
                BCD1 = 4'd9;
                BCD2 = 4'd9;
                BCD3 = 4'd9;
                next_state = `SH1;
            end
            `SH1: begin
                BCD0 = 4'd7;
                BCD1 = 4'd9;
                BCD2 = 4'd9;
                BCD3 = 4'd9;
                next_state = `SH2;
            end
            `SH2: begin
                BCD0 = 4'd6;
                BCD1 = 4'd7;
                BCD2 = 4'd9;
                BCD3 = 4'd9;
                next_state = `SH3;            
            end
            `SH3: begin
                BCD0 = 4'd1;
                BCD1 = 4'd6;
                BCD2 = 4'd7;
                BCD3 = 4'd9;
                next_state = `SH4;
            end
            `SH4: begin
                BCD0 = 4'd1;
                BCD1 = 4'd1;
                BCD2 = 4'd6;
                BCD3 = 4'd7;
                next_state = `SH5;
            end
            `SH5: begin
                BCD0 = 4'd8;
                BCD1 = 4'd1;
                BCD2 = 4'd1;
                BCD3 = 4'd6;
                next_state = `SH6;
            end
            `SH6: begin
                BCD0 = 4'd9;
                BCD1 = 4'd8;
                BCD2 = 4'd1;
                BCD3 = 4'd1;
                next_state = `SH7;
            end
            `SH7: begin
                BCD0 = 4'd7;
                BCD1 = 4'd9;
                BCD2 = 4'd8;
                BCD3 = 4'd1;
                next_state = `SH8;
            end
            `SH8: begin
                BCD0 = 4'd6;
                BCD1 = 4'd7;
                BCD2 = 4'd9;
                BCD3 = 4'd8;
                next_state = `SH3;
            end
            default: next_state = `SH0;
        endcase
    end
endmodule