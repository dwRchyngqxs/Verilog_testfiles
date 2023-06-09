(* abc9_box, blackbox*)
module box(input clk, d, output reg q, output do);
parameter P = 0;
always @(posedge clk)
    q <= d;
assign do = d;
specify
    (posedge clk => (q : d)) = 1;
    (d => do) = 1;
endspecify
endmodule

module top(input clk, d, output q);
box i1(clk, d, q);
endmodule
