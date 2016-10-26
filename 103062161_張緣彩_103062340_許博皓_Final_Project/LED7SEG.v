`define P 7'b0011_000
`define p 4'd0
`define L 7'b1110_001
`define l 4'd1
`define A 7'b0001_000
`define a 4'd2
`define Y 7'b1000_100
`define y 4'd3
`define U 7'b1000_001
`define u 4'd4
`define S 7'b0100_100
`define s 4'd5
`define E 7'b0110_000
`define e 4'd6
`define H 7'b1001_000
`define h 4'd7
`define O 7'b0000_001
`define o 4'd8

module LED7SEG(DIGIT, DISPLAY, clk ,BCD3 ,BCD2 ,BCD1 ,BCD0
    );
input clk;
input [3:0] BCD3;
input [3:0] BCD2;
input [3:0] BCD1;
input [3:0] BCD0;
output reg [3:0] DIGIT;
output [6:0] DISPLAY;
reg [3:0] value;

	always @ (posedge clk) begin	
		case(DIGIT) 
			4'b1110: begin
			    value <= BCD1;
				DIGIT <= 4'b1101;
			end
			4'b1101: begin
			    value <= BCD2;
				DIGIT <= 4'b1011;
			end
			4'b1011: begin
				value = BCD3;
				DIGIT <= 4'b0111;
			end
			4'b0111: begin
				value = BCD0;
				DIGIT <= 4'b1110;
			end
			default begin
				DIGIT <= 4'b1110;
			end
		endcase	
	end

	assign DISPLAY = (value==`p) ? `P :
						(value==`l) ? `L :
						(value==`a) ? `A :
						(value==`y) ? `Y :
						(value==`u) ? `U :
						(value==`s) ? `S :
						(value==`e) ? `E :
						(value==`h) ? `H :
						(value==`o) ? `O : 7'b1111_111;


endmodule
