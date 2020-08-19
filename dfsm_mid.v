`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11.07.2020 01:54:11
// Design Name: 
// Module Name: dfsm_mid
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


module dfsm_mid(start, clk, akey, final, mcol, sbytes);
input start, clk;
output reg akey, final, mcol, sbytes;
reg [1:0]state;
reg [1:0]next_state;
reg [2:0] count = 3'd0;
parameter idle = 2'b00, subbytes = 2'b01, addkey = 2'b10, mixcols = 2'b11;
always @(state or count) begin
case(state)
    idle: begin
        if(start == 1'b1 && count == 3'd1) begin
            next_state <= subbytes;
            sbytes <= 1'b1;
            mcol <= 1'b0;
            final <= 1'b0;
            akey <= 1'b0;
        end
        else begin
            next_state <= idle;
            sbytes <= 1'b0;
            mcol <= 1'b0;
            final <= 1'b0;
            akey <= 1'b0;
        end
    end
    subbytes: begin
            next_state <= addkey;
            sbytes <= 1'b0;
            mcol <= 1'b0;
            final <= 1'b0;
            akey <= 1'b1;
    end
    addkey: begin
            next_state <= mixcols;
            sbytes <= 1'b0;
            mcol <= 1'b1;
            final <= 1'b0;
            akey <= 1'b0;
    end
    mixcols: begin
            next_state <= mixcols;
            sbytes <= 1'b0;
            mcol <= 1'b0;
            final <= 1'b1;
            akey <= 1'b0;
    end
    default: begin
        next_state <= idle;
        sbytes <= 1'b0;
        mcol <= 1'b0;
        final <= 1'b0;
        akey <= 1'b0;
    end
endcase
end
always @(posedge clk) begin
    state <= next_state;
    if(start == 1'b0) count <= 3'd0;
    else count <= count + 1;
end
endmodule
