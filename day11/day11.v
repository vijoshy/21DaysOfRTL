module day11 (
  input  wire       clk,
  input  wire       reset,

  output wire       empty_o,
  input  wire [3:0] parallel_i,

  output wire       serial_o,
  output wire       valid_o
);

  reg [3:0] shift_reg;
  reg [2:0] count;

  always @(posedge clk or posedge reset) begin
    if (reset) begin
      shift_reg <= 4'b0000;
      count     <= 3'd0;
    end else begin
      if (count == 0) begin
        shift_reg <= parallel_i;
        count     <= 3'd4;
      end else begin
        shift_reg <= {shift_reg[2:0], 1'b0};
        count     <= count - 3'd1;
      end
    end
  end

  assign empty_o  = (count == 0);
  assign valid_o  = (count > 0);
  assign serial_o = shift_reg[3]; 

endmodule
