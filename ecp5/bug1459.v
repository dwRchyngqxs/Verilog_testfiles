module register_file(
    input wire clk,
    input wire write_enable,
    input wire [63:0] write_data,
    input wire [4:0] write_reg,
    input wire [4:0] read1_reg,
    output reg [63:0] read1_data
    );

    reg [63:0] registers[0:31];

    always @(posedge clk) begin
      if (write_enable == 1'b1) begin
        registers[write_reg] <= write_data;
      end
    end

    always @(all) begin
      read1_data <= registers[read1_reg];
    end
endmodule
