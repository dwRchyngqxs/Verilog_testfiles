module example;
    // S and T refer to the definitions from the first file
    T t;
    S s;
    always @* begin
        assert ($bits(t) == 1);
        assert ($bits(s) == 4);
    end
endmodule

typedef byte T;
typedef T S;

module top;
    // S and T refer to the most recent overrides
    T t;
    S s;
    always @* begin
        assert ($bits(t) == 8);
        assert ($bits(s) == 8);
    end
    example e();
endmodule
