////////////////////////////////////////////////////////////////
//
// Module: NLC_1ch.v
// Author: Jordi Burbano
//         jburbanoalgarte@gmail.com
//
// Description:
//	Single channel NLC engine

//
// Parameters:
//      
//
// I/Os:
  // input clk,
  // input reset,
  // input [31:0] recip_stdev_4, // ufix32
  // input [31:0] recip_stdev_3, // ufix32
  // input [31:0] recip_stdev_2, // ufix32
  // input [31:0] recip_stdev_1, // ufix32
  // input [31:0] select_section_coefficients_mean_4_porty, // ufix32
  // input [31:0] select_section_coefficients_mean_3_porty, // ufix32
  // input [31:0] select_section_coefficients_mean_2_porty, // ufix32
  // input [31:0] select_section_coefficients_mean_1_porty, // ufix32
  // input [31:0] select_section_coefficients_coeff_4_9_porty, // ufix32
  // input [31:0] select_section_coefficients_coeff_4_8_porty, // ufix32
  // input [31:0] select_section_coefficients_coeff_4_7_porty, // ufix32
  // input [31:0] select_section_coefficients_coeff_4_6_porty, // ufix32
  // input [31:0] select_section_coefficients_coeff_4_5_porty, // ufix32
  // input [31:0] select_section_coefficients_coeff_4_4_porty, // ufix32
  // input [31:0] select_section_coefficients_coeff_4_3_porty, // ufix32
  // input [31:0] select_section_coefficients_coeff_4_2_porty, // ufix32
  // input [31:0] select_section_coefficients_coeff_4_10_porty, // ufix32
  // input [31:0] select_section_coefficients_coeff_4_1_porty, // ufix32
  // input [31:0] select_section_coefficients_coeff_4_0_porty, // ufix32
  // input [31:0] select_section_coefficients_coeff_3_9_porty, // ufix32
  // input [31:0] select_section_coefficients_coeff_3_8_porty, // ufix32
  // input [31:0] select_section_coefficients_coeff_3_7_porty, // ufix32
  // input [31:0] select_section_coefficients_coeff_3_6_porty, // ufix32
  // input [31:0] select_section_coefficients_coeff_3_5_porty, // ufix32
  // input [31:0] select_section_coefficients_coeff_3_4_porty, // ufix32
  // input [31:0] select_section_coefficients_coeff_3_3_porty, // ufix32
  // input [31:0] select_section_coefficients_coeff_3_2_porty, // ufix32
  // input [31:0] select_section_coefficients_coeff_3_10_porty, // ufix32
  // input [31:0] select_section_coefficients_coeff_3_1_porty, // ufix32
  // input [31:0] select_section_coefficients_coeff_3_0_porty, // ufix32
  // input [31:0] select_section_coefficients_coeff_2_9_porty, // ufix32
  // input [31:0] select_section_coefficients_coeff_2_8_porty, // ufix32
  // input [31:0] select_section_coefficients_coeff_2_7_porty, // ufix32
  // input [31:0] select_section_coefficients_coeff_2_6_porty, // ufix32
  // input [31:0] select_section_coefficients_coeff_2_5_porty, // ufix32
  // input [31:0] select_section_coefficients_coeff_2_4_porty, // ufix32
  // input [31:0] select_section_coefficients_coeff_2_3_porty, // ufix32
  // input [31:0] select_section_coefficients_coeff_2_2_porty, // ufix32
  // input [31:0] select_section_coefficients_coeff_2_10_porty, // ufix32
  // input [31:0] select_section_coefficients_coeff_2_1_porty, // ufix32
  // input [31:0] select_section_coefficients_coeff_2_0_porty, // ufix32
  // input [31:0] select_section_coefficients_coeff_1_9_porty, // ufix32
  // input [31:0] select_section_coefficients_coeff_1_8_porty, // ufix32
  // input [31:0] select_section_coefficients_coeff_1_7_porty, // ufix32
  // input [31:0] select_section_coefficients_coeff_1_6_porty, // ufix32
  // input [31:0] select_section_coefficients_coeff_1_5_porty, // ufix32
  // input [31:0] select_section_coefficients_coeff_1_4_porty, // ufix32
  // input [31:0] select_section_coefficients_coeff_1_3_porty, // ufix32
  // input [31:0] select_section_coefficients_coeff_1_2_porty, // ufix32
  // input [31:0] select_section_coefficients_coeff_1_10_porty, // ufix32
  // input [31:0] select_section_coefficients_coeff_1_1_porty, // ufix32
  // input [31:0] select_section_coefficients_coeff_1_0_porty, // ufix32
  // output [20:0] x_lin, // sfix21
  // input [20:0] x_adc, // sfix21
  // output srdyo, // ufix1
  // input srdyi, // ufix1
  // input [19:0] section_limit // ufix20
