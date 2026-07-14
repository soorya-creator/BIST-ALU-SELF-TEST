`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 14.07.2026 16:55:17
// Design Name: 
// Module Name: top_tb
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


module top_tb();

reg clk;
reg rst;
reg en;

wire pass;
wire [4:0] signature;
top dut(
    .clk(clk),
    .rst(rst),
    .en(en),
    .pass(pass),
    .signature(signature)
);
always #5 clk = ~clk;
initial begin
clk = 0;
rst = 1;
en = 0;

#10;
rst = 0;
en = 1;

#11000;
$finish;
end
endmodule