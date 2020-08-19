`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 17.07.2020 13:14:19
// Design Name: 
// Module Name: imixc_tb
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


module imixc_tb;
reg [127:0] a;
reg mcol, clk;
wire [127:0] mcl;
imix_col t1(clk, a, mcol, mcl);
initial begin
clk = 1'b0;
mcol = 1'b1;
#5 clk = 1'b1;
end
initial begin
a = 128'h473794ed40d4e4a5a3703aa64c9f42bc;
#100 $finish;
end

endmodule
