`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 14.07.2026 16:44:01
// Design Name: 
// Module Name: top
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


module top(
    input clk,
    input en,
    input rst,
    output pass,
    output [4:0] signature
    );
    parameter [4:0] golden_signature = 5'b11011;
    wire [7:0]lfsr_out;
    wire [1:0] opcode;
    wire [4:0]alu_out;
    wire [3:0]result;
    wire carry_borrow;
    wire done;
    wire misr_en;
    wire test_en;
    assign alu_out={carry_borrow,result};
    assign test_en = en && !done;
    //lfsr
    lfsr l1(
    .clk(clk),
    .rst(rst),
    .en(test_en),
    .lfsr_out(lfsr_out)
);
    //fsm
    FSM f1(
    .clk(clk),
    .rst(rst),
    .en(en),
    .opcode(opcode),
    .done(done)
);
    //alu
    alu a1(
    .a(lfsr_out[7:4]),
    .b(lfsr_out[3:0]),
    .opcode(opcode),
    .result(result),
    .carry_borrow(carry_borrow)
);

    //misr
    misr m1(
    .clk(clk),
    .rst(rst),
    .en(test_en),
    .alu_out(alu_out),
    .signature(signature)
);
    //comparator
wire signature_match;

comparator c1(
    .signature(signature),
    .golden_signature(golden_signature),
    .pass(signature_match)
);

assign pass = done && signature_match;
endmodule
