module top(input a, b, c, d);

    always @* begin
        if (a) assert (b == c);
        if (!a) assert (b != c);
        if (b) assume (c);
        if (c) cover (d);
    end

endmodule
