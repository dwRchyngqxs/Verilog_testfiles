module foo(input a, b, output c);
    assign c = a + b;
endmodule

module top();
    wire a, b, c;
    foo bar(.a(a), .b(b), .c(c));
endmodule
