module top(input I, output O);
\$pmux #(.WIDTH(1), .S_WIDTH(2)) m (.S({I, 1'b0}), .A(1'b0), .B({I, 1'b0}), .Y(O));
endmodule
