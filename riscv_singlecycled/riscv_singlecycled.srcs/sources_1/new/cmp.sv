module cmp(
  input logic [31:0] R1, R2,
 output logic        Eq
  );
  
  assign Eq = (R1 == R2);
  
endmodule