`timescale 1ns/1ps

module day7_tb;

  reg clk;
  reg reset;
  wire [3:0] lfsr_o;

  day7 uut (
    .clk(clk),
    .reset(reset),
    .lfsr_o(lfsr_o)
  );

  always #5 clk = ~clk;

  initial begin
    clk = 0;
    reset = 1;

    #12;
    reset = 0;

    #200;

    $finish;
  end
endmodule
