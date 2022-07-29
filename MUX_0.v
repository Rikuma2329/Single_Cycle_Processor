`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/02/02 17:36:36
// Design Name: 
// Module Name: MUX_0
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


module MUX_0(RegDst, mux_in_a, mux_in_b, mux_out);
    input RegDst;
    input [4:0] mux_in_a, mux_in_b;
    output [4:0] mux_out;
    
    assign mux_out = (RegDst)? mux_in_a : mux_in_b;
    
endmodule
