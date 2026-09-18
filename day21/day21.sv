// Find second bit set from LSB for a N-bit vector

module day21 #(
  parameter WIDTH = 12
)(
  input  logic [WIDTH-1:0] vec_i,
  output logic [WIDTH-1:0] second_bit_o
);

  logic found_first;
  logic found_second;

  always_comb begin
    second_bit_o = '0;
    found_first  = 1'b0;
    found_second = 1'b0;

    for (int i = 0; i < WIDTH; i++) begin
      if (vec_i[i]) begin
        if (!found_first) begin
          found_first = 1'b1;
        end
        else if (!found_second) begin
          second_bit_o[i] = 1'b1;
          found_second = 1'b1;
        end
      end
    end
  end

endmodule
