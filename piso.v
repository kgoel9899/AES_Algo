`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06.07.2020 14:00:46
// Design Name: 
// Module Name: piso
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


module piso(final, clk, out, outp);
input final, clk;
input [127:0] out;
output reg [3:0] outp;
reg [127:0] t;
always @(posedge final)
    t <= out;
always @(posedge clk) begin
    if(t == 127'bX) 
        t <= out;
    else begin
        outp <= t[127:124];
        t[127:4] <= t[123:0];
        t[3:0] <= t[3:0];
    end
end
endmodule

