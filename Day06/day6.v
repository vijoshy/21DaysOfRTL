// Simple shift register
module day6(
  input  wire       clk,
  input  wire       reset,
  input  wire       x_i,      // Serial input
  output reg [3:0]  sr_o
);

  always @(posedge clk) begin
    if (reset) begin
      sr_o <= 4'b0000;
    end
    else begin
      sr_o[0] <= x_i;
      sr_o[1] <= sr_o[0];
      sr_o[2] <= sr_o[1];
      sr_o[3] <= sr_o[2];
    end
  end

endmodule
