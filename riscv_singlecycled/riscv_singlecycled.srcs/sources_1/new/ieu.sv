module ieu(
  input logic        clk, reset,
  input logic [31:0] Instr,
  input logic [31:0] PC, PCPlus4,
 output logic        PCSrc, MemWrite,
 output logic [31:0] IEUAdr, WriteData,
  input logic [31:0] ReadData
  );
  
logic RegWrite, Jump, Eq, ALUResultSrc, ResultSrc;
logic [1:0] ALUSrc, ImmSrc;
logic [1:0] ALUControl;

controller c(.Op(Instr[6:0]), .Funct3(Instr[14:12]), .Funct7b5(Instr[30]), .Eq, .ALUResultSrc, .ResultSrc, .MemWrite, .PCSrc, .ALUSrc, .RegWrite, .ImmSrc, .ALUControl);
datapath dp(.clk, .reset, .Funct3(Instr[14:12]), .ALUResultSrc, .ResultSrc, .ALUSrc, .RegWrite, .ImmSrc, .ALUControl, .Eq, .PC, .PCPlus4, .Instr, .IEUAdr, .WriteData, .ReadData);

endmodule