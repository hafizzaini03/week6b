module circuit_A(v, A);
input [3:0] v;
output reg [3:0] A;

	always @(v) 
		case(v)
			4'b1010: A = 4'b0000;
			4'b1011: A = 4'b0001;
			4'b1100: A = 4'b0010;
			4'b1101: A = 4'b0011;
			4'b1110: A = 4'b0100;
			4'b1111: A = 4'b0101;
			default: A = 4'b1111;
		endcase


endmodule
