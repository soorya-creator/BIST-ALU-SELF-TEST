`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 14.07.2026 11:26:40
// Design Name: 
// Module Name: misr_tb
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


module misr_tb();
    reg clk;
    reg en;
    reg rst;
    reg [4:0] alu_out;
    wire  [4:0] signature;
    misr dut(.clk(clk),.en(en),.rst(rst),.alu_out(alu_out),.signature(signature));
always #5 clk=~clk;
initial begin
clk=0;
rst=1;
en=0;
alu_out=0;

#10
rst=0;
en=1;
alu_out=5'b10000;
#20
rst=0;
en=0;
alu_out=5'b00111;
#20;
en = 1;
alu_out = 5'b10101;
#20;
rst = 1;

#10;
rst = 0;
#100;
$finish;
end
endmodule
