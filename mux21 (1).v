module mux21 (s, u, v, m);
input s;
input [3:0] u, v;
output [3:0] m;

assign m = s ? v : u;

endmodule