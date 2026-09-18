// TB

module day21_tb;

  parameter WIDTH = 12;

  logic [WIDTH-1:0] vec_i;
  logic [WIDTH-1:0] second_bit_o;

  day21 #(
    .WIDTH(WIDTH)
  ) dut (
    .vec_i(vec_i),
    .second_bit_o(second_bit_o)
  );

  initial begin
    vec_i = 12'b0000_0000_0000;
    #1 assert(second_bit_o == 12'b0000_0000_0000);

    vec_i = 12'b0000_0000_0001;
    #1 assert(second_bit_o == 12'b0000_0000_0000);

    vec_i = 12'b0000_0000_0011;
    #1 assert(second_bit_o == 12'b0000_0000_0010);

    vec_i = 12'b0000_0000_1001;
    #1 assert(second_bit_o == 12'b0000_0000_1000);

    vec_i = 12'b0000_0010_0100;
    #1 assert(second_bit_o == 12'b0000_0010_0000);

    vec_i = 12'b0000_0101_0101;
    #1 assert(second_bit_o == 12'b0000_0000_0100);

    vec_i = 12'b1111_1111_1111;
    #1 assert(second_bit_o == 12'b0000_0000_0010);

    $finish;
  end

endmodule
