module mymux21 (s, w0, w1, f);
input s;
input w0, w1;
output f;

assign f= 
	s? w1:
		w0;

endmodule
