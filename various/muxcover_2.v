    module gold (input [2:0] A, B, C, D, X, output reg [2:0] Y);
        always @*
            casez (X)
                3'b001: Y = A;
                3'b010: Y = B;
                3'b100: Y = C;
                3'b000: Y = D;
		default: Y = 'bx;
            endcase
    endmodule
