parameter A = 10;
parameter B = A;

typedef enum {
	CONST_A = A,
	CONST_B = A+1
} enum_t;

module top(output [3:0] q, output [3:0] r);
assign q = 10;
assign r = CONST_B;
endmodule
