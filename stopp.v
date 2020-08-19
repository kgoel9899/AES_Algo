`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05.07.2020 13:57:59
// Design Name: 
// Module Name: stopp
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


module stopp(out, stop_en, outp);
input [127:0] out;
input stop_en;
output [127:0] outp;
assign outp = (stop_en == 1'b1) ? out : outp;
//bufif1(outp, out, stop_en);
endmodule
