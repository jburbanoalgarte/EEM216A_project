////////////////////////////////////////////////////////////////
//
// Module: delay_Z21.v
// Author: Jordi Burbano
//         jburbanoalgarte@gmail.com
//
// Description:
//      21-delay
//		latency 21 cycles
//
// Parameters:
//      
//
// Inputs [bit width]:
//	clk
//	GlobalReset
//	in	[31:0]
//
// Outputs [bit width]:
//	out [31:0]
////////////////////////////////////////////////////////////////

module delay_Z21 ( 
	clk,
	GlobalReset,
	in,
	out
    );

////////////////////////////////////////////////////////////////
//  Inputs & Outputs
input clk;
input GlobalReset;

input [31:0] in;

output [31:0] out;
	
////////////////////////////////////////////////////////////////
//  reg & wire declarations
wire [31:0] reg1_w;
wire [31:0] reg2_w;
wire [31:0] reg3_w;
wire [31:0] reg4_w;
wire [31:0] reg5_w;
wire [31:0] reg6_w;
wire [31:0] reg7_w;
wire [31:0] reg8_w;
wire [31:0] reg9_w;
wire [31:0] reg10_w;
wire [31:0] reg11_w;
wire [31:0] reg12_w;
wire [31:0] reg13_w;
wire [31:0] reg14_w;
wire [31:0] reg15_w;
wire [31:0] reg16_w;
wire [31:0] reg17_w;
wire [31:0] reg18_w;
wire [31:0] reg19_w;
wire [31:0] reg20_w;

////////////////////////////////////////////////////////////////
//  Modules

delay_Z1 reg1(
	.clk(clk),
	.GlobalReset(GlobalReset),
	.in(in),
	.out(reg1_w)
	);

delay_Z1 reg2(
	.clk(clk),
	.GlobalReset(GlobalReset),
	.in(reg1_w),
	.out(reg2_w)
	);

delay_Z1 reg3(
	.clk(clk),
	.GlobalReset(GlobalReset),
	.in(reg2_w),
	.out(reg3_w)
	);

delay_Z1 reg4(
	.clk(clk),
	.GlobalReset(GlobalReset),
	.in(reg3_w),
	.out(reg4_w)
	);

delay_Z1 reg5(
	.clk(clk),
	.GlobalReset(GlobalReset),
	.in(reg4_w),
	.out(reg5_w)
	);

delay_Z1 reg6(
	.clk(clk),
	.GlobalReset(GlobalReset),
	.in(reg5_w),
	.out(reg6_w)
	);

delay_Z1 reg7(
	.clk(clk),
	.GlobalReset(GlobalReset),
	.in(reg6_w),
	.out(reg7_w)
	);

delay_Z1 reg8(
	.clk(clk),
	.GlobalReset(GlobalReset),
	.in(reg7_w),
	.out(reg8_w)
	);

delay_Z1 reg9(
	.clk(clk),
	.GlobalReset(GlobalReset),
	.in(reg8_w),
	.out(reg9_w)
	);

delay_Z1 reg10(
	.clk(clk),
	.GlobalReset(GlobalReset),
	.in(reg9_w),
	.out(reg10_w)
	);

delay_Z1 reg11(
	.clk(clk),
	.GlobalReset(GlobalReset),
	.in(reg10_w),
	.out(reg11_w)
	);

delay_Z1 reg12(
	.clk(clk),
	.GlobalReset(GlobalReset),
	.in(reg11_w),
	.out(reg12_w)
	);

delay_Z1 reg13(
	.clk(clk),
	.GlobalReset(GlobalReset),
	.in(reg12_w),
	.out(reg13_w)
	);

delay_Z1 reg14(
	.clk(clk),
	.GlobalReset(GlobalReset),
	.in(reg13_w),
	.out(reg14_w)
	);

delay_Z1 reg15(
	.clk(clk),
	.GlobalReset(GlobalReset),
	.in(reg14_w),
	.out(reg15_w)
	);

delay_Z1 reg16(
	.clk(clk),
	.GlobalReset(GlobalReset),
	.in(reg15_w),
	.out(reg16_w)
	);

delay_Z1 reg17(
	.clk(clk),
	.GlobalReset(GlobalReset),
	.in(reg16_w),
	.out(reg17_w)
	);

delay_Z1 reg18(
	.clk(clk),
	.GlobalReset(GlobalReset),
	.in(reg17_w),
	.out(reg18_w)
	);

delay_Z1 reg19(
	.clk(clk),
	.GlobalReset(GlobalReset),
	.in(reg18_w),
	.out(reg19_w)
	);

delay_Z1 reg20(
	.clk(clk),
	.GlobalReset(GlobalReset),
	.in(reg19_w),
	.out(reg20_w)
	);

delay_Z1 reg21(
	.clk(clk),
	.GlobalReset(GlobalReset),
	.in(reg20_w),
	.out(out)
	);

////////////////////////////////////////////////////////////////
//  Combinational Logic

////////////////////////////////////////////////////////////////
//  Registers

endmodule
