`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 14.07.2026 04:53:32
// Design Name: 
// Module Name: alu_tb
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


module alu_tb();
reg [3:0] a;
reg [3:0] b;
reg [1:0] opcode;
wire  [3:0] result;
wire  carry_borrow;
alu dut(.a(a),.b(b),.opcode(opcode),.result(result),.carry_borrow(carry_borrow));
initial begin

    // ADD
    a = 4'd10;
    b = 4'd3;
    opcode = 2'b00;
    #10;

    // SUB
    opcode = 2'b01;
    #10;

    // AND
    opcode = 2'b10;
    #10;

    // OR
    opcode = 2'b11;
    #10;

    // Overflow test
    a = 4'd15;
    b = 4'd1;
    opcode = 2'b00;
    #10;

    $finish;

end
endmodule
