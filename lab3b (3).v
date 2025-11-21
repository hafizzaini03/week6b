module lab3b(clock50M, reset, d1, d0);

input clock50M;
input reset;
output [6:0] d1, d0;

parameter DIV_COUNT = 26'd24_999_999;

wire slow_clock;
wire [25:0] count_div;   // exposed for testbench
wire [3:0] count_4bit;   // exposed for testbench
wire [3:0] A, m;
wire gr;

// instantiate clock divider (connect count_div)
clock_divider CD(
    .clock50M(clock50M),
    .reset(reset),
    .slow_clock(slow_clock),
    .count_div(count_div)
);

// 4-bit counter drives count_4bit
counter_4bit C4(
    .clk(slow_clock),
    .reset(reset),
    .Q(count_4bit)
);

// BCD correction and mux path
circuit_A a0(.v(count_4bit), .A(A));
comparator c0(.v(count_4bit), .z(gr));

mux21 M0(
    .s(gr),
    .u(count_4bit),
    .v(A),
    .m(m)
);

circuit_b b0(.z(gr), .d1_seg(d1));
decoder   d0dec(.m(m), .seg(d0));

endmodule
