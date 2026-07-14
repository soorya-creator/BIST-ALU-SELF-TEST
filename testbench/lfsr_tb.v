`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 14.07.2026 04:18:13
// Design Name: 
// Module Name: lfsr_tb
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


module lfsr_tb;
reg clk;
reg rst;
reg en;
wire [7:0] lfsr_out;
lfsr dut(.clk(clk),.rst(rst),.en(en),.lfsr_out(lfsr_out));
always #5 clk=~clk;
initial begin
clk=0;
rst=1;
en=0;

#10;
rst=0;
en=1;

#200;
$finish;
end
endmodule
