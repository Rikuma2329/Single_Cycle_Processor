`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/02/01 00:12:34
// Design Name: 
// Module Name: MUX_1
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


module MUX_1(ALUSrc, mux_in_a, mux_in_b, mux_out);
    input ALUSrc;
    input [31:0] mux_in_a, mux_in_b;
    output [31:0] mux_out;
    
    assign mux_out = (ALUSrc)? mux_in_a : mux_in_b;
    
endmodule
