`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11.07.2020 00:43:56
// Design Name: 
// Module Name: imix_col
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


module imix_col(clk, a, mcol, mcl);
input [127:0] a;
input clk, mcol;
output reg [127:0] mcl;

//14 11 13 09
//09 14 11 13
//13 09 14 11
//11 13 09 14

//09 -> twth(twth(twth(a[]))) ^ a[]
//11 -> twth(twth(twth(a[])) ^ a[]) ^ a[]
//13 -> twth(twth(twth(a[]) ^ a[])) ^ a[]
//14 -> twth(twth(twth(a[]) ^ a[]) ^ a[])

always @(posedge clk) begin
    if(mcol == 1'b1) begin
        mcl[127:120] = twth(twth(twth(a[127:120]) ^ a[127:120]) ^ a[127:120]) ^ twth(twth(twth(a[119:112])) ^ a[119:112]) ^ a[119:112] ^ twth(twth(twth(a[111:104]) ^ a[111:104])) ^ a[111:104] ^ twth(twth(twth(a[103:96]))) ^ a[103:96];
        mcl[119:112] = twth(twth(twth(a[127:120]))) ^ a[127:120] ^ twth(twth(twth(a[119:112]) ^ a[119:112]) ^ a[119:112]) ^ twth(twth(twth(a[111:104])) ^ a[111:104]) ^ a[111:104] ^ twth(twth(twth(a[103:96]) ^ a[103:96])) ^ a[103:96];
        mcl[111:104] = twth(twth(twth(a[127:120]) ^ a[127:120])) ^ a[127:120] ^ twth(twth(twth(a[119:112]))) ^ a[119:112] ^ twth(twth(twth(a[111:104]) ^ a[111:104]) ^ a[111:104]) ^ twth(twth(twth(a[103:96])) ^ a[103:96]) ^ a[103:96];
        mcl[103:96] = twth(twth(twth(a[127:120])) ^ a[127:120]) ^ a[127:120] ^ twth(twth(twth(a[119:112]) ^ a[119:112])) ^ a[119:112] ^ twth(twth(twth(a[111:104]))) ^ a[111:104] ^ twth(twth(twth(a[103:96]) ^ a[103:96]) ^ a[103:96]);
        
        mcl[95:88] = twth(twth(twth(a[95:88]) ^ a[95:88]) ^ a[95:88]) ^ twth(twth(twth(a[87:80])) ^ a[87:80]) ^ a[87:80] ^ twth(twth(twth(a[79:72]) ^ a[79:72])) ^ a[79:72] ^ twth(twth(twth(a[71:64]))) ^ a[71:64];
        mcl[87:80] = twth(twth(twth(a[95:88]))) ^ a[95:88] ^ twth(twth(twth(a[87:80]) ^ a[87:80]) ^ a[87:80]) ^ twth(twth(twth(a[79:72])) ^ a[79:72]) ^ a[79:72] ^ twth(twth(twth(a[71:64]) ^ a[71:64])) ^ a[71:64];
        mcl[79:72] = twth(twth(twth(a[95:88]) ^ a[95:88])) ^ a[95:88] ^ twth(twth(twth(a[87:80]))) ^ a[87:80] ^ twth(twth(twth(a[79:72]) ^ a[79:72]) ^ a[79:72]) ^ twth(twth(twth(a[71:64])) ^ a[71:64]) ^ a[71:64];
        mcl[71:64] = twth(twth(twth(a[95:88])) ^ a[95:88]) ^ a[95:88] ^ twth(twth(twth(a[87:80]) ^ a[87:80])) ^ a[87:80] ^ twth(twth(twth(a[79:72]))) ^ a[79:72] ^ twth(twth(twth(a[71:64]) ^ a[71:64]) ^ a[71:64]);
        
        mcl[63:56] = twth(twth(twth(a[63:56]) ^ a[63:56]) ^ a[63:56]) ^ twth(twth(twth(a[55:48])) ^ a[55:48]) ^ a[55:48] ^ twth(twth(twth(a[47:40]) ^ a[47:40])) ^ a[47:40] ^ twth(twth(twth(a[39:32]))) ^ a[39:32];
        mcl[55:48] = twth(twth(twth(a[63:56]))) ^ a[63:56] ^ twth(twth(twth(a[55:48]) ^ a[55:48]) ^ a[55:48]) ^ twth(twth(twth(a[47:40])) ^ a[47:40]) ^ a[47:40] ^ twth(twth(twth(a[39:32]) ^ a[39:32])) ^ a[39:32];
        mcl[47:40] = twth(twth(twth(a[63:56]) ^ a[63:56])) ^ a[63:56] ^ twth(twth(twth(a[55:48]))) ^ a[55:48] ^ twth(twth(twth(a[47:40]) ^ a[47:40]) ^ a[47:40]) ^ twth(twth(twth(a[39:32])) ^ a[39:32]) ^ a[39:32];
        mcl[39:32] = twth(twth(twth(a[63:56])) ^ a[63:56]) ^ a[63:56] ^ twth(twth(twth(a[55:48]) ^ a[55:48])) ^ a[55:48] ^ twth(twth(twth(a[47:40]))) ^ a[47:40] ^ twth(twth(twth(a[39:32]) ^ a[39:32]) ^ a[39:32]);
    
        mcl[31:24] = twth(twth(twth(a[31:24]) ^ a[31:24]) ^ a[31:24]) ^ twth(twth(twth(a[23:16])) ^ a[23:16]) ^ a[23:16] ^ twth(twth(twth(a[15:8]) ^ a[15:8])) ^ a[15:8] ^ twth(twth(twth(a[7:0]))) ^ a[7:0];
        mcl[23:16] = twth(twth(twth(a[31:24]))) ^ a[31:24] ^ twth(twth(twth(a[23:16]) ^ a[23:16]) ^ a[23:16]) ^ twth(twth(twth(a[15:8])) ^ a[15:8]) ^ a[15:8] ^ twth(twth(twth(a[7:0]) ^ a[7:0])) ^ a[7:0];
        mcl[15:8] = twth(twth(twth(a[31:24]) ^ a[31:24])) ^ a[31:24] ^ twth(twth(twth(a[23:16]))) ^ a[23:16] ^ twth(twth(twth(a[15:8]) ^ a[15:8]) ^ a[15:8]) ^ twth(twth(twth(a[7:0])) ^ a[7:0]) ^ a[7:0];
        mcl[7:0] = twth(twth(twth(a[31:24])) ^ a[31:24]) ^ a[31:24] ^ twth(twth(twth(a[23:16]) ^ a[23:16])) ^ a[23:16] ^ twth(twth(twth(a[15:8]))) ^ a[15:8] ^ twth(twth(twth(a[7:0]) ^ a[7:0]) ^ a[7:0]);

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
