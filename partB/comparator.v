////////////////////////////////////////////////////////////////
//
// Module: comparator.v
// Author: Jordi Burbano
//         jburbanoalgarte@gmail.com
//
// Description:
//      Incoming x_adc_latched[20:0] is examined to determine appropriate section coefficients, mean, std
//		latency 1 cycle
//
// Parameters:
//      
//
// Inputs [bit width]:
//	clk
//	GlobalReset
//	x_adc_latched [20:0]: incoming IEEE floating point adc sample
//	section_limit [19:0]: used in comparison for determining section
//	coeff1_0 [31:0]
//	coeff1_1 [31:0]
//	... coeff1_10[31:0]
//	... coeff4_10[31:0]
//	mean1 [31:0]
//	... mean4 [31:0]
//	std1 [31:0]
//	... std4 [31:0]	
//
// Outputs [bit width]:
//	coeff0 [31:0]
//	... coeff10 [31:0]
//	mean [31:0]
//	std [31:0]
//	Note: here mean and std are actually negated and reciprocated, respectively
////////////////////////////////////////////////////////////////

module comparator ( 
	clk,
	GlobalReset,
    x_adc_latched,
	section_limit,
	coeff1_0,
	coeff1_1,
	coeff1_2,
	coeff1_3,
	coeff1_4,
	coeff1_5,
	coeff1_6,
	coeff1_7,
	coeff1_8,
	coeff1_9,
	coeff1_10,
	mean1,
	std1,
	coeff2_0,
	coeff2_1,
	coeff2_2,
	coeff2_3,
	coeff2_4,
	coeff2_5,
	coeff2_6,
	coeff2_7,
	coeff2_8,
	coeff2_9,
	coeff2_10,
	mean2,
	std2,
	coeff3_0,
	coeff3_1,
	coeff3_2,
	coeff3_3,
	coeff3_4,
	coeff3_5,
	coeff3_6,
	coeff3_7,
	coeff3_8,
	coeff3_9,
	coeff3_10,
	mean3,
	std3,
	coeff4_0,
	coeff4_1,
	coeff4_2,
	coeff4_3,
	coeff4_4,
	coeff4_5,
	coeff4_6,
	coeff4_7,
	coeff4_8,
	coeff4_9,
	coeff4_10,
	mean4,
	std4,
	coeff0,
	coeff1,
	coeff2,
	coeff3,
	coeff4,
	coeff5,
	coeff6,
	coeff7,
	coeff8,
	coeff9,
	coeff10,
	mean,
	std
    );

////////////////////////////////////////////////////////////////
//  Inputs & Outputs
input clk;
input GlobalReset;

input [20:0] x_adc_latched;
input [19:0] section_limit;

input [31:0] coeff1_0;
input [31:0] coeff1_1;
input [31:0] coeff1_2;
input [31:0] coeff1_3;
input [31:0] coeff1_4;
input [31:0] coeff1_5;
input [31:0] coeff1_6;
input [31:0] coeff1_7;
input [31:0] coeff1_8;
input [31:0] coeff1_9;
input [31:0] coeff1_10;
input [31:0] mean1;
input [31:0] std1;

input [31:0] coeff2_0;
input [31:0] coeff2_1;
input [31:0] coeff2_2;
input [31:0] coeff2_3;
input [31:0] coeff2_4;
input [31:0] coeff2_5;
input [31:0] coeff2_6;
input [31:0] coeff2_7;
input [31:0] coeff2_8;
input [31:0] coeff2_9;
input [31:0] coeff2_10;
input [31:0] mean2;
input [31:0] std2;

input [31:0] coeff3_0;
input [31:0] coeff3_1;
input [31:0] coeff3_2;
input [31:0] coeff3_3;
input [31:0] coeff3_4;
input [31:0] coeff3_5;
input [31:0] coeff3_6;
input [31:0] coeff3_7;
input [31:0] coeff3_8;
input [31:0] coeff3_9;
input [31:0] coeff3_10;
input [31:0] mean3;
input [31:0] std3;

input [31:0] coeff4_0;
input [31:0] coeff4_1;
input [31:0] coeff4_2;
input [31:0] coeff4_3;
input [31:0] coeff4_4;
input [31:0] coeff4_5;
input [31:0] coeff4_6;
input [31:0] coeff4_7;
input [31:0] coeff4_8;
input [31:0] coeff4_9;
input [31:0] coeff4_10;
input [31:0] mean4;
input [31:0] std4;

