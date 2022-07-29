`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/02/01 00:13:13
// Design Name: 
// Module Name: MUX_3
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


module MUX_3(PCSrc, mux_in_a, mux_in_b, mux_out);
    input PCSrc;
    input [31:0] mux_in_a, mux_in_b;
    output [31:0] mux_out;
    
    assign mux_out = (PCSrc)? mux_in_a : mux_in_b;
    
endmodule
