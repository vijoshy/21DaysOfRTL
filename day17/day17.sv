// A memory interface

module day17 (
  input  wire        clk,
  input  wire        reset,

  input  wire        req_i,
  input  wire        req_rnw_i,    // 1 - read, 0 - write
  input  wire [3:0]  req_addr_i,
  input  wire [31:0] req_wdata_i,

  output wire        req_ready_o,
  output wire [31:0] req_rdata_o
);

  reg [31:0] mem [0:15];
  reg        ready;
  reg [31:0] rdata;

  assign req_ready_o = ready;
  assign req_rdata_o = rdata;

  always @(posedge clk or posedge reset) begin
    if (reset) begin
      ready <= 1'b0;
      rdata <= 32'b0;
    end
    else begin
      ready <= 1'b0;

      if (req_i) begin
        if (req_rnw_i) begin
          rdata <= mem[req_addr_i];
          ready <= 1'b1;
        end
        else begin
          mem[req_addr_i] <= req_wdata_i;
          ready <= 1'b1;
        end
      end
    end
  end

endmodule
