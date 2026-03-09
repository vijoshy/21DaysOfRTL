`timescale 1ns/1ps

module day9_tb;

parameter VEC_W = 4;

reg  [VEC_W-1:0] bin_i;
wire [VEC_W-1:0] gray_o;

// DUT
day9 #(.VEC_W(VEC_W)) dut (
    .bin_i(bin_i),
    .gray_o(gray_o)
);

integer i;

initial begin
    for (i = 0; i < (1 << VEC_W); i = i + 1) begin
        bin_i = i[VEC_W-1:0];
        #10;
    end
    $finish;
end

endmodule
