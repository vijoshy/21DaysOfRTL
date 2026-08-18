// Simple TB

module day13_tb ();

	logic [3:0] a_i;
  logic  [3:0] sel_i;

  // Output using ternary operator
      wire     y_ter_o;
  // Output using case
      logic     y_case_o;
  // Ouput using if-else
      logic     y_ifelse_o;
  // Output using for loop
      logic     y_loop_o;
  // Output using and-or tree
      logic     y_aor_o;
  
  day13 uut1 (.a_i(a_i), .sel_i(sel_i), .y_ter_o(y_ter_o), .y_case_o(y_case_o), .y_ifelse_o(y_ifelse_o), .y_loop_o(y_loop_o), .y_aor_o(y_aor_o));
  
  initial begin
    
    a_i = 4'b0000;
    sel_i = 4'b0000;
    
    #10;
    sel_i = 4'b0100;
    
    #10;
    sel_i = 4'b0001;
    
    #10;
    sel_i = 4'b1000;
    
    #10;
    sel_i = 4'b0010;
    
    #40;
    $finish;
  end

endmodule
