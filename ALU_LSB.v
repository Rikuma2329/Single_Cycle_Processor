`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/01/28 00:51:45
// Design Name: 
// Module Name: ALU_LSB
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


module ALU_LSB(a, b, c_in, slt, ALUctl, c_out, ALUout);
    input a, b, c_in, slt;
    input [3:0] ALUctl;
    output c_out, ALUout;
    reg ALUout;
    wire faadd_out, fasub_out;
    
    FA faadd(a, b, c_in, c_out, faadd_out);
    FA fasub(a, ~b, c_in, c_in, fasub_out);
    
    always @(a, b, ALUctl) begin
        case (ALUctl)
            4'b0000:
                ALUout <= (a & b);
            4'b0001:
                ALUout <= (a | b);
            4'b0010:
                ALUout <= faadd_out;
            4'b0110:
                ALUout <= fasub_out;
            4'b0111:
                ALUout <= slt;
            4'b1100:
                ALUout <= (a ^ b);
            default:
                ALUout <= 0;
        endcase
    end
    
endmodule
