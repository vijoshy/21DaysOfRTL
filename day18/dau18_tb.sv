// Simple APB TB

module day18_tb ();

  reg         clk;
  reg         reset;
  reg         psel_i;
  reg         penable_i;
  reg [9:0]   paddr_i;
  reg         pwrite_i;
  reg [31:0]  pwdata_i;

  wire [31:0] prdata_o;
  wire        pready_o;

  // DUT
  day18 dut (
    .clk       (clk),
    .reset     (reset),
    .psel_i    (psel_i),
    .penable_i (penable_i),
    .paddr_i   (paddr_i),
    .pwrite_i  (pwrite_i),
    .pwdata_i  (pwdata_i),
    .prdata_o  (prdata_o),
    .pready_o  (pready_o)
  );

  initial begin
    clk = 0;
    forever #5 clk = ~clk;
  end

  initial begin

    // Initial values
    reset    = 1;
    psel_i   = 0;
    penable_i = 0;
    paddr_i  = 0;
    pwrite_i = 0;
    pwdata_i = 0;

    #20;
    reset = 0;

    @(posedge clk);
    psel_i    = 1;
    penable_i = 0;
    pwrite_i  = 1;
    paddr_i   = 10'h000;
    pwdata_i  = 32'h1234_5678;

    @(posedge clk);
    penable_i = 1;

    @(posedge clk);

    psel_i    = 0;
    penable_i = 0;
    pwrite_i  = 0;

    @(posedge clk);
    psel_i    = 1;
    penable_i = 0;
    pwrite_i  = 0;
    paddr_i   = 10'h000;

    @(posedge clk);
    penable_i = 1;

    @(posedge clk);

    $display("Read data = %h", prdata_o);
    $display("PREADY    = %b", pready_o);

    psel_i    = 0;
    penable_i = 0;

    #20;
    $finish;

  end

endmodule


