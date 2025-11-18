module comparator (v, z);
input [3:0] v;
output z;

assign z=
v>4'd9 ? 1'b1:
			1'b0;

endmodule
