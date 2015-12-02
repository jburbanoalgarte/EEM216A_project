////////////////////////////////////////////////////////////////
//
// Module: enable_reg_31.v
// Author: Jordi Burbano
//         jburbanoalgarte@gmail.com
//
// Description:
//      31 parallel enable-controlled registers
//		latency 1 cycle
//
// Parameters:
//      
//
// Inputs [bit width]:
//	clk
//	GlobalReset

//	enable [31:0]; at most 1 bit should be asserted at a time
//	in	[20:0]
//
// Outputs [bit width]:
//	ch0_x_lin [20:0]
//	... ch31_x_lin [20:0]
////////////////////////////////////////////////////////////////

module enable_reg_32 ( 
	clk,
	GlobalReset,
	enable,
	in,
	ch0_x_lin,
	ch1_x_lin,
	ch2_x_lin,
	ch3_x_lin,
	ch4_x_lin,
	ch5_x_lin,
	ch6_x_lin,
	ch7_x_lin,
	ch8_x_lin,
	ch9_x_lin,
	ch10_x_lin,
	ch11_x_lin,
	ch12_x_lin,
	ch13_x_lin,
	ch14_x_lin,
	ch15_x_lin,
	ch16_x_lin,
	ch17_x_lin,
	ch18_x_lin,
	ch19_x_lin,
	ch20_x_lin,
	ch21_x_lin,
	ch22_x_lin,
	ch23_x_lin,
	ch24_x_lin,
	ch25_x_lin,
	ch26_x_lin,
	ch27_x_lin,
	ch28_x_lin,
	ch29_x_lin,
	ch30_x_lin,
	ch31_x_lin
    );

////////////////////////////////////////////////////////////////
//  Inputs & Outputs
input clk;
input GlobalReset;
input [31:0] enable;

input [20:0] in;

output  [20:0] ch0_x_lin;
output  [20:0] ch1_x_lin;
output  [20:0] ch2_x_lin;
output  [20:0] ch3_x_lin;
output  [20:0] ch4_x_lin;
output  [20:0] ch5_x_lin;
output  [20:0] ch6_x_lin;
output  [20:0] ch7_x_lin;
output  [20:0] ch8_x_lin;
output  [20:0] ch9_x_lin;
output  [20:0] ch10_x_lin;
output  [20:0] ch11_x_lin;
output  [20:0] ch12_x_lin;
output  [20:0] ch13_x_lin;
output  [20:0] ch14_x_lin;
output  [20:0] ch15_x_lin;
output  [20:0] ch16_x_lin;
output  [20:0] ch17_x_lin;
output  [20:0] ch18_x_lin;
output  [20:0] ch19_x_lin;
output  [20:0] ch20_x_lin;
output  [20:0] ch21_x_lin;
output  [20:0] ch22_x_lin;
output  [20:0] ch23_x_lin;
output  [20:0] ch24_x_lin;
output  [20:0] ch25_x_lin;
output  [20:0] ch26_x_lin;
output  [20:0] ch27_x_lin;
output  [20:0] ch28_x_lin;
output  [20:0] ch29_x_lin;
output  [20:0] ch30_x_lin;
output  [20:0] ch31_x_lin;
	
////////////////////////////////////////////////////////////////
//  reg & wire declarations

////////////////////////////////////////////////////////////////
//  Modules
enable_reg ch0_enable_reg(
	.clk(clk),
	.GlobalReset(GlobalReset),
	.enable(enable[0]),
	.in(in),
	.out(ch0_x_lin)
	);

enable_reg ch1_enable_reg(
	.clk(clk),
	.GlobalReset(GlobalReset),
	.enable(enable[1]),
	.in(in),
	.out(ch1_x_lin)
	);

enable_reg ch2_enable_reg(
	.clk(clk),
	.GlobalReset(GlobalReset),
	.enable(enable[2]),
	.in(in),
	.out(ch2_x_lin)
	);

enable_reg ch3_enable_reg(
	.clk(clk),
	.GlobalReset(GlobalReset),
	.enable(enable[3]),
	.in(in),
	.out(ch3_x_lin)
	);

enable_reg ch4_enable_reg(
	.clk(clk),
	.GlobalReset(GlobalReset),
	.enable(enable[4]),
	.in(in),
	.out(ch4_x_lin)
	);

enable_reg ch5_enable_reg(
	.clk(clk),
	.GlobalReset(GlobalReset),
	.enable(enable[5]),
	.in(in),
	.out(ch5_x_lin)
	);

enable_reg ch6_enable_reg(
	.clk(clk),
	.GlobalReset(GlobalReset),
	.enable(enable[6]),
	.in(in),
	.out(ch6_x_lin)
	);

enable_reg ch7_enable_reg(
	.clk(clk),
	.GlobalReset(GlobalReset),
	.enable(enable[7]),
	.in(in),
	.out(ch7_x_lin)
	);

