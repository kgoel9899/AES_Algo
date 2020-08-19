`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05.07.2020 22:56:07
// Design Name: 
// Module Name: toplast
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


module toplast(data, key, rc, start, clk, outp, kgdata, final);
input [127:0] data, key;
input [31:0] rc;
input start, clk;
output [127:0] outp, kgdata;
output final;
wire [127:0] sbdata, kgdata;
wire sbytes, keygen, akey;
sub_byte sb1(clk, data, sbytes, sbdata);
key_gen k1(clk, keygen, rc, key, kgdata);
addkey a1(akey, sbdata, kgdata, outp);
fsm_last f1(start, clk, akey, final, keygen, sbytes);
endmodule