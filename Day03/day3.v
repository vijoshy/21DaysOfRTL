// An edge detector

module day3 (
  input     wire    clk,
  input     wire    reset,

  input     wire    a_i,

  output    wire    rising_edge_o,
  output    wire    falling_edge_o
);

  reg a_prev;

  always @(posedge clk or posedge reset) begin
    if (reset)
      a_prev <= 1'b0;
    else
      a_prev <= a_i;
  end

  assign rising_edge_o  =  a_i & ~a_prev;
  assign falling_edge_o = ~a_i &  a_prev;

endmodule