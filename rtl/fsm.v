`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 14.07.2026 11:51:28
// Design Name: 
// Module Name: FSM
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


module FSM(
    input clk,
    input rst,
    input en,
    output reg [1:0]opcode, 
    output done
    );
 parameter NUM_VECTORS = 8'd255;
 parameter ADD_TEST=3'b000;
 parameter SUB_TEST=3'b001;
 parameter AND_TEST=3'b010;
 parameter OR_TEST=3'B011;
 parameter DONE=3'b100;
 reg [2:0] state;
 reg [7:0] count;
 always@(posedge clk or posedge rst)begin
 if (rst)begin
 state<=ADD_TEST;
 count<=8'd0;
 opcode<=2'b00;
 end
 else if(en)begin
 case(state)
 ADD_TEST:begin
 opcode<=2'b00;
 if (count==NUM_VECTORS-1)begin
 count<=8'b0;
 state<=SUB_TEST; opcode<=2'b01;
 end
 else  count<=count+1; 
 end
  SUB_TEST:begin
 opcode<=2'b01;
 if (count==NUM_VECTORS-1)begin
 count<=8'b0;
 state<=AND_TEST; opcode<=2'b10;
 end
 else  count<=count+1; 
 end
  AND_TEST:begin
 opcode<=2'b10;
 if (count==NUM_VECTORS-1)begin
 count<=8'b0;
 state<=OR_TEST; opcode<=2'b11;
 end
 else  count<=count+1;
 end 
  OR_TEST: begin
 opcode<=2'b11;
 if (count==NUM_VECTORS-1)begin
 count<=8'b0;
 state<=DONE;
 end
 else  count<=count+1; 
 end
 DONE:state<=DONE;
 default:
begin
    state <= ADD_TEST;
    count <= 8'd0;
    opcode <= 2'b00;
end
 endcase
 end
 end
 assign done = (state == DONE);
endmodule
