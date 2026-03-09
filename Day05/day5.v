// odd number counter

module day5 (
  input  wire       clk,
  input  wire       reset,
  output logic [7:0] cnt_o
);

  always @(posedge clk) begin
    if (reset) begin
      cnt_o <= 8'b00000001;         
    end
    else begin
      cnt_o <= cnt_o + 8'b00000010; 
    end
  end

endmodule
