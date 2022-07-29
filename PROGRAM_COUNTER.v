`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/01/30 17:53:10
// Design Name: 
// Module Name: PROGRAM_COUNTER
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


module PROGRAM_COUNTER(clk, rst, PCSrc, Jump, pc);
    input clk, rst, Jump;
    input PCSrc;
    output [31:0] pc;
    wire [31:0] pc_in, pc_add_out, r_data, jump_add, extension_add, shift_add, branch_add, next_pc_add;
    reg [31:0] pc = 32'b0000_0000_0000_0000_0000_0000_0000_0000;
    
    FA32 fa32(pc, 32'b0000_0000_0000_0000_0000_0000_0000_0100, pc_add_out);
    INST_MEM inst_mem(pc, r_data);
    
    SIGN_EXTENSION sign_extension(r_data[15:0], extension_add);
    BIT_SIFT bit_sift(extension_add, shift_add);
    ADDER adder(shift_add, pc_add_out, branch_add);

    assign jump_add = {pc_add_out[31:28], r_data[25:0], 2'b00};
    assign next_pc_add = (PCSrc)? branch_add : pc_add_out;
    assign pc_in = (Jump)? jump_add : next_pc_add;

    always @(posedge clk) begin
        if(rst == 1'b0) begin
			pc <= 32'b0000_0000_0000_0000_0000_0000_0000_0000;
		end else begin
			pc <= pc_in; 
		end
	end

    
endmodule
