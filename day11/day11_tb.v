`timescale 1ns / 1ps

module day11_tb;

  // Testbench signals matching the exact module ports
  reg        clk;
  reg        reset;
  wire       empty_o;
  reg  [3:0] parallel_i;
  wire       serial_o;
  wire       valid_o;

  // Instantiate the module
  day11 uut (
    .clk(clk),
    .reset(reset),
    .empty_o(empty_o),
    .parallel_i(parallel_i),
    .serial_o(serial_o),
    .valid_o(valid_o)
  );

  always #5 clk = ~clk;

  initial begin
    // Initialization
    clk        = 0;
    reset      = 1;
    parallel_i = 4'b0000;

    #15;
    reset = 0;

    parallel_i = 4'b1011;

    wait(empty_o == 1);
    
    @(posedge clk);
    parallel_i = 4'b0110;

    wait(empty_o == 1);
    #20;

    $display("Simulation Complete.");
    $finish;
  end

  initial begin
    $monitor("Time=%0t | reset=%b | empty_o=%b | valid_o=%b | parallel_i=%b | serial_o=%b",
             $time, reset, empty_o, valid_o, parallel_i, serial_o);
  end

endmodule
