////////////////////////////////////////////////////////////////
//
// Module: x_adc_valid.v
// Author: Jordi Burbano, Hyunseok Park
//         jburbanoalgarte@gmail.com
//		   hnskpark@gmail.com
//		 
//
// Description:
//      when srdyi is asserted, 32 21-bit registers
//		become transparent to incoming x_adc signals
//		latency 1 cycle
//
// Parameters:
//      
//
// Inputs [bit width]:
//	clk
//	GlobalReset
//
//	srdyi
//
//	x_adc_0 [20:0]
//	x_adc_1 [20:0]
//  x_adc_2 [20:0]
//  x_adc_3 [20:0]
//  x_adc_4 [20:0]
//  x_adc_5 [20:0]
//  x_adc_6 [20:0]
//  x_adc_7 [20:0]
//  x_adc_8 [20:0]
//  x_adc_9 [20:0]
//  x_adc_10 [20:0]
//  x_adc_11 [20:0]
//  x_adc_12 [20:0]
//  x_adc_13 [20:0]
//  x_adc_14 [20:0]
//  x_adc_15 [20:0]
//  ...
//  x_adc_31 [20:0]
//
// Outputs [bit width]:
//	x_adc_valid_0 [20:0]
//	...
//	x_adc_valid_31 [20:0]
////////////////////////////////////////////////////////////////

module x_adc_valid ( 
	clk,
	GlobalReset,
	srdyi,
    x_adc_0,
	x_adc_1,
	x_adc_2,
	x_adc_3,
	x_adc_4,
	x_adc_5,
	x_adc_6,
	x_adc_7,
	x_adc_8,
	x_adc_9,
	x_adc_10,
	x_adc_11,
	x_adc_12,
	x_adc_13,
	x_adc_14,
	x_adc_15,
	x_adc_16,
	x_adc_17,
	x_adc_18,
	x_adc_19,
	x_adc_20,
	x_adc_21,
	x_adc_22,
	x_adc_23,
	x_adc_24,
	x_adc_25,
	x_adc_26,
	x_adc_27,
	x_adc_28,
	x_adc_29,
	x_adc_30,
	x_adc_31,
    x_adc_valid_0,
	x_adc_valid_1,
	x_adc_valid_2,
	x_adc_valid_3,
	x_adc_valid_4,
	x_adc_valid_5,
	x_adc_valid_6,
	x_adc_valid_7,
	x_adc_valid_8,
	x_adc_valid_9,
	x_adc_valid_10,
	x_adc_valid_11,
	x_adc_valid_12,
	x_adc_valid_13,
	x_adc_valid_14,
	x_adc_valid_15,
	x_adc_valid_16,
	x_adc_valid_17,
	x_adc_valid_18,
	x_adc_valid_19,
	x_adc_valid_20,
	x_adc_valid_21,
	x_adc_valid_22,
	x_adc_valid_23,
	x_adc_valid_24,
	x_adc_valid_25,
	x_adc_valid_26,
	x_adc_valid_27,
	x_adc_valid_28,
	x_adc_valid_29,
	x_adc_valid_30,
	x_adc_valid_31
    );

////////////////////////////////////////////////////////////////
//  Inputs & Outputs
input clk;
input GlobalReset;

input srdyi;

input [20:0] x_adc_0;
input [20:0] x_adc_1;
input [20:0] x_adc_2;
input [20:0] x_adc_3;
input [20:0] x_adc_4;
input [20:0] x_adc_5;
input [20:0] x_adc_6;
input [20:0] x_adc_7;
input [20:0] x_adc_8;
input [20:0] x_adc_9;
input [20:0] x_adc_10;
input [20:0] x_adc_11;
input [20:0] x_adc_12;
input [20:0] x_adc_13;
input [20:0] x_adc_14;
input [20:0] x_adc_15;
input [20:0] x_adc_16;
input [20:0] x_adc_17;
input [20:0] x_adc_18;
input [20:0] x_adc_19;
input [20:0] x_adc_20;
input [20:0] x_adc_21;
input [20:0] x_adc_22;
input [20:0] x_adc_23;
input [20:0] x_adc_24;
input [20:0] x_adc_25;
input [20:0] x_adc_26;
input [20:0] x_adc_27;
input [20:0] x_adc_28;
input [20:0] x_adc_29;
input [20:0] x_adc_30;
input [20:0] x_adc_31;

