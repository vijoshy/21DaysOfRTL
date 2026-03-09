// Counter with a load
module day10(
    input wire clk,
    input wire reset,
    input wire load_i,
    input wire [3:0] load_val_i,
    output reg [3:0] count_o
);

always @(posedge clk or posedge reset) begin
    if (reset)
        count_o <= 4'b0000;
    else if (load_i)
        count_o <= load_val_i;
    else
        count_o <= count_o + 1;
end

endmodule
