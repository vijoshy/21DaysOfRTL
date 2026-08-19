// Priority arbiter
// port[0] - highest priority

module day14 #(
  parameter NUM_PORTS = 4
)(
  input       logic [NUM_PORTS-1:0] req_i,
    output      logic[NUM_PORTS-1:0] gnt_o   // One-hot grant signal
);

  always_comb begin
    
    gnt_o = 4'b0000;
    casez(req_i)
      
      4'b0000: gnt_o = 4'b0000;
      
      4'b0001: gnt_o = 4'b0001;
      
      4'b001z: gnt_o = 4'b0010;
      
      4'b01zz: gnt_o = 4'b0100;
      
      4'b1zzz: gnt_o = 4'b1000;
      
    endcase
    
  end

endmodule
