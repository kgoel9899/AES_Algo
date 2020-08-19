`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05.07.2020 21:40:21
// Design Name: 
// Module Name: addkey
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


module addkey(akey, mcdata, kgdata, akdata);
input akey;
input [127:0] mcdata, kgdata;
output [127:0] akdata;
assign akdata = (akey == 1'b1) ? mcdata ^ kgdata : akdata;
//bufif1(akdata, mcdata ^ kgdata, akey);
endmodule
