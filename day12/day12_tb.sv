`timescale 1ns/1ps

module day12_tb();

  logic clk;
  logic reset;
  logic x_i;
  logic det_o;

  always #10 clk = ~clk;

  day12 uut1 (
    .clk   (clk),
    .reset (reset),
    .x_i   (x_i),
    .det_o (det_o)
  );

  task automatic send_sequence(input logic [11:0] seq);
    for (int i = 11; i >= 0; i--) begin
      @(posedge clk);
      x_i <= seq[i];
    end
  endtask

  initial begin
    clk   = 0;
    reset = 0;
    x_i   = 0;

    @(posedge clk);
    reset <= 1'b1;
    @(posedge clk);
    reset <= 1'b0;

    send_sequence(12'b1110_1101_1011);

    @(posedge clk);
    x_i <= 1'b0;

    #40;
    $finish;
  end

endmodule
