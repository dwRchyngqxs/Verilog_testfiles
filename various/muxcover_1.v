    module gate (input [2:0] A, B, C, D, X, output reg [2:0] Y);
        always @*
            (* parallel_case *)
            casez (X)
                3'b??1: Y = A;
                3'b?1?: Y = B;
                3'b1??: Y = C;
                3'b000: Y = D;
            endcase
    endmodule
