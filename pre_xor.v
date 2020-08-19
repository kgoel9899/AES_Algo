`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05.07.2020 16:17:49
// Design Name: 
// Module Name: pre_xor
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


module pre_xor(pdata, pkey, pxor, pxdata);
input [127:0] pdata, pkey;
input pxor;
output [127:0] pxdata;
assign pxdata = (pxor == 1) ? pdata ^ pkey : pxdata;
//bufif1(pxdata, pdata ^ pkey, pxor);
endmodule
