module opt_expr_and_test(input [3:0] i, input [7:0] j, output [8:0] o);
wire[8:0] a = 8'b11111111;
initial begin
        a &= i;
        a &= j;
end
    assign o = a;
endmodule
