`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11.07.2020 01:10:11
// Design Name: 
// Module Name: dfsm
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


module dfsm(start, clk, akey, final, mcol, sbytes, pxor);
input start, clk;
output reg akey, final, mcol, sbytes, pxor;
reg [2:0]state;
reg [2:0]next_state;
reg [2:0] count = 3'd0;
parameter idle = 3'b000, prexor = 3'b001, subbytes = 3'b010, addkey = 3'b011, mixcols = 3'b100;
always @(start or state or count) begin
case(state)
    idle: begin
        if(start == 1'b1 && count == 3'd1) begin
            next_state <= prexor;
            pxor <= 1'b1;
            sbytes <= 1'b0;
            mcol <= 1'b0;
            final <= 1'b0;
            akey <= 1'b0;
        end
        else begin
            next_state <= idle;
            pxor <= 1'b0;
            sbytes <= 1'b0;
            mcol <= 1'b0;
            final <= 1'b0;
            akey <= 1'b0;
        end
    end
    prexor: begin
            next_state <= subbytes;
            pxor <= 1'b0;
            sbytes <= 1'b1;
            mcol <= 1'b0;
            final <= 1'b0;
            akey <= 1'b0;
    end
    subbytes: begin
            next_state <= addkey;
            pxor <= 1'b0;
            sbytes <= 1'b0;
            mcol <= 1'b0;
            final <= 1'b0;
            akey <= 1'b1;
    end
    addkey: begin
            next_state <= mixcols;
            pxor <= 1'b0;
            sbytes <= 1'b0;
            mcol <= 1'b1;
            final <= 1'b0;
            akey <= 1'b0;
    end
    mixcols: begin
            next_state <= mixcols;
            pxor <= 1'b0;
            sbytes <= 1'b0;
            mcol <= 1'b0;
            final <= 1'b1;
            akey <= 1'b0;
    end
    default: begin
        next_state <= idle;
        pxor <= 1'b0;
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
