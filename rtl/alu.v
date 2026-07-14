`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 14.07.2026 04:42:58
// Design Name: 
// Module Name: alu
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


module alu(
    input [3:0] a,
    input [3:0] b,
    input [1:0] opcode,
    output reg [3:0] result,
    output reg carry_borrow
    );
always @(*) begin
case(opcode)
    2'b00:  {carry_borrow,result}=a+b;
    2'b01: {carry_borrow,result}=a-b;
    2'b10: begin result=a^b;carry_borrow=0;end
    2'b11: begin result=a|b;carry_borrow=0;end
    default: begin result = 4'b0000;carry_borrow = 0; end
endcase
end
endmodule
