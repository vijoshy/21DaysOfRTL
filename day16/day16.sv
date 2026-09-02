// APB Master

// TB should drive a cmd_i input decoded as:
//  - 2'b00 - No-op
//  - 2'b01 - Read from address 0xDEAD_CAFE
//  - 2'b10 - Increment the previously read data and store it to 0xDEAD_CAFE

module day16 (
  input       wire        clk,
  input       wire        reset,

  input       wire[1:0]   cmd_i,

  output      wire        psel_o,
  output      wire        penable_o,
  output      wire[31:0]  paddr_o,
  output      wire        pwrite_o,
  output      wire[31:0]  pwdata_o,
  input       wire        pready_i,
  input       wire[31:0]  prdata_i
);

  localparam IDLE   = 2'b00;
  localparam SETUP  = 2'b01;
  localparam ACCESS = 2'b10;

  reg [1:0]  state;
  reg [31:0] read_data;

  reg [31:0] addr;
  reg        write;
  reg [31:0] wdata;

  always @(posedge clk) begin
    if (reset) begin
      state     <= IDLE;
      read_data <= 32'b0;
      addr      <= 32'b0;
      write     <= 1'b0;
      wdata     <= 32'b0;
    end
    else begin
      case (state)

        IDLE: begin
          if (cmd_i == 2'b01) begin
            addr  <= 32'hDEAD_CAFE;
            write <= 1'b0;
            state <= SETUP;
          end
          else if (cmd_i == 2'b10) begin
            addr  <= 32'hDEAD_CAFE;
            write <= 1'b1;
            wdata <= read_data + 32'd1;
            state <= SETUP;
          end
        end

        SETUP: begin
          state <= ACCESS;
        end

        ACCESS: begin
          if (pready_i) begin

            if (!write)
              read_data <= prdata_i;

            state <= IDLE;
          end
        end

        default: begin
          state <= IDLE;
        end

      endcase
    end
  end

  assign psel_o    = (state == SETUP) || (state == ACCESS);
  assign penable_o = (state == ACCESS);

  assign paddr_o   = addr;
  assign pwrite_o  = write;
  assign pwdata_o  = wdata;

endmodule
