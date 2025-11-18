module lab3b(clock50M, reset, d1, d0);
input  clock50M, reset;
output [6:0] d1, d0;

parameter DIV_COUNT = 26'd24_999_999;

wire clk_out;
wire [3:0] count_4bit_internal;
wire [25:0] count_div_internal;

wire [3:0] count_4bit = count_4bit_internal;
wire [25:0] count_div  = count_div_internal;


clkdvd #(DIV_COUNT) cd(
    .clock_50M(clock50M),
    .reset(reset),
    .clk_out(clk_out),
    .count(count_div_internal)
);

sucounter4b suc(
    .clk(clk_out),
    .reset(reset),
    .q(count_4bit_internal)
);


lab2a all(
    .v(count_4bit_internal),
    .d1(d1),
    .d0(d0)
);

endmodule



