`timescale 1ns/1ps

module day3_tb;

  reg clk;
  reg reset;
  reg a_i;

  wire rising_edge_o;
  wire falling_edge_o;

  day3 dut1 (
    .clk            (clk),
    .reset          (reset),
    .a_i            (a_i),
    .rising_edge_o  (rising_edge_o),
    .falling_edge_o (falling_edge_o)
  );

  // clk gen
  initial begin
    clk = 0;
    forever #5 clk = ~clk;
  end

  initial begin
    reset = 1;
    a_i   = 0;

    #20;
    reset = 0;

    #10;
    a_i = 1;

    #20;
    a_i = 0;

    #15;
    a_i = 1;

    #15;
    a_i = 0;

    #15;
    a_i = 1;

    #20;
    $finish;
  end

endmodule