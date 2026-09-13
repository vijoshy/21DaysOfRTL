// Fifo TB

module day19_tb;

  parameter DEPTH  = 4;
  parameter DATA_W = 1;

  reg clk;
  reg reset;

  reg              push_i;
  reg [DATA_W-1:0] push_data_i;

  reg              pop_i;
  wire [DATA_W-1:0] pop_data_o;

  wire full_o;
  wire empty_o;

  day19 #(
    .DEPTH(DEPTH),
    .DATA_W(DATA_W)
  ) dut (
    .clk(clk),
    .reset(reset),

    .push_i(push_i),
    .push_data_i(push_data_i),

    .pop_i(pop_i),
    .pop_data_o(pop_data_o),

    .full_o(full_o),
    .empty_o(empty_o)
  );

  initial clk = 0;
  always #5 clk = ~clk;

  initial begin
    reset       = 1;
    push_i      = 0;
    push_data_i = '0;
    pop_i       = 0;

    #12;
    reset = 0;

    @(posedge clk);
    push_i      = 1;
    push_data_i = 1;

    @(posedge clk);
    push_data_i = 0;

    @(posedge clk);
    push_i = 0;

    @(posedge clk);
    pop_i = 1;

    @(posedge clk);
    pop_i = 0;

    #10;
    $finish;
  end

endmodule
