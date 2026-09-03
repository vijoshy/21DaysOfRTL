module day17_tb;

  reg        clk;
  reg        reset;
  reg        req_i;
  reg        req_rnw_i;
  reg [3:0]  req_addr_i;
  reg [31:0] req_wdata_i;

  wire        req_ready_o;
  wire [31:0] req_rdata_o;

  day17 dut (
    .clk(clk),
    .reset(reset),
    .req_i(req_i),
    .req_rnw_i(req_rnw_i),
    .req_addr_i(req_addr_i),
    .req_wdata_i(req_wdata_i),
    .req_ready_o(req_ready_o),
    .req_rdata_o(req_rdata_o)
  );

  initial begin
    clk = 0;
    forever #5 clk = ~clk;
  end

  initial begin
    reset = 1;
    req_i = 0;
    req_rnw_i = 0;
    req_addr_i = 0;
    req_wdata_i = 0;

    #10;
    reset = 0;

    @(negedge clk);
    req_i = 1;
    req_rnw_i = 0;
    req_addr_i = 4'd3;
    req_wdata_i = 32'd100;

    @(negedge clk);
    req_i = 0;

    @(negedge clk);
    req_i = 1;
    req_rnw_i = 1;
    req_addr_i = 4'd3;

    @(negedge clk);
    req_i = 0;

    #10;
    $finish;
  end

endmodule
