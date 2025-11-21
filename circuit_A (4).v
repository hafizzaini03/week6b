module circuit_A(v, A);
input [3:0] v;
output reg [3:0] A;

always @(*) begin
    case(v)
        4'b1010: A = 4'b0000;  // 10 -> 0
        4'b1011: A = 4'b0001;  // 11 -> 1
        4'b1100: A = 4'b0010;  // 12 -> 2
        4'b1101: A = 4'b0011;  // 13 -> 3
        4'b1110: A = 4'b0100;  // 14 -> 4
        4'b1111: A = 4'b0101;  // 15 -> 5
        default: A = v;        // *** FIXED: must output v, not XXXX ***
    endcase
end

endmodule

