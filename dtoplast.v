`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11.07.2020 00:45:09
// Design Name: 
// Module Name: dtoplast
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


module dtoplast(data, key, start, clk, out, final);
input [127:0] data, key;
input start, clk;
output [127:0] out;
output final;
wire [127:0] sbdata;
wire sbytes, akey;
isub_byte sb1(clk, data, sbytes, sbdata);
addkey a1(akey, sbdata, key, out);
dfsm_last f1(start, clk, akey, final, sbytes);
endmodule
