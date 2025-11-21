module lab3b(clock50M, reset, d1, d0);

input clock50M;
input reset;
output [6:0] d1, d0;

parameter DIV_COUNT = 26'd24_999_999;

wire [3:0] count_4bit;     // testbench requires this NAME
wire [25:0] count_div;     // testbench requires this NAME
wire slow_clock;
wire [3:0] A, m;
wire gr;


    clock_divider #(.DIV_COUNT(DIV_COUNT)) CD(
    .clock50M(clock50M),
    .reset(reset),
    .slow_clock(slow_clock),
    .count_div(count_div)      // REQUIRED by testbench
);


counter_4bit C4(
    .clk(slow_clock),
    .reset(reset),
    .Q(count_4bit)             // REQUIRED by testbench
);


circuit_A a0(.v(count_4bit), .A(A));
comparator c0(.v(count_4bit), .z(gr));


mux21 M0(
    .s(gr),
    .u(count_4bit),
    .v(A),            // FIXED circuit_A output
    .m(m)
);

circuit_b b0(.z(gr), .d1_seg(d1));
decoder   d0dec(.m(m), .seg(d0));

endmodule


