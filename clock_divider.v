module clock_divider(clock50M, reset, slow_clock);
input clock50M, reset;
output reg slow_clock;

reg [25:0] count;

parameter DIV_COUNT=26'd24_999_999; //new clock toggles every 25 million pulses

always@(posedge clock50M or negedge reset)begin
	if(!reset)begin
		count <= 0;
		slow_clock <= 0;
	end 
	else begin 
		if(count == DIV_COUNT) begin
			count <= 0;
			slow_clock <= ~slow_clock;
		end 
		else begin
			count <= count + 1;
		end 
	end
end
endmodule
