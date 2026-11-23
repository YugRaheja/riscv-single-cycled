`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/23/2026 03:28:40 PM
// Design Name: 
// Module Name: adder
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


module adder #(parameter WIDTH = 32)
(
    input  logic [WIDTH-1:0] a,
    input  logic [WIDTH-1:0] b,
    output logic [WIDTH-1:0] y
);

    assign y = a + b;

endmodule
