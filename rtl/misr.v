`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 14.07.2026 11:15:36
// Design Name: 
// Module Name: misr
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


module misr(
    input clk,
    input en,
    input rst,
    input [4:0] alu_out,
    output reg [4:0] signature
    );
    always@(posedge clk or posedge rst)begin
    if(rst)
    signature<=5'b00000;
    else if(en) begin
    signature[4]<=signature[0]^alu_out[4];
    signature[3]<=signature[4]^^alu_out[3];
    signature[2] <= signature[3] ^ alu_out[2];
    signature[1] <= signature[2] ^ alu_out[1];
    signature[0] <= signature[1] ^ alu_out[0];
    end
end
endmodule
