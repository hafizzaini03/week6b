module clkdvd(clock_50M, reset, clk_out, count);
input clock_50M, reset;
output reg clk_out;
output reg [25:0] count;
parameter DIV_COUNT=26'd24_999_999;

initial
begin
count = 0;
clk_out = 0;
end
	
always@ (posedge clock_50M) 
begin
	if (!reset)
		begin
			count <= 0;
			clk_out <= 0;
		end
	else if (count == DIV_COUNT)
		begin
			count <= 0;
			clk_out <= ~clk_out;
		end
	else
		count <= count + 1;
end

endmodule

