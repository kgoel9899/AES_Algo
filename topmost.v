`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05.07.2020 21:10:13
// Design Name: 
// Module Name: topmost
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


module topmost(data, key, start, clk, outp, final);
input [3:0] data, key;
input start, clk;
output [127:0] outp;
output final;
wire [127:0] inpkey, kgdata1, kgdata2, kgdata3, kgdata4, kgdata5, kgdata6, kgdata7, kgdata8, kgdata9, kgdata10;
wire [127:0] data1, data2, data3, data4, data5, data6, data7, data8, data9, data10;
wire [127:0] data11, data12, data13, data14, data15, data16, data17, data18, data19;
wire final1, final2, final3, final4, final5, final6, final7, final8, final9, final10;
wire final11, final12, final13, final14, final15, final16, final17, final18, final19;

top t1(data, key, 32'h01_00_00_00, start, clk, data1, kgdata1, inpkey, final1);
topmid t2(data1, kgdata1, 32'h02_00_00_00, final1, clk, data2, kgdata2, final2);
topmid t3(data2, kgdata2, 32'h04_00_00_00, final2, clk, data3, kgdata3, final3);
topmid t4(data3, kgdata3, 32'h08_00_00_00, final3, clk, data4, kgdata4, final4);
topmid t5(data4, kgdata4, 32'h10_00_00_00, final4, clk, data5, kgdata5, final5);
topmid t6(data5, kgdata5, 32'h20_00_00_00, final5, clk, data6, kgdata6, final6);
topmid t7(data6, kgdata6, 32'h40_00_00_00, final6, clk, data7, kgdata7, final7);
topmid t8(data7, kgdata7, 32'h80_00_00_00, final7, clk, data8, kgdata8, final8);
topmid t9(data8, kgdata8, 32'h1b_00_00_00, final8, clk, data9, kgdata9, final9);
toplast t10(data9, kgdata9, 32'h36_00_00_00, final9, clk, data10, kgdata10, final10);

dtop t11(data10, kgdata10, kgdata9, final10, clk, data11, final11);
dtopmid t12(data11, kgdata8, final11, clk, data12, final12);
dtopmid t13(data12, kgdata7, final12, clk, data13, final13);
dtopmid t14(data13, kgdata6, final13, clk, data14, final14);
dtopmid t15(data14, kgdata5, final14, clk, data15, final15);
dtopmid t16(data15, kgdata4, final15, clk, data16, final16);
dtopmid t17(data16, kgdata3, final16, clk, data17, final17);
dtopmid t18(data17, kgdata2, final17, clk, data18, final18);
dtopmid t19(data18, kgdata1, final18, clk, data19, final19);
dtoplast t20(data19, inpkey, final19, clk, outp, final);

endmodule
