`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/23/2026 03:27:25 PM
// Design Name: 
// Module Name: flopr
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


module flopr #(parameter WIDTH = 8)
(
    input  logic             clk,
    input  logic             reset,
    input  logic [WIDTH-1:0] d,
    output logic [WIDTH-1:0] q
);

    always_ff @(posedge clk)
        if (reset)
            q <= '0;
        else
            q <= d;

endmodule
