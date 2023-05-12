typedef logic T;
typedef T [3:0] S;
module top;
    T t;
    S s;
    always @* begin
        assert ($bits(t) == 1);
        assert ($bits(s) == 4);
    end
endmodule
