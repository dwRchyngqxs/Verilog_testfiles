module test #(parameter hyst = 16)
            (input [0:1] inA, input rst, output reg out);
    parameter updatePeriod = (100:125:200);
    initial out = 1'b0;
    always #updatePeriod begin
        if (rst) out <= 1'b0;
        else if (inA[0] > inA[1]) out <= 1'b1;
        else if (inA[0] < inA[1] - hyst) out <= 1'b0;
    end
endmodule
