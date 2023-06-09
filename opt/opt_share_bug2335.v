module top();

input [3:0] A, B, C;
input S;
input [1:0] T;
output [3:0] X;
output reg [3:0] Y;

wire [3:0] D = A + B;

assign X = S ? D : A + C;
always @* begin
        case(T)
        2'b01: Y <= A;
        2'b10: Y <= B;
        default: Y <= D;
        endcase
end

endmodule
