module circuit_a (v, a);
input [3:0] v;
output reg [3:0] a;

always @(*)
	case (v)
	4'b1010: a= 4'b0000;
	4'b1011: a= 4'b0001;
	4'b1100: a= 4'b0010;
	4'b1101: a= 4'b0011;
	4'b1110: a= 4'b0100;
	4'b1111: a= 4'b0101;
	default: a=v;
	endcase
	
endmodule
