`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    13:59:45 02/06/2020 
// Design Name: 
// Module Name:    SIPO 
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
module sipo_data(input [3:0] S_DATA, input clk, SDATA_Load,output reg [127:0]P_DATA);

always @(posedge clk)
	begin

		if (SDATA_Load)
			begin
			P_DATA[127:124]<=S_DATA;
			P_DATA[123:0]<=P_DATA[127:4];
			end
			
		else
			P_DATA <= P_DATA;
	end

endmodule