////////////////////////////////////////////////////////////////

module NLC_1ch (
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
  select_section_coefficients_mean_4_porty, 
  select_section_coefficients_mean_3_porty, 
  select_section_coefficients_mean_2_porty, 
  select_section_coefficients_mean_1_porty, 

  //Section 4 coefficients (x > 0, |x| > section_limit)
  select_section_coefficients_coeff_4_10_porty, 
  select_section_coefficients_coeff_4_9_porty, 
  select_section_coefficients_coeff_4_8_porty, 
  select_section_coefficients_coeff_4_7_porty, 
  select_section_coefficients_coeff_4_6_porty, 
  select_section_coefficients_coeff_4_5_porty, 
  select_section_coefficients_coeff_4_4_porty, 
  select_section_coefficients_coeff_4_3_porty, 
  select_section_coefficients_coeff_4_2_porty, 
  select_section_coefficients_coeff_4_1_porty, 
  select_section_coefficients_coeff_4_0_porty, 

  //Section 3 coefficients (x > 0, |x| <= section_limit)
  select_section_coefficients_coeff_3_10_porty, 
  select_section_coefficients_coeff_3_9_porty, 
  select_section_coefficients_coeff_3_8_porty, 
  select_section_coefficients_coeff_3_7_porty, 
  select_section_coefficients_coeff_3_6_porty, 
  select_section_coefficients_coeff_3_5_porty, 
  select_section_coefficients_coeff_3_4_porty, 
  select_section_coefficients_coeff_3_3_porty, 
  select_section_coefficients_coeff_3_2_porty, 
  select_section_coefficients_coeff_3_1_porty, 
  select_section_coefficients_coeff_3_0_porty, 

  //Section 2 coefficients (x <= 0, |x| <= section_limit)
  select_section_coefficients_coeff_2_10_porty, 
  select_section_coefficients_coeff_2_9_porty, 
  select_section_coefficients_coeff_2_8_porty, 
  select_section_coefficients_coeff_2_7_porty, 
  select_section_coefficients_coeff_2_6_porty, 
  select_section_coefficients_coeff_2_5_porty, 
  select_section_coefficients_coeff_2_4_porty, 
  select_section_coefficients_coeff_2_3_porty, 
  select_section_coefficients_coeff_2_2_porty, 
  select_section_coefficients_coeff_2_1_porty, 
  select_section_coefficients_coeff_2_0_porty, 

  //Section 1 coefficients (x <= 0, |x| > section_limit)
  select_section_coefficients_coeff_1_10_porty, 
  select_section_coefficients_coeff_1_9_porty, 
  select_section_coefficients_coeff_1_8_porty, 
  select_section_coefficients_coeff_1_7_porty, 
  select_section_coefficients_coeff_1_6_porty, 
  select_section_coefficients_coeff_1_5_porty, 
  select_section_coefficients_coeff_1_4_porty, 
  select_section_coefficients_coeff_1_3_porty, 
  select_section_coefficients_coeff_1_2_porty, 
  select_section_coefficients_coeff_1_1_porty, 
  select_section_coefficients_coeff_1_0_porty
);

////////////////////////////////////////////////////////////////
//  Inputs & Outputs
input clk;
input reset;
  
  //ADC output
input srdyi; 
output reg [20:0] x_lin;

  //NLC output
output reg srdyo; 
input [20:0] x_adc; 

  //X-value that separates the sections
input [19:0] section_limit;

  //Reciprocal standard deviation for the centered and scaled fit
input [31:0] recip_stdev_4; 
input [31:0] recip_stdev_3; 
input [31:0] recip_stdev_2; 
input [31:0] recip_stdev_1; 

  //Negative meand for the centered and scaled fit
input [31:0] select_section_coefficients_mean_4_porty; 
input [31:0] select_section_coefficients_mean_3_porty; 
input [31:0] select_section_coefficients_mean_2_porty; 
input [31:0] select_section_coefficients_mean_1_porty; 

  //Section 4 coefficients (x > 0, |x| > section_limit)
input [31:0] select_section_coefficients_coeff_4_10_porty; 
input [31:0] select_section_coefficients_coeff_4_9_porty; 
input [31:0] select_section_coefficients_coeff_4_8_porty; 
input [31:0] select_section_coefficients_coeff_4_7_porty; 
input [31:0] select_section_coefficients_coeff_4_6_porty; 
input [31:0] select_section_coefficients_coeff_4_5_porty; 
input [31:0] select_section_coefficients_coeff_4_4_porty; 
input [31:0] select_section_coefficients_coeff_4_3_porty; 
input [31:0] select_section_coefficients_coeff_4_2_porty; 
input [31:0] select_section_coefficients_coeff_4_1_porty; 
input [31:0] select_section_coefficients_coeff_4_0_porty; 

  //Section 3 coefficients (x > 0, |x| <= section_limit)
