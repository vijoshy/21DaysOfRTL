// Round robin arbiter

module day15 (
  input  wire       clk,
  input  wire       reset,

  input  wire [3:0] req_i,
  output logic [3:0] gnt_o
);

  // Round-robin pointer: 2 bits for 4 requesters
  logic [1:0] prio;
  logic [1:0] next_prio;
  logic [1:0] curr_index;

  integer offset;
  logic found;

  // Combinational arbitration
  always_comb begin
    gnt_o     = 4'b0000;
    next_prio = prio;
    found     = 1'b0;

    // Check all 4 requesters circularly
    for (offset = 0; offset < 4; offset = offset + 1) begin

      // 2-bit arithmetic automatically wraps modulo 4
      curr_index = prio + offset[1:0];

      // First active requester wins
      if (req_i[curr_index] && !found) begin
        gnt_o[curr_index] = 1'b1;
        next_prio = curr_index + 2'd1;
        found = 1'b1;
      end

    end
  end

  // Update round-robin priority pointer
  always_ff @(posedge clk or posedge reset) begin
    if (reset) begin
      prio <= 2'b00;
    end
    else begin
      prio <= next_prio;
    end
  end

endmodule
