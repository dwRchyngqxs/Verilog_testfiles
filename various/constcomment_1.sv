module top1;
        localparam a = 8 /*foo*/ 'h ab;
        localparam b = 8 'h /*foo*/ cd;
        generate
                if (a != 8'b10101011) $error("a incorrect!");
                if (b != 8'b11001101) $error("b incorrect!");
        endgenerate
endmodule
