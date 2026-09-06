// APB Slave

module day18 (
  input         wire        clk,
  input         wire        reset,

  input         wire        psel_i,
  input         wire        penable_i,
  input         wire[9:0]   paddr_i,
  input         wire        pwrite_i,
  input         wire[31:0]  pwdata_i,
  output        wire[31:0]  prdata_o,
  output        wire        pready_o
);

  reg [31:0] reg0;
  reg [31:0] reg2;

  assign pready_o = psel_i && penable_i;
  assign prdata_o =
      (psel_i && !pwrite_i) ?
        ((paddr_i == 10'h000) ? reg0 :
         (paddr_i == 10'h004) ? 32'hDEAD_BEEF :
         (paddr_i == 10'h008) ? reg2 :
                                32'h0000_0000)
        : 32'h0000_0000;

  always @(posedge clk) begin
    if (reset) begin
      reg0 <= 32'h0000_0000;
      reg2 <= 32'h0000_0000;
    end
    else if (psel_i && penable_i && pwrite_i) begin
      case (paddr_i)
        10'h000: reg0 <= pwdata_i;
        10'h008: reg2 <= pwdata_i;
        default: ; 
      endcase
    end
  end

endmodule
