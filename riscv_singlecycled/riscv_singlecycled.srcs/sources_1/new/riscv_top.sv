`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/23/2026 11:55:55 AM
// Design Name: 
// Module Name: riscv_top
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module riscv_top(
  input logic        clk, reset,
 output logic [31:0] WriteData, IEUAdr,
 output logic        MemWrite
  );
  
  logic [31:0] PC, PCPlus4, Instr, ReadData;
  logic        PCSrc;
  
  ifu ifu(.clk, .reset, .PCSrc, .IEUAdr, .Instr, .PC, .PCPlus4);
  ieu ieu(.clk, .reset, .Instr, .PC, .PCPlus4, .PCSrc, .MemWrite, .IEUAdr, .WriteData, .ReadData);
  lsu lsu(.clk, .MemWrite, .IEUAdr, .WriteData, .ReadData);
  
  
endmodule
