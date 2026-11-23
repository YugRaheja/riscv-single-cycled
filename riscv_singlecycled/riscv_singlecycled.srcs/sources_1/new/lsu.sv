module lsu(
  input logic        clk, MemWrite,
  input logic [31:0] IEUAdr, WriteData,
 output logic [31:0] ReadData);
 
 logic [31:0] RAM [63:0];
 
 assign ReadData = RAM[IEUAdr[7:2]]; // Word aligned
 always_ff @(posedge clk)
   if (MemWrite) RAM[IEUAdr[7:2]] <= WriteData;
 
endmodule