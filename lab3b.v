module lab3b (clock50M, reset, d1, d0);
input  clock50M, reset;
output [6:0] d1, d0;
parameter DIV_COUNT=26'd24_999_999;

wire clk_out;
wire [3:0] count_4bit;
  wire [25:0] count_div;

//module clkdvd(clk_in, reset, clk_out, count);
clkdvd #(DIV_COUNT) cd(clock50M, reset, clk_out, count_div);

//module sucounter4b (clk, rst, q);
sucounter4b suc(clk_out, reset, count_4bit);

//module lab2a (v, d1, d0);
lab2a all(count_4bit, d1, d0);

endmodule


