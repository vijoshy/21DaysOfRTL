module day12 (
  input  logic clk,
  input  logic reset,
  input  logic x_i,
  output logic det_o
);

  localparam logic [11:0] SEQ = 12'b1110_1101_1011;

  logic [10:0] shiftreg;

  always_ff @(posedge clk or posedge reset) begin
    if (reset) begin
      shiftreg <= 11'b0;
      det_o    <= 1'b0;
    end else begin
      shiftreg <= {shiftreg[9:0], x_i};
      det_o    <= ({shiftreg[10:0], x_i} == SEQ);
    end
  end

endmodule
