module top ( input d0, d1, d2, d3, ce, sr, clk, output reg q0, q1, q2, q3 );
    always @(posedge clk)
      begin
        if (sr) begin
            q0 <= 1'b0;
            q1 <= 1'b1;
        end else begin
            q0 <= d0;
            q1 <= d1;
        end
        if (ce) begin
          if (sr) begin
              q2 <= 1'b0;
              q3 <= 1'b1;
          end else begin
              q2 <= d2;
              q3 <= d3;
          end
        end
      end
endmodule