output reg [31:0] coeff0;
output reg [31:0] coeff1;
output reg [31:0] coeff2;
output reg [31:0] coeff3;
output reg [31:0] coeff4;
output reg [31:0] coeff5;
output reg [31:0] coeff6;
output reg [31:0] coeff7;
output reg [31:0] coeff8;
output reg [31:0] coeff9;
output reg [31:0] coeff10;
output reg [31:0] mean;
output reg [31:0] std;
	
////////////////////////////////////////////////////////////////
//  reg & wire declarations
reg [31:0] absx; //stores absolute value of x_adc_latched

reg [31:0] coeff0_r;
reg [31:0] coeff1_r;
reg [31:0] coeff2_r;
reg [31:0] coeff3_r;
reg [31:0] coeff4_r;
reg [31:0] coeff5_r;
reg [31:0] coeff6_r;
reg [31:0] coeff7_r;
reg [31:0] coeff8_r;
reg [31:0] coeff9_r;
reg [31:0] coeff10_r;
reg [31:0] mean_r;
reg [31:0] std_r;

////////////////////////////////////////////////////////////////
//  Modules


////////////////////////////////////////////////////////////////
//  Combinational Logic

always @( * ) begin
	absx = ( x_adc_latched[20] ? ( (x_adc_latched ^ 21'hFFFFFF) + 21'b1 ) : (x_adc_latched) );
	absx = absx[19:0];
	
	if ( x_adc_latched[20] ) begin
		if ( absx > section_limit ) begin
			coeff0_r = coeff1_0;
			coeff1_r = coeff1_1;
			coeff2_r = coeff1_2;
			coeff3_r = coeff1_3;
			coeff4_r = coeff1_4;
			coeff5_r = coeff1_5;
			coeff6_r = coeff1_6;
			coeff7_r = coeff1_7;
			coeff8_r = coeff1_8;
			coeff9_r = coeff1_9;
			coeff10_r = coeff1_10;
			mean_r = mean1;
			std_r = std1;
		end
		else begin
			coeff0_r = coeff2_0;
			coeff1_r = coeff2_1;
			coeff2_r = coeff2_2;
			coeff3_r = coeff2_3;
			coeff4_r = coeff2_4;
			coeff5_r = coeff2_5;
			coeff6_r = coeff2_6;
			coeff7_r = coeff2_7;
			coeff8_r = coeff2_8;
			coeff9_r = coeff2_9;
			coeff10_r = coeff2_10;
			mean_r = mean2;
			std_r = std2;
		end
	end
	else begin
		if ( absx <= section_limit ) begin
			coeff0_r = coeff3_0;
			coeff1_r = coeff3_1;
			coeff2_r = coeff3_2;
			coeff3_r = coeff3_3;
			coeff4_r = coeff3_4;
			coeff5_r = coeff3_5;
			coeff6_r = coeff3_6;
			coeff7_r = coeff3_7;
			coeff8_r = coeff3_8;
			coeff9_r = coeff3_9;
			coeff10_r = coeff3_10;
			mean_r = mean3;
			std_r = std3;
		end
		else begin
			coeff0_r = coeff4_0;
			coeff1_r = coeff4_1;
			coeff2_r = coeff4_2;
			coeff3_r = coeff4_3;
			coeff4_r = coeff4_4;
			coeff5_r = coeff4_5;
			coeff6_r = coeff4_6;
			coeff7_r = coeff4_7;
			coeff8_r = coeff4_8;
			coeff9_r = coeff4_9;
			coeff10_r = coeff4_10;
			mean_r = mean4;
			std_r = std4;
		end
	end
end

////////////////////////////////////////////////////////////////
//  Registers
always @(posedge clk) begin
    if (GlobalReset == 1'b1) begin
		coeff0 <= coeff1_0;
		coeff1 <= coeff1_1;
		coeff2 <= coeff1_2;
		coeff3 <= coeff1_3;
		coeff4 <= coeff1_4;
		coeff5 <= coeff1_5;
		coeff6 <= coeff1_6;
		coeff7 <= coeff1_7;
		coeff8 <= coeff1_8;
		coeff9 <= coeff1_9;
		coeff10 <= coeff1_10;
		mean <= mean1;
		std <= std1;
    end
	else begin
		coeff0 <= coeff0_r;
		coeff1 <= coeff1_r;
		coeff2 <= coeff2_r;
		coeff3 <= coeff3_r;
		coeff4 <= coeff4_r;
		coeff5 <= coeff5_r;
		coeff6 <= coeff6_r;
		coeff7 <= coeff7_r;
		coeff8 <= coeff8_r;
		coeff9 <= coeff9_r;
		coeff10 <= coeff10_r;
		mean <= mean_r;
		std <= std_r;
	end
end

endmodule
