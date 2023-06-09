module top(input clk, d, s, r, output reg [17:0] q);
always @(posedge clk or posedge s) if ( s) q[ 0] <= 1'b1; else q[ 0] <= d;
always @(posedge clk or negedge s) if (!s) q[ 1] <= 1'b1; else q[ 1] <= d;
always @(posedge clk or posedge r) if ( r) q[ 2] <= 1'b0; else q[ 2] <= d;
always @(posedge clk or negedge r) if (!r) q[ 3] <= 1'b0; else q[ 3] <= d;
always @(negedge clk or posedge s) if ( s) q[ 4] <= 1'b1; else q[ 4] <= d;
always @(negedge clk or negedge s) if (!s) q[ 5] <= 1'b1; else q[ 5] <= d;
always @(negedge clk or posedge r) if ( r) q[ 6] <= 1'b0; else q[ 6] <= d;
always @(negedge clk or negedge r) if (!r) q[ 7] <= 1'b0; else q[ 7] <= d;

// Seems like proc_dlatch always sets {SET,CLR}_POLARITY to true
always @(posedge clk or posedge s or posedge r) if ( r) q[ 8] <= 1'b0; else if ( s) q[ 8] <= 1'b1; else q[ 8] <= d;
//always @(posedge clk or posedge s or negedge r) if (!r) q[ 9] <= 1'b0; else if ( s) q[ 9] <= 1'b1; else q[ 9] <= d;
//always @(posedge clk or negedge s or posedge r) if ( r) q[10] <= 1'b0; else if (!s) q[10] <= 1'b1; else q[10] <= d;
//always @(posedge clk or negedge s or negedge r) if (!r) q[11] <= 1'b0; else if (!s) q[11] <= 1'b1; else q[11] <= d;
\$dffsr  #(.CLK_POLARITY(1'h1), .CLR_POLARITY(1'h0), .SET_POLARITY(1'h1), .WIDTH(32'd1)) ppn (.CLK(clk), .CLR(r), .D(d), .Q(q[ 9]), .SET(s));
\$dffsr  #(.CLK_POLARITY(1'h1), .CLR_POLARITY(1'h1), .SET_POLARITY(1'h0), .WIDTH(32'd1)) pnp (.CLK(clk), .CLR(r), .D(d), .Q(q[10]), .SET(s));
\$dffsr  #(.CLK_POLARITY(1'h1), .CLR_POLARITY(1'h0), .SET_POLARITY(1'h0), .WIDTH(32'd1)) pnn (.CLK(clk), .CLR(r), .D(d), .Q(q[11]), .SET(s));

always @(negedge clk or posedge s or posedge r) if ( r) q[12] <= 1'b0; else if ( s) q[12] <= 1'b1; else q[12] <= d;
//always @(negedge clk or posedge s or negedge r) if (!r) q[13] <= 1'b0; else if ( s) q[13] <= 1'b1; else q[13] <= d;
//always @(negedge clk or negedge s or posedge r) if ( r) q[14] <= 1'b0; else if (!s) q[14] <= 1'b1; else q[14] <= d;
//always @(negedge clk or negedge s or negedge r) if (!r) q[15] <= 1'b0; else if (!s) q[15] <= 1'b1; else q[15] <= d;
\$dffsr  #(.CLK_POLARITY(1'h0), .CLR_POLARITY(1'h0), .SET_POLARITY(1'h1), .WIDTH(32'd1)) npn (.CLK(clk), .CLR(r), .D(d), .Q(q[13]), .SET(s));
\$dffsr  #(.CLK_POLARITY(1'h0), .CLR_POLARITY(1'h1), .SET_POLARITY(1'h0), .WIDTH(32'd1)) nnp (.CLK(clk), .CLR(r), .D(d), .Q(q[14]), .SET(s));
\$dffsr  #(.CLK_POLARITY(1'h0), .CLR_POLARITY(1'h0), .SET_POLARITY(1'h0), .WIDTH(32'd1)) nnn (.CLK(clk), .CLR(r), .D(d), .Q(q[15]), .SET(s));

always @(posedge clk) q[16] <= d;
always @(negedge clk) q[17] <= d;
endmodule
