////////////////////////////////////////////////////////////////
//
// Module: NLC_1ch_1.v
// Author: Jordi Burbano
//         jburbanoalgarte@gmail.com
//
// Description:
//	Unoptimized 1-channel NLC

////////////////////////////////////////////////////////////////

module NLC_1ch_1 (
  //System clock and reset
  clk,
  reset,
  
  //ADC output
  srdyi, 
  x_lin,

  //NLC output
  srdyo, 
  x_adc, 

  //X-value that separates the sections
  section_limit,

  //Reciprocal standard deviation for the centered and scaled fit
  recip_stdev_4, 
  recip_stdev_3, 
  recip_stdev_2, 
  recip_stdev_1, 

  //Negative meand for the centered and scaled fit
  neg_mean_4, 
  neg_mean_3, 
  neg_mean_2, 
  neg_mean_1, 

  //Section 4 coefficients (x > 0, |x| > section_limit)
  coeff_4_10, 
  coeff_4_9, 
  coeff_4_8, 
  coeff_4_7, 
  coeff_4_6, 
  coeff_4_5, 
  coeff_4_4, 
  coeff_4_3, 
  coeff_4_2, 
  coeff_4_1, 
  coeff_4_0, 

  //Section 3 coefficients (x > 0, |x| <= section_limit)
  coeff_3_10, 
  coeff_3_9, 
  coeff_3_8, 
  coeff_3_7, 
  coeff_3_6, 
  coeff_3_5, 
  coeff_3_4, 
  coeff_3_3, 
  coeff_3_2, 
  coeff_3_1, 
  coeff_3_0, 

  //Section 2 coefficients (x <= 0, |x| <= section_limit)
  coeff_2_10, 
  coeff_2_9, 
  coeff_2_8, 
  coeff_2_7, 
  coeff_2_6, 
  coeff_2_5, 
  coeff_2_4, 
  coeff_2_3, 
  coeff_2_2, 
  coeff_2_1, 
  coeff_2_0, 

  //Section 1 coefficients (x <= 0, |x| > section_limit)
  coeff_1_10, 
  coeff_1_9, 
  coeff_1_8, 
  coeff_1_7, 
  coeff_1_6, 
  coeff_1_5, 
  coeff_1_4, 
  coeff_1_3, 
  coeff_1_2, 
  coeff_1_1, 
  coeff_1_0
);

////////////////////////////////////////////////////////////////
//  Inputs & Outputs
input clk;
input reset;
  
  //ADC output
input srdyi; 
output [20:0] x_lin;

  //NLC output
output srdyo; 
input [20:0] x_adc; 

  //X-value that separates the sections
input [19:0] section_limit;

  //Reciprocal standard deviation for the centered and scaled fit
input [31:0] recip_stdev_4; 
input [31:0] recip_stdev_3; 
input [31:0] recip_stdev_2; 
input [31:0] recip_stdev_1; 

  //Negative meand for the centered and scaled fit
input [31:0] neg_mean_4; 
input [31:0] neg_mean_3; 
input [31:0] neg_mean_2; 
input [31:0] neg_mean_1; 

  //Section 4 coefficients (x > 0, |x| > section_limit)
input [31:0] coeff_4_10; 
input [31:0] coeff_4_9; 
input [31:0] coeff_4_8; 
input [31:0] coeff_4_7; 
input [31:0] coeff_4_6; 
input [31:0] coeff_4_5; 
input [31:0] coeff_4_4; 
input [31:0] coeff_4_3; 
input [31:0] coeff_4_2; 
input [31:0] coeff_4_1; 
input [31:0] coeff_4_0; 

  //Section 3 coefficients (x > 0, |x| <= section_limit)
input [31:0] coeff_3_10; 
input [31:0] coeff_3_9; 
input [31:0] coeff_3_8; 
input [31:0] coeff_3_7; 
input [31:0] coeff_3_6; 
input [31:0] coeff_3_5; 
input [31:0] coeff_3_4; 
input [31:0] coeff_3_3; 
input [31:0] coeff_3_2; 
input [31:0] coeff_3_1; 
input [31:0] coeff_3_0; 

  //Section 2 coefficients (x <= 0, |x| <= section_limit)
input [31:0] coeff_2_10; 
input [31:0] coeff_2_9; 
input [31:0] coeff_2_8; 
input [31:0] coeff_2_7; 
input [31:0] coeff_2_6; 
input [31:0] coeff_2_5; 
input [31:0] coeff_2_4; 
input [31:0] coeff_2_3; 
input [31:0] coeff_2_2; 
input [31:0] coeff_2_1; 
input [31:0] coeff_2_0; 

//Section 1 coefficients (x <= 0, |x| > section_limit)
input [31:0] coeff_1_10; 
input [31:0] coeff_1_9; 
input [31:0] coeff_1_8; 
input [31:0] coeff_1_7; 
input [31:0] coeff_1_6; 
input [31:0] coeff_1_5; 
input [31:0] coeff_1_4; 
input [31:0] coeff_1_3; 
input [31:0] coeff_1_2; 
input [31:0] coeff_1_1;
input [31:0] coeff_1_0;
	
