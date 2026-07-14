`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 14.07.2026 16:29:33
// Design Name: 
// Module Name: FSM_tb
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


`timescale 1ns / 1ps

module FSM_tb();

reg clk;
reg rst;
reg en;

wire [1:0] opcode;

FSM dut(
    .clk(clk),
    .rst(rst),
    .en(en),
    .opcode(opcode)
);

always #5 clk = ~clk;

initial begin
    clk = 0;
    rst = 1;
    en  = 0;

    #10;
    rst = 0;
    en  = 1;

    // Run long enough to see all state transitions
    #77000;

    $finish;
end

endmodule
