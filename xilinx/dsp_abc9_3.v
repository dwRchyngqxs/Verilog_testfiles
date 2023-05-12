module top(output [42:0] P);
\$__MUL25X18 mul (.A(42), .B(42), .Y(P));
assert property (P == 42*42);
endmodule
