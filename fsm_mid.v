`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05.07.2020 20:59:45
// Design Name: 
// Module Name: fsm_mid
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


module fsm_mid(start, clk, akey, final, keygen, mcol, sbytes);
input start, clk;
output reg akey, final, keygen, mcol, sbytes;
reg [2:0]state;
reg [2:0]next_state;
reg [2:0] count = 3'd0;
parameter idle = 3'b000, subbytes = 3'b001, mixcols = 3'b010, key_gen = 3'b011, addkey = 3'b100;
always @(start or state or count) begin
case(state)
    idle: begin
        if(start == 1'b1 && count == 3'd1) begin
            next_state <= subbytes;
            sbytes <= 1'b1;
            mcol <= 1'b0;
            keygen <= 1'b0;
            final <= 1'b0;
            akey <= 1'b0;
        end
        else begin
            next_state <= idle;
            sbytes <= 1'b0;
            mcol <= 1'b0;
            keygen <= 1'b0;
            final <= 1'b0;
            akey <= 1'b0;
        end
    end
    subbytes: begin
            next_state <= mixcols;
            sbytes <= 1'b0;
            mcol <= 1'b1;
            keygen <= 1'b0;
            final <= 1'b0;
            akey <= 1'b0;
    end
    mixcols: begin
            next_state <= key_gen;
            sbytes <= 1'b0;
            mcol <= 1'b0;
            keygen <= 1'b1;
            final <= 1'b0;
            akey <= 1'b0;
    end
    key_gen: begin
            next_state <= addkey;
            sbytes <= 1'b0;
            mcol <= 1'b0;
            keygen <= 1'b0;
            final <= 1'b0;
            akey <= 1'b1;
    end
    addkey: begin
            next_state <= addkey;
            sbytes <= 1'b0;
            mcol <= 1'b0;
            keygen <= 1'b0;
            final <= 1'b1;
            akey <= 1'b0;
    end
    default: begin
        next_state <= idle;
        sbytes <= 1'b0;
        mcol <= 1'b0;
        keygen <= 1'b0;
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