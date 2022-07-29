`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/01/31 11:17:32
// Design Name: 
// Module Name: ADDER
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


module ADDER(source_add, pc_add, branch_add);
    input [31:0] source_add, pc_add;
    output [31:0] branch_add;
    
    FA32 fa32(pc_add, source_add, branch_add);

endmodule
