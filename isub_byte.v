`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11.07.2020 00:43:39
// Design Name: 
// Module Name: isub_byte
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


module isub_byte(clk, data, sbytes, out);

input [127:0] data;
input clk, sbytes;
output reg [127:0] out;

     always @(posedge clk) begin
        if(sbytes == 1'b1) begin
            out[127:120] = isbox(data[127:120]);
            out[119:112] = isbox(data[23:16]);
            out[111:104] = isbox(data[47:40]);
            out[103:96] = isbox(data[71:64]);
            
            out[95:88] = isbox(data[95:88]);
            out[87:80] = isbox(data[119:112]);
            out[79:72] = isbox(data[15:8]);
            out[71:64] = isbox(data[39:32]);
            
            out[63:56] = isbox(data[63:56]);
            out[55:48] = isbox(data[87:80]);
            out[47:40] = isbox(data[111:104]);
            out[39:32] = isbox(data[7:0]);
            
            out[31:24] = isbox(data[31:24]);
            out[23:16] = isbox(data[55:48]);
            out[15:8] = isbox(data[79:72]);
            out[7:0] = isbox(data[103:96]);
        end
     end


function [7:0] isbox;
input [7:0] mat;

case(mat)
    8'h00:isbox =8'h52;
	8'h01:isbox =8'h09;
	8'h02:isbox =8'h6a;
	8'h03:isbox =8'hd5;
	8'h04:isbox =8'h30;
	8'h05:isbox =8'h36;
	8'h06:isbox =8'ha5;
	8'h07:isbox =8'h38;
	8'h08:isbox =8'hbf;
	8'h09:isbox =8'h40;
	8'h0a:isbox =8'ha3;
	8'h0b:isbox =8'h9e;
	8'h0c:isbox =8'h81;
	8'h0d:isbox =8'hf3;
	8'h0e:isbox =8'hd7;
	8'h0f:isbox =8'hfb;
	8'h10:isbox =8'h7c;
	8'h11:isbox =8'he3;
	8'h12:isbox =8'h39;
	8'h13:isbox =8'h82;
	8'h14:isbox =8'h9b;
	8'h15:isbox =8'h2f;
	8'h16:isbox =8'hff;
	8'h17:isbox =8'h87;
	8'h18:isbox =8'h34;
	8'h19:isbox =8'h8e;
	8'h1a:isbox =8'h43;
	8'h1b:isbox =8'h44;
	8'h1c:isbox =8'hc4;
	8'h1d:isbox =8'hde;
	8'h1e:isbox =8'he9;
	8'h1f:isbox =8'hcb;
	8'h20:isbox =8'h54;
	8'h21:isbox =8'h7b;
	8'h22:isbox =8'h94;
	8'h23:isbox =8'h32;
	8'h24:isbox =8'ha6;
	8'h25:isbox =8'hc2;
	8'h26:isbox =8'h23;
	8'h27:isbox =8'h3d;
	8'h28:isbox =8'hee;
	8'h29:isbox =8'h4c;
	8'h2a:isbox =8'h95;
	8'h2b:isbox =8'h0b;
	8'h2c:isbox =8'h42;
	8'h2d:isbox =8'hfa;
	8'h2e:isbox =8'hc3;
	8'h2f:isbox =8'h4e;
	8'h30:isbox =8'h08;
	8'h31:isbox =8'h2e;
	8'h32:isbox =8'ha1;
	8'h33:isbox =8'h66;
	8'h34:isbox =8'h28;
	8'h35:isbox =8'hd9;
	8'h36:isbox =8'h24;
	8'h37:isbox =8'hb2;
	8'h38:isbox =8'h76;
	8'h39:isbox =8'h5b;
	8'h3a:isbox =8'ha2;
	8'h3b:isbox =8'h49;
	8'h3c:isbox =8'h6d;
	8'h3d:isbox =8'h8b;
	8'h3e:isbox =8'hd1;
	8'h3f:isbox =8'h25;
	8'h40:isbox =8'h72;
	8'h41:isbox =8'hf8;
	8'h42:isbox =8'hf6;
	8'h43:isbox =8'h64;
	8'h44:isbox =8'h86;
	8'h45:isbox =8'h68;
	8'h46:isbox =8'h98;
	8'h47:isbox =8'h16;
	8'h48:isbox =8'hd4;
	8'h49:isbox =8'ha4;
	8'h4a:isbox =8'h5c;
	8'h4b:isbox =8'hcc;
	8'h4c:isbox =8'h5d;
	8'h4d:isbox =8'h65;
	8'h4e:isbox =8'hb6;
	8'h4f:isbox =8'h92;
	8'h50:isbox =8'h6c;
	8'h51:isbox =8'h70;
	8'h52:isbox =8'h48;
	8'h53:isbox =8'h50;
	8'h54:isbox =8'hfd;
	8'h55:isbox =8'hed;
	8'h56:isbox =8'hb9;
	8'h57:isbox =8'hda;
	8'h58:isbox =8'h5e;
	8'h59:isbox =8'h15;
	8'h5a:isbox =8'h46;
	8'h5b:isbox =8'h57;
	8'h5c:isbox =8'ha7;
	8'h5d:isbox =8'h8d;
	8'h5e:isbox =8'h9d;
	8'h5f:isbox =8'h84;
	8'h60:isbox =8'h90;
	8'h61:isbox =8'hd8;
	8'h62:isbox =8'hab;
	8'h63:isbox =8'h00;
	8'h64:isbox =8'h8c;
	8'h65:isbox =8'hbc;
	8'h66:isbox =8'hd3;
	8'h67:isbox =8'h0a;
	8'h68:isbox =8'hf7;
	8'h69:isbox =8'he4;
	8'h6a:isbox =8'h58;
	8'h6b:isbox =8'h05;
	8'h6c:isbox =8'hb8;
	8'h6d:isbox =8'hb3;
	8'h6e:isbox =8'h45;
	8'h6f:isbox =8'h06;
	8'h70:isbox =8'hd0;
	8'h71:isbox =8'h2c;
	8'h72:isbox =8'h1e;
	8'h73:isbox =8'h8f;
	8'h74:isbox =8'hca;
	8'h75:isbox =8'h3f;
	8'h76:isbox =8'h0f;
	8'h77:isbox =8'h02;
	8'h78:isbox =8'hc1;
	8'h79:isbox =8'haf;
	8'h7a:isbox =8'hbd;
	8'h7b:isbox =8'h03;
	8'h7c:isbox =8'h01;
	8'h7d:isbox =8'h13;
	8'h7e:isbox =8'h8a;
	8'h7f:isbox =8'h6b;
	8'h80:isbox =8'h3a;
	8'h81:isbox =8'h91;
	8'h82:isbox =8'h11;
	8'h83:isbox =8'h41;
	8'h84:isbox =8'h4f;
	8'h85:isbox =8'h67;
	8'h86:isbox =8'hdc;
	8'h87:isbox =8'hea;
	8'h88:isbox =8'h97;
	8'h89:isbox =8'hf2;
	8'h8a:isbox =8'hcf;
	8'h8b:isbox =8'hce;
	8'h8c:isbox =8'hf0;
	8'h8d:isbox =8'hb4;
	8'h8e:isbox =8'he6;
	8'h8f:isbox =8'h73;
	8'h90:isbox =8'h96;
	8'h91:isbox =8'hac;
	8'h92:isbox =8'h74;
	8'h93:isbox =8'h22;
	8'h94:isbox =8'he7;
	8'h95:isbox =8'had;
	8'h96:isbox =8'h35;
	8'h97:isbox =8'h85;
	8'h98:isbox =8'he2;
	8'h99:isbox =8'hf9;
	8'h9a:isbox =8'h37;
	8'h9b:isbox =8'he8;
	8'h9c:isbox =8'h1c;
	8'h9d:isbox =8'h75;
	8'h9e:isbox =8'hdf;
	8'h9f:isbox =8'h6e;
	8'ha0:isbox =8'h47;
	8'ha1:isbox =8'hf1;
	8'ha2:isbox =8'h1a;
	8'ha3:isbox =8'h71;
	8'ha4:isbox =8'h1d;
	8'ha5:isbox =8'h29;
	8'ha6:isbox =8'hc5;
	8'ha7:isbox =8'h89;
	8'ha8:isbox =8'h6f;
	8'ha9:isbox =8'hb7;
	8'haa:isbox =8'h62;
	8'hab:isbox =8'h0e;
	8'hac:isbox =8'haa;
	8'had:isbox =8'h18;
	8'hae:isbox =8'hbe;
	8'haf:isbox =8'h1b;
	8'hb0:isbox =8'hfc;
	8'hb1:isbox =8'h56;
	8'hb2:isbox =8'h3e;
	8'hb3:isbox =8'h4b;
	8'hb4:isbox =8'hc6;
	8'hb5:isbox =8'hd2;
	8'hb6:isbox =8'h79;
	8'hb7:isbox =8'h20;
	8'hb8:isbox =8'h9a;
	8'hb9:isbox =8'hdb;
	8'hba:isbox =8'hc0;
	8'hbb:isbox =8'hfe;
	8'hbc:isbox =8'h78;
	8'hbd:isbox =8'hcd;
	8'hbe:isbox =8'h5a;
	8'hbf:isbox =8'hf4;
	8'hc0:isbox =8'h1f;
	8'hc1:isbox =8'hdd;
	8'hc2:isbox =8'ha8;
	8'hc3:isbox =8'h33;
	8'hc4:isbox =8'h88;
	8'hc5:isbox =8'h07;
	8'hc6:isbox =8'hc7;
	8'hc7:isbox =8'h31;
	8'hc8:isbox =8'hb1;
	8'hc9:isbox =8'h12;
	8'hca:isbox =8'h10;
	8'hcb:isbox =8'h59;
	8'hcc:isbox =8'h27;
	8'hcd:isbox =8'h80;
	8'hce:isbox =8'hec;
	8'hcf:isbox =8'h5f;
	8'hd0:isbox =8'h60;
	8'hd1:isbox =8'h51;
	8'hd2:isbox =8'h7f;
	8'hd3:isbox =8'ha9;
	8'hd4:isbox =8'h19;
	8'hd5:isbox =8'hb5;
	8'hd6:isbox =8'h4a;
	8'hd7:isbox =8'h0d;
	8'hd8:isbox =8'h2d;
	8'hd9:isbox =8'he5;
	8'hda:isbox =8'h7a;
	8'hdb:isbox =8'h9f;
	8'hdc:isbox =8'h93;
	8'hdd:isbox =8'hc9;
	8'hde:isbox =8'h9c;
	8'hdf:isbox =8'hef;
	8'he0:isbox =8'ha0;
	8'he1:isbox =8'he0;
	8'he2:isbox =8'h3b;
	8'he3:isbox =8'h4d;
	8'he4:isbox =8'hae;
	8'he5:isbox =8'h2a;
	8'he6:isbox =8'hf5;
	8'he7:isbox =8'hb0;
	8'he8:isbox =8'hc8;
	8'he9:isbox =8'heb;
	8'hea:isbox =8'hbb;
	8'heb:isbox =8'h3c;
	8'hec:isbox =8'h83;
	8'hed:isbox =8'h53;
	8'hee:isbox =8'h99;
	8'hef:isbox =8'h61;
	8'hf0:isbox =8'h17;
	8'hf1:isbox =8'h2b;
	8'hf2:isbox =8'h04;
	8'hf3:isbox =8'h7e;
	8'hf4:isbox =8'hba;
	8'hf5:isbox =8'h77;
	8'hf6:isbox =8'hd6;
	8'hf7:isbox =8'h26;
	8'hf8:isbox =8'he1;
	8'hf9:isbox =8'h69;
	8'hfa:isbox =8'h14;
	8'hfb:isbox =8'h63;
	8'hfc:isbox =8'h55;
	8'hfd:isbox =8'h21;
	8'hfe:isbox =8'h0c;
	8'hff:isbox =8'h7d;
endcase
endfunction
endmodule