enable_reg ch8_enable_reg(
	.clk(clk),
	.GlobalReset(GlobalReset),
	.enable(enable[8]),
	.in(in),
	.out(ch8_x_lin)
	);

enable_reg ch9_enable_reg(
	.clk(clk),
	.GlobalReset(GlobalReset),
	.enable(enable[9]),
	.in(in),
	.out(ch9_x_lin)
	);

enable_reg ch10_enable_reg(
	.clk(clk),
	.GlobalReset(GlobalReset),
	.enable(enable[10]),
	.in(in),
	.out(ch10_x_lin)
	);

enable_reg ch11_enable_reg(
	.clk(clk),
	.GlobalReset(GlobalReset),
	.enable(enable[11]),
	.in(in),
	.out(ch11_x_lin)
	);

enable_reg ch12_enable_reg(
	.clk(clk),
	.GlobalReset(GlobalReset),
	.enable(enable[12]),
	.in(in),
	.out(ch12_x_lin)
	);

enable_reg ch13_enable_reg(
	.clk(clk),
	.GlobalReset(GlobalReset),
	.enable(enable[13]),
	.in(in),
	.out(ch13_x_lin)
	);

enable_reg ch14_enable_reg(
	.clk(clk),
	.GlobalReset(GlobalReset),
	.enable(enable[14]),
	.in(in),
	.out(ch14_x_lin)
	);

enable_reg ch15_enable_reg(
	.clk(clk),
	.GlobalReset(GlobalReset),
	.enable(enable[15]),
	.in(in),
	.out(ch15_x_lin)
	);

enable_reg ch16_enable_reg(
	.clk(clk),
	.GlobalReset(GlobalReset),
	.enable(enable[16]),
	.in(in),
	.out(ch16_x_lin)
	);

enable_reg ch17_enable_reg(
	.clk(clk),
	.GlobalReset(GlobalReset),
	.enable(enable[17]),
	.in(in),
	.out(ch17_x_lin)
	);

enable_reg ch18_enable_reg(
	.clk(clk),
	.GlobalReset(GlobalReset),
	.enable(enable[18]),
	.in(in),
	.out(ch18_x_lin)
	);

enable_reg ch19_enable_reg(
	.clk(clk),
	.GlobalReset(GlobalReset),
	.enable(enable[19]),
	.in(in),
	.out(ch19_x_lin)
	);

enable_reg ch20_enable_reg(
	.clk(clk),
	.GlobalReset(GlobalReset),
	.enable(enable[20]),
	.in(in),
	.out(ch20_x_lin)
	);

enable_reg ch21_enable_reg(
	.clk(clk),
	.GlobalReset(GlobalReset),
	.enable(enable[21]),
	.in(in),
	.out(ch21_x_lin)
	);

enable_reg ch22_enable_reg(
	.clk(clk),
	.GlobalReset(GlobalReset),
	.enable(enable[22]),
	.in(in),
	.out(ch22_x_lin)
	);

enable_reg ch23_enable_reg(
	.clk(clk),
	.GlobalReset(GlobalReset),
	.enable(enable[23]),
	.in(in),
	.out(ch23_x_lin)
	);

enable_reg ch24_enable_reg(
	.clk(clk),
	.GlobalReset(GlobalReset),
	.enable(enable[24]),
	.in(in),
	.out(ch24_x_lin)
	);

enable_reg ch25_enable_reg(
	.clk(clk),
	.GlobalReset(GlobalReset),
	.enable(enable[25]),
	.in(in),
	.out(ch25_x_lin)
	);

enable_reg ch26_enable_reg(
	.clk(clk),
	.GlobalReset(GlobalReset),
	.enable(enable[26]),
	.in(in),
	.out(ch26_x_lin)
	);

enable_reg ch27_enable_reg(
	.clk(clk),
	.GlobalReset(GlobalReset),
	.enable(enable[27]),
	.in(in),
	.out(ch27_x_lin)
	);

enable_reg ch28_enable_reg(
	.clk(clk),
	.GlobalReset(GlobalReset),
	.enable(enable[28]),
	.in(in),
	.out(ch28_x_lin)
	);

enable_reg ch29_enable_reg(
	.clk(clk),
	.GlobalReset(GlobalReset),
	.enable(enable[29]),
	.in(in),
	.out(ch29_x_lin)
	);

enable_reg ch30_enable_reg(
	.clk(clk),
	.GlobalReset(GlobalReset),
	.enable(enable[30]),
	.in(in),
	.out(ch30_x_lin)
	);

enable_reg ch31_enable_reg(
	.clk(clk),
	.GlobalReset(GlobalReset),
	.enable(enable[31]),
	.in(in),
	.out(ch31_x_lin)
	);

////////////////////////////////////////////////////////////////
//  Combinational Logic

////////////////////////////////////////////////////////////////
//  Registers

endmodule
