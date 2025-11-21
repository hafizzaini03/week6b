module lab3b(clock50M, reset, d1, d0);

input clock50M;
input reset;
output [6:0] d1;
output [6:0] d0;

parameter DIV_COUNT = 26'd24_999_999;

wire slow_clock;
wire [3:0] v, A, m;
wire gr;


clock_divider CD(
    .clock50M(clock50M),
    .reset(reset),
    .slow_clock(slow_clock)
);


counter_4bit C4(
    .clk(slow_clock),
    .reset(reset),
    .Q(v)
);

assign count_4bit = v;    // optional


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
    .v({1'b0, A}),
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
