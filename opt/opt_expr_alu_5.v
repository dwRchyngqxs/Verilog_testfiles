module test(input a, output [3:0] y);
assign y = {a,3'b101} - 1'b1;
endmodule
