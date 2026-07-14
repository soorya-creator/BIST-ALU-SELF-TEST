`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 14.07.2026 04:06:26
// Design Name: 
// Module Name: lfsr
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


module lfsr(
    input clk,
    input en,
    input rst,
    output reg [7:0] lfsr_out
    );
    wire feedback;
    assign feedback=lfsr_out[7]^lfsr_out[5]^lfsr_out[4]^lfsr_out[3];
    always@(posedge clk or posedge rst)
    begin
    if(rst)
    lfsr_out<=8'b10101100 ;
    else if(en)
    lfsr_out<={feedback,lfsr_out[7:1]};
    end
    
endmodule