////////////////////////////////////////////////////////////////
//  reg & wire declarations
// centerScale
wire [31:0] x_centScale;
wire srdyo_o;
wire [20:0] x_adc_valid;

// comparator
wire [31:0] coeff0;
wire [31:0] coeff1;
wire [31:0] coeff2;
wire [31:0] coeff3;
wire [31:0] coeff4;
wire [31:0] coeff5;
wire [31:0] coeff6;
wire [31:0] coeff7;
wire [31:0] coeff8;
wire [31:0] coeff9;
wire [31:0] coeff10;
wire [31:0] mean;
wire [31:0] std;

// mux
wire [3:0] coeff_select;
wire [31:0] coeff;

// hornerLoop
wire sum_en;
wire sum_rst;

////////////////////////////////////////////////////////////////
//  Modules
centerScale2 theCenterScale( 
    .GlobalReset(reset),
	.clk(clk),
	.x_adc(x_adc),
	.srdyi(srdyi),
	.mean(mean),
	.std(std),
	.x_centScale(x_centScale),
	.srdyo_o(srdyo_o),
	.x_adc_valid(x_adc_valid)
    );
	
comparator theComparator( 
	.clk(clk),
	.GlobalReset(reset),
    .x_adc_valid(x_adc_valid),
	.section_limit(section_limit),
	.coeff1_0(coeff_1_0),
	.coeff1_1(coeff_1_1),
	.coeff1_2(coeff_1_2),
	.coeff1_3(coeff_1_3),
	.coeff1_4(coeff_1_4),
	.coeff1_5(coeff_1_5),
	.coeff1_6(coeff_1_6),
	.coeff1_7(coeff_1_7),
	.coeff1_8(coeff_1_8),
	.coeff1_9(coeff_1_9),
	.coeff1_10(coeff_1_10),
	.mean1(neg_mean_1),
	.std1(recip_stdev_1),
	.coeff2_0(coeff_2_0),
	.coeff2_1(coeff_2_1),
	.coeff2_2(coeff_2_2),
	.coeff2_3(coeff_2_3),
	.coeff2_4(coeff_2_4),
	.coeff2_5(coeff_2_5),
	.coeff2_6(coeff_2_6),
	.coeff2_7(coeff_2_7),
	.coeff2_8(coeff_2_8),
	.coeff2_9(coeff_2_9),
	.coeff2_10(coeff_2_10),
	.mean2(neg_mean_2),
	.std2(recip_stdev_2),
	.coeff3_0(coeff_3_0),
	.coeff3_1(coeff_3_1),
	.coeff3_2(coeff_3_2),
	.coeff3_3(coeff_3_3),
	.coeff3_4(coeff_3_4),
	.coeff3_5(coeff_3_5),
	.coeff3_6(coeff_3_6),
	.coeff3_7(coeff_3_7),
	.coeff3_8(coeff_3_8),
	.coeff3_9(coeff_3_9),
	.coeff3_10(coeff_3_10),
	.mean3(neg_mean_3),
	.std3(recip_stdev_3),
	.coeff4_0(coeff_4_0),
	.coeff4_1(coeff_4_1),
	.coeff4_2(coeff_4_2),
	.coeff4_3(coeff_4_3),
	.coeff4_4(coeff_4_4),
	.coeff4_5(coeff_4_5),
	.coeff4_6(coeff_4_6),
	.coeff4_7(coeff_4_7),
	.coeff4_8(coeff_4_8),
	.coeff4_9(coeff_4_9),
	.coeff4_10(coeff_4_10),
	.mean4(neg_mean_4),
	.std4(recip_stdev_4),
	.coeff0(coeff0),
	.coeff1(coeff1),
	.coeff2(coeff2),
	.coeff3(coeff3),
	.coeff4(coeff4),
	.coeff5(coeff5),
	.coeff6(coeff6),
	.coeff7(coeff7),
	.coeff8(coeff8),
	.coeff9(coeff9),
	.coeff10(coeff10),
	.mean(mean),
	.std(std)
    );

mux theMux( 
	.clk(clk),
	.GlobalReset(reset),
    .coeff0(coeff0),
    .coeff1(coeff1),
    .coeff2(coeff2),
    .coeff3(coeff3),
    .coeff4(coeff4),
    .coeff5(coeff5),
    .coeff6(coeff6),
    .coeff7(coeff7),
    .coeff8(coeff8),
    .coeff9(coeff9),
    .coeff10(coeff10),
	.coeff_select(coeff_select),
	.coeff(coeff)
    );
	
hornerLoop theHornerLoop( 
    .GlobalReset(reset),
	.clk(clk),
	.x_adc_smc(x_centScale),
	.srdyi_i(srdyo_o),
	.coeff(coeff),
	.sum_en(sum_en),
	.sum_rst(sum_rst),
	.x_lin(x_lin)
    );
	
control theControl( 
    .GlobalReset(reset),
	.clk(clk),
	.srdyi(srdyi),
	.coeff_sel(coeff_select),
	.sum_rst(sum_rst),
	.sum_en(sum_en),
	.srdyo(srdyo)/*,
	cnt*/ //used only for testbench
    );
	
////////////////////////////////////////////////////////////////
//  Combinational Logic

////////////////////////////////////////////////////////////////
//  Registers

endmodule
