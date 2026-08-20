// Round robin arbiter

module day15 (
  input  wire       clk,
  input  wire       reset,

  input  wire [3:0] req_i,
  output logic [3:0] gnt_o
);

  logic [1:0] priority;
  logic [1:0] next_priority;

  integer offset;
  integer curr_index;
  logic found;

  always_comb begin
    gnt_o = 4'b0000;
    next_priority = priority;
    found = 1'b0;

    for (offset = 0; offset < 4; offset = offset + 1) begin
      curr_index = (priority + offset) % 4;

      // Grant only the FIRST requester found
      if (req_i[curr_index] && !found) begin
        gnt_o[curr_index] = 1'b1;
        next_priority = (curr_index + 1) % 4;
        found = 1'b1;
      end
    end
  end

  always_ff @(posedge clk or posedge reset) begin
    if (reset) begin
      priority <= 2'b00;
    end
    else begin
      priority <= next_priority;
    end
  end

endmodule
