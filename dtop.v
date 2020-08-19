`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11.07.2020 00:44:16
// Design Name: 
// Module Name: dtop
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


module dtop(data, key, key1, start, clk, out, final);
input [127:0] data, key, key1;
input start, clk;
output [127:0] out;
output final;
wire [127:0] pxdata, sbdata, akdata;
wire pxor, sbytes, mcol, akey;
addkey pa1(pxor, data, key, pxdata);
isub_byte sb1(clk, pxdata, sbytes, sbdata);
addkey a1(akey, sbdata, key1, akdata);
imix_col mc1(clk, akdata, mcol, out);
dfsm f1(start, clk, akey, final, mcol, sbytes, pxor);
endmodule
