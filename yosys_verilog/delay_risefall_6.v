module test (input en, d, t_rise, t_fall);
    reg o;
    always @*
        if (en)
            o = #(t_rise: t_fall: 50) ~d;
endmodule
