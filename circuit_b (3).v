module circuit_b(z, d1_seg);
input z;
output reg [6:0] d1_seg;

parameter BLANK = 7'b1000000;  //blank
parameter ONE = 7'b1111001;    //"1"

	always @(*) begin
		if (z == 1)
			d1_seg = ONE;
		else
			d1_seg = BLANK;
	end
	
endmodule
		