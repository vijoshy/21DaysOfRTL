// TB for round robin

module day15_tb ();

  logic       clk;
  logic       reset;
  logic [3:0] req_i;
  logic [3:0] gnt_o;

  day15 dut (
    .clk   (clk),
    .reset (reset),
    .req_i (req_i),
    .gnt_o (gnt_o)
  );

  initial begin
    clk = 0;

    forever begin
      #5 clk = ~clk;
    end
  end

  initial begin

    reset = 1;
    req_i = 4'b0000;

    #10;

    reset = 0;

    req_i = 4'b0001;
    #10;

    req_i = 4'b1111;
    #10;
    #10;
    #10;
    #10;

    req_i = 4'b1010;
    #10;
    #10;
    #10;

    req_i = 4'b0000;
    #10;

    req_i = 4'b0101;
    #10;
    #10;
    #10;

    $finish;
  end

endmodule
