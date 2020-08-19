`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05.07.2020 13:26:11
// Design Name: 
// Module Name: tb
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


module tb;
reg [3:0] data;
reg start, clk;
wire [127:0] outp;
top t1(data, start, clk, outp);
initial begin
start = 1'b1;
clk = 1'b0;
end
initial begin
#4 data = 4'h1;
#9 data = 4'h2;
#1000 $finish;
end
always #5 clk = ~clk;

endmodule
