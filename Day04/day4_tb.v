// Simple ALU TB
`timescale 1ns/1ps

module day4_tb;

  reg  [7:0] a_i;
  reg  [7:0] b_i;
  reg  [2:0] op_i;
  wire [7:0] alu_o;

  //DUT 
  day4 dut1 (
    .a_i(a_i),
    .b_i(b_i),
    .op_i(op_i),
    .alu_o(alu_o)
  );

  initial begin

    // ADD
    a_i = 8'd10; b_i = 8'd5; op_i = 3'b000;
    #10;

    // SUB
    op_i = 3'b001;
    #10;

    // SLL
    op_i = 3'b010;
    #10;

    // LSR
    op_i = 3'b011;
    #10;

    // AND
    op_i = 3'b100;
    #10;

    // OR
    op_i = 3'b101;
    #10;

    // XOR
    op_i = 3'b110;
    #10;

    // EQUAL (false)
    op_i = 3'b111;
    #10;

    // EQUAL (true)
    a_i = 8'd20; 
    b_i = 8'd20;
    op_i = 3'b111;
    #10;

    $finish;
  end

  // Monitor values
  initial begin
    $monitor("time=%0t op=%b a=%d b=%d alu_o=%d",
              $time, op_i, a_i, b_i, alu_o);
  end

endmodule
