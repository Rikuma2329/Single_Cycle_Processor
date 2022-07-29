`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/01/31 02:14:03
// Design Name: 
// Module Name: REGISTER
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


module REGISTER(clk, rst, r_data, write_data, read_data1, read_data2, RegWrite, RegDst);
    input clk, rst, RegWrite, RegDst;
    input [31:0] r_data;
    input [31:0] write_data;
    output [31:0] read_data1, read_data2;
    wire [4:0] read_reg1, read_reg2, write_reg;
    reg [31:0] register [31:0];
    
    assign read_reg1 = r_data[25:21];
    assign read_reg2 = r_data[20:16];
    assign write_reg = (RegDst)? r_data[15:11] : r_data[20:16];
    assign read_data1 = register[read_reg1];
    assign read_data2 = register[read_reg2];
 
    integer i;
    initial begin
        for(i = 0; i <= 31; i = i + 1) 
            register[i] <= 32'b0000_0000_0000_0000_0000_0000_0000_0000;
    end
    
    always @(posedge clk) begin
        if(RegWrite == 1'b1) begin
            register[write_reg] = write_data;
        end
    end
    
endmodule
