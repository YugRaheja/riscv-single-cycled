module ifu(
  input logic        clk, reset,
  input logic        PCSrc,
  input logic [31:0] IEUAdr,
 output logic [31:0] Instr, PC, PCPlus4
  );
  
  logic [31:0] PCNext;
  
  //Next PC Logic
  
  flopr #(32) pcreg(clk, reset, PCNext, PC);
  adder       pcadd4(PC, 32'd4, PCPlus4);
  mux2 #(32)  pcmux(PCPlus4, IEUAdr, PCSrc, PCNext);
  irom        irom(PC, Instr);
  
endmodule