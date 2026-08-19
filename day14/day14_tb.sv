module day14_tb #(parameter NUM_PORTS = 4) ();
  
         logic [NUM_PORTS-1:0] req_i;
        logic[NUM_PORTS-1:0] gnt_o;

  
  day14 uut1 (.req_i(req_i), .gnt_o(gnt_o));
  
  initial begin
    req_i = 4'b0000;
    
    #10;
    req_i = 4'b1010;
    
    #10;
    req_i = 4'b0111;
  end

endmodule
