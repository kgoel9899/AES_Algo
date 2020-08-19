`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05.07.2020 21:49:10
// Design Name: 
// Module Name: topmid
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


module topmid(data, key, rc, start, clk, outp, kgdata, final);
input [127:0] data, key;
input [31:0] rc;
input start, clk;
output [127:0] outp, kgdata;
output final;
wire [127:0] sbdata, mcdata, kgdata;
wire sbytes, mcol, keygen, akey;
sub_byte sb1(clk, data, sbytes, sbdata);
mix_col mc1(clk, sbdata, mcol, mcdata);
key_gen k1(clk, keygen, rc, key, kgdata);
addkey a1(akey, mcdata, kgdata, outp);
fsm_mid f1(start, clk, akey, final, keygen, mcol, sbytes);
endmodule