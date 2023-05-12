module test(input a, output [1:0] y);
assign y = {a,1'b1} - 1'b1;
endmodule
