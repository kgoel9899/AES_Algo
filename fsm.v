`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05.07.2020 12:47:40
// Design Name: 
// Module Name: fsm
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


module fsm(start, clk, akey, final, keygen, mcol, sbytes, pxor, shift_data, shift_key);
input start, clk;
output reg akey, final, keygen, mcol, sbytes, pxor, shift_data, shift_key;
reg [2:0]state;
reg [2:0]next_state;
reg [6:0] count = 7'd0;
parameter idle = 3'b000, sdata = 3'b001, skey = 3'b010, prexor = 3'b011, subbytes = 3'b100, mixcols = 3'b101, key_gen = 3'b110, addkey = 3'b111;
always @(start or state or count) begin
case(state)
    idle: begin
        if(start == 1'b1 && count == 7'd1) begin
            next_state <= sdata;
            shift_data <= 1'b1;
            shift_key <= 1'b0;
            pxor <= 1'b0;
            sbytes <= 1'b0;
            mcol <= 1'b0;
            keygen <= 1'b0;
            final <= 1'b0;
            akey <= 1'b0;
        end
        else begin
            next_state <= idle;
            shift_data <= 1'b0;
            shift_key <= 1'b0;
            pxor <= 1'b0;
            sbytes <= 1'b0;
            mcol <= 1'b0;
            keygen <= 1'b0;
            final <= 1'b0;
            akey <= 1'b0;
        end
    end
    sdata: begin
        if(count == 7'd33) begin
            next_state <= skey;
            shift_data <= 1'b0;
            shift_key <= 1'b1;
            pxor <= 1'b0;
            sbytes <= 1'b0;
            mcol <= 1'b0;
            keygen <= 1'b0;
            final <= 1'b0;
            akey <= 1'b0;
        end
        else begin
            next_state <= sdata;
            shift_data <= 1'b1;
            shift_key <= 1'b0;
            pxor <= 1'b0;
            sbytes <= 1'b0;
            mcol <= 1'b0;
            keygen <= 1'b0;
            final <= 1'b0;
            akey <= 1'b0;
       end
    end
    skey: begin
        if(count == 7'd65) begin
            next_state <= prexor;
            shift_data <= 1'b0;
            shift_key <= 1'b0;
            pxor <= 1'b1;
            sbytes <= 1'b0;
            mcol <= 1'b0;
            keygen <= 1'b0;
            final <= 1'b0;
            akey <= 1'b0;
        end
        else begin
            next_state <= skey;
            shift_data <= 1'b0;
            shift_key <= 1'b1;
            pxor <= 1'b0;
            sbytes <= 1'b0;
            mcol <= 1'b0;
            keygen <= 1'b0;
            final <= 1'b0;
            akey <= 1'b0;
        end
    end
    prexor: begin
            next_state <= subbytes;
            shift_data <= 1'b0;
            shift_key <= 1'b0;
            pxor <= 1'b0;
            sbytes <= 1'b1;
            mcol <= 1'b0;
            keygen <= 1'b0;
            final <= 1'b0;
            akey <= 1'b0;
    end
    subbytes: begin
            next_state <= mixcols;
            shift_data <= 1'b0;
            shift_key <= 1'b0;
            pxor <= 1'b0;
            sbytes <= 1'b0;
            mcol <= 1'b1;
            keygen <= 1'b0;
            final <= 1'b0;
            akey <= 1'b0;
    end
    mixcols: begin
            next_state <= key_gen;
            shift_data <= 1'b0;
            shift_key <= 1'b0;
            pxor <= 1'b0;
            sbytes <= 1'b0;
            mcol <= 1'b0;
            keygen <= 1'b1;
            final <= 1'b0;
            akey <= 1'b0;
    end
    key_gen: begin
            next_state <= addkey;
            shift_data <= 1'b0;
            shift_key <= 1'b0;
            pxor <= 1'b0;
            sbytes <= 1'b0;
            mcol <= 1'b0;
            keygen <= 1'b0;
            final <= 1'b0;
            akey <= 1'b1;
    end
    addkey: begin
            next_state <= addkey;
            shift_data <= 1'b0;
            shift_key <= 1'b0;
            pxor <= 1'b0;
            sbytes <= 1'b0;
            mcol <= 1'b0;
            keygen <= 1'b0;
            final <= 1'b1;
            akey <= 1'b0;
    end
    default: begin
        next_state <= idle;
        shift_data <= 1'b0;
        shift_key <= 1'b0;
        pxor <= 1'b0;
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
    count <= count + 1;
end
endmodule