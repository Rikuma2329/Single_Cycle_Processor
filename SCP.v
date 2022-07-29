`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/02/03 01:22:47
// Design Name: 
// Module Name: SCP
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


module SCP(clk, rst, Jump);
    input clk, rst;
    output Jump;
    wire [31:0] pc, r_data, write_data, read_data1, read_data2, read_data3, extension_add, alu_in, alu_result;
    wire [3:0] ALUCtl;
    wire Jump, RegDst, ALUSrc, MemtoReg, RegWrite, MemRead, MemWrite, Branch, ALUOp1, ALUOp0, PCSrc;
    wire ovf, zero;
    
    assign PCSrc = (Branch & zero);
    
    PROGRAM_COUNTER program_counter(clk, rst, PCSrc, Jump, pc);
    INST_MEM inst_mem(pc, r_data);
    CONTROL_UNIT control_unit(r_data[31:26], Jump, RegDst, ALUSrc, MemtoReg, RegWrite, MemRead, MemWrite, Branch, ALUOp1, ALUOp0);
    ALU_CONTROL_UNIT alu_control_unit({ALUOp1, ALUOp0}, r_data[5:0], ALUCtl);
    REGISTER register(clk, rst, r_data, write_data, read_data1, read_data2, RegWrite, RegDst);
    SIGN_EXTENSION sign_extension(r_data[15:0], extension_add);
    MUX_1 mux_1(ALUSrc, extension_add, read_data2, alu_in);
    ALU32 alu32(read_data1, alu_in, ALUCtl, alu_result, ovf, zero);
    DATA_MEM data_mem(clk, rst, alu_result, read_data2, read_data3, MemWrite, MemRead);
    MUX_2 mux_2(MemtoReg, read_data3, alu_result, write_data);
    
endmodule
