module top_func(input [7:0] a, output [7:0] b);
    function automatic void clear_b; b = 0; endfunction
    function automatic void increment_b; b += a; endfunction
    always_comb begin
        clear_b;
        increment_b;
        increment_b;
    end
endmodule

module top_task(input [7:0] a, output [7:0] b);
    task automatic clear_b; b = 0; endtask
    task automatic increment_b; b += a; endtask
    always_comb begin
        clear_b;
        increment_b;
        increment_b;
    end
endmodule

module top_inline(input [7:0] a, output [7:0] b);
    always_comb begin
        b = 0;
        b += a;
        b += a;
    end
endmodule