input [31:0] select_section_coefficients_coeff_3_10_porty; 
input [31:0] select_section_coefficients_coeff_3_9_porty; 
input [31:0] select_section_coefficients_coeff_3_8_porty; 
input [31:0] select_section_coefficients_coeff_3_7_porty; 
input [31:0] select_section_coefficients_coeff_3_6_porty; 
input [31:0] select_section_coefficients_coeff_3_5_porty; 
input [31:0] select_section_coefficients_coeff_3_4_porty; 
input [31:0] select_section_coefficients_coeff_3_3_porty; 
input [31:0] select_section_coefficients_coeff_3_2_porty; 
input [31:0] select_section_coefficients_coeff_3_1_porty; 
input [31:0] select_section_coefficients_coeff_3_0_porty; 

  //Section 2 coefficients (x <= 0, |x| <= section_limit)
input [31:0] select_section_coefficients_coeff_2_10_porty; 
input [31:0] select_section_coefficients_coeff_2_9_porty; 
input [31:0] select_section_coefficients_coeff_2_8_porty; 
input [31:0] select_section_coefficients_coeff_2_7_porty; 
input [31:0] select_section_coefficients_coeff_2_6_porty; 
input [31:0] select_section_coefficients_coeff_2_5_porty; 
input [31:0] select_section_coefficients_coeff_2_4_porty; 
input [31:0] select_section_coefficients_coeff_2_3_porty; 
input [31:0] select_section_coefficients_coeff_2_2_porty; 
input [31:0] select_section_coefficients_coeff_2_1_porty; 
input [31:0] select_section_coefficients_coeff_2_0_porty; 

//Section 1 coefficients (x <= 0, |x| > section_limit)
input [31:0] select_section_coefficients_coeff_1_10_porty; 
input [31:0] select_section_coefficients_coeff_1_9_porty; 
input [31:0] select_section_coefficients_coeff_1_8_porty; 
input [31:0] select_section_coefficients_coeff_1_7_porty; 
input [31:0] select_section_coefficients_coeff_1_6_porty; 
input [31:0] select_section_coefficients_coeff_1_5_porty; 
input [31:0] select_section_coefficients_coeff_1_4_porty; 
input [31:0] select_section_coefficients_coeff_1_3_porty; 
input [31:0] select_section_coefficients_coeff_1_2_porty; 
input [31:0] select_section_coefficients_coeff_1_1_porty;
input [31:0] select_section_coefficients_coeff_1_0_porty;
	
////////////////////////////////////////////////////////////////
//  reg & wire declarations
// centerScale
wire [31:0] x_centScale;
wire srdyo_o;
wire [20:0] x_adc_latched;

// comparator
wire [31:0] select_section_coefficients_coeff_0_porty;
wire [31:0] select_section_coefficients_coeff_1_porty;
wire [31:0] select_section_coefficients_coeff_2_porty;
wire [31:0] select_section_coefficients_coeff_3_porty;
wire [31:0] select_section_coefficients_coeff_4_porty;
wire [31:0] select_section_coefficients_coeff_5_porty;
wire [31:0] select_section_coefficients_coeff_6_porty;
wire [31:0] select_section_coefficients_coeff_7_porty;
wire [31:0] select_section_coefficients_coeff_8_porty;
wire [31:0] select_section_coefficients_coeff_9_porty;
wire [31:0] select_section_coefficients_coeff_10_porty;
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
centerScale theCenterScale( 
    .GlobalReset(reset),
	.clk(clk),
	.x_adc(x_adc),
	.srdyi(srdyi),
	.mean(mean),
	.std(std),
	.x_centScale(x_centScale),
	.srdyo_o(srdyo_o),
	.x_adc_latched(x_adc_latched)
    );
	
