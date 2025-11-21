module lab3b (clock50M, reset, d1, d0);

input clock50M;     // 50 MHz clock input
input reset;        // Active-low asynchronous reset
output [6:0] d1;    // MSB digit (0 or 1)
output [6:0] d0;    // LSB digit (0–9)
		
parameter DIV_COUNT = 26'd24_999_999; //new clock toggles every 25 million pulses

wire slow_clock;
wire[3:0] v, A, m; 
wire gr;
wire [3:0] count_4bit; //this is the output of your 4-bit counter 

reg [24:0] count_div; //this is the counter you count to 24,999,999 in your clock divider

clock_divider CD(
	.clock50M(clock50M),
	.reset(reset),
	.slow_clock(slow_clock),
);

counter_4bit C4(
	.clk(slow_clock),
	.reset(reset),
	.Q(v)
);

assign count_4bit = v;

circuit_A a0( 
	.v(v), 
	.A(A)
);

comparator c0(
	.v(v),
	.z(gr)
);

mux21 M0(
	.s(gr), 
	.u(v), 
	.v({1'b0,A}), 
	.m(m)
);

circuit_b b0(
	.z(gr), 
	.d1_seg(d1)
);

decoder Dec(
	.m(m), 
	.seg(d0)
);

endmodule
