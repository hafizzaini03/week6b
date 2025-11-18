module lab2a (v, d1, d0);
input [3:0] v;
output [6:0] d1, d0;

wire z;
wire [3:0] a, m;

//module comparator (v, z);
comparator comp(v, z);

//module circuit_a (v, a);
circuit_a ca(v, a);

//module mymux21 (s, w0, w1, f);
mymux21 m0(z, v[0], a[0], m[0]);
mymux21 m1(z, v[1], a[1], m[1]);
mymux21 m2(z, v[2], a[2], m[2]);
mymux21 m3(z, v[3], 1'b0, m[3]);

//module circuit_b (z, x);
circuit_b cb(z, d1);

//module seg7dec (x, y);
seg7dec s7d(m, d0);

endmodule
