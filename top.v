`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05.07.2020 12:47:30
// Design Name: 
// Module Name: top
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


module top(data, key, rc, start, clk, outp, kgdata, inpkey, final);
input [3:0] data, key;
input [31:0] rc;
input start, clk;
output [127:0] outp, kgdata, inpkey;
output final;
wire [127:0] pxdata, pdata, pkey, sbdata, mcdata;
wire sload, kload, pxor, sbytes, mcol, keygen, akey;
sipo_data s1(data, clk, sload, pdata);
sipo_data s3(key, clk, kload, inpkey);
addkey pa1(pxor, pdata, inpkey, pxdata);
sub_byte sb1(clk, pxdata, sbytes, sbdata);
mix_col mc1(clk, sbdata, mcol, mcdata);
key_gen k1(clk, keygen, rc, inpkey, kgdata);
addkey a1(akey, mcdata, kgdata, outp);
fsm f1(start, clk, akey, final, keygen, mcol, sbytes, pxor, sload, kload);
endmodule