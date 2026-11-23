`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/23/2026 03:43:47 PM
// Design Name: 
// Module Name: riscvtb
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


module riscvtb();

  logic clk;
  logic reset;
  
  logic [31:0] WriteData, DataAdr;
  logic        MemWrite;
  
  top dut(clk, reset, WriteData, DataAdr, MemWrite);
 
  initial
    begin
      reset <= 1;
    end
  
  always
    begin
      clk <= 1;
      #5;
      clk <= 0;
      #5;
    end
    
  always @(negedge clk)
    begin
      if (MemWrite) begin
        if (DataAdr === 1000 & WriteData ===25) begin
          $display("Simulation Suceeded");
          $stop;
        end else if (DataAdr !== 96) begin
          $display("Simulation Failed");
          $stop;
        end
      end
    end
  
endmodule
