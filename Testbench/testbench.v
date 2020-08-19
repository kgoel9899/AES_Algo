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


module testbench;
reg [3:0] data, key;
reg start, clk;
wire [127:0] outp;
wire final;
topmost t1(data, key, start, clk, outp, final);
initial begin
clk = 1'b0;
start = 1'b1;
end
initial begin
#14 data = 4'h4;
#10 data = 4'h3;
#10 data = 4'h7;
#10 data = 4'h0;
#10 data = 4'h7;
#10 data = 4'h3;
#10 data = 4'h0;
#10 data = 4'he;
#10 data = 4'h2;
#10 data = 4'ha;
#10 data = 4'h8;
#10 data = 4'h9;
#10 data = 4'h1;
#10 data = 4'h3;
#10 data = 4'h1;
#10 data = 4'h3;
#10 data = 4'hd;
#10 data = 4'h8;
#10 data = 4'h0;
#10 data = 4'h3;
#10 data = 4'ha;
#10 data = 4'h5;
#10 data = 4'h8;
#10 data = 4'h8;
#10 data = 4'h8;
#10 data = 4'ha;
#10 data = 4'h6;
#10 data = 4'hf;
#10 data = 4'h3;
#10 data = 4'h4;
#10 data = 4'h2;
#10 data = 4'h3;

#10 key = 4'hc;
#10 key = 4'h3;
#10 key = 4'hf;
#10 key = 4'h4;
#10 key = 4'hf;
#10 key = 4'hc;
#10 key = 4'h9;
#10 key = 4'h0;
#10 key = 4'h8;
#10 key = 4'h8;
#10 key = 4'h5;
#10 key = 4'h1;
#10 key = 4'h7;
#10 key = 4'hf;
#10 key = 4'hb;
#10 key = 4'ha;
#10 key = 4'h6;
#10 key = 4'ha;
#10 key = 4'h2;
#10 key = 4'hd;
#10 key = 4'he;
#10 key = 4'ha;
#10 key = 4'h8;
#10 key = 4'h2;
#10 key = 4'h6;
#10 key = 4'h1;
#10 key = 4'h5;
#10 key = 4'h1;
#10 key = 4'he;
#10 key = 4'h7;
#10 key = 4'hb;
#10 key = 4'h2;
#1000000 $finish;
end
always #5 clk = ~clk;

endmodule
