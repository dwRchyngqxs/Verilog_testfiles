module test (input en, d, t_min, t, t_max);
    reg o;
    always @*
        if (en)
            o = #(t_min : t : t_max) ~d;
endmodule
