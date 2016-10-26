module clock_divisor(clk, clk_out);
parameter lenght = 16;
input clk;
output clk_out;

reg [lenght - 1 : 0] num;
wire [lenght - 1 : 0] next_num;

always @(posedge clk) begin
  num <= next_num;
end

assign next_num = num + 1'b1;
assign clk_out = num[lenght - 1];
endmodule
