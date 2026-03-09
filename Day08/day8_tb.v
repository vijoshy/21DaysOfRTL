`timescale 1ns / 1ps

module day8_tb;

  parameter BIN_W     = 4;
  parameter ONE_HOT_W = 16;

  reg  [BIN_W-1:0]     bin_i;
  wire [ONE_HOT_W-1:0] one_hot_o;

  day8 #(
    .BIN_W(BIN_W),
    .ONE_HOT_W(ONE_HOT_W)
  ) uut (
    .bin_i(bin_i),
    .one_hot_o(one_hot_o)
  );

  integer i;

  initial begin
    for (i = 0; i < (1 << BIN_W); i = i + 1) begin
      bin_i = i;
      #10;
      assert (one_hot_o == (1'b1 << i));
    end

    $finish;
  end

endmodule