comparator theComparator( 
	.clk(clk),
	.GlobalReset(reset),
    .x_adc(x_adc_latched),
	.section_limit(section_limit),
	.coeff1_0(select_section_coefficients_coeff_1_0_porty),
	.coeff1_1(select_section_coefficients_coeff_1_1_porty),
	.coeff1_2(select_section_coefficients_coeff_1_2_porty),
	.coeff1_3(select_section_coefficients_coeff_1_3_porty),
	.coeff1_4(select_section_coefficients_coeff_1_4_porty),
	.coeff1_5(select_section_coefficients_coeff_1_5_porty),
	.coeff1_6(select_section_coefficients_coeff_1_6_porty),
	.coeff1_7(select_section_coefficients_coeff_1_7_porty),
	.coeff1_8(select_section_coefficients_coeff_1_8_porty),
	.coeff1_9(select_section_coefficients_coeff_1_9_porty),
	.coeff1_10(select_section_coefficients_coeff_1_10_porty),
	.mean1(select_section_coefficients_mean_1_porty),
	.std1(recip_stdev_1),
	.coeff2_0(select_section_coefficients_coeff_2_0_porty),
	.coeff2_1(select_section_coefficients_coeff_2_1_porty),
	.coeff2_2(select_section_coefficients_coeff_2_2_porty),
	.coeff2_3(select_section_coefficients_coeff_2_3_porty),
	.coeff2_4(select_section_coefficients_coeff_2_4_porty),
	.coeff2_5(select_section_coefficients_coeff_2_5_porty),
	.coeff2_6(select_section_coefficients_coeff_2_6_porty),
	.coeff2_7(select_section_coefficients_coeff_2_7_porty),
	.coeff2_8(select_section_coefficients_coeff_2_8_porty),
	.coeff2_9(select_section_coefficients_coeff_2_9_porty),
	.coeff2_10(select_section_coefficients_coeff_2_10_porty),
	.mean2(select_section_coefficients_mean_2_porty),
	.std2(recip_stdev_2),
	.coeff3_0(select_section_coefficients_coeff_3_0_porty),
	.coeff3_1(select_section_coefficients_coeff_3_1_porty),
	.coeff3_2(select_section_coefficients_coeff_3_2_porty),
	.coeff3_3(select_section_coefficients_coeff_3_3_porty),
	.coeff3_4(select_section_coefficients_coeff_3_4_porty),
	.coeff3_5(select_section_coefficients_coeff_3_5_porty),
	.coeff3_6(select_section_coefficients_coeff_3_6_porty),
	.coeff3_7(select_section_coefficients_coeff_3_7_porty),
	.coeff3_8(select_section_coefficients_coeff_3_8_porty),
	.coeff3_9(select_section_coefficients_coeff_3_9_porty),
	.coeff3_10(select_section_coefficients_coeff_3_10_porty),
	.mean3(select_section_coefficients_mean_3_porty),
	.std3(recip_stdev_3),
	.coeff4_0(select_section_coefficients_coeff_4_0_porty),
	.coeff4_1(select_section_coefficients_coeff_4_1_porty),
	.coeff4_2(select_section_coefficients_coeff_4_2_porty),
	.coeff4_3(select_section_coefficients_coeff_4_3_porty),
	.coeff4_4(select_section_coefficients_coeff_4_4_porty),
	.coeff4_5(select_section_coefficients_coeff_4_5_porty),
	.coeff4_6(select_section_coefficients_coeff_4_6_porty),
	.coeff4_7(select_section_coefficients_coeff_4_7_porty),
	.coeff4_8(select_section_coefficients_coeff_4_8_porty),
	.coeff4_9(select_section_coefficients_coeff_4_9_porty),
	.coeff4_10(select_section_coefficients_coeff_4_10_porty),
	.mean4(select_section_coefficients_mean_4_porty),
	.std4(recip_stdev_4),
	.select_section_coefficients_coeff_0_porty(select_section_coefficients_coeff_0_porty),
	.select_section_coefficients_coeff_1_porty(select_section_coefficients_coeff_1_porty),
	.select_section_coefficients_coeff_2_porty(select_section_coefficients_coeff_2_porty),
	.select_section_coefficients_coeff_3_porty(select_section_coefficients_coeff_3_porty),
	.select_section_coefficients_coeff_4_porty(select_section_coefficients_coeff_4_porty),
	.select_section_coefficients_coeff_5_porty(select_section_coefficients_coeff_5_porty),
	.select_section_coefficients_coeff_6_porty(select_section_coefficients_coeff_6_porty),
	.select_section_coefficients_coeff_7_porty(select_section_coefficients_coeff_7_porty),
	.select_section_coefficients_coeff_8_porty(select_section_coefficients_coeff_8_porty),
	.select_section_coefficients_coeff_9_porty(select_section_coefficients_coeff_9_porty),
	.select_section_coefficients_coeff_10_porty(select_section_coefficients_coeff_10_porty),
	.mean(mean),
	.std(std)
    );

mux theMux( 
	.clk(clk),
	.GlobalReset(reset),
    .coeff0(select_section_coefficients_coeff_0_porty),
    .coeff1(select_section_coefficients_coeff_1_porty),
    .coeff2(select_section_coefficients_coeff_2_porty),
    .coeff3(select_section_coefficients_coeff_3_porty),
    .coeff4(select_section_coefficients_coeff_4_porty),
    .coeff5(select_section_coefficients_coeff_5_porty),
    .coeff6(select_section_coefficients_coeff_6_porty),
    .coeff7(select_section_coefficients_coeff_7_porty),
    .coeff8(select_section_coefficients_coeff_8_porty),
    .coeff9(select_section_coefficients_coeff_9_porty),
    .coeff10(select_section_coefficients_coeff_10_porty),
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
