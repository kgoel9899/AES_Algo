`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11.07.2020 00:44:33
// Design Name: 
// Module Name: dtopmid
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


module dtopmid(data, key, start, clk, out, final);
input [127:0] data, key;
input start, clk;
output [127:0] out;
output final;
wire [127:0] sbdata, akdata;
wire sbytes, mcol, akey;
isub_byte sb1(clk, data, sbytes, sbdata);
addkey a1(akey, sbdata, key, akdata);
imix_col mc1(clk, akdata, mcol, out);
dfsm_mid f1(start, clk, akey, final, mcol, sbytes);
endmodule
