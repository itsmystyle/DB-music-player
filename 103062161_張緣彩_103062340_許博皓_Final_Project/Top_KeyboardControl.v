`define KEYCODE_B 9'b0_0011_0010
`define KEYCODE_F 9'b0_0010_1011
`define KEYCODE_ESC 9'b0_0111_0110
`define KEYCODE_ENTER 9'b0_0101_1010
`define KEYCODE_UP 9'b0_0111_0101
`define KEYCODE_DOWN 9'b0_0111_0010

module Top_KeyBoardControl(
	output reg fast_forward,
	output reg back_forward,
	output reg esc,
	output reg enter,
	output reg up,
	output reg down,
	inout wire PS2_DATA,
	inout wire PS2_CLK,
	input wire rst,
	input wire clk
	);
	
	wire [511:0] key_down;
	wire [8:0] last_change;
	wire been_ready;
		
	KeyboardDecoder key_de (
		.key_down(key_down),
		.last_change(last_change),
		.key_valid(been_ready),
		.PS2_DATA(PS2_DATA),
		.PS2_CLK(PS2_CLK),
		.rst(rst),
		.clk(clk)
	);

	always@(posedge clk, posedge rst) begin
		if(rst) begin
			fast_forward <= 0;
			back_forward <= 0;
			esc <= 0;
			enter <= 0;
			up <= 0;
			down <= 0;
		end else begin
			if(been_ready && key_down[last_change] == 1'b1) begin
				if(last_change == `KEYCODE_F) fast_forward <= 1;
				else if(last_change == `KEYCODE_B) back_forward <= 1;
				else if(last_change == `KEYCODE_ESC) esc <= 1;
				else if(last_change == `KEYCODE_ENTER) enter <= 1;
				else if(last_change == `KEYCODE_UP) up <= 1;
				else if(last_change == `KEYCODE_DOWN) down <= 1;
			end else begin
			    fast_forward <= 0;
			    back_forward <= 0;
			    esc <= 0;
			    enter <= 0;
			    up <= 0;
			    down <= 0;
			end
		end
	end
	
endmodule
