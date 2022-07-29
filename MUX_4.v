`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/02/02 17:42:11
// Design Name: 
// Module Name: MUX_4
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


module MUX_4(Jump, mux_in_a, mux_in_b, mux_out);
    input Jump;
    input [31:0] mux_in_a, mux_in_b;
    output [31:0] mux_out;
    
    assign mux_out = (Jump)? mux_in_a : mux_in_b;
    
endmodule
