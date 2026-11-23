module regfile(
  input logic clk,
  input logic WE3,
  input logic [4:0] A1, A2, A3,
  input logic [31:0] WD3,
 output logic [31:0] RD1, RD2
  );
  
  logic [31:0] rf[31:1];
  // 3-ported register file
  // Read 2 ports combinationally (A1/RD1, A2/RD2)
  // Write port 3 on rising edge of clock (A3/WD3/WE3)
  // Register 0 hardwired to 0
  always_ff @(posedge clk)
    if (WE3) rf[A3] <= WD3;
  assign RD1 = (A1 != 0) ? rf[A1] : 0;
  assign RD2 = (A2 != 0) ? rf[A2] : 0;
  
endmodule