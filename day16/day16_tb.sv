// APB Master TB

`timescale 1ns/1ps

module day16_tb;

  reg         clk;
  reg         reset;
  reg  [1:0]  cmd_i;

  wire        psel_o;
  wire        penable_o;
  wire [31:0] paddr_o;
  wire        pwrite_o;
  wire [31:0] pwdata_o;

  reg         pready_i;
  reg  [31:0] prdata_i;

  day16 dut (
    .clk       (clk),
    .reset     (reset),
    .cmd_i     (cmd_i),

    .psel_o    (psel_o),
    .penable_o (penable_o),
    .paddr_o   (paddr_o),
    .pwrite_o  (pwrite_o),
    .pwdata_o  (pwdata_o),

    .pready_i  (pready_i),
    .prdata_i  (prdata_i)
  );

  always #5 clk = ~clk;

  initial begin

    // Initial values
    clk      = 0;
    reset    = 1;
    cmd_i    = 2'b00;
    pready_i = 0;
    prdata_i = 32'b0;

    // Reset
    #20;
    reset = 0;

    @(posedge clk);
    cmd_i = 2'b01;

    @(posedge clk);
    cmd_i = 2'b00;

    @(posedge clk);

    prdata_i = 32'h0000_1234;
    pready_i = 1;

    @(posedge clk);

    pready_i = 0;
    prdata_i = 0;

    @(posedge clk);
    cmd_i = 2'b10;

    @(posedge clk);
    cmd_i = 2'b00;

    // Wait for ACCESS
    @(posedge clk);

    // Complete write
    pready_i = 1;

    @(posedge clk);

    pready_i = 0;

    #20;
    $finish;

  end

endmodule
