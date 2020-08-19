`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    20:04:30 06/29/2020 
// Design Name: 
// Module Name:    mixcolumn 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module mix_col(clk, a, mcol, mcl);
input [127:0] a;
input clk, mcol;
output reg [127:0] mcl;

always @(posedge clk) begin
    if(mcol == 1'b1) begin
        mcl[127:120] = twth(a[127:120]) ^ a[119:112] ^ twth(a[119:112]) ^ a[111:104] ^ a[103:96]; //2 3 1 1
        mcl[119:112] = a[127:120] ^ twth(a[119:112]) ^ a[111:104] ^ twth(a[111:104]) ^ a[103:96]; //1 2 3 1
        mcl[111:104] = a[127:120] ^ a[119:112] ^ twth(a[111:104]) ^ a[103:96] ^ twth(a[103:96]); //1 1 2 3
        mcl[103:96] = a[127:120] ^ twth(a[127:120]) ^ a[119:112] ^ a[111:104] ^ twth(a[103:96]); //3 1 1 2
        
        mcl[95:88] = twth(a[95:88]) ^ a[87:80] ^ twth(a[87:80]) ^ a[79:72] ^ a[71:64];
        mcl[87:80] = a[95:88] ^ twth(a[87:80]) ^ a[79:72] ^ twth(a[79:72]) ^ a[71:64];
        mcl[79:72] = a[95:88] ^ a[87:80] ^ twth(a[79:72]) ^ a[71:64] ^ twth(a[71:64]);
        mcl[71:64] = a[95:88] ^ twth(a[95:88]) ^ a[87:80] ^ a[79:72] ^ twth(a[71:64]);
        
        mcl[63:56] = twth(a[63:56]) ^ a[55:48] ^ twth(a[55:48]) ^ a[47:40] ^ a[39:32];
        mcl[55:48] = a[63:56] ^ twth(a[55:48]) ^ a[47:40] ^ twth(a[47:40]) ^ a[39:32];
        mcl[47:40] = a[63:56] ^ a[55:48] ^ twth(a[47:40]) ^ a[39:32] ^ twth(a[39:32]);
        mcl[39:32] = a[63:56] ^ twth(a[63:56]) ^ a[55:48] ^ a[47:40] ^ twth(a[39:32]);
    
        mcl[31:24] = twth(a[31:24]) ^ a[23:16] ^ twth(a[23:16]) ^ a[15:8] ^ a[7:0];
        mcl[23:16] = a[31:24] ^ twth(a[23:16]) ^ a[15:8] ^ twth(a[15:8]) ^ a[7:0];
        mcl[15:8] = a[31:24] ^ a[23:16] ^ twth(a[15:8]) ^ a[7:0] ^ twth(a[7:0]);
        mcl[7:0] = a[31:24] ^ twth(a[31:24]) ^ a[23:16] ^ a[15:8] ^ twth(a[7:0]);

    end
    else mcl <= mcl;
    
end

function [7:0] twth;
    input [7:0] b;
    if(b[7] == 0)
        twth = {b[6:0], 1'b0};
    else
        twth = {b[6:0], 1'b0} ^ 8'h1b;
endfunction

endmodule
