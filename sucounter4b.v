module sucounter4b (clk, reset, q);
input clk, reset;
output reg [3:0] q;

initial q = 4'b0000;

always@ (posedge clk or negedge reset)
begin
	if (!reset)
		q <= 4'b0000;
	else
		q <= q + 1'b1;
end

endmodule
