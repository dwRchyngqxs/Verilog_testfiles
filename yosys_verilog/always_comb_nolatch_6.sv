module top(input wire x, y, output reg z);
function automatic f;
    input inp;
    for (int i = 0; i < 1; i++)
        f = inp + 0;
endfunction
always_comb
    if (y)
        z = f(x);
    else
        z = 0;
endmodule
