module CreateLargePulse #(
	parameter PULSE_SIZE = 16 
)(
	output wire large_pulse,
	input wire small_pulse,
	input wire rst,
	input wire clk
);

	parameter WAITING = 1'b0;
	parameter COUNTING = 1'b1;
	reg state; 
	reg [PULSE_SIZE-1:0] counter;
	
	assign large_pulse = (counter != 0) ? 1 : 0;

	always @ (posedge clk, posedge rst) begin
		if (rst) begin
			state <= WAITING;
			counter <= 0;
		end else begin
			if (state == WAITING) begin
				if (small_pulse) begin
					state <= COUNTING;
					counter <= 1;
				end else begin
					state <= WAITING;
					counter <= 0;
				end
			end else if (state == COUNTING) begin
				counter <= counter + 1;
				if (counter == 0) begin
					state <= WAITING;
				end else begin
					state <= COUNTING;
				end
			end
		end
	end

endmodule