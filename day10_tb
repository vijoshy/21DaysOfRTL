module day10_tb;

reg clk;
reg reset;
reg load_i;
reg [3:0] load_val_i;

wire [3:0] count_o;

day10 dut (
    .clk(clk),
    .reset(reset),
    .load_i(load_i),
    .load_val_i(load_val_i),
    .count_o(count_o)
);

always #10 clk = ~clk;

initial begin
    clk = 0;
    reset = 1;
    load_i = 0;
    load_val_i = 4'b0000;

    #15;
    reset = 0;          

    #20;
    load_val_i = 4'b0110;
    load_i = 1;        

    #20;
    load_i = 0;         

    #100;
    $finish;
end

endmodule
