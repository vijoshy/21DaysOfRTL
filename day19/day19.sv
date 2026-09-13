// Parameterized fifo

module day19 #(
  parameter DEPTH  = 4,
  parameter DATA_W = 1
)(
  input  logic             clk,
  input  logic             reset,

  input  logic             push_i,
  input  logic [DATA_W-1:0] push_data_i,

  input  logic             pop_i,
  output logic [DATA_W-1:0] pop_data_o,

  output logic             full_o,
  output logic             empty_o
);

  localparam PTR_WIDTH = $clog2(DEPTH);

  logic [DATA_W-1:0] fifo [0:DEPTH-1];

  logic [PTR_WIDTH-1:0] read_ptr;
  logic [PTR_WIDTH-1:0] write_ptr;

  logic [PTR_WIDTH:0] count;

  always_ff @(posedge clk or posedge reset) begin
    if (reset) begin
      read_ptr   <= '0;
      write_ptr  <= '0;
      count      <= '0;
      pop_data_o <= '0;
    end
    else begin

      if (push_i && !full_o) begin
        fifo[write_ptr] <= push_data_i;
        write_ptr <= write_ptr + 1'b1;
      end

      if (pop_i && !empty_o) begin
        pop_data_o <= fifo[read_ptr];
        read_ptr <= read_ptr + 1'b1;
      end

      case ({push_i && !full_o, pop_i && !empty_o})
        2'b10: count <= count + 1'b1;
        2'b01: count <= count - 1'b1;
        default: count <= count;
      endcase
    end
  end

  assign empty_o = (count == 0);
  assign full_o  = (count == DEPTH);

endmodule
