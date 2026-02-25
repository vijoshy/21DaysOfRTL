module day6_tb;

  reg clk, reset, x_i;
  wire [3:0] sr_o;

  day6 dut1(
    .clk(clk),
    .reset(reset),
    .x_i(x_i),
    .sr_o(sr_o)
  );

  initial begin
    clk = 0;
    forever #10 clk = ~clk;
  end

  initial begin
    reset = 1;
    x_i   = 0;

    #20;
    reset = 0;  

    #20; x_i = 1;
    #20; x_i = 1;
    #20; x_i = 0;
    #20; x_i = 1;

    #40;
    $finish;
  end

endmodule
