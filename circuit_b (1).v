module circuit_b (z, x);
input z;
output reg [6:0] x;

always @(*)
	begin
	if (z==0)
	x= 7'b1000000;
	else
	x= 7'b1111001;
	end
	
endmodule