output reg [20:0] x_adc_valid_0;
output reg [20:0] x_adc_valid_1;
output reg [20:0] x_adc_valid_2;
output reg [20:0] x_adc_valid_3;
output reg [20:0] x_adc_valid_4;
output reg [20:0] x_adc_valid_5;
output reg [20:0] x_adc_valid_6;
output reg [20:0] x_adc_valid_7;
output reg [20:0] x_adc_valid_8;
output reg [20:0] x_adc_valid_9;
output reg [20:0] x_adc_valid_10;
output reg [20:0] x_adc_valid_11;
output reg [20:0] x_adc_valid_12;
output reg [20:0] x_adc_valid_13;
output reg [20:0] x_adc_valid_14;
output reg [20:0] x_adc_valid_15;
output reg [20:0] x_adc_valid_16;
output reg [20:0] x_adc_valid_17;
output reg [20:0] x_adc_valid_18;
output reg [20:0] x_adc_valid_19;
output reg [20:0] x_adc_valid_20;
output reg [20:0] x_adc_valid_21;
output reg [20:0] x_adc_valid_22;
output reg [20:0] x_adc_valid_23;
output reg [20:0] x_adc_valid_24;
output reg [20:0] x_adc_valid_25;
output reg [20:0] x_adc_valid_26;
output reg [20:0] x_adc_valid_27;
output reg [20:0] x_adc_valid_28;
output reg [20:0] x_adc_valid_29;
output reg [20:0] x_adc_valid_30;
output reg [20:0] x_adc_valid_31;
	
////////////////////////////////////////////////////////////////
//  reg & wire declarations

////////////////////////////////////////////////////////////////
//  Modules


////////////////////////////////////////////////////////////////
//  Registers

always @(posedge clk) begin
    if (GlobalReset == 1'b1) begin
		x_adc_valid_0     <= 21'd0;
		x_adc_valid_1     <= 21'd0;
		x_adc_valid_2     <= 21'd0;
		x_adc_valid_3     <= 21'd0;
		x_adc_valid_4     <= 21'd0;
		x_adc_valid_5     <= 21'd0;
		x_adc_valid_6     <= 21'd0;
		x_adc_valid_7     <= 21'd0;
		x_adc_valid_8     <= 21'd0;
		x_adc_valid_9     <= 21'd0;
		x_adc_valid_10    <= 21'd0;
		x_adc_valid_11    <= 21'd0;
		x_adc_valid_12    <= 21'd0;
		x_adc_valid_13    <= 21'd0;
		x_adc_valid_14    <= 21'd0;
		x_adc_valid_15    <= 21'd0;
		x_adc_valid_16    <= 21'd0;
		x_adc_valid_17    <= 21'd0;
		x_adc_valid_18    <= 21'd0;
		x_adc_valid_19    <= 21'd0;
		x_adc_valid_20    <= 21'd0;
		x_adc_valid_21    <= 21'd0;
		x_adc_valid_22    <= 21'd0;
		x_adc_valid_23    <= 21'd0;
		x_adc_valid_24    <= 21'd0;
		x_adc_valid_25    <= 21'd0;
		x_adc_valid_26    <= 21'd0;
		x_adc_valid_27    <= 21'd0;
		x_adc_valid_28    <= 21'd0;
		x_adc_valid_29    <= 21'd0;
		x_adc_valid_30    <= 21'd0;
		x_adc_valid_31    <= 21'd0;
    end
    else begin
		if (srdyi == 1'b1) begin
			x_adc_valid_0     <= x_adc_0;
			x_adc_valid_1     <= x_adc_1;
			x_adc_valid_2     <= x_adc_2;
			x_adc_valid_3     <= x_adc_3;
			x_adc_valid_4     <= x_adc_4;
			x_adc_valid_5     <= x_adc_5;
			x_adc_valid_6     <= x_adc_6;
			x_adc_valid_7     <= x_adc_7;
			x_adc_valid_8     <= x_adc_8;
			x_adc_valid_9     <= x_adc_9;
			x_adc_valid_10    <= x_adc_10;
			x_adc_valid_11    <= x_adc_11;
			x_adc_valid_12    <= x_adc_12;
			x_adc_valid_13    <= x_adc_13;
			x_adc_valid_14    <= x_adc_14;
			x_adc_valid_15    <= x_adc_15;
			x_adc_valid_16    <= x_adc_16;
			x_adc_valid_17    <= x_adc_17;
			x_adc_valid_18    <= x_adc_18;
			x_adc_valid_19    <= x_adc_19;
			x_adc_valid_20    <= x_adc_20;
			x_adc_valid_21    <= x_adc_21;
			x_adc_valid_22    <= x_adc_22;
			x_adc_valid_23    <= x_adc_23;
			x_adc_valid_24    <= x_adc_24;
			x_adc_valid_25    <= x_adc_25;
			x_adc_valid_26    <= x_adc_26;
			x_adc_valid_27    <= x_adc_27;
			x_adc_valid_28    <= x_adc_28;
			x_adc_valid_29    <= x_adc_29;
			x_adc_valid_30    <= x_adc_30;
			x_adc_valid_31    <= x_adc_31;
		end
    end
end

endmodule
