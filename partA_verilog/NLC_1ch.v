////////////////////////////////////////////////////////////////
//
// Module: NLC_1ch.v
// Author: Jordi Burbano
//         jburbanoalgarte@gmail.com
//
// Description:
//	Unoptimized 32-channel NLC

module NLC_1ch(
  //System clock and reset
  clk,
  reset,

  //Input valid and output ready signals (one for all 32ch)  
  srdyi, 
  srdyo, 

  ch31_x_adc,//NLC output 
  ch31_x_lin,//ADC output 
  ch31_section_limit,//X-value that separates the sections 
  ch31_recip_stdev_4,//Reciprocal standard deviation for the centered and scaled fit  
  ch31_recip_stdev_3, 
  ch31_recip_stdev_2, 
  ch31_recip_stdev_1, 
  ch31_neg_mean_4,//Negative meand for the centered and scaled fit  
  ch31_neg_mean_3, 
  ch31_neg_mean_2, 
  ch31_neg_mean_1, 
  ch31_coeff_4_10, //Section 4 coefficients (x > 0, |x| > section_limit) 
  ch31_coeff_4_9, 
  ch31_coeff_4_8, 
  ch31_coeff_4_7, 
  ch31_coeff_4_6, 
  ch31_coeff_4_5, 
  ch31_coeff_4_4, 
  ch31_coeff_4_3, 
  ch31_coeff_4_2, 
  ch31_coeff_4_1, 
  ch31_coeff_4_0, 
  ch31_coeff_3_10,//Section 3 coefficients (x > 0, |x| <= section_limit)  
  ch31_coeff_3_9, 
  ch31_coeff_3_8, 
  ch31_coeff_3_7, 
  ch31_coeff_3_6, 
  ch31_coeff_3_5, 
  ch31_coeff_3_4, 
  ch31_coeff_3_3, 
  ch31_coeff_3_2, 
  ch31_coeff_3_1, 
  ch31_coeff_3_0, 
  ch31_coeff_2_10,//Section 2 coefficients (x <= 0, |x| <= section_limit)  
  ch31_coeff_2_9, 
  ch31_coeff_2_8, 
  ch31_coeff_2_7, 
  ch31_coeff_2_6, 
  ch31_coeff_2_5, 
  ch31_coeff_2_4, 
  ch31_coeff_2_3, 
  ch31_coeff_2_2, 
  ch31_coeff_2_1, 
  ch31_coeff_2_0, 
  ch31_coeff_1_10,//Section 1 coefficients (x <= 0, |x| > section_limit)  
  ch31_coeff_1_9, 
  ch31_coeff_1_8, 
  ch31_coeff_1_7, 
  ch31_coeff_1_6, 
  ch31_coeff_1_5, 
  ch31_coeff_1_4, 
  ch31_coeff_1_3, 
  ch31_coeff_1_2, 
  ch31_coeff_1_1, 
  ch31_coeff_1_0, 

  ch30_x_adc,//NLC output 
  ch30_x_lin,//ADC output 
  ch30_section_limit,//X-value that separates the sections 
  ch30_recip_stdev_4,//Reciprocal standard deviation for the centered and scaled fit  
  ch30_recip_stdev_3, 
  ch30_recip_stdev_2, 
  ch30_recip_stdev_1, 
  ch30_neg_mean_4,//Negative meand for the centered and scaled fit  
  ch30_neg_mean_3, 
  ch30_neg_mean_2, 
  ch30_neg_mean_1, 
  ch30_coeff_4_10, //Section 4 coefficients (x > 0, |x| > section_limit) 
  ch30_coeff_4_9, 
  ch30_coeff_4_8, 
  ch30_coeff_4_7, 
  ch30_coeff_4_6, 
  ch30_coeff_4_5, 
  ch30_coeff_4_4, 
  ch30_coeff_4_3, 
  ch30_coeff_4_2, 
  ch30_coeff_4_1, 
  ch30_coeff_4_0, 
  ch30_coeff_3_10,//Section 3 coefficients (x > 0, |x| <= section_limit)  
  ch30_coeff_3_9, 
  ch30_coeff_3_8, 
  ch30_coeff_3_7, 
  ch30_coeff_3_6, 
  ch30_coeff_3_5, 
  ch30_coeff_3_4, 
  ch30_coeff_3_3, 
  ch30_coeff_3_2, 
  ch30_coeff_3_1, 
  ch30_coeff_3_0, 
  ch30_coeff_2_10,//Section 2 coefficients (x <= 0, |x| <= section_limit)  
  ch30_coeff_2_9, 
  ch30_coeff_2_8, 
  ch30_coeff_2_7, 
  ch30_coeff_2_6, 
  ch30_coeff_2_5, 
  ch30_coeff_2_4, 
  ch30_coeff_2_3, 
  ch30_coeff_2_2, 
  ch30_coeff_2_1, 
  ch30_coeff_2_0, 
  ch30_coeff_1_10,//Section 1 coefficients (x <= 0, |x| > section_limit)  
  ch30_coeff_1_9, 
  ch30_coeff_1_8, 
  ch30_coeff_1_7, 
  ch30_coeff_1_6, 
  ch30_coeff_1_5, 
  ch30_coeff_1_4, 
  ch30_coeff_1_3, 
  ch30_coeff_1_2, 
  ch30_coeff_1_1, 
  ch30_coeff_1_0, 

  ch29_x_adc,//NLC output 
  ch29_x_lin,//ADC output 
  ch29_section_limit,//X-value that separates the sections 
  ch29_recip_stdev_4,//Reciprocal standard deviation for the centered and scaled fit  
  ch29_recip_stdev_3, 
  ch29_recip_stdev_2, 
  ch29_recip_stdev_1, 
  ch29_neg_mean_4,//Negative meand for the centered and scaled fit  
  ch29_neg_mean_3, 
  ch29_neg_mean_2, 
  ch29_neg_mean_1, 
  ch29_coeff_4_10, //Section 4 coefficients (x > 0, |x| > section_limit) 
  ch29_coeff_4_9, 
  ch29_coeff_4_8, 
  ch29_coeff_4_7, 
  ch29_coeff_4_6, 
  ch29_coeff_4_5, 
  ch29_coeff_4_4, 
  ch29_coeff_4_3, 
  ch29_coeff_4_2, 
  ch29_coeff_4_1, 
  ch29_coeff_4_0, 
  ch29_coeff_3_10,//Section 3 coefficients (x > 0, |x| <= section_limit)  
  ch29_coeff_3_9, 
  ch29_coeff_3_8, 
  ch29_coeff_3_7, 
  ch29_coeff_3_6, 
  ch29_coeff_3_5, 
  ch29_coeff_3_4, 
  ch29_coeff_3_3, 
  ch29_coeff_3_2, 
  ch29_coeff_3_1, 
  ch29_coeff_3_0, 
  ch29_coeff_2_10,//Section 2 coefficients (x <= 0, |x| <= section_limit)  
  ch29_coeff_2_9, 
  ch29_coeff_2_8, 
  ch29_coeff_2_7, 
  ch29_coeff_2_6, 
  ch29_coeff_2_5, 
  ch29_coeff_2_4, 
  ch29_coeff_2_3, 
  ch29_coeff_2_2, 
  ch29_coeff_2_1, 
  ch29_coeff_2_0, 
  ch29_coeff_1_10,//Section 1 coefficients (x <= 0, |x| > section_limit)  
  ch29_coeff_1_9, 
  ch29_coeff_1_8, 
  ch29_coeff_1_7, 
  ch29_coeff_1_6, 
  ch29_coeff_1_5, 
  ch29_coeff_1_4, 
  ch29_coeff_1_3, 
  ch29_coeff_1_2, 
  ch29_coeff_1_1, 
  ch29_coeff_1_0, 

  ch28_x_adc,//NLC output 
  ch28_x_lin,//ADC output 
  ch28_section_limit,//X-value that separates the sections 
  ch28_recip_stdev_4,//Reciprocal standard deviation for the centered and scaled fit  
  ch28_recip_stdev_3, 
  ch28_recip_stdev_2, 
  ch28_recip_stdev_1, 
  ch28_neg_mean_4,//Negative meand for the centered and scaled fit  
  ch28_neg_mean_3, 
  ch28_neg_mean_2, 
  ch28_neg_mean_1, 
  ch28_coeff_4_10, //Section 4 coefficients (x > 0, |x| > section_limit) 
  ch28_coeff_4_9, 
  ch28_coeff_4_8, 
  ch28_coeff_4_7, 
  ch28_coeff_4_6, 
  ch28_coeff_4_5, 
  ch28_coeff_4_4, 
  ch28_coeff_4_3, 
  ch28_coeff_4_2, 
  ch28_coeff_4_1, 
  ch28_coeff_4_0, 
  ch28_coeff_3_10,//Section 3 coefficients (x > 0, |x| <= section_limit)  
  ch28_coeff_3_9, 
  ch28_coeff_3_8, 
  ch28_coeff_3_7, 
  ch28_coeff_3_6, 
  ch28_coeff_3_5, 
  ch28_coeff_3_4, 
  ch28_coeff_3_3, 
  ch28_coeff_3_2, 
  ch28_coeff_3_1, 
  ch28_coeff_3_0, 
  ch28_coeff_2_10,//Section 2 coefficients (x <= 0, |x| <= section_limit)  
  ch28_coeff_2_9, 
  ch28_coeff_2_8, 
  ch28_coeff_2_7, 
  ch28_coeff_2_6, 
  ch28_coeff_2_5, 
  ch28_coeff_2_4, 
  ch28_coeff_2_3, 
  ch28_coeff_2_2, 
  ch28_coeff_2_1, 
  ch28_coeff_2_0, 
  ch28_coeff_1_10,//Section 1 coefficients (x <= 0, |x| > section_limit)  
  ch28_coeff_1_9, 
  ch28_coeff_1_8, 
  ch28_coeff_1_7, 
  ch28_coeff_1_6, 
  ch28_coeff_1_5, 
  ch28_coeff_1_4, 
  ch28_coeff_1_3, 
  ch28_coeff_1_2, 
  ch28_coeff_1_1, 
  ch28_coeff_1_0, 

  ch27_x_adc,//NLC output 
  ch27_x_lin,//ADC output 
  ch27_section_limit,//X-value that separates the sections 
  ch27_recip_stdev_4,//Reciprocal standard deviation for the centered and scaled fit  
  ch27_recip_stdev_3, 
  ch27_recip_stdev_2, 
  ch27_recip_stdev_1, 
  ch27_neg_mean_4,//Negative meand for the centered and scaled fit  
  ch27_neg_mean_3, 
  ch27_neg_mean_2, 
  ch27_neg_mean_1, 
  ch27_coeff_4_10, //Section 4 coefficients (x > 0, |x| > section_limit) 
  ch27_coeff_4_9, 
  ch27_coeff_4_8, 
  ch27_coeff_4_7, 
  ch27_coeff_4_6, 
  ch27_coeff_4_5, 
  ch27_coeff_4_4, 
  ch27_coeff_4_3, 
  ch27_coeff_4_2, 
  ch27_coeff_4_1, 
  ch27_coeff_4_0, 
  ch27_coeff_3_10,//Section 3 coefficients (x > 0, |x| <= section_limit)  
  ch27_coeff_3_9, 
  ch27_coeff_3_8, 
  ch27_coeff_3_7, 
  ch27_coeff_3_6, 
  ch27_coeff_3_5, 
  ch27_coeff_3_4, 
  ch27_coeff_3_3, 
  ch27_coeff_3_2, 
  ch27_coeff_3_1, 
  ch27_coeff_3_0, 
  ch27_coeff_2_10,//Section 2 coefficients (x <= 0, |x| <= section_limit)  
  ch27_coeff_2_9, 
  ch27_coeff_2_8, 
  ch27_coeff_2_7, 
  ch27_coeff_2_6, 
  ch27_coeff_2_5, 
  ch27_coeff_2_4, 
  ch27_coeff_2_3, 
  ch27_coeff_2_2, 
  ch27_coeff_2_1, 
  ch27_coeff_2_0, 
  ch27_coeff_1_10,//Section 1 coefficients (x <= 0, |x| > section_limit)  
  ch27_coeff_1_9, 
  ch27_coeff_1_8, 
  ch27_coeff_1_7, 
  ch27_coeff_1_6, 
  ch27_coeff_1_5, 
  ch27_coeff_1_4, 
  ch27_coeff_1_3, 
  ch27_coeff_1_2, 
  ch27_coeff_1_1, 
  ch27_coeff_1_0, 

  ch26_x_adc,//NLC output 
  ch26_x_lin,//ADC output 
  ch26_section_limit,//X-value that separates the sections 
  ch26_recip_stdev_4,//Reciprocal standard deviation for the centered and scaled fit  
  ch26_recip_stdev_3, 
  ch26_recip_stdev_2, 
  ch26_recip_stdev_1, 
  ch26_neg_mean_4,//Negative meand for the centered and scaled fit  
  ch26_neg_mean_3, 
  ch26_neg_mean_2, 
  ch26_neg_mean_1, 
  ch26_coeff_4_10, //Section 4 coefficients (x > 0, |x| > section_limit) 
  ch26_coeff_4_9, 
  ch26_coeff_4_8, 
  ch26_coeff_4_7, 
  ch26_coeff_4_6, 
  ch26_coeff_4_5, 
  ch26_coeff_4_4, 
  ch26_coeff_4_3, 
  ch26_coeff_4_2, 
  ch26_coeff_4_1, 
  ch26_coeff_4_0, 
  ch26_coeff_3_10,//Section 3 coefficients (x > 0, |x| <= section_limit)  
  ch26_coeff_3_9, 
  ch26_coeff_3_8, 
  ch26_coeff_3_7, 
  ch26_coeff_3_6, 
  ch26_coeff_3_5, 
  ch26_coeff_3_4, 
  ch26_coeff_3_3, 
  ch26_coeff_3_2, 
  ch26_coeff_3_1, 
  ch26_coeff_3_0, 
  ch26_coeff_2_10,//Section 2 coefficients (x <= 0, |x| <= section_limit)  
  ch26_coeff_2_9, 
  ch26_coeff_2_8, 
  ch26_coeff_2_7, 
  ch26_coeff_2_6, 
  ch26_coeff_2_5, 
  ch26_coeff_2_4, 
  ch26_coeff_2_3, 
  ch26_coeff_2_2, 
  ch26_coeff_2_1, 
  ch26_coeff_2_0, 
  ch26_coeff_1_10,//Section 1 coefficients (x <= 0, |x| > section_limit)  
  ch26_coeff_1_9, 
  ch26_coeff_1_8, 
  ch26_coeff_1_7, 
  ch26_coeff_1_6, 
  ch26_coeff_1_5, 
  ch26_coeff_1_4, 
  ch26_coeff_1_3, 
  ch26_coeff_1_2, 
  ch26_coeff_1_1, 
  ch26_coeff_1_0, 

  ch25_x_adc,//NLC output 
  ch25_x_lin,//ADC output 
  ch25_section_limit,//X-value that separates the sections 
  ch25_recip_stdev_4,//Reciprocal standard deviation for the centered and scaled fit  
  ch25_recip_stdev_3, 
  ch25_recip_stdev_2, 
  ch25_recip_stdev_1, 
  ch25_neg_mean_4,//Negative meand for the centered and scaled fit  
  ch25_neg_mean_3, 
  ch25_neg_mean_2, 
  ch25_neg_mean_1, 
  ch25_coeff_4_10, //Section 4 coefficients (x > 0, |x| > section_limit) 
  ch25_coeff_4_9, 
  ch25_coeff_4_8, 
  ch25_coeff_4_7, 
  ch25_coeff_4_6, 
  ch25_coeff_4_5, 
  ch25_coeff_4_4, 
  ch25_coeff_4_3, 
  ch25_coeff_4_2, 
  ch25_coeff_4_1, 
  ch25_coeff_4_0, 
  ch25_coeff_3_10,//Section 3 coefficients (x > 0, |x| <= section_limit)  
  ch25_coeff_3_9, 
  ch25_coeff_3_8, 
  ch25_coeff_3_7, 
  ch25_coeff_3_6, 
  ch25_coeff_3_5, 
  ch25_coeff_3_4, 
  ch25_coeff_3_3, 
  ch25_coeff_3_2, 
  ch25_coeff_3_1, 
  ch25_coeff_3_0, 
  ch25_coeff_2_10,//Section 2 coefficients (x <= 0, |x| <= section_limit)  
  ch25_coeff_2_9, 
  ch25_coeff_2_8, 
  ch25_coeff_2_7, 
  ch25_coeff_2_6, 
  ch25_coeff_2_5, 
  ch25_coeff_2_4, 
  ch25_coeff_2_3, 
  ch25_coeff_2_2, 
  ch25_coeff_2_1, 
  ch25_coeff_2_0, 
  ch25_coeff_1_10,//Section 1 coefficients (x <= 0, |x| > section_limit)  
  ch25_coeff_1_9, 
  ch25_coeff_1_8, 
  ch25_coeff_1_7, 
  ch25_coeff_1_6, 
  ch25_coeff_1_5, 
  ch25_coeff_1_4, 
  ch25_coeff_1_3, 
  ch25_coeff_1_2, 
  ch25_coeff_1_1, 
  ch25_coeff_1_0, 

  ch24_x_adc,//NLC output 
  ch24_x_lin,//ADC output 
  ch24_section_limit,//X-value that separates the sections 
  ch24_recip_stdev_4,//Reciprocal standard deviation for the centered and scaled fit  
  ch24_recip_stdev_3, 
  ch24_recip_stdev_2, 
  ch24_recip_stdev_1, 
  ch24_neg_mean_4,//Negative meand for the centered and scaled fit  
  ch24_neg_mean_3, 
  ch24_neg_mean_2, 
  ch24_neg_mean_1, 
  ch24_coeff_4_10, //Section 4 coefficients (x > 0, |x| > section_limit) 
  ch24_coeff_4_9, 
  ch24_coeff_4_8, 
  ch24_coeff_4_7, 
  ch24_coeff_4_6, 
  ch24_coeff_4_5, 
  ch24_coeff_4_4, 
  ch24_coeff_4_3, 
  ch24_coeff_4_2, 
  ch24_coeff_4_1, 
  ch24_coeff_4_0, 
  ch24_coeff_3_10,//Section 3 coefficients (x > 0, |x| <= section_limit)  
  ch24_coeff_3_9, 
  ch24_coeff_3_8, 
  ch24_coeff_3_7, 
  ch24_coeff_3_6, 
  ch24_coeff_3_5, 
  ch24_coeff_3_4, 
  ch24_coeff_3_3, 
  ch24_coeff_3_2, 
  ch24_coeff_3_1, 
  ch24_coeff_3_0, 
  ch24_coeff_2_10,//Section 2 coefficients (x <= 0, |x| <= section_limit)  
  ch24_coeff_2_9, 
  ch24_coeff_2_8, 
  ch24_coeff_2_7, 
  ch24_coeff_2_6, 
  ch24_coeff_2_5, 
  ch24_coeff_2_4, 
  ch24_coeff_2_3, 
  ch24_coeff_2_2, 
  ch24_coeff_2_1, 
  ch24_coeff_2_0, 
  ch24_coeff_1_10,//Section 1 coefficients (x <= 0, |x| > section_limit)  
  ch24_coeff_1_9, 
  ch24_coeff_1_8, 
  ch24_coeff_1_7, 
  ch24_coeff_1_6, 
  ch24_coeff_1_5, 
  ch24_coeff_1_4, 
  ch24_coeff_1_3, 
  ch24_coeff_1_2, 
  ch24_coeff_1_1, 
  ch24_coeff_1_0, 

  ch23_x_adc,//NLC output 
  ch23_x_lin,//ADC output 
  ch23_section_limit,//X-value that separates the sections 
  ch23_recip_stdev_4,//Reciprocal standard deviation for the centered and scaled fit  
  ch23_recip_stdev_3, 
  ch23_recip_stdev_2, 
  ch23_recip_stdev_1, 
  ch23_neg_mean_4,//Negative meand for the centered and scaled fit  
  ch23_neg_mean_3, 
  ch23_neg_mean_2, 
  ch23_neg_mean_1, 
  ch23_coeff_4_10, //Section 4 coefficients (x > 0, |x| > section_limit) 
  ch23_coeff_4_9, 
  ch23_coeff_4_8, 
  ch23_coeff_4_7, 
  ch23_coeff_4_6, 
  ch23_coeff_4_5, 
  ch23_coeff_4_4, 
  ch23_coeff_4_3, 
  ch23_coeff_4_2, 
  ch23_coeff_4_1, 
  ch23_coeff_4_0, 
  ch23_coeff_3_10,//Section 3 coefficients (x > 0, |x| <= section_limit)  
  ch23_coeff_3_9, 
  ch23_coeff_3_8, 
  ch23_coeff_3_7, 
  ch23_coeff_3_6, 
  ch23_coeff_3_5, 
  ch23_coeff_3_4, 
  ch23_coeff_3_3, 
  ch23_coeff_3_2, 
  ch23_coeff_3_1, 
  ch23_coeff_3_0, 
  ch23_coeff_2_10,//Section 2 coefficients (x <= 0, |x| <= section_limit)  
  ch23_coeff_2_9, 
  ch23_coeff_2_8, 
  ch23_coeff_2_7, 
  ch23_coeff_2_6, 
  ch23_coeff_2_5, 
  ch23_coeff_2_4, 
  ch23_coeff_2_3, 
  ch23_coeff_2_2, 
  ch23_coeff_2_1, 
  ch23_coeff_2_0, 
  ch23_coeff_1_10,//Section 1 coefficients (x <= 0, |x| > section_limit)  
  ch23_coeff_1_9, 
  ch23_coeff_1_8, 
  ch23_coeff_1_7, 
  ch23_coeff_1_6, 
  ch23_coeff_1_5, 
  ch23_coeff_1_4, 
  ch23_coeff_1_3, 
  ch23_coeff_1_2, 
  ch23_coeff_1_1, 
  ch23_coeff_1_0, 

  ch22_x_adc,//NLC output 
  ch22_x_lin,//ADC output 
  ch22_section_limit,//X-value that separates the sections 
  ch22_recip_stdev_4,//Reciprocal standard deviation for the centered and scaled fit  
  ch22_recip_stdev_3, 
  ch22_recip_stdev_2, 
  ch22_recip_stdev_1, 
  ch22_neg_mean_4,//Negative meand for the centered and scaled fit  
  ch22_neg_mean_3, 
  ch22_neg_mean_2, 
  ch22_neg_mean_1, 
  ch22_coeff_4_10, //Section 4 coefficients (x > 0, |x| > section_limit) 
  ch22_coeff_4_9, 
  ch22_coeff_4_8, 
  ch22_coeff_4_7, 
  ch22_coeff_4_6, 
  ch22_coeff_4_5, 
  ch22_coeff_4_4, 
  ch22_coeff_4_3, 
  ch22_coeff_4_2, 
  ch22_coeff_4_1, 
  ch22_coeff_4_0, 
  ch22_coeff_3_10,//Section 3 coefficients (x > 0, |x| <= section_limit)  
  ch22_coeff_3_9, 
  ch22_coeff_3_8, 
  ch22_coeff_3_7, 
  ch22_coeff_3_6, 
  ch22_coeff_3_5, 
  ch22_coeff_3_4, 
  ch22_coeff_3_3, 
  ch22_coeff_3_2, 
  ch22_coeff_3_1, 
  ch22_coeff_3_0, 
  ch22_coeff_2_10,//Section 2 coefficients (x <= 0, |x| <= section_limit)  
  ch22_coeff_2_9, 
  ch22_coeff_2_8, 
  ch22_coeff_2_7, 
  ch22_coeff_2_6, 
  ch22_coeff_2_5, 
  ch22_coeff_2_4, 
  ch22_coeff_2_3, 
  ch22_coeff_2_2, 
  ch22_coeff_2_1, 
  ch22_coeff_2_0, 
  ch22_coeff_1_10,//Section 1 coefficients (x <= 0, |x| > section_limit)  
  ch22_coeff_1_9, 
  ch22_coeff_1_8, 
  ch22_coeff_1_7, 
  ch22_coeff_1_6, 
  ch22_coeff_1_5, 
  ch22_coeff_1_4, 
  ch22_coeff_1_3, 
  ch22_coeff_1_2, 
  ch22_coeff_1_1, 
  ch22_coeff_1_0, 

  ch21_x_adc,//NLC output 
  ch21_x_lin,//ADC output 
  ch21_section_limit,//X-value that separates the sections 
  ch21_recip_stdev_4,//Reciprocal standard deviation for the centered and scaled fit  
  ch21_recip_stdev_3, 
  ch21_recip_stdev_2, 
  ch21_recip_stdev_1, 
  ch21_neg_mean_4,//Negative meand for the centered and scaled fit  
  ch21_neg_mean_3, 
  ch21_neg_mean_2, 
  ch21_neg_mean_1, 
  ch21_coeff_4_10, //Section 4 coefficients (x > 0, |x| > section_limit) 
  ch21_coeff_4_9, 
  ch21_coeff_4_8, 
  ch21_coeff_4_7, 
  ch21_coeff_4_6, 
  ch21_coeff_4_5, 
  ch21_coeff_4_4, 
  ch21_coeff_4_3, 
  ch21_coeff_4_2, 
  ch21_coeff_4_1, 
  ch21_coeff_4_0, 
  ch21_coeff_3_10,//Section 3 coefficients (x > 0, |x| <= section_limit)  
  ch21_coeff_3_9, 
  ch21_coeff_3_8, 
  ch21_coeff_3_7, 
  ch21_coeff_3_6, 
  ch21_coeff_3_5, 
  ch21_coeff_3_4, 
  ch21_coeff_3_3, 
  ch21_coeff_3_2, 
  ch21_coeff_3_1, 
  ch21_coeff_3_0, 
  ch21_coeff_2_10,//Section 2 coefficients (x <= 0, |x| <= section_limit)  
  ch21_coeff_2_9, 
  ch21_coeff_2_8, 
  ch21_coeff_2_7, 
  ch21_coeff_2_6, 
  ch21_coeff_2_5, 
  ch21_coeff_2_4, 
  ch21_coeff_2_3, 
  ch21_coeff_2_2, 
  ch21_coeff_2_1, 
  ch21_coeff_2_0, 
  ch21_coeff_1_10,//Section 1 coefficients (x <= 0, |x| > section_limit)  
  ch21_coeff_1_9, 
  ch21_coeff_1_8, 
  ch21_coeff_1_7, 
  ch21_coeff_1_6, 
  ch21_coeff_1_5, 
  ch21_coeff_1_4, 
  ch21_coeff_1_3, 
  ch21_coeff_1_2, 
  ch21_coeff_1_1, 
  ch21_coeff_1_0, 

  ch20_x_adc,//NLC output 
  ch20_x_lin,//ADC output 
  ch20_section_limit,//X-value that separates the sections 
  ch20_recip_stdev_4,//Reciprocal standard deviation for the centered and scaled fit  
  ch20_recip_stdev_3, 
  ch20_recip_stdev_2, 
  ch20_recip_stdev_1, 
  ch20_neg_mean_4,//Negative meand for the centered and scaled fit  
  ch20_neg_mean_3, 
  ch20_neg_mean_2, 
  ch20_neg_mean_1, 
  ch20_coeff_4_10, //Section 4 coefficients (x > 0, |x| > section_limit) 
  ch20_coeff_4_9, 
  ch20_coeff_4_8, 
  ch20_coeff_4_7, 
  ch20_coeff_4_6, 
  ch20_coeff_4_5, 
  ch20_coeff_4_4, 
  ch20_coeff_4_3, 
  ch20_coeff_4_2, 
  ch20_coeff_4_1, 
  ch20_coeff_4_0, 
  ch20_coeff_3_10,//Section 3 coefficients (x > 0, |x| <= section_limit)  
  ch20_coeff_3_9, 
  ch20_coeff_3_8, 
  ch20_coeff_3_7, 
  ch20_coeff_3_6, 
  ch20_coeff_3_5, 
  ch20_coeff_3_4, 
  ch20_coeff_3_3, 
  ch20_coeff_3_2, 
  ch20_coeff_3_1, 
  ch20_coeff_3_0, 
  ch20_coeff_2_10,//Section 2 coefficients (x <= 0, |x| <= section_limit)  
  ch20_coeff_2_9, 
  ch20_coeff_2_8, 
  ch20_coeff_2_7, 
  ch20_coeff_2_6, 
  ch20_coeff_2_5, 
  ch20_coeff_2_4, 
  ch20_coeff_2_3, 
  ch20_coeff_2_2, 
  ch20_coeff_2_1, 
  ch20_coeff_2_0, 
  ch20_coeff_1_10,//Section 1 coefficients (x <= 0, |x| > section_limit)  
  ch20_coeff_1_9, 
  ch20_coeff_1_8, 
  ch20_coeff_1_7, 
  ch20_coeff_1_6, 
  ch20_coeff_1_5, 
  ch20_coeff_1_4, 
  ch20_coeff_1_3, 
  ch20_coeff_1_2, 
  ch20_coeff_1_1, 
  ch20_coeff_1_0, 

  ch19_x_adc,//NLC output 
  ch19_x_lin,//ADC output 
  ch19_section_limit,//X-value that separates the sections 
  ch19_recip_stdev_4,//Reciprocal standard deviation for the centered and scaled fit  
  ch19_recip_stdev_3, 
  ch19_recip_stdev_2, 
  ch19_recip_stdev_1, 
  ch19_neg_mean_4,//Negative meand for the centered and scaled fit  
  ch19_neg_mean_3, 
  ch19_neg_mean_2, 
  ch19_neg_mean_1, 
  ch19_coeff_4_10, //Section 4 coefficients (x > 0, |x| > section_limit) 
  ch19_coeff_4_9, 
  ch19_coeff_4_8, 
  ch19_coeff_4_7, 
  ch19_coeff_4_6, 
  ch19_coeff_4_5, 
  ch19_coeff_4_4, 
  ch19_coeff_4_3, 
  ch19_coeff_4_2, 
  ch19_coeff_4_1, 
  ch19_coeff_4_0, 
  ch19_coeff_3_10,//Section 3 coefficients (x > 0, |x| <= section_limit)  
  ch19_coeff_3_9, 
  ch19_coeff_3_8, 
  ch19_coeff_3_7, 
  ch19_coeff_3_6, 
  ch19_coeff_3_5, 
  ch19_coeff_3_4, 
  ch19_coeff_3_3, 
  ch19_coeff_3_2, 
  ch19_coeff_3_1, 
  ch19_coeff_3_0, 
  ch19_coeff_2_10,//Section 2 coefficients (x <= 0, |x| <= section_limit)  
  ch19_coeff_2_9, 
  ch19_coeff_2_8, 
  ch19_coeff_2_7, 
  ch19_coeff_2_6, 
  ch19_coeff_2_5, 
  ch19_coeff_2_4, 
  ch19_coeff_2_3, 
  ch19_coeff_2_2, 
  ch19_coeff_2_1, 
  ch19_coeff_2_0, 
  ch19_coeff_1_10,//Section 1 coefficients (x <= 0, |x| > section_limit)  
  ch19_coeff_1_9, 
  ch19_coeff_1_8, 
  ch19_coeff_1_7, 
  ch19_coeff_1_6, 
  ch19_coeff_1_5, 
  ch19_coeff_1_4, 
  ch19_coeff_1_3, 
  ch19_coeff_1_2, 
  ch19_coeff_1_1, 
  ch19_coeff_1_0, 

  ch18_x_adc,//NLC output 
  ch18_x_lin,//ADC output 
  ch18_section_limit,//X-value that separates the sections 
  ch18_recip_stdev_4,//Reciprocal standard deviation for the centered and scaled fit  
  ch18_recip_stdev_3, 
  ch18_recip_stdev_2, 
  ch18_recip_stdev_1, 
  ch18_neg_mean_4,//Negative meand for the centered and scaled fit  
  ch18_neg_mean_3, 
  ch18_neg_mean_2, 
  ch18_neg_mean_1, 
  ch18_coeff_4_10, //Section 4 coefficients (x > 0, |x| > section_limit) 
  ch18_coeff_4_9, 
  ch18_coeff_4_8, 
  ch18_coeff_4_7, 
  ch18_coeff_4_6, 
  ch18_coeff_4_5, 
  ch18_coeff_4_4, 
  ch18_coeff_4_3, 
  ch18_coeff_4_2, 
  ch18_coeff_4_1, 
  ch18_coeff_4_0, 
  ch18_coeff_3_10,//Section 3 coefficients (x > 0, |x| <= section_limit)  
  ch18_coeff_3_9, 
  ch18_coeff_3_8, 
  ch18_coeff_3_7, 
  ch18_coeff_3_6, 
  ch18_coeff_3_5, 
  ch18_coeff_3_4, 
  ch18_coeff_3_3, 
  ch18_coeff_3_2, 
  ch18_coeff_3_1, 
  ch18_coeff_3_0, 
  ch18_coeff_2_10,//Section 2 coefficients (x <= 0, |x| <= section_limit)  
  ch18_coeff_2_9, 
  ch18_coeff_2_8, 
  ch18_coeff_2_7, 
  ch18_coeff_2_6, 
  ch18_coeff_2_5, 
  ch18_coeff_2_4, 
  ch18_coeff_2_3, 
  ch18_coeff_2_2, 
  ch18_coeff_2_1, 
  ch18_coeff_2_0, 
  ch18_coeff_1_10,//Section 1 coefficients (x <= 0, |x| > section_limit)  
  ch18_coeff_1_9, 
  ch18_coeff_1_8, 
  ch18_coeff_1_7, 
  ch18_coeff_1_6, 
  ch18_coeff_1_5, 
  ch18_coeff_1_4, 
  ch18_coeff_1_3, 
  ch18_coeff_1_2, 
  ch18_coeff_1_1, 
  ch18_coeff_1_0, 

  ch17_x_adc,//NLC output 
  ch17_x_lin,//ADC output 
  ch17_section_limit,//X-value that separates the sections 
  ch17_recip_stdev_4,//Reciprocal standard deviation for the centered and scaled fit  
  ch17_recip_stdev_3, 
  ch17_recip_stdev_2, 
  ch17_recip_stdev_1, 
  ch17_neg_mean_4,//Negative meand for the centered and scaled fit  
  ch17_neg_mean_3, 
  ch17_neg_mean_2, 
  ch17_neg_mean_1, 
  ch17_coeff_4_10, //Section 4 coefficients (x > 0, |x| > section_limit) 
  ch17_coeff_4_9, 
  ch17_coeff_4_8, 
  ch17_coeff_4_7, 
  ch17_coeff_4_6, 
  ch17_coeff_4_5, 
  ch17_coeff_4_4, 
  ch17_coeff_4_3, 
  ch17_coeff_4_2, 
  ch17_coeff_4_1, 
  ch17_coeff_4_0, 
  ch17_coeff_3_10,//Section 3 coefficients (x > 0, |x| <= section_limit)  
  ch17_coeff_3_9, 
  ch17_coeff_3_8, 
  ch17_coeff_3_7, 
  ch17_coeff_3_6, 
  ch17_coeff_3_5, 
  ch17_coeff_3_4, 
  ch17_coeff_3_3, 
  ch17_coeff_3_2, 
  ch17_coeff_3_1, 
  ch17_coeff_3_0, 
  ch17_coeff_2_10,//Section 2 coefficients (x <= 0, |x| <= section_limit)  
  ch17_coeff_2_9, 
  ch17_coeff_2_8, 
  ch17_coeff_2_7, 
  ch17_coeff_2_6, 
  ch17_coeff_2_5, 
  ch17_coeff_2_4, 
  ch17_coeff_2_3, 
  ch17_coeff_2_2, 
  ch17_coeff_2_1, 
  ch17_coeff_2_0, 
  ch17_coeff_1_10,//Section 1 coefficients (x <= 0, |x| > section_limit)  
  ch17_coeff_1_9, 
  ch17_coeff_1_8, 
  ch17_coeff_1_7, 
  ch17_coeff_1_6, 
  ch17_coeff_1_5, 
  ch17_coeff_1_4, 
  ch17_coeff_1_3, 
  ch17_coeff_1_2, 
  ch17_coeff_1_1, 
  ch17_coeff_1_0, 

  ch16_x_adc,//NLC output 
  ch16_x_lin,//ADC output 
  ch16_section_limit,//X-value that separates the sections 
  ch16_recip_stdev_4,//Reciprocal standard deviation for the centered and scaled fit  
  ch16_recip_stdev_3, 
  ch16_recip_stdev_2, 
  ch16_recip_stdev_1, 
  ch16_neg_mean_4,//Negative meand for the centered and scaled fit  
  ch16_neg_mean_3, 
  ch16_neg_mean_2, 
  ch16_neg_mean_1, 
  ch16_coeff_4_10, //Section 4 coefficients (x > 0, |x| > section_limit) 
  ch16_coeff_4_9, 
  ch16_coeff_4_8, 
  ch16_coeff_4_7, 
  ch16_coeff_4_6, 
  ch16_coeff_4_5, 
  ch16_coeff_4_4, 
  ch16_coeff_4_3, 
  ch16_coeff_4_2, 
  ch16_coeff_4_1, 
  ch16_coeff_4_0, 
  ch16_coeff_3_10,//Section 3 coefficients (x > 0, |x| <= section_limit)  
  ch16_coeff_3_9, 
  ch16_coeff_3_8, 
  ch16_coeff_3_7, 
  ch16_coeff_3_6, 
  ch16_coeff_3_5, 
  ch16_coeff_3_4, 
  ch16_coeff_3_3, 
  ch16_coeff_3_2, 
  ch16_coeff_3_1, 
  ch16_coeff_3_0, 
  ch16_coeff_2_10,//Section 2 coefficients (x <= 0, |x| <= section_limit)  
  ch16_coeff_2_9, 
  ch16_coeff_2_8, 
  ch16_coeff_2_7, 
  ch16_coeff_2_6, 
  ch16_coeff_2_5, 
  ch16_coeff_2_4, 
  ch16_coeff_2_3, 
  ch16_coeff_2_2, 
  ch16_coeff_2_1, 
  ch16_coeff_2_0, 
  ch16_coeff_1_10,//Section 1 coefficients (x <= 0, |x| > section_limit)  
  ch16_coeff_1_9, 
  ch16_coeff_1_8, 
  ch16_coeff_1_7, 
  ch16_coeff_1_6, 
  ch16_coeff_1_5, 
  ch16_coeff_1_4, 
  ch16_coeff_1_3, 
  ch16_coeff_1_2, 
  ch16_coeff_1_1, 
  ch16_coeff_1_0, 

  ch15_x_adc,//NLC output 
  ch15_x_lin,//ADC output 
  ch15_section_limit,//X-value that separates the sections 
  ch15_recip_stdev_4,//Reciprocal standard deviation for the centered and scaled fit  
  ch15_recip_stdev_3, 
  ch15_recip_stdev_2, 
  ch15_recip_stdev_1, 
  ch15_neg_mean_4,//Negative meand for the centered and scaled fit  
  ch15_neg_mean_3, 
  ch15_neg_mean_2, 
  ch15_neg_mean_1, 
  ch15_coeff_4_10, //Section 4 coefficients (x > 0, |x| > section_limit) 
  ch15_coeff_4_9, 
  ch15_coeff_4_8, 
  ch15_coeff_4_7, 
  ch15_coeff_4_6, 
  ch15_coeff_4_5, 
  ch15_coeff_4_4, 
  ch15_coeff_4_3, 
  ch15_coeff_4_2, 
  ch15_coeff_4_1, 
  ch15_coeff_4_0, 
  ch15_coeff_3_10,//Section 3 coefficients (x > 0, |x| <= section_limit)  
  ch15_coeff_3_9, 
  ch15_coeff_3_8, 
  ch15_coeff_3_7, 
  ch15_coeff_3_6, 
  ch15_coeff_3_5, 
  ch15_coeff_3_4, 
  ch15_coeff_3_3, 
  ch15_coeff_3_2, 
  ch15_coeff_3_1, 
  ch15_coeff_3_0, 
  ch15_coeff_2_10,//Section 2 coefficients (x <= 0, |x| <= section_limit)  
  ch15_coeff_2_9, 
  ch15_coeff_2_8, 
  ch15_coeff_2_7, 
  ch15_coeff_2_6, 
  ch15_coeff_2_5, 
  ch15_coeff_2_4, 
  ch15_coeff_2_3, 
  ch15_coeff_2_2, 
  ch15_coeff_2_1, 
  ch15_coeff_2_0, 
  ch15_coeff_1_10,//Section 1 coefficients (x <= 0, |x| > section_limit)  
  ch15_coeff_1_9, 
  ch15_coeff_1_8, 
  ch15_coeff_1_7, 
  ch15_coeff_1_6, 
  ch15_coeff_1_5, 
  ch15_coeff_1_4, 
  ch15_coeff_1_3, 
  ch15_coeff_1_2, 
  ch15_coeff_1_1, 
  ch15_coeff_1_0, 

  ch14_x_adc,//NLC output 
  ch14_x_lin,//ADC output 
  ch14_section_limit,//X-value that separates the sections 
  ch14_recip_stdev_4,//Reciprocal standard deviation for the centered and scaled fit  
  ch14_recip_stdev_3, 
  ch14_recip_stdev_2, 
  ch14_recip_stdev_1, 
  ch14_neg_mean_4,//Negative meand for the centered and scaled fit  
  ch14_neg_mean_3, 
  ch14_neg_mean_2, 
  ch14_neg_mean_1, 
  ch14_coeff_4_10, //Section 4 coefficients (x > 0, |x| > section_limit) 
  ch14_coeff_4_9, 
  ch14_coeff_4_8, 
  ch14_coeff_4_7, 
  ch14_coeff_4_6, 
  ch14_coeff_4_5, 
  ch14_coeff_4_4, 
  ch14_coeff_4_3, 
  ch14_coeff_4_2, 
  ch14_coeff_4_1, 
  ch14_coeff_4_0, 
  ch14_coeff_3_10,//Section 3 coefficients (x > 0, |x| <= section_limit)  
  ch14_coeff_3_9, 
  ch14_coeff_3_8, 
  ch14_coeff_3_7, 
  ch14_coeff_3_6, 
  ch14_coeff_3_5, 
  ch14_coeff_3_4, 
  ch14_coeff_3_3, 
  ch14_coeff_3_2, 
  ch14_coeff_3_1, 
  ch14_coeff_3_0, 
  ch14_coeff_2_10,//Section 2 coefficients (x <= 0, |x| <= section_limit)  
  ch14_coeff_2_9, 
  ch14_coeff_2_8, 
  ch14_coeff_2_7, 
  ch14_coeff_2_6, 
  ch14_coeff_2_5, 
  ch14_coeff_2_4, 
  ch14_coeff_2_3, 
  ch14_coeff_2_2, 
  ch14_coeff_2_1, 
  ch14_coeff_2_0, 
  ch14_coeff_1_10,//Section 1 coefficients (x <= 0, |x| > section_limit)  
  ch14_coeff_1_9, 
  ch14_coeff_1_8, 
  ch14_coeff_1_7, 
  ch14_coeff_1_6, 
  ch14_coeff_1_5, 
  ch14_coeff_1_4, 
  ch14_coeff_1_3, 
  ch14_coeff_1_2, 
  ch14_coeff_1_1, 
  ch14_coeff_1_0, 

  ch13_x_adc,//NLC output 
  ch13_x_lin,//ADC output 
  ch13_section_limit,//X-value that separates the sections 
  ch13_recip_stdev_4,//Reciprocal standard deviation for the centered and scaled fit  
  ch13_recip_stdev_3, 
  ch13_recip_stdev_2, 
  ch13_recip_stdev_1, 
  ch13_neg_mean_4,//Negative meand for the centered and scaled fit  
  ch13_neg_mean_3, 
  ch13_neg_mean_2, 
  ch13_neg_mean_1, 
  ch13_coeff_4_10, //Section 4 coefficients (x > 0, |x| > section_limit) 
  ch13_coeff_4_9, 
  ch13_coeff_4_8, 
  ch13_coeff_4_7, 
  ch13_coeff_4_6, 
  ch13_coeff_4_5, 
  ch13_coeff_4_4, 
  ch13_coeff_4_3, 
  ch13_coeff_4_2, 
  ch13_coeff_4_1, 
  ch13_coeff_4_0, 
  ch13_coeff_3_10,//Section 3 coefficients (x > 0, |x| <= section_limit)  
  ch13_coeff_3_9, 
  ch13_coeff_3_8, 
  ch13_coeff_3_7, 
  ch13_coeff_3_6, 
  ch13_coeff_3_5, 
  ch13_coeff_3_4, 
  ch13_coeff_3_3, 
  ch13_coeff_3_2, 
  ch13_coeff_3_1, 
  ch13_coeff_3_0, 
  ch13_coeff_2_10,//Section 2 coefficients (x <= 0, |x| <= section_limit)  
  ch13_coeff_2_9, 
  ch13_coeff_2_8, 
  ch13_coeff_2_7, 
  ch13_coeff_2_6, 
  ch13_coeff_2_5, 
  ch13_coeff_2_4, 
  ch13_coeff_2_3, 
  ch13_coeff_2_2, 
  ch13_coeff_2_1, 
  ch13_coeff_2_0, 
  ch13_coeff_1_10,//Section 1 coefficients (x <= 0, |x| > section_limit)  
  ch13_coeff_1_9, 
  ch13_coeff_1_8, 
  ch13_coeff_1_7, 
  ch13_coeff_1_6, 
  ch13_coeff_1_5, 
  ch13_coeff_1_4, 
  ch13_coeff_1_3, 
  ch13_coeff_1_2, 
  ch13_coeff_1_1, 
  ch13_coeff_1_0, 

  ch12_x_adc,//NLC output 
  ch12_x_lin,//ADC output 
  ch12_section_limit,//X-value that separates the sections 
  ch12_recip_stdev_4,//Reciprocal standard deviation for the centered and scaled fit  
  ch12_recip_stdev_3, 
  ch12_recip_stdev_2, 
  ch12_recip_stdev_1, 
  ch12_neg_mean_4,//Negative meand for the centered and scaled fit  
  ch12_neg_mean_3, 
  ch12_neg_mean_2, 
  ch12_neg_mean_1, 
  ch12_coeff_4_10, //Section 4 coefficients (x > 0, |x| > section_limit) 
  ch12_coeff_4_9, 
  ch12_coeff_4_8, 
  ch12_coeff_4_7, 
  ch12_coeff_4_6, 
  ch12_coeff_4_5, 
  ch12_coeff_4_4, 
  ch12_coeff_4_3, 
  ch12_coeff_4_2, 
  ch12_coeff_4_1, 
  ch12_coeff_4_0, 
  ch12_coeff_3_10,//Section 3 coefficients (x > 0, |x| <= section_limit)  
  ch12_coeff_3_9, 
  ch12_coeff_3_8, 
  ch12_coeff_3_7, 
  ch12_coeff_3_6, 
  ch12_coeff_3_5, 
  ch12_coeff_3_4, 
  ch12_coeff_3_3, 
  ch12_coeff_3_2, 
  ch12_coeff_3_1, 
  ch12_coeff_3_0, 
  ch12_coeff_2_10,//Section 2 coefficients (x <= 0, |x| <= section_limit)  
  ch12_coeff_2_9, 
  ch12_coeff_2_8, 
  ch12_coeff_2_7, 
  ch12_coeff_2_6, 
  ch12_coeff_2_5, 
  ch12_coeff_2_4, 
  ch12_coeff_2_3, 
  ch12_coeff_2_2, 
  ch12_coeff_2_1, 
  ch12_coeff_2_0, 
  ch12_coeff_1_10,//Section 1 coefficients (x <= 0, |x| > section_limit)  
  ch12_coeff_1_9, 
  ch12_coeff_1_8, 
  ch12_coeff_1_7, 
  ch12_coeff_1_6, 
  ch12_coeff_1_5, 
  ch12_coeff_1_4, 
  ch12_coeff_1_3, 
  ch12_coeff_1_2, 
  ch12_coeff_1_1, 
  ch12_coeff_1_0, 

  ch11_x_adc,//NLC output 
  ch11_x_lin,//ADC output 
  ch11_section_limit,//X-value that separates the sections 
  ch11_recip_stdev_4,//Reciprocal standard deviation for the centered and scaled fit  
  ch11_recip_stdev_3, 
  ch11_recip_stdev_2, 
  ch11_recip_stdev_1, 
  ch11_neg_mean_4,//Negative meand for the centered and scaled fit  
  ch11_neg_mean_3, 
  ch11_neg_mean_2, 
  ch11_neg_mean_1, 
  ch11_coeff_4_10, //Section 4 coefficients (x > 0, |x| > section_limit) 
  ch11_coeff_4_9, 
  ch11_coeff_4_8, 
  ch11_coeff_4_7, 
  ch11_coeff_4_6, 
  ch11_coeff_4_5, 
  ch11_coeff_4_4, 
  ch11_coeff_4_3, 
  ch11_coeff_4_2, 
  ch11_coeff_4_1, 
  ch11_coeff_4_0, 
  ch11_coeff_3_10,//Section 3 coefficients (x > 0, |x| <= section_limit)  
  ch11_coeff_3_9, 
  ch11_coeff_3_8, 
  ch11_coeff_3_7, 
  ch11_coeff_3_6, 
  ch11_coeff_3_5, 
  ch11_coeff_3_4, 
  ch11_coeff_3_3, 
  ch11_coeff_3_2, 
  ch11_coeff_3_1, 
  ch11_coeff_3_0, 
  ch11_coeff_2_10,//Section 2 coefficients (x <= 0, |x| <= section_limit)  
  ch11_coeff_2_9, 
  ch11_coeff_2_8, 
  ch11_coeff_2_7, 
  ch11_coeff_2_6, 
  ch11_coeff_2_5, 
  ch11_coeff_2_4, 
  ch11_coeff_2_3, 
  ch11_coeff_2_2, 
  ch11_coeff_2_1, 
  ch11_coeff_2_0, 
  ch11_coeff_1_10,//Section 1 coefficients (x <= 0, |x| > section_limit)  
  ch11_coeff_1_9, 
  ch11_coeff_1_8, 
  ch11_coeff_1_7, 
  ch11_coeff_1_6, 
  ch11_coeff_1_5, 
  ch11_coeff_1_4, 
  ch11_coeff_1_3, 
  ch11_coeff_1_2, 
  ch11_coeff_1_1, 
  ch11_coeff_1_0, 

  ch10_x_adc,//NLC output 
  ch10_x_lin,//ADC output 
  ch10_section_limit,//X-value that separates the sections 
  ch10_recip_stdev_4,//Reciprocal standard deviation for the centered and scaled fit  
  ch10_recip_stdev_3, 
  ch10_recip_stdev_2, 
  ch10_recip_stdev_1, 
  ch10_neg_mean_4,//Negative meand for the centered and scaled fit  
  ch10_neg_mean_3, 
  ch10_neg_mean_2, 
  ch10_neg_mean_1, 
  ch10_coeff_4_10, //Section 4 coefficients (x > 0, |x| > section_limit) 
  ch10_coeff_4_9, 
  ch10_coeff_4_8, 
  ch10_coeff_4_7, 
  ch10_coeff_4_6, 
  ch10_coeff_4_5, 
  ch10_coeff_4_4, 
  ch10_coeff_4_3, 
  ch10_coeff_4_2, 
  ch10_coeff_4_1, 
  ch10_coeff_4_0, 
  ch10_coeff_3_10,//Section 3 coefficients (x > 0, |x| <= section_limit)  
  ch10_coeff_3_9, 
  ch10_coeff_3_8, 
  ch10_coeff_3_7, 
  ch10_coeff_3_6, 
  ch10_coeff_3_5, 
  ch10_coeff_3_4, 
  ch10_coeff_3_3, 
  ch10_coeff_3_2, 
  ch10_coeff_3_1, 
  ch10_coeff_3_0, 
  ch10_coeff_2_10,//Section 2 coefficients (x <= 0, |x| <= section_limit)  
  ch10_coeff_2_9, 
  ch10_coeff_2_8, 
  ch10_coeff_2_7, 
  ch10_coeff_2_6, 
  ch10_coeff_2_5, 
  ch10_coeff_2_4, 
  ch10_coeff_2_3, 
  ch10_coeff_2_2, 
  ch10_coeff_2_1, 
  ch10_coeff_2_0, 
  ch10_coeff_1_10,//Section 1 coefficients (x <= 0, |x| > section_limit)  
  ch10_coeff_1_9, 
  ch10_coeff_1_8, 
  ch10_coeff_1_7, 
  ch10_coeff_1_6, 
  ch10_coeff_1_5, 
  ch10_coeff_1_4, 
  ch10_coeff_1_3, 
  ch10_coeff_1_2, 
  ch10_coeff_1_1, 
  ch10_coeff_1_0, 

  ch9_x_adc,//NLC output 
  ch9_x_lin,//ADC output 
  ch9_section_limit,//X-value that separates the sections 
  ch9_recip_stdev_4,//Reciprocal standard deviation for the centered and scaled fit  
  ch9_recip_stdev_3, 
  ch9_recip_stdev_2, 
  ch9_recip_stdev_1, 
  ch9_neg_mean_4,//Negative meand for the centered and scaled fit  
  ch9_neg_mean_3, 
  ch9_neg_mean_2, 
  ch9_neg_mean_1, 
  ch9_coeff_4_10, //Section 4 coefficients (x > 0, |x| > section_limit) 
  ch9_coeff_4_9, 
  ch9_coeff_4_8, 
  ch9_coeff_4_7, 
  ch9_coeff_4_6, 
  ch9_coeff_4_5, 
  ch9_coeff_4_4, 
  ch9_coeff_4_3, 
  ch9_coeff_4_2, 
  ch9_coeff_4_1, 
  ch9_coeff_4_0, 
  ch9_coeff_3_10,//Section 3 coefficients (x > 0, |x| <= section_limit)  
  ch9_coeff_3_9, 
  ch9_coeff_3_8, 
  ch9_coeff_3_7, 
  ch9_coeff_3_6, 
  ch9_coeff_3_5, 
  ch9_coeff_3_4, 
  ch9_coeff_3_3, 
  ch9_coeff_3_2, 
  ch9_coeff_3_1, 
  ch9_coeff_3_0, 
  ch9_coeff_2_10,//Section 2 coefficients (x <= 0, |x| <= section_limit)  
  ch9_coeff_2_9, 
  ch9_coeff_2_8, 
  ch9_coeff_2_7, 
  ch9_coeff_2_6, 
  ch9_coeff_2_5, 
  ch9_coeff_2_4, 
  ch9_coeff_2_3, 
  ch9_coeff_2_2, 
  ch9_coeff_2_1, 
  ch9_coeff_2_0, 
  ch9_coeff_1_10,//Section 1 coefficients (x <= 0, |x| > section_limit)  
  ch9_coeff_1_9, 
  ch9_coeff_1_8, 
  ch9_coeff_1_7, 
  ch9_coeff_1_6, 
  ch9_coeff_1_5, 
  ch9_coeff_1_4, 
  ch9_coeff_1_3, 
  ch9_coeff_1_2, 
  ch9_coeff_1_1, 
  ch9_coeff_1_0, 

  ch8_x_adc,//NLC output 
  ch8_x_lin,//ADC output 
  ch8_section_limit,//X-value that separates the sections 
  ch8_recip_stdev_4,//Reciprocal standard deviation for the centered and scaled fit  
  ch8_recip_stdev_3, 
  ch8_recip_stdev_2, 
  ch8_recip_stdev_1, 
  ch8_neg_mean_4,//Negative meand for the centered and scaled fit  
  ch8_neg_mean_3, 
  ch8_neg_mean_2, 
  ch8_neg_mean_1, 
  ch8_coeff_4_10, //Section 4 coefficients (x > 0, |x| > section_limit) 
  ch8_coeff_4_9, 
  ch8_coeff_4_8, 
  ch8_coeff_4_7, 
  ch8_coeff_4_6, 
  ch8_coeff_4_5, 
  ch8_coeff_4_4, 
  ch8_coeff_4_3, 
  ch8_coeff_4_2, 
  ch8_coeff_4_1, 
  ch8_coeff_4_0, 
  ch8_coeff_3_10,//Section 3 coefficients (x > 0, |x| <= section_limit)  
  ch8_coeff_3_9, 
  ch8_coeff_3_8, 
  ch8_coeff_3_7, 
  ch8_coeff_3_6, 
  ch8_coeff_3_5, 
  ch8_coeff_3_4, 
  ch8_coeff_3_3, 
  ch8_coeff_3_2, 
  ch8_coeff_3_1, 
  ch8_coeff_3_0, 
  ch8_coeff_2_10,//Section 2 coefficients (x <= 0, |x| <= section_limit)  
  ch8_coeff_2_9, 
  ch8_coeff_2_8, 
  ch8_coeff_2_7, 
  ch8_coeff_2_6, 
  ch8_coeff_2_5, 
  ch8_coeff_2_4, 
  ch8_coeff_2_3, 
  ch8_coeff_2_2, 
  ch8_coeff_2_1, 
  ch8_coeff_2_0, 
  ch8_coeff_1_10,//Section 1 coefficients (x <= 0, |x| > section_limit)  
  ch8_coeff_1_9, 
  ch8_coeff_1_8, 
  ch8_coeff_1_7, 
  ch8_coeff_1_6, 
  ch8_coeff_1_5, 
  ch8_coeff_1_4, 
  ch8_coeff_1_3, 
  ch8_coeff_1_2, 
  ch8_coeff_1_1, 
  ch8_coeff_1_0, 

  ch7_x_adc,//NLC output 
  ch7_x_lin,//ADC output 
  ch7_section_limit,//X-value that separates the sections 
  ch7_recip_stdev_4,//Reciprocal standard deviation for the centered and scaled fit  
  ch7_recip_stdev_3, 
  ch7_recip_stdev_2, 
  ch7_recip_stdev_1, 
  ch7_neg_mean_4,//Negative meand for the centered and scaled fit  
  ch7_neg_mean_3, 
  ch7_neg_mean_2, 
  ch7_neg_mean_1, 
  ch7_coeff_4_10, //Section 4 coefficients (x > 0, |x| > section_limit) 
  ch7_coeff_4_9, 
  ch7_coeff_4_8, 
  ch7_coeff_4_7, 
  ch7_coeff_4_6, 
  ch7_coeff_4_5, 
  ch7_coeff_4_4, 
  ch7_coeff_4_3, 
  ch7_coeff_4_2, 
  ch7_coeff_4_1, 
  ch7_coeff_4_0, 
  ch7_coeff_3_10,//Section 3 coefficients (x > 0, |x| <= section_limit)  
  ch7_coeff_3_9, 
  ch7_coeff_3_8, 
  ch7_coeff_3_7, 
  ch7_coeff_3_6, 
  ch7_coeff_3_5, 
  ch7_coeff_3_4, 
  ch7_coeff_3_3, 
  ch7_coeff_3_2, 
  ch7_coeff_3_1, 
  ch7_coeff_3_0, 
  ch7_coeff_2_10,//Section 2 coefficients (x <= 0, |x| <= section_limit)  
  ch7_coeff_2_9, 
  ch7_coeff_2_8, 
  ch7_coeff_2_7, 
  ch7_coeff_2_6, 
  ch7_coeff_2_5, 
  ch7_coeff_2_4, 
  ch7_coeff_2_3, 
  ch7_coeff_2_2, 
  ch7_coeff_2_1, 
  ch7_coeff_2_0, 
  ch7_coeff_1_10,//Section 1 coefficients (x <= 0, |x| > section_limit)  
  ch7_coeff_1_9, 
  ch7_coeff_1_8, 
  ch7_coeff_1_7, 
  ch7_coeff_1_6, 
  ch7_coeff_1_5, 
  ch7_coeff_1_4, 
  ch7_coeff_1_3, 
  ch7_coeff_1_2, 
  ch7_coeff_1_1, 
  ch7_coeff_1_0, 

  ch6_x_adc,//NLC output 
  ch6_x_lin,//ADC output 
  ch6_section_limit,//X-value that separates the sections 
  ch6_recip_stdev_4,//Reciprocal standard deviation for the centered and scaled fit  
  ch6_recip_stdev_3, 
  ch6_recip_stdev_2, 
  ch6_recip_stdev_1, 
  ch6_neg_mean_4,//Negative meand for the centered and scaled fit  
  ch6_neg_mean_3, 
  ch6_neg_mean_2, 
  ch6_neg_mean_1, 
  ch6_coeff_4_10, //Section 4 coefficients (x > 0, |x| > section_limit) 
  ch6_coeff_4_9, 
  ch6_coeff_4_8, 
  ch6_coeff_4_7, 
  ch6_coeff_4_6, 
  ch6_coeff_4_5, 
  ch6_coeff_4_4, 
  ch6_coeff_4_3, 
  ch6_coeff_4_2, 
  ch6_coeff_4_1, 
  ch6_coeff_4_0, 
  ch6_coeff_3_10,//Section 3 coefficients (x > 0, |x| <= section_limit)  
  ch6_coeff_3_9, 
  ch6_coeff_3_8, 
  ch6_coeff_3_7, 
  ch6_coeff_3_6, 
  ch6_coeff_3_5, 
  ch6_coeff_3_4, 
  ch6_coeff_3_3, 
  ch6_coeff_3_2, 
  ch6_coeff_3_1, 
  ch6_coeff_3_0, 
  ch6_coeff_2_10,//Section 2 coefficients (x <= 0, |x| <= section_limit)  
  ch6_coeff_2_9, 
  ch6_coeff_2_8, 
  ch6_coeff_2_7, 
  ch6_coeff_2_6, 
  ch6_coeff_2_5, 
  ch6_coeff_2_4, 
  ch6_coeff_2_3, 
  ch6_coeff_2_2, 
  ch6_coeff_2_1, 
  ch6_coeff_2_0, 
  ch6_coeff_1_10,//Section 1 coefficients (x <= 0, |x| > section_limit)  
  ch6_coeff_1_9, 
  ch6_coeff_1_8, 
  ch6_coeff_1_7, 
  ch6_coeff_1_6, 
  ch6_coeff_1_5, 
  ch6_coeff_1_4, 
  ch6_coeff_1_3, 
  ch6_coeff_1_2, 
  ch6_coeff_1_1, 
  ch6_coeff_1_0, 

  ch5_x_adc,//NLC output 
  ch5_x_lin,//ADC output 
  ch5_section_limit,//X-value that separates the sections 
  ch5_recip_stdev_4,//Reciprocal standard deviation for the centered and scaled fit  
  ch5_recip_stdev_3, 
  ch5_recip_stdev_2, 
  ch5_recip_stdev_1, 
  ch5_neg_mean_4,//Negative meand for the centered and scaled fit  
  ch5_neg_mean_3, 
  ch5_neg_mean_2, 
  ch5_neg_mean_1, 
  ch5_coeff_4_10, //Section 4 coefficients (x > 0, |x| > section_limit) 
  ch5_coeff_4_9, 
  ch5_coeff_4_8, 
  ch5_coeff_4_7, 
  ch5_coeff_4_6, 
  ch5_coeff_4_5, 
  ch5_coeff_4_4, 
  ch5_coeff_4_3, 
  ch5_coeff_4_2, 
  ch5_coeff_4_1, 
  ch5_coeff_4_0, 
  ch5_coeff_3_10,//Section 3 coefficients (x > 0, |x| <= section_limit)  
  ch5_coeff_3_9, 
  ch5_coeff_3_8, 
  ch5_coeff_3_7, 
  ch5_coeff_3_6, 
  ch5_coeff_3_5, 
  ch5_coeff_3_4, 
  ch5_coeff_3_3, 
  ch5_coeff_3_2, 
  ch5_coeff_3_1, 
  ch5_coeff_3_0, 
  ch5_coeff_2_10,//Section 2 coefficients (x <= 0, |x| <= section_limit)  
  ch5_coeff_2_9, 
  ch5_coeff_2_8, 
  ch5_coeff_2_7, 
  ch5_coeff_2_6, 
  ch5_coeff_2_5, 
  ch5_coeff_2_4, 
  ch5_coeff_2_3, 
  ch5_coeff_2_2, 
  ch5_coeff_2_1, 
  ch5_coeff_2_0, 
  ch5_coeff_1_10,//Section 1 coefficients (x <= 0, |x| > section_limit)  
  ch5_coeff_1_9, 
  ch5_coeff_1_8, 
  ch5_coeff_1_7, 
  ch5_coeff_1_6, 
  ch5_coeff_1_5, 
  ch5_coeff_1_4, 
  ch5_coeff_1_3, 
  ch5_coeff_1_2, 
  ch5_coeff_1_1, 
  ch5_coeff_1_0, 

  ch4_x_adc,//NLC output 
  ch4_x_lin,//ADC output 
  ch4_section_limit,//X-value that separates the sections 
  ch4_recip_stdev_4,//Reciprocal standard deviation for the centered and scaled fit  
  ch4_recip_stdev_3, 
  ch4_recip_stdev_2, 
  ch4_recip_stdev_1, 
  ch4_neg_mean_4,//Negative meand for the centered and scaled fit  
  ch4_neg_mean_3, 
  ch4_neg_mean_2, 
  ch4_neg_mean_1, 
  ch4_coeff_4_10, //Section 4 coefficients (x > 0, |x| > section_limit) 
  ch4_coeff_4_9, 
  ch4_coeff_4_8, 
  ch4_coeff_4_7, 
  ch4_coeff_4_6, 
  ch4_coeff_4_5, 
  ch4_coeff_4_4, 
  ch4_coeff_4_3, 
  ch4_coeff_4_2, 
  ch4_coeff_4_1, 
  ch4_coeff_4_0, 
  ch4_coeff_3_10,//Section 3 coefficients (x > 0, |x| <= section_limit)  
  ch4_coeff_3_9, 
  ch4_coeff_3_8, 
  ch4_coeff_3_7, 
  ch4_coeff_3_6, 
  ch4_coeff_3_5, 
  ch4_coeff_3_4, 
  ch4_coeff_3_3, 
  ch4_coeff_3_2, 
  ch4_coeff_3_1, 
  ch4_coeff_3_0, 
  ch4_coeff_2_10,//Section 2 coefficients (x <= 0, |x| <= section_limit)  
  ch4_coeff_2_9, 
  ch4_coeff_2_8, 
  ch4_coeff_2_7, 
  ch4_coeff_2_6, 
  ch4_coeff_2_5, 
  ch4_coeff_2_4, 
  ch4_coeff_2_3, 
  ch4_coeff_2_2, 
  ch4_coeff_2_1, 
  ch4_coeff_2_0, 
  ch4_coeff_1_10,//Section 1 coefficients (x <= 0, |x| > section_limit)  
  ch4_coeff_1_9, 
  ch4_coeff_1_8, 
  ch4_coeff_1_7, 
  ch4_coeff_1_6, 
  ch4_coeff_1_5, 
  ch4_coeff_1_4, 
  ch4_coeff_1_3, 
  ch4_coeff_1_2, 
  ch4_coeff_1_1, 
  ch4_coeff_1_0, 

  ch3_x_adc,//NLC output 
  ch3_x_lin,//ADC output 
  ch3_section_limit,//X-value that separates the sections 
  ch3_recip_stdev_4,//Reciprocal standard deviation for the centered and scaled fit  
  ch3_recip_stdev_3, 
  ch3_recip_stdev_2, 
  ch3_recip_stdev_1, 
  ch3_neg_mean_4,//Negative meand for the centered and scaled fit  
  ch3_neg_mean_3, 
  ch3_neg_mean_2, 
  ch3_neg_mean_1, 
  ch3_coeff_4_10, //Section 4 coefficients (x > 0, |x| > section_limit) 
  ch3_coeff_4_9, 
  ch3_coeff_4_8, 
  ch3_coeff_4_7, 
  ch3_coeff_4_6, 
  ch3_coeff_4_5, 
  ch3_coeff_4_4, 
  ch3_coeff_4_3, 
  ch3_coeff_4_2, 
  ch3_coeff_4_1, 
  ch3_coeff_4_0, 
  ch3_coeff_3_10,//Section 3 coefficients (x > 0, |x| <= section_limit)  
  ch3_coeff_3_9, 
  ch3_coeff_3_8, 
  ch3_coeff_3_7, 
  ch3_coeff_3_6, 
  ch3_coeff_3_5, 
  ch3_coeff_3_4, 
  ch3_coeff_3_3, 
  ch3_coeff_3_2, 
  ch3_coeff_3_1, 
  ch3_coeff_3_0, 
  ch3_coeff_2_10,//Section 2 coefficients (x <= 0, |x| <= section_limit)  
  ch3_coeff_2_9, 
  ch3_coeff_2_8, 
  ch3_coeff_2_7, 
  ch3_coeff_2_6, 
  ch3_coeff_2_5, 
  ch3_coeff_2_4, 
  ch3_coeff_2_3, 
  ch3_coeff_2_2, 
  ch3_coeff_2_1, 
  ch3_coeff_2_0, 
  ch3_coeff_1_10,//Section 1 coefficients (x <= 0, |x| > section_limit)  
  ch3_coeff_1_9, 
  ch3_coeff_1_8, 
  ch3_coeff_1_7, 
  ch3_coeff_1_6, 
  ch3_coeff_1_5, 
  ch3_coeff_1_4, 
  ch3_coeff_1_3, 
  ch3_coeff_1_2, 
  ch3_coeff_1_1, 
  ch3_coeff_1_0, 

  ch2_x_adc,//NLC output 
  ch2_x_lin,//ADC output 
  ch2_section_limit,//X-value that separates the sections 
  ch2_recip_stdev_4,//Reciprocal standard deviation for the centered and scaled fit  
  ch2_recip_stdev_3, 
  ch2_recip_stdev_2, 
  ch2_recip_stdev_1, 
  ch2_neg_mean_4,//Negative meand for the centered and scaled fit  
  ch2_neg_mean_3, 
  ch2_neg_mean_2, 
  ch2_neg_mean_1, 
  ch2_coeff_4_10, //Section 4 coefficients (x > 0, |x| > section_limit) 
  ch2_coeff_4_9, 
  ch2_coeff_4_8, 
  ch2_coeff_4_7, 
  ch2_coeff_4_6, 
  ch2_coeff_4_5, 
  ch2_coeff_4_4, 
  ch2_coeff_4_3, 
  ch2_coeff_4_2, 
  ch2_coeff_4_1, 
  ch2_coeff_4_0, 
  ch2_coeff_3_10,//Section 3 coefficients (x > 0, |x| <= section_limit)  
  ch2_coeff_3_9, 
  ch2_coeff_3_8, 
  ch2_coeff_3_7, 
  ch2_coeff_3_6, 
  ch2_coeff_3_5, 
  ch2_coeff_3_4, 
  ch2_coeff_3_3, 
  ch2_coeff_3_2, 
  ch2_coeff_3_1, 
  ch2_coeff_3_0, 
  ch2_coeff_2_10,//Section 2 coefficients (x <= 0, |x| <= section_limit)  
  ch2_coeff_2_9, 
  ch2_coeff_2_8, 
  ch2_coeff_2_7, 
  ch2_coeff_2_6, 
  ch2_coeff_2_5, 
  ch2_coeff_2_4, 
  ch2_coeff_2_3, 
  ch2_coeff_2_2, 
  ch2_coeff_2_1, 
  ch2_coeff_2_0, 
  ch2_coeff_1_10,//Section 1 coefficients (x <= 0, |x| > section_limit)  
  ch2_coeff_1_9, 
  ch2_coeff_1_8, 
  ch2_coeff_1_7, 
  ch2_coeff_1_6, 
  ch2_coeff_1_5, 
  ch2_coeff_1_4, 
  ch2_coeff_1_3, 
  ch2_coeff_1_2, 
  ch2_coeff_1_1, 
  ch2_coeff_1_0, 

  ch1_x_adc,//NLC output 
  ch1_x_lin,//ADC output 
  ch1_section_limit,//X-value that separates the sections 
  ch1_recip_stdev_4,//Reciprocal standard deviation for the centered and scaled fit  
  ch1_recip_stdev_3, 
  ch1_recip_stdev_2, 
  ch1_recip_stdev_1, 
  ch1_neg_mean_4,//Negative meand for the centered and scaled fit  
  ch1_neg_mean_3, 
  ch1_neg_mean_2, 
  ch1_neg_mean_1, 
  ch1_coeff_4_10, //Section 4 coefficients (x > 0, |x| > section_limit) 
  ch1_coeff_4_9, 
  ch1_coeff_4_8, 
  ch1_coeff_4_7, 
  ch1_coeff_4_6, 
  ch1_coeff_4_5, 
  ch1_coeff_4_4, 
  ch1_coeff_4_3, 
  ch1_coeff_4_2, 
  ch1_coeff_4_1, 
  ch1_coeff_4_0, 
  ch1_coeff_3_10,//Section 3 coefficients (x > 0, |x| <= section_limit)  
  ch1_coeff_3_9, 
  ch1_coeff_3_8, 
  ch1_coeff_3_7, 
  ch1_coeff_3_6, 
  ch1_coeff_3_5, 
  ch1_coeff_3_4, 
  ch1_coeff_3_3, 
  ch1_coeff_3_2, 
  ch1_coeff_3_1, 
  ch1_coeff_3_0, 
  ch1_coeff_2_10,//Section 2 coefficients (x <= 0, |x| <= section_limit)  
  ch1_coeff_2_9, 
  ch1_coeff_2_8, 
  ch1_coeff_2_7, 
  ch1_coeff_2_6, 
  ch1_coeff_2_5, 
  ch1_coeff_2_4, 
  ch1_coeff_2_3, 
  ch1_coeff_2_2, 
  ch1_coeff_2_1, 
  ch1_coeff_2_0, 
  ch1_coeff_1_10,//Section 1 coefficients (x <= 0, |x| > section_limit)  
  ch1_coeff_1_9, 
  ch1_coeff_1_8, 
  ch1_coeff_1_7, 
  ch1_coeff_1_6, 
  ch1_coeff_1_5, 
  ch1_coeff_1_4, 
  ch1_coeff_1_3, 
  ch1_coeff_1_2, 
  ch1_coeff_1_1, 
  ch1_coeff_1_0, 

  ch0_x_adc,//NLC output 
  ch0_x_lin,//ADC output 
  ch0_section_limit,//X-value that separates the sections 
  ch0_recip_stdev_4,//Reciprocal standard deviation for the centered and scaled fit  
  ch0_recip_stdev_3, 
  ch0_recip_stdev_2, 
  ch0_recip_stdev_1, 
  ch0_neg_mean_4,//Negative meand for the centered and scaled fit  
  ch0_neg_mean_3, 
  ch0_neg_mean_2, 
  ch0_neg_mean_1, 
  ch0_coeff_4_10, //Section 4 coefficients (x > 0, |x| > section_limit) 
  ch0_coeff_4_9, 
  ch0_coeff_4_8, 
  ch0_coeff_4_7, 
  ch0_coeff_4_6, 
  ch0_coeff_4_5, 
  ch0_coeff_4_4, 
  ch0_coeff_4_3, 
  ch0_coeff_4_2, 
  ch0_coeff_4_1, 
  ch0_coeff_4_0, 
  ch0_coeff_3_10,//Section 3 coefficients (x > 0, |x| <= section_limit)  
  ch0_coeff_3_9, 
  ch0_coeff_3_8, 
  ch0_coeff_3_7, 
  ch0_coeff_3_6, 
  ch0_coeff_3_5, 
  ch0_coeff_3_4, 
  ch0_coeff_3_3, 
  ch0_coeff_3_2, 
  ch0_coeff_3_1, 
  ch0_coeff_3_0, 
  ch0_coeff_2_10,//Section 2 coefficients (x <= 0, |x| <= section_limit)  
  ch0_coeff_2_9, 
  ch0_coeff_2_8, 
  ch0_coeff_2_7, 
  ch0_coeff_2_6, 
  ch0_coeff_2_5, 
  ch0_coeff_2_4, 
  ch0_coeff_2_3, 
  ch0_coeff_2_2, 
  ch0_coeff_2_1, 
  ch0_coeff_2_0, 
  ch0_coeff_1_10,//Section 1 coefficients (x <= 0, |x| > section_limit)  
  ch0_coeff_1_9, 
  ch0_coeff_1_8, 
  ch0_coeff_1_7, 
  ch0_coeff_1_6, 
  ch0_coeff_1_5, 
  ch0_coeff_1_4, 
  ch0_coeff_1_3, 
  ch0_coeff_1_2, 
  ch0_coeff_1_1, 
  ch0_coeff_1_0 

);

////////////////////////////////////////////////////////////////
//  Inputs & Outputs
input clk;
input reset;

//Input valid and output ready signals (one for all 32ch)  
input srdyi;
output srdyo;

input [20:0] ch31_x_adc;//NLC output 
output [20:0] ch31_x_lin;//ADC output 
input [19:0] ch31_section_limit;//X-value that separates the sections 
input [31:0] ch31_recip_stdev_4;//Reciprocal standard deviation for the centered and scaled fit  
input [31:0] ch31_recip_stdev_3; 
input [31:0] ch31_recip_stdev_2; 
input [31:0] ch31_recip_stdev_1; 
input [31:0] ch31_neg_mean_4;//Negative meand for the centered and scaled fit  
input [31:0] ch31_neg_mean_3; 
input [31:0] ch31_neg_mean_2; 
input [31:0] ch31_neg_mean_1; 
input [31:0] ch31_coeff_4_10; //Section 4 coefficients (x > 0, |x| > section_limit) 
input [31:0] ch31_coeff_4_9; 
input [31:0] ch31_coeff_4_8; 
input [31:0] ch31_coeff_4_7; 
input [31:0] ch31_coeff_4_6; 
input [31:0] ch31_coeff_4_5; 
input [31:0] ch31_coeff_4_4; 
input [31:0] ch31_coeff_4_3; 
input [31:0] ch31_coeff_4_2; 
input [31:0] ch31_coeff_4_1; 
input [31:0] ch31_coeff_4_0; 
input [31:0] ch31_coeff_3_10;//Section 3 coefficients (x > 0, |x| <= section_limit)  
input [31:0] ch31_coeff_3_9; 
input [31:0] ch31_coeff_3_8; 
input [31:0] ch31_coeff_3_7; 
input [31:0] ch31_coeff_3_6; 
input [31:0] ch31_coeff_3_5; 
input [31:0] ch31_coeff_3_4; 
input [31:0] ch31_coeff_3_3; 
input [31:0] ch31_coeff_3_2; 
input [31:0] ch31_coeff_3_1; 
input [31:0] ch31_coeff_3_0; 
input [31:0] ch31_coeff_2_10;//Section 2 coefficients (x <= 0, |x| <= section_limit)  
input [31:0] ch31_coeff_2_9; 
input [31:0] ch31_coeff_2_8; 
input [31:0] ch31_coeff_2_7; 
input [31:0] ch31_coeff_2_6; 
input [31:0] ch31_coeff_2_5; 
input [31:0] ch31_coeff_2_4; 
input [31:0] ch31_coeff_2_3; 
input [31:0] ch31_coeff_2_2; 
input [31:0] ch31_coeff_2_1; 
input [31:0] ch31_coeff_2_0; 
input [31:0] ch31_coeff_1_10;//Section 1 coefficients (x <= 0, |x| > section_limit)  
input [31:0] ch31_coeff_1_9; 
input [31:0] ch31_coeff_1_8; 
input [31:0] ch31_coeff_1_7; 
input [31:0] ch31_coeff_1_6; 
input [31:0] ch31_coeff_1_5; 
input [31:0] ch31_coeff_1_4; 
input [31:0] ch31_coeff_1_3; 
input [31:0] ch31_coeff_1_2; 
input [31:0] ch31_coeff_1_1; 
input [31:0] ch31_coeff_1_0; 

input [20:0] ch30_x_adc;//NLC output 
output [20:0] ch30_x_lin;//ADC output 
input [19:0] ch30_section_limit;//X-value that separates the sections 
input [31:0] ch30_recip_stdev_4;//Reciprocal standard deviation for the centered and scaled fit  
input [31:0] ch30_recip_stdev_3; 
input [31:0] ch30_recip_stdev_2; 
input [31:0] ch30_recip_stdev_1; 
input [31:0] ch30_neg_mean_4;//Negative meand for the centered and scaled fit  
input [31:0] ch30_neg_mean_3; 
input [31:0] ch30_neg_mean_2; 
input [31:0] ch30_neg_mean_1; 
input [31:0] ch30_coeff_4_10; //Section 4 coefficients (x > 0, |x| > section_limit) 
input [31:0] ch30_coeff_4_9; 
input [31:0] ch30_coeff_4_8; 
input [31:0] ch30_coeff_4_7; 
input [31:0] ch30_coeff_4_6; 
input [31:0] ch30_coeff_4_5; 
input [31:0] ch30_coeff_4_4; 
input [31:0] ch30_coeff_4_3; 
input [31:0] ch30_coeff_4_2; 
input [31:0] ch30_coeff_4_1; 
input [31:0] ch30_coeff_4_0; 
input [31:0] ch30_coeff_3_10;//Section 3 coefficients (x > 0, |x| <= section_limit)  
input [31:0] ch30_coeff_3_9; 
input [31:0] ch30_coeff_3_8; 
input [31:0] ch30_coeff_3_7; 
input [31:0] ch30_coeff_3_6; 
input [31:0] ch30_coeff_3_5; 
input [31:0] ch30_coeff_3_4; 
input [31:0] ch30_coeff_3_3; 
input [31:0] ch30_coeff_3_2; 
input [31:0] ch30_coeff_3_1; 
input [31:0] ch30_coeff_3_0; 
input [31:0] ch30_coeff_2_10;//Section 2 coefficients (x <= 0, |x| <= section_limit)  
input [31:0] ch30_coeff_2_9; 
input [31:0] ch30_coeff_2_8; 
input [31:0] ch30_coeff_2_7; 
input [31:0] ch30_coeff_2_6; 
input [31:0] ch30_coeff_2_5; 
input [31:0] ch30_coeff_2_4; 
input [31:0] ch30_coeff_2_3; 
input [31:0] ch30_coeff_2_2; 
input [31:0] ch30_coeff_2_1; 
input [31:0] ch30_coeff_2_0; 
input [31:0] ch30_coeff_1_10;//Section 1 coefficients (x <= 0, |x| > section_limit)  
input [31:0] ch30_coeff_1_9; 
input [31:0] ch30_coeff_1_8; 
input [31:0] ch30_coeff_1_7; 
input [31:0] ch30_coeff_1_6; 
input [31:0] ch30_coeff_1_5; 
input [31:0] ch30_coeff_1_4; 
input [31:0] ch30_coeff_1_3; 
input [31:0] ch30_coeff_1_2; 
input [31:0] ch30_coeff_1_1; 
input [31:0] ch30_coeff_1_0; 

input [20:0] ch29_x_adc;//NLC output 
output [20:0] ch29_x_lin;//ADC output 
input [19:0] ch29_section_limit;//X-value that separates the sections 
input [31:0] ch29_recip_stdev_4;//Reciprocal standard deviation for the centered and scaled fit  
input [31:0] ch29_recip_stdev_3; 
input [31:0] ch29_recip_stdev_2; 
input [31:0] ch29_recip_stdev_1; 
input [31:0] ch29_neg_mean_4;//Negative meand for the centered and scaled fit  
input [31:0] ch29_neg_mean_3; 
input [31:0] ch29_neg_mean_2; 
input [31:0] ch29_neg_mean_1; 
input [31:0] ch29_coeff_4_10; //Section 4 coefficients (x > 0, |x| > section_limit) 
input [31:0] ch29_coeff_4_9; 
input [31:0] ch29_coeff_4_8; 
input [31:0] ch29_coeff_4_7; 
input [31:0] ch29_coeff_4_6; 
input [31:0] ch29_coeff_4_5; 
input [31:0] ch29_coeff_4_4; 
input [31:0] ch29_coeff_4_3; 
input [31:0] ch29_coeff_4_2; 
input [31:0] ch29_coeff_4_1; 
input [31:0] ch29_coeff_4_0; 
input [31:0] ch29_coeff_3_10;//Section 3 coefficients (x > 0, |x| <= section_limit)  
input [31:0] ch29_coeff_3_9; 
input [31:0] ch29_coeff_3_8; 
input [31:0] ch29_coeff_3_7; 
input [31:0] ch29_coeff_3_6; 
input [31:0] ch29_coeff_3_5; 
input [31:0] ch29_coeff_3_4; 
input [31:0] ch29_coeff_3_3; 
input [31:0] ch29_coeff_3_2; 
input [31:0] ch29_coeff_3_1; 
input [31:0] ch29_coeff_3_0; 
input [31:0] ch29_coeff_2_10;//Section 2 coefficients (x <= 0, |x| <= section_limit)  
input [31:0] ch29_coeff_2_9; 
input [31:0] ch29_coeff_2_8; 
input [31:0] ch29_coeff_2_7; 
input [31:0] ch29_coeff_2_6; 
input [31:0] ch29_coeff_2_5; 
input [31:0] ch29_coeff_2_4; 
input [31:0] ch29_coeff_2_3; 
input [31:0] ch29_coeff_2_2; 
input [31:0] ch29_coeff_2_1; 
input [31:0] ch29_coeff_2_0; 
input [31:0] ch29_coeff_1_10;//Section 1 coefficients (x <= 0, |x| > section_limit)  
input [31:0] ch29_coeff_1_9; 
input [31:0] ch29_coeff_1_8; 
input [31:0] ch29_coeff_1_7; 
input [31:0] ch29_coeff_1_6; 
input [31:0] ch29_coeff_1_5; 
input [31:0] ch29_coeff_1_4; 
input [31:0] ch29_coeff_1_3; 
input [31:0] ch29_coeff_1_2; 
input [31:0] ch29_coeff_1_1; 
input [31:0] ch29_coeff_1_0; 

input [20:0] ch28_x_adc;//NLC output 
output [20:0] ch28_x_lin;//ADC output 
input [19:0] ch28_section_limit;//X-value that separates the sections 
input [31:0] ch28_recip_stdev_4;//Reciprocal standard deviation for the centered and scaled fit  
input [31:0] ch28_recip_stdev_3; 
input [31:0] ch28_recip_stdev_2; 
input [31:0] ch28_recip_stdev_1; 
input [31:0] ch28_neg_mean_4;//Negative meand for the centered and scaled fit  
input [31:0] ch28_neg_mean_3; 
input [31:0] ch28_neg_mean_2; 
input [31:0] ch28_neg_mean_1; 
input [31:0] ch28_coeff_4_10; //Section 4 coefficients (x > 0, |x| > section_limit) 
input [31:0] ch28_coeff_4_9; 
input [31:0] ch28_coeff_4_8; 
input [31:0] ch28_coeff_4_7; 
input [31:0] ch28_coeff_4_6; 
input [31:0] ch28_coeff_4_5; 
input [31:0] ch28_coeff_4_4; 
input [31:0] ch28_coeff_4_3; 
input [31:0] ch28_coeff_4_2; 
input [31:0] ch28_coeff_4_1; 
input [31:0] ch28_coeff_4_0; 
input [31:0] ch28_coeff_3_10;//Section 3 coefficients (x > 0, |x| <= section_limit)  
input [31:0] ch28_coeff_3_9; 
input [31:0] ch28_coeff_3_8; 
input [31:0] ch28_coeff_3_7; 
input [31:0] ch28_coeff_3_6; 
input [31:0] ch28_coeff_3_5; 
input [31:0] ch28_coeff_3_4; 
input [31:0] ch28_coeff_3_3; 
input [31:0] ch28_coeff_3_2; 
input [31:0] ch28_coeff_3_1; 
input [31:0] ch28_coeff_3_0; 
input [31:0] ch28_coeff_2_10;//Section 2 coefficients (x <= 0, |x| <= section_limit)  
input [31:0] ch28_coeff_2_9; 
input [31:0] ch28_coeff_2_8; 
input [31:0] ch28_coeff_2_7; 
input [31:0] ch28_coeff_2_6; 
input [31:0] ch28_coeff_2_5; 
input [31:0] ch28_coeff_2_4; 
input [31:0] ch28_coeff_2_3; 
input [31:0] ch28_coeff_2_2; 
input [31:0] ch28_coeff_2_1; 
input [31:0] ch28_coeff_2_0; 
input [31:0] ch28_coeff_1_10;//Section 1 coefficients (x <= 0, |x| > section_limit)  
input [31:0] ch28_coeff_1_9; 
input [31:0] ch28_coeff_1_8; 
input [31:0] ch28_coeff_1_7; 
input [31:0] ch28_coeff_1_6; 
input [31:0] ch28_coeff_1_5; 
input [31:0] ch28_coeff_1_4; 
input [31:0] ch28_coeff_1_3; 
input [31:0] ch28_coeff_1_2; 
input [31:0] ch28_coeff_1_1; 
input [31:0] ch28_coeff_1_0; 

input [20:0] ch27_x_adc;//NLC output 
output [20:0] ch27_x_lin;//ADC output 
input [19:0] ch27_section_limit;//X-value that separates the sections 
input [31:0] ch27_recip_stdev_4;//Reciprocal standard deviation for the centered and scaled fit  
input [31:0] ch27_recip_stdev_3; 
input [31:0] ch27_recip_stdev_2; 
input [31:0] ch27_recip_stdev_1; 
input [31:0] ch27_neg_mean_4;//Negative meand for the centered and scaled fit  
input [31:0] ch27_neg_mean_3; 
input [31:0] ch27_neg_mean_2; 
input [31:0] ch27_neg_mean_1; 
input [31:0] ch27_coeff_4_10; //Section 4 coefficients (x > 0, |x| > section_limit) 
input [31:0] ch27_coeff_4_9; 
input [31:0] ch27_coeff_4_8; 
input [31:0] ch27_coeff_4_7; 
input [31:0] ch27_coeff_4_6; 
input [31:0] ch27_coeff_4_5; 
input [31:0] ch27_coeff_4_4; 
input [31:0] ch27_coeff_4_3; 
input [31:0] ch27_coeff_4_2; 
input [31:0] ch27_coeff_4_1; 
input [31:0] ch27_coeff_4_0; 
input [31:0] ch27_coeff_3_10;//Section 3 coefficients (x > 0, |x| <= section_limit)  
input [31:0] ch27_coeff_3_9; 
input [31:0] ch27_coeff_3_8; 
input [31:0] ch27_coeff_3_7; 
input [31:0] ch27_coeff_3_6; 
input [31:0] ch27_coeff_3_5; 
input [31:0] ch27_coeff_3_4; 
input [31:0] ch27_coeff_3_3; 
input [31:0] ch27_coeff_3_2; 
input [31:0] ch27_coeff_3_1; 
input [31:0] ch27_coeff_3_0; 
input [31:0] ch27_coeff_2_10;//Section 2 coefficients (x <= 0, |x| <= section_limit)  
input [31:0] ch27_coeff_2_9; 
input [31:0] ch27_coeff_2_8; 
input [31:0] ch27_coeff_2_7; 
input [31:0] ch27_coeff_2_6; 
input [31:0] ch27_coeff_2_5; 
input [31:0] ch27_coeff_2_4; 
input [31:0] ch27_coeff_2_3; 
input [31:0] ch27_coeff_2_2; 
input [31:0] ch27_coeff_2_1; 
input [31:0] ch27_coeff_2_0; 
input [31:0] ch27_coeff_1_10;//Section 1 coefficients (x <= 0, |x| > section_limit)  
input [31:0] ch27_coeff_1_9; 
input [31:0] ch27_coeff_1_8; 
input [31:0] ch27_coeff_1_7; 
input [31:0] ch27_coeff_1_6; 
input [31:0] ch27_coeff_1_5; 
input [31:0] ch27_coeff_1_4; 
input [31:0] ch27_coeff_1_3; 
input [31:0] ch27_coeff_1_2; 
input [31:0] ch27_coeff_1_1; 
input [31:0] ch27_coeff_1_0; 

input [20:0] ch26_x_adc;//NLC output 
output [20:0] ch26_x_lin;//ADC output 
input [19:0] ch26_section_limit;//X-value that separates the sections 
input [31:0] ch26_recip_stdev_4;//Reciprocal standard deviation for the centered and scaled fit  
input [31:0] ch26_recip_stdev_3; 
input [31:0] ch26_recip_stdev_2; 
input [31:0] ch26_recip_stdev_1; 
input [31:0] ch26_neg_mean_4;//Negative meand for the centered and scaled fit  
input [31:0] ch26_neg_mean_3; 
input [31:0] ch26_neg_mean_2; 
input [31:0] ch26_neg_mean_1; 
input [31:0] ch26_coeff_4_10; //Section 4 coefficients (x > 0, |x| > section_limit) 
input [31:0] ch26_coeff_4_9; 
input [31:0] ch26_coeff_4_8; 
input [31:0] ch26_coeff_4_7; 
input [31:0] ch26_coeff_4_6; 
input [31:0] ch26_coeff_4_5; 
input [31:0] ch26_coeff_4_4; 
input [31:0] ch26_coeff_4_3; 
input [31:0] ch26_coeff_4_2; 
input [31:0] ch26_coeff_4_1; 
input [31:0] ch26_coeff_4_0; 
input [31:0] ch26_coeff_3_10;//Section 3 coefficients (x > 0, |x| <= section_limit)  
input [31:0] ch26_coeff_3_9; 
input [31:0] ch26_coeff_3_8; 
input [31:0] ch26_coeff_3_7; 
input [31:0] ch26_coeff_3_6; 
input [31:0] ch26_coeff_3_5; 
input [31:0] ch26_coeff_3_4; 
input [31:0] ch26_coeff_3_3; 
input [31:0] ch26_coeff_3_2; 
input [31:0] ch26_coeff_3_1; 
input [31:0] ch26_coeff_3_0; 
input [31:0] ch26_coeff_2_10;//Section 2 coefficients (x <= 0, |x| <= section_limit)  
input [31:0] ch26_coeff_2_9; 
input [31:0] ch26_coeff_2_8; 
input [31:0] ch26_coeff_2_7; 
input [31:0] ch26_coeff_2_6; 
input [31:0] ch26_coeff_2_5; 
input [31:0] ch26_coeff_2_4; 
input [31:0] ch26_coeff_2_3; 
input [31:0] ch26_coeff_2_2; 
input [31:0] ch26_coeff_2_1; 
input [31:0] ch26_coeff_2_0; 
input [31:0] ch26_coeff_1_10;//Section 1 coefficients (x <= 0, |x| > section_limit)  
input [31:0] ch26_coeff_1_9; 
input [31:0] ch26_coeff_1_8; 
input [31:0] ch26_coeff_1_7; 
input [31:0] ch26_coeff_1_6; 
input [31:0] ch26_coeff_1_5; 
input [31:0] ch26_coeff_1_4; 
input [31:0] ch26_coeff_1_3; 
input [31:0] ch26_coeff_1_2; 
input [31:0] ch26_coeff_1_1; 
input [31:0] ch26_coeff_1_0; 

input [20:0] ch25_x_adc;//NLC output 
output [20:0] ch25_x_lin;//ADC output 
input [19:0] ch25_section_limit;//X-value that separates the sections 
input [31:0] ch25_recip_stdev_4;//Reciprocal standard deviation for the centered and scaled fit  
input [31:0] ch25_recip_stdev_3; 
input [31:0] ch25_recip_stdev_2; 
input [31:0] ch25_recip_stdev_1; 
input [31:0] ch25_neg_mean_4;//Negative meand for the centered and scaled fit  
input [31:0] ch25_neg_mean_3; 
input [31:0] ch25_neg_mean_2; 
input [31:0] ch25_neg_mean_1; 
input [31:0] ch25_coeff_4_10; //Section 4 coefficients (x > 0, |x| > section_limit) 
input [31:0] ch25_coeff_4_9; 
input [31:0] ch25_coeff_4_8; 
input [31:0] ch25_coeff_4_7; 
input [31:0] ch25_coeff_4_6; 
input [31:0] ch25_coeff_4_5; 
input [31:0] ch25_coeff_4_4; 
input [31:0] ch25_coeff_4_3; 
input [31:0] ch25_coeff_4_2; 
input [31:0] ch25_coeff_4_1; 
input [31:0] ch25_coeff_4_0; 
input [31:0] ch25_coeff_3_10;//Section 3 coefficients (x > 0, |x| <= section_limit)  
input [31:0] ch25_coeff_3_9; 
input [31:0] ch25_coeff_3_8; 
input [31:0] ch25_coeff_3_7; 
input [31:0] ch25_coeff_3_6; 
input [31:0] ch25_coeff_3_5; 
input [31:0] ch25_coeff_3_4; 
input [31:0] ch25_coeff_3_3; 
input [31:0] ch25_coeff_3_2; 
input [31:0] ch25_coeff_3_1; 
input [31:0] ch25_coeff_3_0; 
input [31:0] ch25_coeff_2_10;//Section 2 coefficients (x <= 0, |x| <= section_limit)  
input [31:0] ch25_coeff_2_9; 
input [31:0] ch25_coeff_2_8; 
input [31:0] ch25_coeff_2_7; 
input [31:0] ch25_coeff_2_6; 
input [31:0] ch25_coeff_2_5; 
input [31:0] ch25_coeff_2_4; 
input [31:0] ch25_coeff_2_3; 
input [31:0] ch25_coeff_2_2; 
input [31:0] ch25_coeff_2_1; 
input [31:0] ch25_coeff_2_0; 
input [31:0] ch25_coeff_1_10;//Section 1 coefficients (x <= 0, |x| > section_limit)  
input [31:0] ch25_coeff_1_9; 
input [31:0] ch25_coeff_1_8; 
input [31:0] ch25_coeff_1_7; 
input [31:0] ch25_coeff_1_6; 
input [31:0] ch25_coeff_1_5; 
input [31:0] ch25_coeff_1_4; 
input [31:0] ch25_coeff_1_3; 
input [31:0] ch25_coeff_1_2; 
input [31:0] ch25_coeff_1_1; 
input [31:0] ch25_coeff_1_0; 

input [20:0] ch24_x_adc;//NLC output 
output [20:0] ch24_x_lin;//ADC output 
input [19:0] ch24_section_limit;//X-value that separates the sections 
input [31:0] ch24_recip_stdev_4;//Reciprocal standard deviation for the centered and scaled fit  
input [31:0] ch24_recip_stdev_3; 
input [31:0] ch24_recip_stdev_2; 
input [31:0] ch24_recip_stdev_1; 
input [31:0] ch24_neg_mean_4;//Negative meand for the centered and scaled fit  
input [31:0] ch24_neg_mean_3; 
input [31:0] ch24_neg_mean_2; 
input [31:0] ch24_neg_mean_1; 
input [31:0] ch24_coeff_4_10; //Section 4 coefficients (x > 0, |x| > section_limit) 
input [31:0] ch24_coeff_4_9; 
input [31:0] ch24_coeff_4_8; 
input [31:0] ch24_coeff_4_7; 
input [31:0] ch24_coeff_4_6; 
input [31:0] ch24_coeff_4_5; 
input [31:0] ch24_coeff_4_4; 
input [31:0] ch24_coeff_4_3; 
input [31:0] ch24_coeff_4_2; 
input [31:0] ch24_coeff_4_1; 
input [31:0] ch24_coeff_4_0; 
input [31:0] ch24_coeff_3_10;//Section 3 coefficients (x > 0, |x| <= section_limit)  
input [31:0] ch24_coeff_3_9; 
input [31:0] ch24_coeff_3_8; 
input [31:0] ch24_coeff_3_7; 
input [31:0] ch24_coeff_3_6; 
input [31:0] ch24_coeff_3_5; 
input [31:0] ch24_coeff_3_4; 
input [31:0] ch24_coeff_3_3; 
input [31:0] ch24_coeff_3_2; 
input [31:0] ch24_coeff_3_1; 
input [31:0] ch24_coeff_3_0; 
input [31:0] ch24_coeff_2_10;//Section 2 coefficients (x <= 0, |x| <= section_limit)  
input [31:0] ch24_coeff_2_9; 
input [31:0] ch24_coeff_2_8; 
input [31:0] ch24_coeff_2_7; 
input [31:0] ch24_coeff_2_6; 
input [31:0] ch24_coeff_2_5; 
input [31:0] ch24_coeff_2_4; 
input [31:0] ch24_coeff_2_3; 
input [31:0] ch24_coeff_2_2; 
input [31:0] ch24_coeff_2_1; 
input [31:0] ch24_coeff_2_0; 
input [31:0] ch24_coeff_1_10;//Section 1 coefficients (x <= 0, |x| > section_limit)  
input [31:0] ch24_coeff_1_9; 
input [31:0] ch24_coeff_1_8; 
input [31:0] ch24_coeff_1_7; 
input [31:0] ch24_coeff_1_6; 
input [31:0] ch24_coeff_1_5; 
input [31:0] ch24_coeff_1_4; 
input [31:0] ch24_coeff_1_3; 
input [31:0] ch24_coeff_1_2; 
input [31:0] ch24_coeff_1_1; 
input [31:0] ch24_coeff_1_0; 

input [20:0] ch23_x_adc;//NLC output 
output [20:0] ch23_x_lin;//ADC output 
input [19:0] ch23_section_limit;//X-value that separates the sections 
input [31:0] ch23_recip_stdev_4;//Reciprocal standard deviation for the centered and scaled fit  
input [31:0] ch23_recip_stdev_3; 
input [31:0] ch23_recip_stdev_2; 
input [31:0] ch23_recip_stdev_1; 
input [31:0] ch23_neg_mean_4;//Negative meand for the centered and scaled fit  
input [31:0] ch23_neg_mean_3; 
input [31:0] ch23_neg_mean_2; 
input [31:0] ch23_neg_mean_1; 
input [31:0] ch23_coeff_4_10; //Section 4 coefficients (x > 0, |x| > section_limit) 
input [31:0] ch23_coeff_4_9; 
input [31:0] ch23_coeff_4_8; 
input [31:0] ch23_coeff_4_7; 
input [31:0] ch23_coeff_4_6; 
input [31:0] ch23_coeff_4_5; 
input [31:0] ch23_coeff_4_4; 
input [31:0] ch23_coeff_4_3; 
input [31:0] ch23_coeff_4_2; 
input [31:0] ch23_coeff_4_1; 
input [31:0] ch23_coeff_4_0; 
input [31:0] ch23_coeff_3_10;//Section 3 coefficients (x > 0, |x| <= section_limit)  
input [31:0] ch23_coeff_3_9; 
input [31:0] ch23_coeff_3_8; 
input [31:0] ch23_coeff_3_7; 
input [31:0] ch23_coeff_3_6; 
input [31:0] ch23_coeff_3_5; 
input [31:0] ch23_coeff_3_4; 
input [31:0] ch23_coeff_3_3; 
input [31:0] ch23_coeff_3_2; 
input [31:0] ch23_coeff_3_1; 
input [31:0] ch23_coeff_3_0; 
input [31:0] ch23_coeff_2_10;//Section 2 coefficients (x <= 0, |x| <= section_limit)  
input [31:0] ch23_coeff_2_9; 
input [31:0] ch23_coeff_2_8; 
input [31:0] ch23_coeff_2_7; 
input [31:0] ch23_coeff_2_6; 
input [31:0] ch23_coeff_2_5; 
input [31:0] ch23_coeff_2_4; 
input [31:0] ch23_coeff_2_3; 
input [31:0] ch23_coeff_2_2; 
input [31:0] ch23_coeff_2_1; 
input [31:0] ch23_coeff_2_0; 
input [31:0] ch23_coeff_1_10;//Section 1 coefficients (x <= 0, |x| > section_limit)  
input [31:0] ch23_coeff_1_9; 
input [31:0] ch23_coeff_1_8; 
input [31:0] ch23_coeff_1_7; 
input [31:0] ch23_coeff_1_6; 
input [31:0] ch23_coeff_1_5; 
input [31:0] ch23_coeff_1_4; 
input [31:0] ch23_coeff_1_3; 
input [31:0] ch23_coeff_1_2; 
input [31:0] ch23_coeff_1_1; 
input [31:0] ch23_coeff_1_0; 

input [20:0] ch22_x_adc;//NLC output 
output [20:0] ch22_x_lin;//ADC output 
input [19:0] ch22_section_limit;//X-value that separates the sections 
input [31:0] ch22_recip_stdev_4;//Reciprocal standard deviation for the centered and scaled fit  
input [31:0] ch22_recip_stdev_3; 
input [31:0] ch22_recip_stdev_2; 
input [31:0] ch22_recip_stdev_1; 
input [31:0] ch22_neg_mean_4;//Negative meand for the centered and scaled fit  
input [31:0] ch22_neg_mean_3; 
input [31:0] ch22_neg_mean_2; 
input [31:0] ch22_neg_mean_1; 
input [31:0] ch22_coeff_4_10; //Section 4 coefficients (x > 0, |x| > section_limit) 
input [31:0] ch22_coeff_4_9; 
input [31:0] ch22_coeff_4_8; 
input [31:0] ch22_coeff_4_7; 
input [31:0] ch22_coeff_4_6; 
input [31:0] ch22_coeff_4_5; 
input [31:0] ch22_coeff_4_4; 
input [31:0] ch22_coeff_4_3; 
input [31:0] ch22_coeff_4_2; 
input [31:0] ch22_coeff_4_1; 
input [31:0] ch22_coeff_4_0; 
input [31:0] ch22_coeff_3_10;//Section 3 coefficients (x > 0, |x| <= section_limit)  
input [31:0] ch22_coeff_3_9; 
input [31:0] ch22_coeff_3_8; 
input [31:0] ch22_coeff_3_7; 
input [31:0] ch22_coeff_3_6; 
input [31:0] ch22_coeff_3_5; 
input [31:0] ch22_coeff_3_4; 
input [31:0] ch22_coeff_3_3; 
input [31:0] ch22_coeff_3_2; 
input [31:0] ch22_coeff_3_1; 
input [31:0] ch22_coeff_3_0; 
input [31:0] ch22_coeff_2_10;//Section 2 coefficients (x <= 0, |x| <= section_limit)  
input [31:0] ch22_coeff_2_9; 
input [31:0] ch22_coeff_2_8; 
input [31:0] ch22_coeff_2_7; 
input [31:0] ch22_coeff_2_6; 
input [31:0] ch22_coeff_2_5; 
input [31:0] ch22_coeff_2_4; 
input [31:0] ch22_coeff_2_3; 
input [31:0] ch22_coeff_2_2; 
input [31:0] ch22_coeff_2_1; 
input [31:0] ch22_coeff_2_0; 
input [31:0] ch22_coeff_1_10;//Section 1 coefficients (x <= 0, |x| > section_limit)  
input [31:0] ch22_coeff_1_9; 
input [31:0] ch22_coeff_1_8; 
input [31:0] ch22_coeff_1_7; 
input [31:0] ch22_coeff_1_6; 
input [31:0] ch22_coeff_1_5; 
input [31:0] ch22_coeff_1_4; 
input [31:0] ch22_coeff_1_3; 
input [31:0] ch22_coeff_1_2; 
input [31:0] ch22_coeff_1_1; 
input [31:0] ch22_coeff_1_0; 

input [20:0] ch21_x_adc;//NLC output 
output [20:0] ch21_x_lin;//ADC output 
input [19:0] ch21_section_limit;//X-value that separates the sections 
input [31:0] ch21_recip_stdev_4;//Reciprocal standard deviation for the centered and scaled fit  
input [31:0] ch21_recip_stdev_3; 
input [31:0] ch21_recip_stdev_2; 
input [31:0] ch21_recip_stdev_1; 
input [31:0] ch21_neg_mean_4;//Negative meand for the centered and scaled fit  
input [31:0] ch21_neg_mean_3; 
input [31:0] ch21_neg_mean_2; 
input [31:0] ch21_neg_mean_1; 
input [31:0] ch21_coeff_4_10; //Section 4 coefficients (x > 0, |x| > section_limit) 
input [31:0] ch21_coeff_4_9; 
input [31:0] ch21_coeff_4_8; 
input [31:0] ch21_coeff_4_7; 
input [31:0] ch21_coeff_4_6; 
input [31:0] ch21_coeff_4_5; 
input [31:0] ch21_coeff_4_4; 
input [31:0] ch21_coeff_4_3; 
input [31:0] ch21_coeff_4_2; 
input [31:0] ch21_coeff_4_1; 
input [31:0] ch21_coeff_4_0; 
input [31:0] ch21_coeff_3_10;//Section 3 coefficients (x > 0, |x| <= section_limit)  
input [31:0] ch21_coeff_3_9; 
input [31:0] ch21_coeff_3_8; 
input [31:0] ch21_coeff_3_7; 
input [31:0] ch21_coeff_3_6; 
input [31:0] ch21_coeff_3_5; 
input [31:0] ch21_coeff_3_4; 
input [31:0] ch21_coeff_3_3; 
input [31:0] ch21_coeff_3_2; 
input [31:0] ch21_coeff_3_1; 
input [31:0] ch21_coeff_3_0; 
input [31:0] ch21_coeff_2_10;//Section 2 coefficients (x <= 0, |x| <= section_limit)  
input [31:0] ch21_coeff_2_9; 
input [31:0] ch21_coeff_2_8; 
input [31:0] ch21_coeff_2_7; 
input [31:0] ch21_coeff_2_6; 
input [31:0] ch21_coeff_2_5; 
input [31:0] ch21_coeff_2_4; 
input [31:0] ch21_coeff_2_3; 
input [31:0] ch21_coeff_2_2; 
input [31:0] ch21_coeff_2_1; 
input [31:0] ch21_coeff_2_0; 
input [31:0] ch21_coeff_1_10;//Section 1 coefficients (x <= 0, |x| > section_limit)  
input [31:0] ch21_coeff_1_9; 
input [31:0] ch21_coeff_1_8; 
input [31:0] ch21_coeff_1_7; 
input [31:0] ch21_coeff_1_6; 
input [31:0] ch21_coeff_1_5; 
input [31:0] ch21_coeff_1_4; 
input [31:0] ch21_coeff_1_3; 
input [31:0] ch21_coeff_1_2; 
input [31:0] ch21_coeff_1_1; 
input [31:0] ch21_coeff_1_0; 

input [20:0] ch20_x_adc;//NLC output 
output [20:0] ch20_x_lin;//ADC output 
input [19:0] ch20_section_limit;//X-value that separates the sections 
input [31:0] ch20_recip_stdev_4;//Reciprocal standard deviation for the centered and scaled fit  
input [31:0] ch20_recip_stdev_3; 
input [31:0] ch20_recip_stdev_2; 
input [31:0] ch20_recip_stdev_1; 
input [31:0] ch20_neg_mean_4;//Negative meand for the centered and scaled fit  
input [31:0] ch20_neg_mean_3; 
input [31:0] ch20_neg_mean_2; 
input [31:0] ch20_neg_mean_1; 
input [31:0] ch20_coeff_4_10; //Section 4 coefficients (x > 0, |x| > section_limit) 
input [31:0] ch20_coeff_4_9; 
input [31:0] ch20_coeff_4_8; 
input [31:0] ch20_coeff_4_7; 
input [31:0] ch20_coeff_4_6; 
input [31:0] ch20_coeff_4_5; 
input [31:0] ch20_coeff_4_4; 
input [31:0] ch20_coeff_4_3; 
input [31:0] ch20_coeff_4_2; 
input [31:0] ch20_coeff_4_1; 
input [31:0] ch20_coeff_4_0; 
input [31:0] ch20_coeff_3_10;//Section 3 coefficients (x > 0, |x| <= section_limit)  
input [31:0] ch20_coeff_3_9; 
input [31:0] ch20_coeff_3_8; 
input [31:0] ch20_coeff_3_7; 
input [31:0] ch20_coeff_3_6; 
input [31:0] ch20_coeff_3_5; 
input [31:0] ch20_coeff_3_4; 
input [31:0] ch20_coeff_3_3; 
input [31:0] ch20_coeff_3_2; 
input [31:0] ch20_coeff_3_1; 
input [31:0] ch20_coeff_3_0; 
input [31:0] ch20_coeff_2_10;//Section 2 coefficients (x <= 0, |x| <= section_limit)  
input [31:0] ch20_coeff_2_9; 
input [31:0] ch20_coeff_2_8; 
input [31:0] ch20_coeff_2_7; 
input [31:0] ch20_coeff_2_6; 
input [31:0] ch20_coeff_2_5; 
input [31:0] ch20_coeff_2_4; 
input [31:0] ch20_coeff_2_3; 
input [31:0] ch20_coeff_2_2; 
input [31:0] ch20_coeff_2_1; 
input [31:0] ch20_coeff_2_0; 
input [31:0] ch20_coeff_1_10;//Section 1 coefficients (x <= 0, |x| > section_limit)  
input [31:0] ch20_coeff_1_9; 
input [31:0] ch20_coeff_1_8; 
input [31:0] ch20_coeff_1_7; 
input [31:0] ch20_coeff_1_6; 
input [31:0] ch20_coeff_1_5; 
input [31:0] ch20_coeff_1_4; 
input [31:0] ch20_coeff_1_3; 
input [31:0] ch20_coeff_1_2; 
input [31:0] ch20_coeff_1_1; 
input [31:0] ch20_coeff_1_0; 

input [20:0] ch19_x_adc;//NLC output 
output [20:0] ch19_x_lin;//ADC output 
input [19:0] ch19_section_limit;//X-value that separates the sections 
input [31:0] ch19_recip_stdev_4;//Reciprocal standard deviation for the centered and scaled fit  
input [31:0] ch19_recip_stdev_3; 
input [31:0] ch19_recip_stdev_2; 
input [31:0] ch19_recip_stdev_1; 
input [31:0] ch19_neg_mean_4;//Negative meand for the centered and scaled fit  
input [31:0] ch19_neg_mean_3; 
input [31:0] ch19_neg_mean_2; 
input [31:0] ch19_neg_mean_1; 
input [31:0] ch19_coeff_4_10; //Section 4 coefficients (x > 0, |x| > section_limit) 
input [31:0] ch19_coeff_4_9; 
input [31:0] ch19_coeff_4_8; 
input [31:0] ch19_coeff_4_7; 
input [31:0] ch19_coeff_4_6; 
input [31:0] ch19_coeff_4_5; 
input [31:0] ch19_coeff_4_4; 
input [31:0] ch19_coeff_4_3; 
input [31:0] ch19_coeff_4_2; 
input [31:0] ch19_coeff_4_1; 
input [31:0] ch19_coeff_4_0; 
input [31:0] ch19_coeff_3_10;//Section 3 coefficients (x > 0, |x| <= section_limit)  
input [31:0] ch19_coeff_3_9; 
input [31:0] ch19_coeff_3_8; 
input [31:0] ch19_coeff_3_7; 
input [31:0] ch19_coeff_3_6; 
input [31:0] ch19_coeff_3_5; 
input [31:0] ch19_coeff_3_4; 
input [31:0] ch19_coeff_3_3; 
input [31:0] ch19_coeff_3_2; 
input [31:0] ch19_coeff_3_1; 
input [31:0] ch19_coeff_3_0; 
input [31:0] ch19_coeff_2_10;//Section 2 coefficients (x <= 0, |x| <= section_limit)  
input [31:0] ch19_coeff_2_9; 
input [31:0] ch19_coeff_2_8; 
input [31:0] ch19_coeff_2_7; 
input [31:0] ch19_coeff_2_6; 
input [31:0] ch19_coeff_2_5; 
input [31:0] ch19_coeff_2_4; 
input [31:0] ch19_coeff_2_3; 
input [31:0] ch19_coeff_2_2; 
input [31:0] ch19_coeff_2_1; 
input [31:0] ch19_coeff_2_0; 
input [31:0] ch19_coeff_1_10;//Section 1 coefficients (x <= 0, |x| > section_limit)  
input [31:0] ch19_coeff_1_9; 
input [31:0] ch19_coeff_1_8; 
input [31:0] ch19_coeff_1_7; 
input [31:0] ch19_coeff_1_6; 
input [31:0] ch19_coeff_1_5; 
input [31:0] ch19_coeff_1_4; 
input [31:0] ch19_coeff_1_3; 
input [31:0] ch19_coeff_1_2; 
input [31:0] ch19_coeff_1_1; 
input [31:0] ch19_coeff_1_0; 

input [20:0] ch18_x_adc;//NLC output 
output [20:0] ch18_x_lin;//ADC output 
input [19:0] ch18_section_limit;//X-value that separates the sections 
input [31:0] ch18_recip_stdev_4;//Reciprocal standard deviation for the centered and scaled fit  
input [31:0] ch18_recip_stdev_3; 
input [31:0] ch18_recip_stdev_2; 
input [31:0] ch18_recip_stdev_1; 
input [31:0] ch18_neg_mean_4;//Negative meand for the centered and scaled fit  
input [31:0] ch18_neg_mean_3; 
input [31:0] ch18_neg_mean_2; 
input [31:0] ch18_neg_mean_1; 
input [31:0] ch18_coeff_4_10; //Section 4 coefficients (x > 0, |x| > section_limit) 
input [31:0] ch18_coeff_4_9; 
input [31:0] ch18_coeff_4_8; 
input [31:0] ch18_coeff_4_7; 
input [31:0] ch18_coeff_4_6; 
input [31:0] ch18_coeff_4_5; 
input [31:0] ch18_coeff_4_4; 
input [31:0] ch18_coeff_4_3; 
input [31:0] ch18_coeff_4_2; 
input [31:0] ch18_coeff_4_1; 
input [31:0] ch18_coeff_4_0; 
input [31:0] ch18_coeff_3_10;//Section 3 coefficients (x > 0, |x| <= section_limit)  
input [31:0] ch18_coeff_3_9; 
input [31:0] ch18_coeff_3_8; 
input [31:0] ch18_coeff_3_7; 
input [31:0] ch18_coeff_3_6; 
input [31:0] ch18_coeff_3_5; 
input [31:0] ch18_coeff_3_4; 
input [31:0] ch18_coeff_3_3; 
input [31:0] ch18_coeff_3_2; 
input [31:0] ch18_coeff_3_1; 
input [31:0] ch18_coeff_3_0; 
input [31:0] ch18_coeff_2_10;//Section 2 coefficients (x <= 0, |x| <= section_limit)  
input [31:0] ch18_coeff_2_9; 
input [31:0] ch18_coeff_2_8; 
input [31:0] ch18_coeff_2_7; 
input [31:0] ch18_coeff_2_6; 
input [31:0] ch18_coeff_2_5; 
input [31:0] ch18_coeff_2_4; 
input [31:0] ch18_coeff_2_3; 
input [31:0] ch18_coeff_2_2; 
input [31:0] ch18_coeff_2_1; 
input [31:0] ch18_coeff_2_0; 
input [31:0] ch18_coeff_1_10;//Section 1 coefficients (x <= 0, |x| > section_limit)  
input [31:0] ch18_coeff_1_9; 
input [31:0] ch18_coeff_1_8; 
input [31:0] ch18_coeff_1_7; 
input [31:0] ch18_coeff_1_6; 
input [31:0] ch18_coeff_1_5; 
input [31:0] ch18_coeff_1_4; 
input [31:0] ch18_coeff_1_3; 
input [31:0] ch18_coeff_1_2; 
input [31:0] ch18_coeff_1_1; 
input [31:0] ch18_coeff_1_0; 

input [20:0] ch17_x_adc;//NLC output 
output [20:0] ch17_x_lin;//ADC output 
input [19:0] ch17_section_limit;//X-value that separates the sections 
input [31:0] ch17_recip_stdev_4;//Reciprocal standard deviation for the centered and scaled fit  
input [31:0] ch17_recip_stdev_3; 
input [31:0] ch17_recip_stdev_2; 
input [31:0] ch17_recip_stdev_1; 
input [31:0] ch17_neg_mean_4;//Negative meand for the centered and scaled fit  
input [31:0] ch17_neg_mean_3; 
input [31:0] ch17_neg_mean_2; 
input [31:0] ch17_neg_mean_1; 
input [31:0] ch17_coeff_4_10; //Section 4 coefficients (x > 0, |x| > section_limit) 
input [31:0] ch17_coeff_4_9; 
input [31:0] ch17_coeff_4_8; 
input [31:0] ch17_coeff_4_7; 
input [31:0] ch17_coeff_4_6; 
input [31:0] ch17_coeff_4_5; 
input [31:0] ch17_coeff_4_4; 
input [31:0] ch17_coeff_4_3; 
input [31:0] ch17_coeff_4_2; 
input [31:0] ch17_coeff_4_1; 
input [31:0] ch17_coeff_4_0; 
input [31:0] ch17_coeff_3_10;//Section 3 coefficients (x > 0, |x| <= section_limit)  
input [31:0] ch17_coeff_3_9; 
input [31:0] ch17_coeff_3_8; 
input [31:0] ch17_coeff_3_7; 
input [31:0] ch17_coeff_3_6; 
input [31:0] ch17_coeff_3_5; 
input [31:0] ch17_coeff_3_4; 
input [31:0] ch17_coeff_3_3; 
input [31:0] ch17_coeff_3_2; 
input [31:0] ch17_coeff_3_1; 
input [31:0] ch17_coeff_3_0; 
input [31:0] ch17_coeff_2_10;//Section 2 coefficients (x <= 0, |x| <= section_limit)  
input [31:0] ch17_coeff_2_9; 
input [31:0] ch17_coeff_2_8; 
input [31:0] ch17_coeff_2_7; 
input [31:0] ch17_coeff_2_6; 
input [31:0] ch17_coeff_2_5; 
input [31:0] ch17_coeff_2_4; 
input [31:0] ch17_coeff_2_3; 
input [31:0] ch17_coeff_2_2; 
input [31:0] ch17_coeff_2_1; 
input [31:0] ch17_coeff_2_0; 
input [31:0] ch17_coeff_1_10;//Section 1 coefficients (x <= 0, |x| > section_limit)  
input [31:0] ch17_coeff_1_9; 
input [31:0] ch17_coeff_1_8; 
input [31:0] ch17_coeff_1_7; 
input [31:0] ch17_coeff_1_6; 
input [31:0] ch17_coeff_1_5; 
input [31:0] ch17_coeff_1_4; 
input [31:0] ch17_coeff_1_3; 
input [31:0] ch17_coeff_1_2; 
input [31:0] ch17_coeff_1_1; 
input [31:0] ch17_coeff_1_0; 

input [20:0] ch16_x_adc;//NLC output 
output [20:0] ch16_x_lin;//ADC output 
input [19:0] ch16_section_limit;//X-value that separates the sections 
input [31:0] ch16_recip_stdev_4;//Reciprocal standard deviation for the centered and scaled fit  
input [31:0] ch16_recip_stdev_3; 
input [31:0] ch16_recip_stdev_2; 
input [31:0] ch16_recip_stdev_1; 
input [31:0] ch16_neg_mean_4;//Negative meand for the centered and scaled fit  
input [31:0] ch16_neg_mean_3; 
input [31:0] ch16_neg_mean_2; 
input [31:0] ch16_neg_mean_1; 
input [31:0] ch16_coeff_4_10; //Section 4 coefficients (x > 0, |x| > section_limit) 
input [31:0] ch16_coeff_4_9; 
input [31:0] ch16_coeff_4_8; 
input [31:0] ch16_coeff_4_7; 
input [31:0] ch16_coeff_4_6; 
input [31:0] ch16_coeff_4_5; 
input [31:0] ch16_coeff_4_4; 
input [31:0] ch16_coeff_4_3; 
input [31:0] ch16_coeff_4_2; 
input [31:0] ch16_coeff_4_1; 
input [31:0] ch16_coeff_4_0; 
input [31:0] ch16_coeff_3_10;//Section 3 coefficients (x > 0, |x| <= section_limit)  
input [31:0] ch16_coeff_3_9; 
input [31:0] ch16_coeff_3_8; 
input [31:0] ch16_coeff_3_7; 
input [31:0] ch16_coeff_3_6; 
input [31:0] ch16_coeff_3_5; 
input [31:0] ch16_coeff_3_4; 
input [31:0] ch16_coeff_3_3; 
input [31:0] ch16_coeff_3_2; 
input [31:0] ch16_coeff_3_1; 
input [31:0] ch16_coeff_3_0; 
input [31:0] ch16_coeff_2_10;//Section 2 coefficients (x <= 0, |x| <= section_limit)  
input [31:0] ch16_coeff_2_9; 
input [31:0] ch16_coeff_2_8; 
input [31:0] ch16_coeff_2_7; 
input [31:0] ch16_coeff_2_6; 
input [31:0] ch16_coeff_2_5; 
input [31:0] ch16_coeff_2_4; 
input [31:0] ch16_coeff_2_3; 
input [31:0] ch16_coeff_2_2; 
input [31:0] ch16_coeff_2_1; 
input [31:0] ch16_coeff_2_0; 
input [31:0] ch16_coeff_1_10;//Section 1 coefficients (x <= 0, |x| > section_limit)  
input [31:0] ch16_coeff_1_9; 
input [31:0] ch16_coeff_1_8; 
input [31:0] ch16_coeff_1_7; 
input [31:0] ch16_coeff_1_6; 
input [31:0] ch16_coeff_1_5; 
input [31:0] ch16_coeff_1_4; 
input [31:0] ch16_coeff_1_3; 
input [31:0] ch16_coeff_1_2; 
input [31:0] ch16_coeff_1_1; 
input [31:0] ch16_coeff_1_0; 

input [20:0] ch15_x_adc;//NLC output 
output [20:0] ch15_x_lin;//ADC output 
input [19:0] ch15_section_limit;//X-value that separates the sections 
input [31:0] ch15_recip_stdev_4;//Reciprocal standard deviation for the centered and scaled fit  
input [31:0] ch15_recip_stdev_3; 
input [31:0] ch15_recip_stdev_2; 
input [31:0] ch15_recip_stdev_1; 
input [31:0] ch15_neg_mean_4;//Negative meand for the centered and scaled fit  
input [31:0] ch15_neg_mean_3; 
input [31:0] ch15_neg_mean_2; 
input [31:0] ch15_neg_mean_1; 
input [31:0] ch15_coeff_4_10; //Section 4 coefficients (x > 0, |x| > section_limit) 
input [31:0] ch15_coeff_4_9; 
input [31:0] ch15_coeff_4_8; 
input [31:0] ch15_coeff_4_7; 
input [31:0] ch15_coeff_4_6; 
input [31:0] ch15_coeff_4_5; 
input [31:0] ch15_coeff_4_4; 
input [31:0] ch15_coeff_4_3; 
input [31:0] ch15_coeff_4_2; 
input [31:0] ch15_coeff_4_1; 
input [31:0] ch15_coeff_4_0; 
input [31:0] ch15_coeff_3_10;//Section 3 coefficients (x > 0, |x| <= section_limit)  
input [31:0] ch15_coeff_3_9; 
input [31:0] ch15_coeff_3_8; 
input [31:0] ch15_coeff_3_7; 
input [31:0] ch15_coeff_3_6; 
input [31:0] ch15_coeff_3_5; 
input [31:0] ch15_coeff_3_4; 
input [31:0] ch15_coeff_3_3; 
input [31:0] ch15_coeff_3_2; 
input [31:0] ch15_coeff_3_1; 
input [31:0] ch15_coeff_3_0; 
input [31:0] ch15_coeff_2_10;//Section 2 coefficients (x <= 0, |x| <= section_limit)  
input [31:0] ch15_coeff_2_9; 
input [31:0] ch15_coeff_2_8; 
input [31:0] ch15_coeff_2_7; 
input [31:0] ch15_coeff_2_6; 
input [31:0] ch15_coeff_2_5; 
input [31:0] ch15_coeff_2_4; 
input [31:0] ch15_coeff_2_3; 
input [31:0] ch15_coeff_2_2; 
input [31:0] ch15_coeff_2_1; 
input [31:0] ch15_coeff_2_0; 
input [31:0] ch15_coeff_1_10;//Section 1 coefficients (x <= 0, |x| > section_limit)  
input [31:0] ch15_coeff_1_9; 
input [31:0] ch15_coeff_1_8; 
input [31:0] ch15_coeff_1_7; 
input [31:0] ch15_coeff_1_6; 
input [31:0] ch15_coeff_1_5; 
input [31:0] ch15_coeff_1_4; 
input [31:0] ch15_coeff_1_3; 
input [31:0] ch15_coeff_1_2; 
input [31:0] ch15_coeff_1_1; 
input [31:0] ch15_coeff_1_0; 

input [20:0] ch14_x_adc;//NLC output 
output [20:0] ch14_x_lin;//ADC output 
input [19:0] ch14_section_limit;//X-value that separates the sections 
input [31:0] ch14_recip_stdev_4;//Reciprocal standard deviation for the centered and scaled fit  
input [31:0] ch14_recip_stdev_3; 
input [31:0] ch14_recip_stdev_2; 
input [31:0] ch14_recip_stdev_1; 
input [31:0] ch14_neg_mean_4;//Negative meand for the centered and scaled fit  
input [31:0] ch14_neg_mean_3; 
input [31:0] ch14_neg_mean_2; 
input [31:0] ch14_neg_mean_1; 
input [31:0] ch14_coeff_4_10; //Section 4 coefficients (x > 0, |x| > section_limit) 
input [31:0] ch14_coeff_4_9; 
input [31:0] ch14_coeff_4_8; 
input [31:0] ch14_coeff_4_7; 
input [31:0] ch14_coeff_4_6; 
input [31:0] ch14_coeff_4_5; 
input [31:0] ch14_coeff_4_4; 
input [31:0] ch14_coeff_4_3; 
input [31:0] ch14_coeff_4_2; 
input [31:0] ch14_coeff_4_1; 
input [31:0] ch14_coeff_4_0; 
input [31:0] ch14_coeff_3_10;//Section 3 coefficients (x > 0, |x| <= section_limit)  
input [31:0] ch14_coeff_3_9; 
input [31:0] ch14_coeff_3_8; 
input [31:0] ch14_coeff_3_7; 
input [31:0] ch14_coeff_3_6; 
input [31:0] ch14_coeff_3_5; 
input [31:0] ch14_coeff_3_4; 
input [31:0] ch14_coeff_3_3; 
input [31:0] ch14_coeff_3_2; 
input [31:0] ch14_coeff_3_1; 
input [31:0] ch14_coeff_3_0; 
input [31:0] ch14_coeff_2_10;//Section 2 coefficients (x <= 0, |x| <= section_limit)  
input [31:0] ch14_coeff_2_9; 
input [31:0] ch14_coeff_2_8; 
input [31:0] ch14_coeff_2_7; 
input [31:0] ch14_coeff_2_6; 
input [31:0] ch14_coeff_2_5; 
input [31:0] ch14_coeff_2_4; 
input [31:0] ch14_coeff_2_3; 
input [31:0] ch14_coeff_2_2; 
input [31:0] ch14_coeff_2_1; 
input [31:0] ch14_coeff_2_0; 
input [31:0] ch14_coeff_1_10;//Section 1 coefficients (x <= 0, |x| > section_limit)  
input [31:0] ch14_coeff_1_9; 
input [31:0] ch14_coeff_1_8; 
input [31:0] ch14_coeff_1_7; 
input [31:0] ch14_coeff_1_6; 
input [31:0] ch14_coeff_1_5; 
input [31:0] ch14_coeff_1_4; 
input [31:0] ch14_coeff_1_3; 
input [31:0] ch14_coeff_1_2; 
input [31:0] ch14_coeff_1_1; 
input [31:0] ch14_coeff_1_0; 

input [20:0] ch13_x_adc;//NLC output 
output [20:0] ch13_x_lin;//ADC output 
input [19:0] ch13_section_limit;//X-value that separates the sections 
input [31:0] ch13_recip_stdev_4;//Reciprocal standard deviation for the centered and scaled fit  
input [31:0] ch13_recip_stdev_3; 
input [31:0] ch13_recip_stdev_2; 
input [31:0] ch13_recip_stdev_1; 
input [31:0] ch13_neg_mean_4;//Negative meand for the centered and scaled fit  
input [31:0] ch13_neg_mean_3; 
input [31:0] ch13_neg_mean_2; 
input [31:0] ch13_neg_mean_1; 
input [31:0] ch13_coeff_4_10; //Section 4 coefficients (x > 0, |x| > section_limit) 
input [31:0] ch13_coeff_4_9; 
input [31:0] ch13_coeff_4_8; 
input [31:0] ch13_coeff_4_7; 
input [31:0] ch13_coeff_4_6; 
input [31:0] ch13_coeff_4_5; 
input [31:0] ch13_coeff_4_4; 
input [31:0] ch13_coeff_4_3; 
input [31:0] ch13_coeff_4_2; 
input [31:0] ch13_coeff_4_1; 
input [31:0] ch13_coeff_4_0; 
input [31:0] ch13_coeff_3_10;//Section 3 coefficients (x > 0, |x| <= section_limit)  
input [31:0] ch13_coeff_3_9; 
input [31:0] ch13_coeff_3_8; 
input [31:0] ch13_coeff_3_7; 
input [31:0] ch13_coeff_3_6; 
input [31:0] ch13_coeff_3_5; 
input [31:0] ch13_coeff_3_4; 
input [31:0] ch13_coeff_3_3; 
input [31:0] ch13_coeff_3_2; 
input [31:0] ch13_coeff_3_1; 
input [31:0] ch13_coeff_3_0; 
input [31:0] ch13_coeff_2_10;//Section 2 coefficients (x <= 0, |x| <= section_limit)  
input [31:0] ch13_coeff_2_9; 
input [31:0] ch13_coeff_2_8; 
input [31:0] ch13_coeff_2_7; 
input [31:0] ch13_coeff_2_6; 
input [31:0] ch13_coeff_2_5; 
input [31:0] ch13_coeff_2_4; 
input [31:0] ch13_coeff_2_3; 
input [31:0] ch13_coeff_2_2; 
input [31:0] ch13_coeff_2_1; 
input [31:0] ch13_coeff_2_0; 
input [31:0] ch13_coeff_1_10;//Section 1 coefficients (x <= 0, |x| > section_limit)  
input [31:0] ch13_coeff_1_9; 
input [31:0] ch13_coeff_1_8; 
input [31:0] ch13_coeff_1_7; 
input [31:0] ch13_coeff_1_6; 
input [31:0] ch13_coeff_1_5; 
input [31:0] ch13_coeff_1_4; 
input [31:0] ch13_coeff_1_3; 
input [31:0] ch13_coeff_1_2; 
input [31:0] ch13_coeff_1_1; 
input [31:0] ch13_coeff_1_0; 

input [20:0] ch12_x_adc;//NLC output 
output [20:0] ch12_x_lin;//ADC output 
input [19:0] ch12_section_limit;//X-value that separates the sections 
input [31:0] ch12_recip_stdev_4;//Reciprocal standard deviation for the centered and scaled fit  
input [31:0] ch12_recip_stdev_3; 
input [31:0] ch12_recip_stdev_2; 
input [31:0] ch12_recip_stdev_1; 
input [31:0] ch12_neg_mean_4;//Negative meand for the centered and scaled fit  
input [31:0] ch12_neg_mean_3; 
input [31:0] ch12_neg_mean_2; 
input [31:0] ch12_neg_mean_1; 
input [31:0] ch12_coeff_4_10; //Section 4 coefficients (x > 0, |x| > section_limit) 
input [31:0] ch12_coeff_4_9; 
input [31:0] ch12_coeff_4_8; 
input [31:0] ch12_coeff_4_7; 
input [31:0] ch12_coeff_4_6; 
input [31:0] ch12_coeff_4_5; 
input [31:0] ch12_coeff_4_4; 
input [31:0] ch12_coeff_4_3; 
input [31:0] ch12_coeff_4_2; 
input [31:0] ch12_coeff_4_1; 
input [31:0] ch12_coeff_4_0; 
input [31:0] ch12_coeff_3_10;//Section 3 coefficients (x > 0, |x| <= section_limit)  
input [31:0] ch12_coeff_3_9; 
input [31:0] ch12_coeff_3_8; 
input [31:0] ch12_coeff_3_7; 
input [31:0] ch12_coeff_3_6; 
input [31:0] ch12_coeff_3_5; 
input [31:0] ch12_coeff_3_4; 
input [31:0] ch12_coeff_3_3; 
input [31:0] ch12_coeff_3_2; 
input [31:0] ch12_coeff_3_1; 
input [31:0] ch12_coeff_3_0; 
input [31:0] ch12_coeff_2_10;//Section 2 coefficients (x <= 0, |x| <= section_limit)  
input [31:0] ch12_coeff_2_9; 
input [31:0] ch12_coeff_2_8; 
input [31:0] ch12_coeff_2_7; 
input [31:0] ch12_coeff_2_6; 
input [31:0] ch12_coeff_2_5; 
input [31:0] ch12_coeff_2_4; 
input [31:0] ch12_coeff_2_3; 
input [31:0] ch12_coeff_2_2; 
input [31:0] ch12_coeff_2_1; 
input [31:0] ch12_coeff_2_0; 
input [31:0] ch12_coeff_1_10;//Section 1 coefficients (x <= 0, |x| > section_limit)  
input [31:0] ch12_coeff_1_9; 
input [31:0] ch12_coeff_1_8; 
input [31:0] ch12_coeff_1_7; 
input [31:0] ch12_coeff_1_6; 
input [31:0] ch12_coeff_1_5; 
input [31:0] ch12_coeff_1_4; 
input [31:0] ch12_coeff_1_3; 
input [31:0] ch12_coeff_1_2; 
input [31:0] ch12_coeff_1_1; 
input [31:0] ch12_coeff_1_0; 

input [20:0] ch11_x_adc;//NLC output 
output [20:0] ch11_x_lin;//ADC output 
input [19:0] ch11_section_limit;//X-value that separates the sections 
input [31:0] ch11_recip_stdev_4;//Reciprocal standard deviation for the centered and scaled fit  
input [31:0] ch11_recip_stdev_3; 
input [31:0] ch11_recip_stdev_2; 
input [31:0] ch11_recip_stdev_1; 
input [31:0] ch11_neg_mean_4;//Negative meand for the centered and scaled fit  
input [31:0] ch11_neg_mean_3; 
input [31:0] ch11_neg_mean_2; 
input [31:0] ch11_neg_mean_1; 
input [31:0] ch11_coeff_4_10; //Section 4 coefficients (x > 0, |x| > section_limit) 
input [31:0] ch11_coeff_4_9; 
input [31:0] ch11_coeff_4_8; 
input [31:0] ch11_coeff_4_7; 
input [31:0] ch11_coeff_4_6; 
input [31:0] ch11_coeff_4_5; 
input [31:0] ch11_coeff_4_4; 
input [31:0] ch11_coeff_4_3; 
input [31:0] ch11_coeff_4_2; 
input [31:0] ch11_coeff_4_1; 
input [31:0] ch11_coeff_4_0; 
input [31:0] ch11_coeff_3_10;//Section 3 coefficients (x > 0, |x| <= section_limit)  
input [31:0] ch11_coeff_3_9; 
input [31:0] ch11_coeff_3_8; 
input [31:0] ch11_coeff_3_7; 
input [31:0] ch11_coeff_3_6; 
input [31:0] ch11_coeff_3_5; 
input [31:0] ch11_coeff_3_4; 
input [31:0] ch11_coeff_3_3; 
input [31:0] ch11_coeff_3_2; 
input [31:0] ch11_coeff_3_1; 
input [31:0] ch11_coeff_3_0; 
input [31:0] ch11_coeff_2_10;//Section 2 coefficients (x <= 0, |x| <= section_limit)  
input [31:0] ch11_coeff_2_9; 
input [31:0] ch11_coeff_2_8; 
input [31:0] ch11_coeff_2_7; 
input [31:0] ch11_coeff_2_6; 
input [31:0] ch11_coeff_2_5; 
input [31:0] ch11_coeff_2_4; 
input [31:0] ch11_coeff_2_3; 
input [31:0] ch11_coeff_2_2; 
input [31:0] ch11_coeff_2_1; 
input [31:0] ch11_coeff_2_0; 
input [31:0] ch11_coeff_1_10;//Section 1 coefficients (x <= 0, |x| > section_limit)  
input [31:0] ch11_coeff_1_9; 
input [31:0] ch11_coeff_1_8; 
input [31:0] ch11_coeff_1_7; 
input [31:0] ch11_coeff_1_6; 
input [31:0] ch11_coeff_1_5; 
input [31:0] ch11_coeff_1_4; 
input [31:0] ch11_coeff_1_3; 
input [31:0] ch11_coeff_1_2; 
input [31:0] ch11_coeff_1_1; 
input [31:0] ch11_coeff_1_0; 

input [20:0] ch10_x_adc;//NLC output 
output [20:0] ch10_x_lin;//ADC output 
input [19:0] ch10_section_limit;//X-value that separates the sections 
input [31:0] ch10_recip_stdev_4;//Reciprocal standard deviation for the centered and scaled fit  
input [31:0] ch10_recip_stdev_3; 
input [31:0] ch10_recip_stdev_2; 
input [31:0] ch10_recip_stdev_1; 
input [31:0] ch10_neg_mean_4;//Negative meand for the centered and scaled fit  
input [31:0] ch10_neg_mean_3; 
input [31:0] ch10_neg_mean_2; 
input [31:0] ch10_neg_mean_1; 
input [31:0] ch10_coeff_4_10; //Section 4 coefficients (x > 0, |x| > section_limit) 
input [31:0] ch10_coeff_4_9; 
input [31:0] ch10_coeff_4_8; 
input [31:0] ch10_coeff_4_7; 
input [31:0] ch10_coeff_4_6; 
input [31:0] ch10_coeff_4_5; 
input [31:0] ch10_coeff_4_4; 
input [31:0] ch10_coeff_4_3; 
input [31:0] ch10_coeff_4_2; 
input [31:0] ch10_coeff_4_1; 
input [31:0] ch10_coeff_4_0; 
input [31:0] ch10_coeff_3_10;//Section 3 coefficients (x > 0, |x| <= section_limit)  
input [31:0] ch10_coeff_3_9; 
input [31:0] ch10_coeff_3_8; 
input [31:0] ch10_coeff_3_7; 
input [31:0] ch10_coeff_3_6; 
input [31:0] ch10_coeff_3_5; 
input [31:0] ch10_coeff_3_4; 
input [31:0] ch10_coeff_3_3; 
input [31:0] ch10_coeff_3_2; 
input [31:0] ch10_coeff_3_1; 
input [31:0] ch10_coeff_3_0; 
input [31:0] ch10_coeff_2_10;//Section 2 coefficients (x <= 0, |x| <= section_limit)  
input [31:0] ch10_coeff_2_9; 
input [31:0] ch10_coeff_2_8; 
input [31:0] ch10_coeff_2_7; 
input [31:0] ch10_coeff_2_6; 
input [31:0] ch10_coeff_2_5; 
input [31:0] ch10_coeff_2_4; 
input [31:0] ch10_coeff_2_3; 
input [31:0] ch10_coeff_2_2; 
input [31:0] ch10_coeff_2_1; 
input [31:0] ch10_coeff_2_0; 
input [31:0] ch10_coeff_1_10;//Section 1 coefficients (x <= 0, |x| > section_limit)  
input [31:0] ch10_coeff_1_9; 
input [31:0] ch10_coeff_1_8; 
input [31:0] ch10_coeff_1_7; 
input [31:0] ch10_coeff_1_6; 
input [31:0] ch10_coeff_1_5; 
input [31:0] ch10_coeff_1_4; 
input [31:0] ch10_coeff_1_3; 
input [31:0] ch10_coeff_1_2; 
input [31:0] ch10_coeff_1_1; 
input [31:0] ch10_coeff_1_0; 

input [20:0] ch9_x_adc;//NLC output 
output [20:0] ch9_x_lin;//ADC output 
input [19:0] ch9_section_limit;//X-value that separates the sections 
input [31:0] ch9_recip_stdev_4;//Reciprocal standard deviation for the centered and scaled fit  
input [31:0] ch9_recip_stdev_3; 
input [31:0] ch9_recip_stdev_2; 
input [31:0] ch9_recip_stdev_1; 
input [31:0] ch9_neg_mean_4;//Negative meand for the centered and scaled fit  
input [31:0] ch9_neg_mean_3; 
input [31:0] ch9_neg_mean_2; 
input [31:0] ch9_neg_mean_1; 
input [31:0] ch9_coeff_4_10; //Section 4 coefficients (x > 0, |x| > section_limit) 
input [31:0] ch9_coeff_4_9; 
input [31:0] ch9_coeff_4_8; 
input [31:0] ch9_coeff_4_7; 
input [31:0] ch9_coeff_4_6; 
input [31:0] ch9_coeff_4_5; 
input [31:0] ch9_coeff_4_4; 
input [31:0] ch9_coeff_4_3; 
input [31:0] ch9_coeff_4_2; 
input [31:0] ch9_coeff_4_1; 
input [31:0] ch9_coeff_4_0; 
input [31:0] ch9_coeff_3_10;//Section 3 coefficients (x > 0, |x| <= section_limit)  
input [31:0] ch9_coeff_3_9; 
input [31:0] ch9_coeff_3_8; 
input [31:0] ch9_coeff_3_7; 
input [31:0] ch9_coeff_3_6; 
input [31:0] ch9_coeff_3_5; 
input [31:0] ch9_coeff_3_4; 
input [31:0] ch9_coeff_3_3; 
input [31:0] ch9_coeff_3_2; 
input [31:0] ch9_coeff_3_1; 
input [31:0] ch9_coeff_3_0; 
input [31:0] ch9_coeff_2_10;//Section 2 coefficients (x <= 0, |x| <= section_limit)  
input [31:0] ch9_coeff_2_9; 
input [31:0] ch9_coeff_2_8; 
input [31:0] ch9_coeff_2_7; 
input [31:0] ch9_coeff_2_6; 
input [31:0] ch9_coeff_2_5; 
input [31:0] ch9_coeff_2_4; 
input [31:0] ch9_coeff_2_3; 
input [31:0] ch9_coeff_2_2; 
input [31:0] ch9_coeff_2_1; 
input [31:0] ch9_coeff_2_0; 
input [31:0] ch9_coeff_1_10;//Section 1 coefficients (x <= 0, |x| > section_limit)  
input [31:0] ch9_coeff_1_9; 
input [31:0] ch9_coeff_1_8; 
input [31:0] ch9_coeff_1_7; 
input [31:0] ch9_coeff_1_6; 
input [31:0] ch9_coeff_1_5; 
input [31:0] ch9_coeff_1_4; 
input [31:0] ch9_coeff_1_3; 
input [31:0] ch9_coeff_1_2; 
input [31:0] ch9_coeff_1_1; 
input [31:0] ch9_coeff_1_0; 

input [20:0] ch8_x_adc;//NLC output 
output [20:0] ch8_x_lin;//ADC output 
input [19:0] ch8_section_limit;//X-value that separates the sections 
input [31:0] ch8_recip_stdev_4;//Reciprocal standard deviation for the centered and scaled fit  
input [31:0] ch8_recip_stdev_3; 
input [31:0] ch8_recip_stdev_2; 
input [31:0] ch8_recip_stdev_1; 
input [31:0] ch8_neg_mean_4;//Negative meand for the centered and scaled fit  
input [31:0] ch8_neg_mean_3; 
input [31:0] ch8_neg_mean_2; 
input [31:0] ch8_neg_mean_1; 
input [31:0] ch8_coeff_4_10; //Section 4 coefficients (x > 0, |x| > section_limit) 
input [31:0] ch8_coeff_4_9; 
input [31:0] ch8_coeff_4_8; 
input [31:0] ch8_coeff_4_7; 
input [31:0] ch8_coeff_4_6; 
input [31:0] ch8_coeff_4_5; 
input [31:0] ch8_coeff_4_4; 
input [31:0] ch8_coeff_4_3; 
input [31:0] ch8_coeff_4_2; 
input [31:0] ch8_coeff_4_1; 
input [31:0] ch8_coeff_4_0; 
input [31:0] ch8_coeff_3_10;//Section 3 coefficients (x > 0, |x| <= section_limit)  
input [31:0] ch8_coeff_3_9; 
input [31:0] ch8_coeff_3_8; 
input [31:0] ch8_coeff_3_7; 
input [31:0] ch8_coeff_3_6; 
input [31:0] ch8_coeff_3_5; 
input [31:0] ch8_coeff_3_4; 
input [31:0] ch8_coeff_3_3; 
input [31:0] ch8_coeff_3_2; 
input [31:0] ch8_coeff_3_1; 
input [31:0] ch8_coeff_3_0; 
input [31:0] ch8_coeff_2_10;//Section 2 coefficients (x <= 0, |x| <= section_limit)  
input [31:0] ch8_coeff_2_9; 
input [31:0] ch8_coeff_2_8; 
input [31:0] ch8_coeff_2_7; 
input [31:0] ch8_coeff_2_6; 
input [31:0] ch8_coeff_2_5; 
input [31:0] ch8_coeff_2_4; 
input [31:0] ch8_coeff_2_3; 
input [31:0] ch8_coeff_2_2; 
input [31:0] ch8_coeff_2_1; 
input [31:0] ch8_coeff_2_0; 
input [31:0] ch8_coeff_1_10;//Section 1 coefficients (x <= 0, |x| > section_limit)  
input [31:0] ch8_coeff_1_9; 
input [31:0] ch8_coeff_1_8; 
input [31:0] ch8_coeff_1_7; 
input [31:0] ch8_coeff_1_6; 
input [31:0] ch8_coeff_1_5; 
input [31:0] ch8_coeff_1_4; 
input [31:0] ch8_coeff_1_3; 
input [31:0] ch8_coeff_1_2; 
input [31:0] ch8_coeff_1_1; 
input [31:0] ch8_coeff_1_0; 

input [20:0] ch7_x_adc;//NLC output 
output [20:0] ch7_x_lin;//ADC output 
input [19:0] ch7_section_limit;//X-value that separates the sections 
input [31:0] ch7_recip_stdev_4;//Reciprocal standard deviation for the centered and scaled fit  
input [31:0] ch7_recip_stdev_3; 
input [31:0] ch7_recip_stdev_2; 
input [31:0] ch7_recip_stdev_1; 
input [31:0] ch7_neg_mean_4;//Negative meand for the centered and scaled fit  
input [31:0] ch7_neg_mean_3; 
input [31:0] ch7_neg_mean_2; 
input [31:0] ch7_neg_mean_1; 
input [31:0] ch7_coeff_4_10; //Section 4 coefficients (x > 0, |x| > section_limit) 
input [31:0] ch7_coeff_4_9; 
input [31:0] ch7_coeff_4_8; 
input [31:0] ch7_coeff_4_7; 
input [31:0] ch7_coeff_4_6; 
input [31:0] ch7_coeff_4_5; 
input [31:0] ch7_coeff_4_4; 
input [31:0] ch7_coeff_4_3; 
input [31:0] ch7_coeff_4_2; 
input [31:0] ch7_coeff_4_1; 
input [31:0] ch7_coeff_4_0; 
input [31:0] ch7_coeff_3_10;//Section 3 coefficients (x > 0, |x| <= section_limit)  
input [31:0] ch7_coeff_3_9; 
input [31:0] ch7_coeff_3_8; 
input [31:0] ch7_coeff_3_7; 
input [31:0] ch7_coeff_3_6; 
input [31:0] ch7_coeff_3_5; 
input [31:0] ch7_coeff_3_4; 
input [31:0] ch7_coeff_3_3; 
input [31:0] ch7_coeff_3_2; 
input [31:0] ch7_coeff_3_1; 
input [31:0] ch7_coeff_3_0; 
input [31:0] ch7_coeff_2_10;//Section 2 coefficients (x <= 0, |x| <= section_limit)  
input [31:0] ch7_coeff_2_9; 
input [31:0] ch7_coeff_2_8; 
input [31:0] ch7_coeff_2_7; 
input [31:0] ch7_coeff_2_6; 
input [31:0] ch7_coeff_2_5; 
input [31:0] ch7_coeff_2_4; 
input [31:0] ch7_coeff_2_3; 
input [31:0] ch7_coeff_2_2; 
input [31:0] ch7_coeff_2_1; 
input [31:0] ch7_coeff_2_0; 
input [31:0] ch7_coeff_1_10;//Section 1 coefficients (x <= 0, |x| > section_limit)  
input [31:0] ch7_coeff_1_9; 
input [31:0] ch7_coeff_1_8; 
input [31:0] ch7_coeff_1_7; 
input [31:0] ch7_coeff_1_6; 
input [31:0] ch7_coeff_1_5; 
input [31:0] ch7_coeff_1_4; 
input [31:0] ch7_coeff_1_3; 
input [31:0] ch7_coeff_1_2; 
input [31:0] ch7_coeff_1_1; 
input [31:0] ch7_coeff_1_0; 

input [20:0] ch6_x_adc;//NLC output 
output [20:0] ch6_x_lin;//ADC output 
input [19:0] ch6_section_limit;//X-value that separates the sections 
input [31:0] ch6_recip_stdev_4;//Reciprocal standard deviation for the centered and scaled fit  
input [31:0] ch6_recip_stdev_3; 
input [31:0] ch6_recip_stdev_2; 
input [31:0] ch6_recip_stdev_1; 
input [31:0] ch6_neg_mean_4;//Negative meand for the centered and scaled fit  
input [31:0] ch6_neg_mean_3; 
input [31:0] ch6_neg_mean_2; 
input [31:0] ch6_neg_mean_1; 
input [31:0] ch6_coeff_4_10; //Section 4 coefficients (x > 0, |x| > section_limit) 
input [31:0] ch6_coeff_4_9; 
input [31:0] ch6_coeff_4_8; 
input [31:0] ch6_coeff_4_7; 
input [31:0] ch6_coeff_4_6; 
input [31:0] ch6_coeff_4_5; 
input [31:0] ch6_coeff_4_4; 
input [31:0] ch6_coeff_4_3; 
input [31:0] ch6_coeff_4_2; 
input [31:0] ch6_coeff_4_1; 
input [31:0] ch6_coeff_4_0; 
input [31:0] ch6_coeff_3_10;//Section 3 coefficients (x > 0, |x| <= section_limit)  
input [31:0] ch6_coeff_3_9; 
input [31:0] ch6_coeff_3_8; 
input [31:0] ch6_coeff_3_7; 
input [31:0] ch6_coeff_3_6; 
input [31:0] ch6_coeff_3_5; 
input [31:0] ch6_coeff_3_4; 
input [31:0] ch6_coeff_3_3; 
input [31:0] ch6_coeff_3_2; 
input [31:0] ch6_coeff_3_1; 
input [31:0] ch6_coeff_3_0; 
input [31:0] ch6_coeff_2_10;//Section 2 coefficients (x <= 0, |x| <= section_limit)  
input [31:0] ch6_coeff_2_9; 
input [31:0] ch6_coeff_2_8; 
input [31:0] ch6_coeff_2_7; 
input [31:0] ch6_coeff_2_6; 
input [31:0] ch6_coeff_2_5; 
input [31:0] ch6_coeff_2_4; 
input [31:0] ch6_coeff_2_3; 
input [31:0] ch6_coeff_2_2; 
input [31:0] ch6_coeff_2_1; 
input [31:0] ch6_coeff_2_0; 
input [31:0] ch6_coeff_1_10;//Section 1 coefficients (x <= 0, |x| > section_limit)  
input [31:0] ch6_coeff_1_9; 
input [31:0] ch6_coeff_1_8; 
input [31:0] ch6_coeff_1_7; 
input [31:0] ch6_coeff_1_6; 
input [31:0] ch6_coeff_1_5; 
input [31:0] ch6_coeff_1_4; 
input [31:0] ch6_coeff_1_3; 
input [31:0] ch6_coeff_1_2; 
input [31:0] ch6_coeff_1_1; 
input [31:0] ch6_coeff_1_0; 

input [20:0] ch5_x_adc;//NLC output 
output [20:0] ch5_x_lin;//ADC output 
input [19:0] ch5_section_limit;//X-value that separates the sections 
input [31:0] ch5_recip_stdev_4;//Reciprocal standard deviation for the centered and scaled fit  
input [31:0] ch5_recip_stdev_3; 
input [31:0] ch5_recip_stdev_2; 
input [31:0] ch5_recip_stdev_1; 
input [31:0] ch5_neg_mean_4;//Negative meand for the centered and scaled fit  
input [31:0] ch5_neg_mean_3; 
input [31:0] ch5_neg_mean_2; 
input [31:0] ch5_neg_mean_1; 
input [31:0] ch5_coeff_4_10; //Section 4 coefficients (x > 0, |x| > section_limit) 
input [31:0] ch5_coeff_4_9; 
input [31:0] ch5_coeff_4_8; 
input [31:0] ch5_coeff_4_7; 
input [31:0] ch5_coeff_4_6; 
input [31:0] ch5_coeff_4_5; 
input [31:0] ch5_coeff_4_4; 
input [31:0] ch5_coeff_4_3; 
input [31:0] ch5_coeff_4_2; 
input [31:0] ch5_coeff_4_1; 
input [31:0] ch5_coeff_4_0; 
input [31:0] ch5_coeff_3_10;//Section 3 coefficients (x > 0, |x| <= section_limit)  
input [31:0] ch5_coeff_3_9; 
input [31:0] ch5_coeff_3_8; 
input [31:0] ch5_coeff_3_7; 
input [31:0] ch5_coeff_3_6; 
input [31:0] ch5_coeff_3_5; 
input [31:0] ch5_coeff_3_4; 
input [31:0] ch5_coeff_3_3; 
input [31:0] ch5_coeff_3_2; 
input [31:0] ch5_coeff_3_1; 
input [31:0] ch5_coeff_3_0; 
input [31:0] ch5_coeff_2_10;//Section 2 coefficients (x <= 0, |x| <= section_limit)  
input [31:0] ch5_coeff_2_9; 
input [31:0] ch5_coeff_2_8; 
input [31:0] ch5_coeff_2_7; 
input [31:0] ch5_coeff_2_6; 
input [31:0] ch5_coeff_2_5; 
input [31:0] ch5_coeff_2_4; 
input [31:0] ch5_coeff_2_3; 
input [31:0] ch5_coeff_2_2; 
input [31:0] ch5_coeff_2_1; 
input [31:0] ch5_coeff_2_0; 
input [31:0] ch5_coeff_1_10;//Section 1 coefficients (x <= 0, |x| > section_limit)  
input [31:0] ch5_coeff_1_9; 
input [31:0] ch5_coeff_1_8; 
input [31:0] ch5_coeff_1_7; 
input [31:0] ch5_coeff_1_6; 
input [31:0] ch5_coeff_1_5; 
input [31:0] ch5_coeff_1_4; 
input [31:0] ch5_coeff_1_3; 
input [31:0] ch5_coeff_1_2; 
input [31:0] ch5_coeff_1_1; 
input [31:0] ch5_coeff_1_0; 

input [20:0] ch4_x_adc;//NLC output 
output [20:0] ch4_x_lin;//ADC output 
input [19:0] ch4_section_limit;//X-value that separates the sections 
input [31:0] ch4_recip_stdev_4;//Reciprocal standard deviation for the centered and scaled fit  
input [31:0] ch4_recip_stdev_3; 
input [31:0] ch4_recip_stdev_2; 
input [31:0] ch4_recip_stdev_1; 
input [31:0] ch4_neg_mean_4;//Negative meand for the centered and scaled fit  
input [31:0] ch4_neg_mean_3; 
input [31:0] ch4_neg_mean_2; 
input [31:0] ch4_neg_mean_1; 
input [31:0] ch4_coeff_4_10; //Section 4 coefficients (x > 0, |x| > section_limit) 
input [31:0] ch4_coeff_4_9; 
input [31:0] ch4_coeff_4_8; 
input [31:0] ch4_coeff_4_7; 
input [31:0] ch4_coeff_4_6; 
input [31:0] ch4_coeff_4_5; 
input [31:0] ch4_coeff_4_4; 
input [31:0] ch4_coeff_4_3; 
input [31:0] ch4_coeff_4_2; 
input [31:0] ch4_coeff_4_1; 
input [31:0] ch4_coeff_4_0; 
input [31:0] ch4_coeff_3_10;//Section 3 coefficients (x > 0, |x| <= section_limit)  
input [31:0] ch4_coeff_3_9; 
input [31:0] ch4_coeff_3_8; 
input [31:0] ch4_coeff_3_7; 
input [31:0] ch4_coeff_3_6; 
input [31:0] ch4_coeff_3_5; 
input [31:0] ch4_coeff_3_4; 
input [31:0] ch4_coeff_3_3; 
input [31:0] ch4_coeff_3_2; 
input [31:0] ch4_coeff_3_1; 
input [31:0] ch4_coeff_3_0; 
input [31:0] ch4_coeff_2_10;//Section 2 coefficients (x <= 0, |x| <= section_limit)  
input [31:0] ch4_coeff_2_9; 
input [31:0] ch4_coeff_2_8; 
input [31:0] ch4_coeff_2_7; 
input [31:0] ch4_coeff_2_6; 
input [31:0] ch4_coeff_2_5; 
input [31:0] ch4_coeff_2_4; 
input [31:0] ch4_coeff_2_3; 
input [31:0] ch4_coeff_2_2; 
input [31:0] ch4_coeff_2_1; 
input [31:0] ch4_coeff_2_0; 
input [31:0] ch4_coeff_1_10;//Section 1 coefficients (x <= 0, |x| > section_limit)  
input [31:0] ch4_coeff_1_9; 
input [31:0] ch4_coeff_1_8; 
input [31:0] ch4_coeff_1_7; 
input [31:0] ch4_coeff_1_6; 
input [31:0] ch4_coeff_1_5; 
input [31:0] ch4_coeff_1_4; 
input [31:0] ch4_coeff_1_3; 
input [31:0] ch4_coeff_1_2; 
input [31:0] ch4_coeff_1_1; 
input [31:0] ch4_coeff_1_0; 

input [20:0] ch3_x_adc;//NLC output 
output [20:0] ch3_x_lin;//ADC output 
input [19:0] ch3_section_limit;//X-value that separates the sections 
input [31:0] ch3_recip_stdev_4;//Reciprocal standard deviation for the centered and scaled fit  
input [31:0] ch3_recip_stdev_3; 
input [31:0] ch3_recip_stdev_2; 
input [31:0] ch3_recip_stdev_1; 
input [31:0] ch3_neg_mean_4;//Negative meand for the centered and scaled fit  
input [31:0] ch3_neg_mean_3; 
input [31:0] ch3_neg_mean_2; 
input [31:0] ch3_neg_mean_1; 
input [31:0] ch3_coeff_4_10; //Section 4 coefficients (x > 0, |x| > section_limit) 
input [31:0] ch3_coeff_4_9; 
input [31:0] ch3_coeff_4_8; 
input [31:0] ch3_coeff_4_7; 
input [31:0] ch3_coeff_4_6; 
input [31:0] ch3_coeff_4_5; 
input [31:0] ch3_coeff_4_4; 
input [31:0] ch3_coeff_4_3; 
input [31:0] ch3_coeff_4_2; 
input [31:0] ch3_coeff_4_1; 
input [31:0] ch3_coeff_4_0; 
input [31:0] ch3_coeff_3_10;//Section 3 coefficients (x > 0, |x| <= section_limit)  
input [31:0] ch3_coeff_3_9; 
input [31:0] ch3_coeff_3_8; 
input [31:0] ch3_coeff_3_7; 
input [31:0] ch3_coeff_3_6; 
input [31:0] ch3_coeff_3_5; 
input [31:0] ch3_coeff_3_4; 
input [31:0] ch3_coeff_3_3; 
input [31:0] ch3_coeff_3_2; 
input [31:0] ch3_coeff_3_1; 
input [31:0] ch3_coeff_3_0; 
input [31:0] ch3_coeff_2_10;//Section 2 coefficients (x <= 0, |x| <= section_limit)  
input [31:0] ch3_coeff_2_9; 
input [31:0] ch3_coeff_2_8; 
input [31:0] ch3_coeff_2_7; 
input [31:0] ch3_coeff_2_6; 
input [31:0] ch3_coeff_2_5; 
input [31:0] ch3_coeff_2_4; 
input [31:0] ch3_coeff_2_3; 
input [31:0] ch3_coeff_2_2; 
input [31:0] ch3_coeff_2_1; 
input [31:0] ch3_coeff_2_0; 
input [31:0] ch3_coeff_1_10;//Section 1 coefficients (x <= 0, |x| > section_limit)  
input [31:0] ch3_coeff_1_9; 
input [31:0] ch3_coeff_1_8; 
input [31:0] ch3_coeff_1_7; 
input [31:0] ch3_coeff_1_6; 
input [31:0] ch3_coeff_1_5; 
input [31:0] ch3_coeff_1_4; 
input [31:0] ch3_coeff_1_3; 
input [31:0] ch3_coeff_1_2; 
input [31:0] ch3_coeff_1_1; 
input [31:0] ch3_coeff_1_0; 

input [20:0] ch2_x_adc;//NLC output 
output [20:0] ch2_x_lin;//ADC output 
input [19:0] ch2_section_limit;//X-value that separates the sections 
input [31:0] ch2_recip_stdev_4;//Reciprocal standard deviation for the centered and scaled fit  
input [31:0] ch2_recip_stdev_3; 
input [31:0] ch2_recip_stdev_2; 
input [31:0] ch2_recip_stdev_1; 
input [31:0] ch2_neg_mean_4;//Negative meand for the centered and scaled fit  
input [31:0] ch2_neg_mean_3; 
input [31:0] ch2_neg_mean_2; 
input [31:0] ch2_neg_mean_1; 
input [31:0] ch2_coeff_4_10; //Section 4 coefficients (x > 0, |x| > section_limit) 
input [31:0] ch2_coeff_4_9; 
input [31:0] ch2_coeff_4_8; 
input [31:0] ch2_coeff_4_7; 
input [31:0] ch2_coeff_4_6; 
input [31:0] ch2_coeff_4_5; 
input [31:0] ch2_coeff_4_4; 
input [31:0] ch2_coeff_4_3; 
input [31:0] ch2_coeff_4_2; 
input [31:0] ch2_coeff_4_1; 
input [31:0] ch2_coeff_4_0; 
input [31:0] ch2_coeff_3_10;//Section 3 coefficients (x > 0, |x| <= section_limit)  
input [31:0] ch2_coeff_3_9; 
input [31:0] ch2_coeff_3_8; 
input [31:0] ch2_coeff_3_7; 
input [31:0] ch2_coeff_3_6; 
input [31:0] ch2_coeff_3_5; 
input [31:0] ch2_coeff_3_4; 
input [31:0] ch2_coeff_3_3; 
input [31:0] ch2_coeff_3_2; 
input [31:0] ch2_coeff_3_1; 
input [31:0] ch2_coeff_3_0; 
input [31:0] ch2_coeff_2_10;//Section 2 coefficients (x <= 0, |x| <= section_limit)  
input [31:0] ch2_coeff_2_9; 
input [31:0] ch2_coeff_2_8; 
input [31:0] ch2_coeff_2_7; 
input [31:0] ch2_coeff_2_6; 
input [31:0] ch2_coeff_2_5; 
input [31:0] ch2_coeff_2_4; 
input [31:0] ch2_coeff_2_3; 
input [31:0] ch2_coeff_2_2; 
input [31:0] ch2_coeff_2_1; 
input [31:0] ch2_coeff_2_0; 
input [31:0] ch2_coeff_1_10;//Section 1 coefficients (x <= 0, |x| > section_limit)  
input [31:0] ch2_coeff_1_9; 
input [31:0] ch2_coeff_1_8; 
input [31:0] ch2_coeff_1_7; 
input [31:0] ch2_coeff_1_6; 
input [31:0] ch2_coeff_1_5; 
input [31:0] ch2_coeff_1_4; 
input [31:0] ch2_coeff_1_3; 
input [31:0] ch2_coeff_1_2; 
input [31:0] ch2_coeff_1_1; 
input [31:0] ch2_coeff_1_0; 

input [20:0] ch1_x_adc;//NLC output 
output [20:0] ch1_x_lin;//ADC output 
input [19:0] ch1_section_limit;//X-value that separates the sections 
input [31:0] ch1_recip_stdev_4;//Reciprocal standard deviation for the centered and scaled fit  
input [31:0] ch1_recip_stdev_3; 
input [31:0] ch1_recip_stdev_2; 
input [31:0] ch1_recip_stdev_1; 
input [31:0] ch1_neg_mean_4;//Negative meand for the centered and scaled fit  
input [31:0] ch1_neg_mean_3; 
input [31:0] ch1_neg_mean_2; 
input [31:0] ch1_neg_mean_1; 
input [31:0] ch1_coeff_4_10; //Section 4 coefficients (x > 0, |x| > section_limit) 
input [31:0] ch1_coeff_4_9; 
input [31:0] ch1_coeff_4_8; 
input [31:0] ch1_coeff_4_7; 
input [31:0] ch1_coeff_4_6; 
input [31:0] ch1_coeff_4_5; 
input [31:0] ch1_coeff_4_4; 
input [31:0] ch1_coeff_4_3; 
input [31:0] ch1_coeff_4_2; 
input [31:0] ch1_coeff_4_1; 
input [31:0] ch1_coeff_4_0; 
input [31:0] ch1_coeff_3_10;//Section 3 coefficients (x > 0, |x| <= section_limit)  
input [31:0] ch1_coeff_3_9; 
input [31:0] ch1_coeff_3_8; 
input [31:0] ch1_coeff_3_7; 
input [31:0] ch1_coeff_3_6; 
input [31:0] ch1_coeff_3_5; 
input [31:0] ch1_coeff_3_4; 
input [31:0] ch1_coeff_3_3; 
input [31:0] ch1_coeff_3_2; 
input [31:0] ch1_coeff_3_1; 
input [31:0] ch1_coeff_3_0; 
input [31:0] ch1_coeff_2_10;//Section 2 coefficients (x <= 0, |x| <= section_limit)  
input [31:0] ch1_coeff_2_9; 
input [31:0] ch1_coeff_2_8; 
input [31:0] ch1_coeff_2_7; 
input [31:0] ch1_coeff_2_6; 
input [31:0] ch1_coeff_2_5; 
input [31:0] ch1_coeff_2_4; 
input [31:0] ch1_coeff_2_3; 
input [31:0] ch1_coeff_2_2; 
input [31:0] ch1_coeff_2_1; 
input [31:0] ch1_coeff_2_0; 
input [31:0] ch1_coeff_1_10;//Section 1 coefficients (x <= 0, |x| > section_limit)  
input [31:0] ch1_coeff_1_9; 
input [31:0] ch1_coeff_1_8; 
input [31:0] ch1_coeff_1_7; 
input [31:0] ch1_coeff_1_6; 
input [31:0] ch1_coeff_1_5; 
input [31:0] ch1_coeff_1_4; 
input [31:0] ch1_coeff_1_3; 
input [31:0] ch1_coeff_1_2; 
input [31:0] ch1_coeff_1_1; 
input [31:0] ch1_coeff_1_0; 

input [20:0] ch0_x_adc;//NLC output 
output [20:0] ch0_x_lin;//ADC output 
input [19:0] ch0_section_limit;//X-value that separates the sections 
input [31:0] ch0_recip_stdev_4;//Reciprocal standard deviation for the centered and scaled fit  
input [31:0] ch0_recip_stdev_3; 
input [31:0] ch0_recip_stdev_2; 
input [31:0] ch0_recip_stdev_1; 
input [31:0] ch0_neg_mean_4;//Negative meand for the centered and scaled fit  
input [31:0] ch0_neg_mean_3; 
input [31:0] ch0_neg_mean_2; 
input [31:0] ch0_neg_mean_1; 
input [31:0] ch0_coeff_4_10; //Section 4 coefficients (x > 0, |x| > section_limit) 
input [31:0] ch0_coeff_4_9; 
input [31:0] ch0_coeff_4_8; 
input [31:0] ch0_coeff_4_7; 
input [31:0] ch0_coeff_4_6; 
input [31:0] ch0_coeff_4_5; 
input [31:0] ch0_coeff_4_4; 
input [31:0] ch0_coeff_4_3; 
input [31:0] ch0_coeff_4_2; 
input [31:0] ch0_coeff_4_1; 
input [31:0] ch0_coeff_4_0; 
input [31:0] ch0_coeff_3_10;//Section 3 coefficients (x > 0, |x| <= section_limit)  
input [31:0] ch0_coeff_3_9; 
input [31:0] ch0_coeff_3_8; 
input [31:0] ch0_coeff_3_7; 
input [31:0] ch0_coeff_3_6; 
input [31:0] ch0_coeff_3_5; 
input [31:0] ch0_coeff_3_4; 
input [31:0] ch0_coeff_3_3; 
input [31:0] ch0_coeff_3_2; 
input [31:0] ch0_coeff_3_1; 
input [31:0] ch0_coeff_3_0; 
input [31:0] ch0_coeff_2_10;//Section 2 coefficients (x <= 0, |x| <= section_limit)  
input [31:0] ch0_coeff_2_9; 
input [31:0] ch0_coeff_2_8; 
input [31:0] ch0_coeff_2_7; 
input [31:0] ch0_coeff_2_6; 
input [31:0] ch0_coeff_2_5; 
input [31:0] ch0_coeff_2_4; 
input [31:0] ch0_coeff_2_3; 
input [31:0] ch0_coeff_2_2; 
input [31:0] ch0_coeff_2_1; 
input [31:0] ch0_coeff_2_0; 
input [31:0] ch0_coeff_1_10;//Section 1 coefficients (x <= 0, |x| > section_limit)  
input [31:0] ch0_coeff_1_9; 
input [31:0] ch0_coeff_1_8; 
input [31:0] ch0_coeff_1_7; 
input [31:0] ch0_coeff_1_6; 
input [31:0] ch0_coeff_1_5; 
input [31:0] ch0_coeff_1_4; 
input [31:0] ch0_coeff_1_3; 
input [31:0] ch0_coeff_1_2; 
input [31:0] ch0_coeff_1_1; 
input [31:0] ch0_coeff_1_0;
  

	
////////////////////////////////////////////////////////////////
//  reg & wire declarations

////////////////////////////////////////////////////////////////
//  Modules
NLC_1ch_1 ch31(
  //System clock and reset
  .clk(clk),
  .reset(reset),
  
  //ADC output
  .srdyi(srdyi), 
  .x_lin(ch31_x_lin),

  //NLC output
  .srdyo(srdyo), 
  .x_adc(ch31_x_adc), 

  //X-value that separates the sections
  .section_limit(ch31_section_limit),

  //Reciprocal standard deviation for the centered and scaled fit
  .recip_stdev_4(ch31_recip_stdev_4), 
  .recip_stdev_3(ch31_recip_stdev_3), 
  .recip_stdev_2(ch31_recip_stdev_2), 
  .recip_stdev_1(ch31_recip_stdev_1), 

  //Negative meand for the centered and scaled fit
  .neg_mean_4(ch31_neg_mean_4), 
  .neg_mean_3(ch31_neg_mean_3), 
  .neg_mean_2(ch31_neg_mean_2), 
  .neg_mean_1(ch31_neg_mean_1), 

  //Section 4 coefficients (x > 0, |x| > section_limit)
  .coeff_4_10(ch31_coeff_4_10), 
  .coeff_4_9(ch31_coeff_4_9), 
  .coeff_4_8(ch31_coeff_4_8), 
  .coeff_4_7(ch31_coeff_4_7), 
  .coeff_4_6(ch31_coeff_4_6), 
  .coeff_4_5(ch31_coeff_4_5), 
  .coeff_4_4(ch31_coeff_4_4), 
  .coeff_4_3(ch31_coeff_4_3), 
  .coeff_4_2(ch31_coeff_4_2), 
  .coeff_4_1(ch31_coeff_4_1), 
  .coeff_4_0(ch31_coeff_4_0), 

  //Section 3 coefficients (x > 0, |x| <= section_limit)
  .coeff_3_10(ch31_coeff_3_10), 
  .coeff_3_9(ch31_coeff_3_9), 
  .coeff_3_8(ch31_coeff_3_8), 
  .coeff_3_7(ch31_coeff_3_7), 
  .coeff_3_6(ch31_coeff_3_6), 
  .coeff_3_5(ch31_coeff_3_5), 
  .coeff_3_4(ch31_coeff_3_4), 
  .coeff_3_3(ch31_coeff_3_3), 
  .coeff_3_2(ch31_coeff_3_2), 
  .coeff_3_1(ch31_coeff_3_1), 
  .coeff_3_0(ch31_coeff_3_0), 

  //Section 2 coefficients (x <= 0, |x| <= section_limit)
  .coeff_2_10(ch31_coeff_2_10), 
  .coeff_2_9(ch31_coeff_2_9), 
  .coeff_2_8(ch31_coeff_2_8), 
  .coeff_2_7(ch31_coeff_2_7), 
  .coeff_2_6(ch31_coeff_2_6), 
  .coeff_2_5(ch31_coeff_2_5), 
  .coeff_2_4(ch31_coeff_2_4), 
  .coeff_2_3(ch31_coeff_2_3), 
  .coeff_2_2(ch31_coeff_2_2), 
  .coeff_2_1(ch31_coeff_2_1), 
  .coeff_2_0(ch31_coeff_2_0), 

  //Section 1 coefficients (x <= 0, |x| > section_limit)
  .coeff_1_10(ch31_coeff_1_10), 
  .coeff_1_9(ch31_coeff_1_9), 
  .coeff_1_8(ch31_coeff_1_8), 
  .coeff_1_7(ch31_coeff_1_7), 
  .coeff_1_6(ch31_coeff_1_6), 
  .coeff_1_5(ch31_coeff_1_5), 
  .coeff_1_4(ch31_coeff_1_4), 
  .coeff_1_3(ch31_coeff_1_3), 
  .coeff_1_2(ch31_coeff_1_2), 
  .coeff_1_1(ch31_coeff_1_1), 
  .coeff_1_0(ch31_coeff_1_0)
);

NLC_1ch_1 ch30(
  //System clock and reset
  .clk(clk),
  .reset(reset),
  
  //ADC output
  .srdyi(srdyi), 
  .x_lin(ch30_x_lin),

  //NLC output
  .srdyo(srdyo), 
  .x_adc(ch30_x_adc), 

  //X-value that separates the sections
  .section_limit(ch30_section_limit),

  //Reciprocal standard deviation for the centered and scaled fit
  .recip_stdev_4(ch30_recip_stdev_4), 
  .recip_stdev_3(ch30_recip_stdev_3), 
  .recip_stdev_2(ch30_recip_stdev_2), 
  .recip_stdev_1(ch30_recip_stdev_1), 

  //Negative meand for the centered and scaled fit
  .neg_mean_4(ch30_neg_mean_4), 
  .neg_mean_3(ch30_neg_mean_3), 
  .neg_mean_2(ch30_neg_mean_2), 
  .neg_mean_1(ch30_neg_mean_1), 

  //Section 4 coefficients (x > 0, |x| > section_limit)
  .coeff_4_10(ch30_coeff_4_10), 
  .coeff_4_9(ch30_coeff_4_9), 
  .coeff_4_8(ch30_coeff_4_8), 
  .coeff_4_7(ch30_coeff_4_7), 
  .coeff_4_6(ch30_coeff_4_6), 
  .coeff_4_5(ch30_coeff_4_5), 
  .coeff_4_4(ch30_coeff_4_4), 
  .coeff_4_3(ch30_coeff_4_3), 
  .coeff_4_2(ch30_coeff_4_2), 
  .coeff_4_1(ch30_coeff_4_1), 
  .coeff_4_0(ch30_coeff_4_0), 

  //Section 3 coefficients (x > 0, |x| <= section_limit)
  .coeff_3_10(ch30_coeff_3_10), 
  .coeff_3_9(ch30_coeff_3_9), 
  .coeff_3_8(ch30_coeff_3_8), 
  .coeff_3_7(ch30_coeff_3_7), 
  .coeff_3_6(ch30_coeff_3_6), 
  .coeff_3_5(ch30_coeff_3_5), 
  .coeff_3_4(ch30_coeff_3_4), 
  .coeff_3_3(ch30_coeff_3_3), 
  .coeff_3_2(ch30_coeff_3_2), 
  .coeff_3_1(ch30_coeff_3_1), 
  .coeff_3_0(ch30_coeff_3_0), 

  //Section 2 coefficients (x <= 0, |x| <= section_limit)
  .coeff_2_10(ch30_coeff_2_10), 
  .coeff_2_9(ch30_coeff_2_9), 
  .coeff_2_8(ch30_coeff_2_8), 
  .coeff_2_7(ch30_coeff_2_7), 
  .coeff_2_6(ch30_coeff_2_6), 
  .coeff_2_5(ch30_coeff_2_5), 
  .coeff_2_4(ch30_coeff_2_4), 
  .coeff_2_3(ch30_coeff_2_3), 
  .coeff_2_2(ch30_coeff_2_2), 
  .coeff_2_1(ch30_coeff_2_1), 
  .coeff_2_0(ch30_coeff_2_0), 

  //Section 1 coefficients (x <= 0, |x| > section_limit)
  .coeff_1_10(ch30_coeff_1_10), 
  .coeff_1_9(ch30_coeff_1_9), 
  .coeff_1_8(ch30_coeff_1_8), 
  .coeff_1_7(ch30_coeff_1_7), 
  .coeff_1_6(ch30_coeff_1_6), 
  .coeff_1_5(ch30_coeff_1_5), 
  .coeff_1_4(ch30_coeff_1_4), 
  .coeff_1_3(ch30_coeff_1_3), 
  .coeff_1_2(ch30_coeff_1_2), 
  .coeff_1_1(ch30_coeff_1_1), 
  .coeff_1_0(ch30_coeff_1_0)
);

NLC_1ch_1 ch29(
  //System clock and reset
  .clk(clk),
  .reset(reset),
  
  //ADC output
  .srdyi(srdyi), 
  .x_lin(ch29_x_lin),

  //NLC output
  .srdyo(srdyo), 
  .x_adc(ch29_x_adc), 

  //X-value that separates the sections
  .section_limit(ch29_section_limit),

  //Reciprocal standard deviation for the centered and scaled fit
  .recip_stdev_4(ch29_recip_stdev_4), 
  .recip_stdev_3(ch29_recip_stdev_3), 
  .recip_stdev_2(ch29_recip_stdev_2), 
  .recip_stdev_1(ch29_recip_stdev_1), 

  //Negative meand for the centered and scaled fit
  .neg_mean_4(ch29_neg_mean_4), 
  .neg_mean_3(ch29_neg_mean_3), 
  .neg_mean_2(ch29_neg_mean_2), 
  .neg_mean_1(ch29_neg_mean_1), 

  //Section 4 coefficients (x > 0, |x| > section_limit)
  .coeff_4_10(ch29_coeff_4_10), 
  .coeff_4_9(ch29_coeff_4_9), 
  .coeff_4_8(ch29_coeff_4_8), 
  .coeff_4_7(ch29_coeff_4_7), 
  .coeff_4_6(ch29_coeff_4_6), 
  .coeff_4_5(ch29_coeff_4_5), 
  .coeff_4_4(ch29_coeff_4_4), 
  .coeff_4_3(ch29_coeff_4_3), 
  .coeff_4_2(ch29_coeff_4_2), 
  .coeff_4_1(ch29_coeff_4_1), 
  .coeff_4_0(ch29_coeff_4_0), 

  //Section 3 coefficients (x > 0, |x| <= section_limit)
  .coeff_3_10(ch29_coeff_3_10), 
  .coeff_3_9(ch29_coeff_3_9), 
  .coeff_3_8(ch29_coeff_3_8), 
  .coeff_3_7(ch29_coeff_3_7), 
  .coeff_3_6(ch29_coeff_3_6), 
  .coeff_3_5(ch29_coeff_3_5), 
  .coeff_3_4(ch29_coeff_3_4), 
  .coeff_3_3(ch29_coeff_3_3), 
  .coeff_3_2(ch29_coeff_3_2), 
  .coeff_3_1(ch29_coeff_3_1), 
  .coeff_3_0(ch29_coeff_3_0), 

  //Section 2 coefficients (x <= 0, |x| <= section_limit)
  .coeff_2_10(ch29_coeff_2_10), 
  .coeff_2_9(ch29_coeff_2_9), 
  .coeff_2_8(ch29_coeff_2_8), 
  .coeff_2_7(ch29_coeff_2_7), 
  .coeff_2_6(ch29_coeff_2_6), 
  .coeff_2_5(ch29_coeff_2_5), 
  .coeff_2_4(ch29_coeff_2_4), 
  .coeff_2_3(ch29_coeff_2_3), 
  .coeff_2_2(ch29_coeff_2_2), 
  .coeff_2_1(ch29_coeff_2_1), 
  .coeff_2_0(ch29_coeff_2_0), 

  //Section 1 coefficients (x <= 0, |x| > section_limit)
  .coeff_1_10(ch29_coeff_1_10), 
  .coeff_1_9(ch29_coeff_1_9), 
  .coeff_1_8(ch29_coeff_1_8), 
  .coeff_1_7(ch29_coeff_1_7), 
  .coeff_1_6(ch29_coeff_1_6), 
  .coeff_1_5(ch29_coeff_1_5), 
  .coeff_1_4(ch29_coeff_1_4), 
  .coeff_1_3(ch29_coeff_1_3), 
  .coeff_1_2(ch29_coeff_1_2), 
  .coeff_1_1(ch29_coeff_1_1), 
  .coeff_1_0(ch29_coeff_1_0)
);

NLC_1ch_1 ch28(
  //System clock and reset
  .clk(clk),
  .reset(reset),
  
  //ADC output
  .srdyi(srdyi), 
  .x_lin(ch28_x_lin),

  //NLC output
  .srdyo(srdyo), 
  .x_adc(ch28_x_adc), 

  //X-value that separates the sections
  .section_limit(ch28_section_limit),

  //Reciprocal standard deviation for the centered and scaled fit
  .recip_stdev_4(ch28_recip_stdev_4), 
  .recip_stdev_3(ch28_recip_stdev_3), 
  .recip_stdev_2(ch28_recip_stdev_2), 
  .recip_stdev_1(ch28_recip_stdev_1), 

  //Negative meand for the centered and scaled fit
  .neg_mean_4(ch28_neg_mean_4), 
  .neg_mean_3(ch28_neg_mean_3), 
  .neg_mean_2(ch28_neg_mean_2), 
  .neg_mean_1(ch28_neg_mean_1), 

  //Section 4 coefficients (x > 0, |x| > section_limit)
  .coeff_4_10(ch28_coeff_4_10), 
  .coeff_4_9(ch28_coeff_4_9), 
  .coeff_4_8(ch28_coeff_4_8), 
  .coeff_4_7(ch28_coeff_4_7), 
  .coeff_4_6(ch28_coeff_4_6), 
  .coeff_4_5(ch28_coeff_4_5), 
  .coeff_4_4(ch28_coeff_4_4), 
  .coeff_4_3(ch28_coeff_4_3), 
  .coeff_4_2(ch28_coeff_4_2), 
  .coeff_4_1(ch28_coeff_4_1), 
  .coeff_4_0(ch28_coeff_4_0), 

  //Section 3 coefficients (x > 0, |x| <= section_limit)
  .coeff_3_10(ch28_coeff_3_10), 
  .coeff_3_9(ch28_coeff_3_9), 
  .coeff_3_8(ch28_coeff_3_8), 
  .coeff_3_7(ch28_coeff_3_7), 
  .coeff_3_6(ch28_coeff_3_6), 
  .coeff_3_5(ch28_coeff_3_5), 
  .coeff_3_4(ch28_coeff_3_4), 
  .coeff_3_3(ch28_coeff_3_3), 
  .coeff_3_2(ch28_coeff_3_2), 
  .coeff_3_1(ch28_coeff_3_1), 
  .coeff_3_0(ch28_coeff_3_0), 

  //Section 2 coefficients (x <= 0, |x| <= section_limit)
  .coeff_2_10(ch28_coeff_2_10), 
  .coeff_2_9(ch28_coeff_2_9), 
  .coeff_2_8(ch28_coeff_2_8), 
  .coeff_2_7(ch28_coeff_2_7), 
  .coeff_2_6(ch28_coeff_2_6), 
  .coeff_2_5(ch28_coeff_2_5), 
  .coeff_2_4(ch28_coeff_2_4), 
  .coeff_2_3(ch28_coeff_2_3), 
  .coeff_2_2(ch28_coeff_2_2), 
  .coeff_2_1(ch28_coeff_2_1), 
  .coeff_2_0(ch28_coeff_2_0), 

  //Section 1 coefficients (x <= 0, |x| > section_limit)
  .coeff_1_10(ch28_coeff_1_10), 
  .coeff_1_9(ch28_coeff_1_9), 
  .coeff_1_8(ch28_coeff_1_8), 
  .coeff_1_7(ch28_coeff_1_7), 
  .coeff_1_6(ch28_coeff_1_6), 
  .coeff_1_5(ch28_coeff_1_5), 
  .coeff_1_4(ch28_coeff_1_4), 
  .coeff_1_3(ch28_coeff_1_3), 
  .coeff_1_2(ch28_coeff_1_2), 
  .coeff_1_1(ch28_coeff_1_1), 
  .coeff_1_0(ch28_coeff_1_0)
);

NLC_1ch_1 ch27(
  //System clock and reset
  .clk(clk),
  .reset(reset),
  
  //ADC output
  .srdyi(srdyi), 
  .x_lin(ch27_x_lin),

  //NLC output
  .srdyo(srdyo), 
  .x_adc(ch27_x_adc), 

  //X-value that separates the sections
  .section_limit(ch27_section_limit),

  //Reciprocal standard deviation for the centered and scaled fit
  .recip_stdev_4(ch27_recip_stdev_4), 
  .recip_stdev_3(ch27_recip_stdev_3), 
  .recip_stdev_2(ch27_recip_stdev_2), 
  .recip_stdev_1(ch27_recip_stdev_1), 

  //Negative meand for the centered and scaled fit
  .neg_mean_4(ch27_neg_mean_4), 
  .neg_mean_3(ch27_neg_mean_3), 
  .neg_mean_2(ch27_neg_mean_2), 
  .neg_mean_1(ch27_neg_mean_1), 

  //Section 4 coefficients (x > 0, |x| > section_limit)
  .coeff_4_10(ch27_coeff_4_10), 
  .coeff_4_9(ch27_coeff_4_9), 
  .coeff_4_8(ch27_coeff_4_8), 
  .coeff_4_7(ch27_coeff_4_7), 
  .coeff_4_6(ch27_coeff_4_6), 
  .coeff_4_5(ch27_coeff_4_5), 
  .coeff_4_4(ch27_coeff_4_4), 
  .coeff_4_3(ch27_coeff_4_3), 
  .coeff_4_2(ch27_coeff_4_2), 
  .coeff_4_1(ch27_coeff_4_1), 
  .coeff_4_0(ch27_coeff_4_0), 

  //Section 3 coefficients (x > 0, |x| <= section_limit)
  .coeff_3_10(ch27_coeff_3_10), 
  .coeff_3_9(ch27_coeff_3_9), 
  .coeff_3_8(ch27_coeff_3_8), 
  .coeff_3_7(ch27_coeff_3_7), 
  .coeff_3_6(ch27_coeff_3_6), 
  .coeff_3_5(ch27_coeff_3_5), 
  .coeff_3_4(ch27_coeff_3_4), 
  .coeff_3_3(ch27_coeff_3_3), 
  .coeff_3_2(ch27_coeff_3_2), 
  .coeff_3_1(ch27_coeff_3_1), 
  .coeff_3_0(ch27_coeff_3_0), 

  //Section 2 coefficients (x <= 0, |x| <= section_limit)
  .coeff_2_10(ch27_coeff_2_10), 
  .coeff_2_9(ch27_coeff_2_9), 
  .coeff_2_8(ch27_coeff_2_8), 
  .coeff_2_7(ch27_coeff_2_7), 
  .coeff_2_6(ch27_coeff_2_6), 
  .coeff_2_5(ch27_coeff_2_5), 
  .coeff_2_4(ch27_coeff_2_4), 
  .coeff_2_3(ch27_coeff_2_3), 
  .coeff_2_2(ch27_coeff_2_2), 
  .coeff_2_1(ch27_coeff_2_1), 
  .coeff_2_0(ch27_coeff_2_0), 

  //Section 1 coefficients (x <= 0, |x| > section_limit)
  .coeff_1_10(ch27_coeff_1_10), 
  .coeff_1_9(ch27_coeff_1_9), 
  .coeff_1_8(ch27_coeff_1_8), 
  .coeff_1_7(ch27_coeff_1_7), 
  .coeff_1_6(ch27_coeff_1_6), 
  .coeff_1_5(ch27_coeff_1_5), 
  .coeff_1_4(ch27_coeff_1_4), 
  .coeff_1_3(ch27_coeff_1_3), 
  .coeff_1_2(ch27_coeff_1_2), 
  .coeff_1_1(ch27_coeff_1_1), 
  .coeff_1_0(ch27_coeff_1_0)
);

NLC_1ch_1 ch26(
  //System clock and reset
  .clk(clk),
  .reset(reset),
  
  //ADC output
  .srdyi(srdyi), 
  .x_lin(ch26_x_lin),

  //NLC output
  .srdyo(srdyo), 
  .x_adc(ch26_x_adc), 

  //X-value that separates the sections
  .section_limit(ch26_section_limit),

  //Reciprocal standard deviation for the centered and scaled fit
  .recip_stdev_4(ch26_recip_stdev_4), 
  .recip_stdev_3(ch26_recip_stdev_3), 
  .recip_stdev_2(ch26_recip_stdev_2), 
  .recip_stdev_1(ch26_recip_stdev_1), 

  //Negative meand for the centered and scaled fit
  .neg_mean_4(ch26_neg_mean_4), 
  .neg_mean_3(ch26_neg_mean_3), 
  .neg_mean_2(ch26_neg_mean_2), 
  .neg_mean_1(ch26_neg_mean_1), 

  //Section 4 coefficients (x > 0, |x| > section_limit)
  .coeff_4_10(ch26_coeff_4_10), 
  .coeff_4_9(ch26_coeff_4_9), 
  .coeff_4_8(ch26_coeff_4_8), 
  .coeff_4_7(ch26_coeff_4_7), 
  .coeff_4_6(ch26_coeff_4_6), 
  .coeff_4_5(ch26_coeff_4_5), 
  .coeff_4_4(ch26_coeff_4_4), 
  .coeff_4_3(ch26_coeff_4_3), 
  .coeff_4_2(ch26_coeff_4_2), 
  .coeff_4_1(ch26_coeff_4_1), 
  .coeff_4_0(ch26_coeff_4_0), 

  //Section 3 coefficients (x > 0, |x| <= section_limit)
  .coeff_3_10(ch26_coeff_3_10), 
  .coeff_3_9(ch26_coeff_3_9), 
  .coeff_3_8(ch26_coeff_3_8), 
  .coeff_3_7(ch26_coeff_3_7), 
  .coeff_3_6(ch26_coeff_3_6), 
  .coeff_3_5(ch26_coeff_3_5), 
  .coeff_3_4(ch26_coeff_3_4), 
  .coeff_3_3(ch26_coeff_3_3), 
  .coeff_3_2(ch26_coeff_3_2), 
  .coeff_3_1(ch26_coeff_3_1), 
  .coeff_3_0(ch26_coeff_3_0), 

  //Section 2 coefficients (x <= 0, |x| <= section_limit)
  .coeff_2_10(ch26_coeff_2_10), 
  .coeff_2_9(ch26_coeff_2_9), 
  .coeff_2_8(ch26_coeff_2_8), 
  .coeff_2_7(ch26_coeff_2_7), 
  .coeff_2_6(ch26_coeff_2_6), 
  .coeff_2_5(ch26_coeff_2_5), 
  .coeff_2_4(ch26_coeff_2_4), 
  .coeff_2_3(ch26_coeff_2_3), 
  .coeff_2_2(ch26_coeff_2_2), 
  .coeff_2_1(ch26_coeff_2_1), 
  .coeff_2_0(ch26_coeff_2_0), 

  //Section 1 coefficients (x <= 0, |x| > section_limit)
  .coeff_1_10(ch26_coeff_1_10), 
  .coeff_1_9(ch26_coeff_1_9), 
  .coeff_1_8(ch26_coeff_1_8), 
  .coeff_1_7(ch26_coeff_1_7), 
  .coeff_1_6(ch26_coeff_1_6), 
  .coeff_1_5(ch26_coeff_1_5), 
  .coeff_1_4(ch26_coeff_1_4), 
  .coeff_1_3(ch26_coeff_1_3), 
  .coeff_1_2(ch26_coeff_1_2), 
  .coeff_1_1(ch26_coeff_1_1), 
  .coeff_1_0(ch26_coeff_1_0)
);

NLC_1ch_1 ch25(
  //System clock and reset
  .clk(clk),
  .reset(reset),
  
  //ADC output
  .srdyi(srdyi), 
  .x_lin(ch25_x_lin),

  //NLC output
  .srdyo(srdyo), 
  .x_adc(ch25_x_adc), 

  //X-value that separates the sections
  .section_limit(ch25_section_limit),

  //Reciprocal standard deviation for the centered and scaled fit
  .recip_stdev_4(ch25_recip_stdev_4), 
  .recip_stdev_3(ch25_recip_stdev_3), 
  .recip_stdev_2(ch25_recip_stdev_2), 
  .recip_stdev_1(ch25_recip_stdev_1), 

  //Negative meand for the centered and scaled fit
  .neg_mean_4(ch25_neg_mean_4), 
  .neg_mean_3(ch25_neg_mean_3), 
  .neg_mean_2(ch25_neg_mean_2), 
  .neg_mean_1(ch25_neg_mean_1), 

  //Section 4 coefficients (x > 0, |x| > section_limit)
  .coeff_4_10(ch25_coeff_4_10), 
  .coeff_4_9(ch25_coeff_4_9), 
  .coeff_4_8(ch25_coeff_4_8), 
  .coeff_4_7(ch25_coeff_4_7), 
  .coeff_4_6(ch25_coeff_4_6), 
  .coeff_4_5(ch25_coeff_4_5), 
  .coeff_4_4(ch25_coeff_4_4), 
  .coeff_4_3(ch25_coeff_4_3), 
  .coeff_4_2(ch25_coeff_4_2), 
  .coeff_4_1(ch25_coeff_4_1), 
  .coeff_4_0(ch25_coeff_4_0), 

  //Section 3 coefficients (x > 0, |x| <= section_limit)
  .coeff_3_10(ch25_coeff_3_10), 
  .coeff_3_9(ch25_coeff_3_9), 
  .coeff_3_8(ch25_coeff_3_8), 
  .coeff_3_7(ch25_coeff_3_7), 
  .coeff_3_6(ch25_coeff_3_6), 
  .coeff_3_5(ch25_coeff_3_5), 
  .coeff_3_4(ch25_coeff_3_4), 
  .coeff_3_3(ch25_coeff_3_3), 
  .coeff_3_2(ch25_coeff_3_2), 
  .coeff_3_1(ch25_coeff_3_1), 
  .coeff_3_0(ch25_coeff_3_0), 

  //Section 2 coefficients (x <= 0, |x| <= section_limit)
  .coeff_2_10(ch25_coeff_2_10), 
  .coeff_2_9(ch25_coeff_2_9), 
  .coeff_2_8(ch25_coeff_2_8), 
  .coeff_2_7(ch25_coeff_2_7), 
  .coeff_2_6(ch25_coeff_2_6), 
  .coeff_2_5(ch25_coeff_2_5), 
  .coeff_2_4(ch25_coeff_2_4), 
  .coeff_2_3(ch25_coeff_2_3), 
  .coeff_2_2(ch25_coeff_2_2), 
  .coeff_2_1(ch25_coeff_2_1), 
  .coeff_2_0(ch25_coeff_2_0), 

  //Section 1 coefficients (x <= 0, |x| > section_limit)
  .coeff_1_10(ch25_coeff_1_10), 
  .coeff_1_9(ch25_coeff_1_9), 
  .coeff_1_8(ch25_coeff_1_8), 
  .coeff_1_7(ch25_coeff_1_7), 
  .coeff_1_6(ch25_coeff_1_6), 
  .coeff_1_5(ch25_coeff_1_5), 
  .coeff_1_4(ch25_coeff_1_4), 
  .coeff_1_3(ch25_coeff_1_3), 
  .coeff_1_2(ch25_coeff_1_2), 
  .coeff_1_1(ch25_coeff_1_1), 
  .coeff_1_0(ch25_coeff_1_0)
);

NLC_1ch_1 ch24(
  //System clock and reset
  .clk(clk),
  .reset(reset),
  
  //ADC output
  .srdyi(srdyi), 
  .x_lin(ch24_x_lin),

  //NLC output
  .srdyo(srdyo), 
  .x_adc(ch24_x_adc), 

  //X-value that separates the sections
  .section_limit(ch24_section_limit),

  //Reciprocal standard deviation for the centered and scaled fit
  .recip_stdev_4(ch24_recip_stdev_4), 
  .recip_stdev_3(ch24_recip_stdev_3), 
  .recip_stdev_2(ch24_recip_stdev_2), 
  .recip_stdev_1(ch24_recip_stdev_1), 

  //Negative meand for the centered and scaled fit
  .neg_mean_4(ch24_neg_mean_4), 
  .neg_mean_3(ch24_neg_mean_3), 
  .neg_mean_2(ch24_neg_mean_2), 
  .neg_mean_1(ch24_neg_mean_1), 

  //Section 4 coefficients (x > 0, |x| > section_limit)
  .coeff_4_10(ch24_coeff_4_10), 
  .coeff_4_9(ch24_coeff_4_9), 
  .coeff_4_8(ch24_coeff_4_8), 
  .coeff_4_7(ch24_coeff_4_7), 
  .coeff_4_6(ch24_coeff_4_6), 
  .coeff_4_5(ch24_coeff_4_5), 
  .coeff_4_4(ch24_coeff_4_4), 
  .coeff_4_3(ch24_coeff_4_3), 
  .coeff_4_2(ch24_coeff_4_2), 
  .coeff_4_1(ch24_coeff_4_1), 
  .coeff_4_0(ch24_coeff_4_0), 

  //Section 3 coefficients (x > 0, |x| <= section_limit)
  .coeff_3_10(ch24_coeff_3_10), 
  .coeff_3_9(ch24_coeff_3_9), 
  .coeff_3_8(ch24_coeff_3_8), 
  .coeff_3_7(ch24_coeff_3_7), 
  .coeff_3_6(ch24_coeff_3_6), 
  .coeff_3_5(ch24_coeff_3_5), 
  .coeff_3_4(ch24_coeff_3_4), 
  .coeff_3_3(ch24_coeff_3_3), 
  .coeff_3_2(ch24_coeff_3_2), 
  .coeff_3_1(ch24_coeff_3_1), 
  .coeff_3_0(ch24_coeff_3_0), 

  //Section 2 coefficients (x <= 0, |x| <= section_limit)
  .coeff_2_10(ch24_coeff_2_10), 
  .coeff_2_9(ch24_coeff_2_9), 
  .coeff_2_8(ch24_coeff_2_8), 
  .coeff_2_7(ch24_coeff_2_7), 
  .coeff_2_6(ch24_coeff_2_6), 
  .coeff_2_5(ch24_coeff_2_5), 
  .coeff_2_4(ch24_coeff_2_4), 
  .coeff_2_3(ch24_coeff_2_3), 
  .coeff_2_2(ch24_coeff_2_2), 
  .coeff_2_1(ch24_coeff_2_1), 
  .coeff_2_0(ch24_coeff_2_0), 

  //Section 1 coefficients (x <= 0, |x| > section_limit)
  .coeff_1_10(ch24_coeff_1_10), 
  .coeff_1_9(ch24_coeff_1_9), 
  .coeff_1_8(ch24_coeff_1_8), 
  .coeff_1_7(ch24_coeff_1_7), 
  .coeff_1_6(ch24_coeff_1_6), 
  .coeff_1_5(ch24_coeff_1_5), 
  .coeff_1_4(ch24_coeff_1_4), 
  .coeff_1_3(ch24_coeff_1_3), 
  .coeff_1_2(ch24_coeff_1_2), 
  .coeff_1_1(ch24_coeff_1_1), 
  .coeff_1_0(ch24_coeff_1_0)
);

NLC_1ch_1 ch23(
  //System clock and reset
  .clk(clk),
  .reset(reset),
  
  //ADC output
  .srdyi(srdyi), 
  .x_lin(ch23_x_lin),

  //NLC output
  .srdyo(srdyo), 
  .x_adc(ch23_x_adc), 

  //X-value that separates the sections
  .section_limit(ch23_section_limit),

  //Reciprocal standard deviation for the centered and scaled fit
  .recip_stdev_4(ch23_recip_stdev_4), 
  .recip_stdev_3(ch23_recip_stdev_3), 
  .recip_stdev_2(ch23_recip_stdev_2), 
  .recip_stdev_1(ch23_recip_stdev_1), 

  //Negative meand for the centered and scaled fit
  .neg_mean_4(ch23_neg_mean_4), 
  .neg_mean_3(ch23_neg_mean_3), 
  .neg_mean_2(ch23_neg_mean_2), 
  .neg_mean_1(ch23_neg_mean_1), 

  //Section 4 coefficients (x > 0, |x| > section_limit)
  .coeff_4_10(ch23_coeff_4_10), 
  .coeff_4_9(ch23_coeff_4_9), 
  .coeff_4_8(ch23_coeff_4_8), 
  .coeff_4_7(ch23_coeff_4_7), 
  .coeff_4_6(ch23_coeff_4_6), 
  .coeff_4_5(ch23_coeff_4_5), 
  .coeff_4_4(ch23_coeff_4_4), 
  .coeff_4_3(ch23_coeff_4_3), 
  .coeff_4_2(ch23_coeff_4_2), 
  .coeff_4_1(ch23_coeff_4_1), 
  .coeff_4_0(ch23_coeff_4_0), 

  //Section 3 coefficients (x > 0, |x| <= section_limit)
  .coeff_3_10(ch23_coeff_3_10), 
  .coeff_3_9(ch23_coeff_3_9), 
  .coeff_3_8(ch23_coeff_3_8), 
  .coeff_3_7(ch23_coeff_3_7), 
  .coeff_3_6(ch23_coeff_3_6), 
  .coeff_3_5(ch23_coeff_3_5), 
  .coeff_3_4(ch23_coeff_3_4), 
  .coeff_3_3(ch23_coeff_3_3), 
  .coeff_3_2(ch23_coeff_3_2), 
  .coeff_3_1(ch23_coeff_3_1), 
  .coeff_3_0(ch23_coeff_3_0), 

  //Section 2 coefficients (x <= 0, |x| <= section_limit)
  .coeff_2_10(ch23_coeff_2_10), 
  .coeff_2_9(ch23_coeff_2_9), 
  .coeff_2_8(ch23_coeff_2_8), 
  .coeff_2_7(ch23_coeff_2_7), 
  .coeff_2_6(ch23_coeff_2_6), 
  .coeff_2_5(ch23_coeff_2_5), 
  .coeff_2_4(ch23_coeff_2_4), 
  .coeff_2_3(ch23_coeff_2_3), 
  .coeff_2_2(ch23_coeff_2_2), 
  .coeff_2_1(ch23_coeff_2_1), 
  .coeff_2_0(ch23_coeff_2_0), 

  //Section 1 coefficients (x <= 0, |x| > section_limit)
  .coeff_1_10(ch23_coeff_1_10), 
  .coeff_1_9(ch23_coeff_1_9), 
  .coeff_1_8(ch23_coeff_1_8), 
  .coeff_1_7(ch23_coeff_1_7), 
  .coeff_1_6(ch23_coeff_1_6), 
  .coeff_1_5(ch23_coeff_1_5), 
  .coeff_1_4(ch23_coeff_1_4), 
  .coeff_1_3(ch23_coeff_1_3), 
  .coeff_1_2(ch23_coeff_1_2), 
  .coeff_1_1(ch23_coeff_1_1), 
  .coeff_1_0(ch23_coeff_1_0)
);

NLC_1ch_1 ch22(
  //System clock and reset
  .clk(clk),
  .reset(reset),
  
  //ADC output
  .srdyi(srdyi), 
  .x_lin(ch22_x_lin),

  //NLC output
  .srdyo(srdyo), 
  .x_adc(ch22_x_adc), 

  //X-value that separates the sections
  .section_limit(ch22_section_limit),

  //Reciprocal standard deviation for the centered and scaled fit
  .recip_stdev_4(ch22_recip_stdev_4), 
  .recip_stdev_3(ch22_recip_stdev_3), 
  .recip_stdev_2(ch22_recip_stdev_2), 
  .recip_stdev_1(ch22_recip_stdev_1), 

  //Negative meand for the centered and scaled fit
  .neg_mean_4(ch22_neg_mean_4), 
  .neg_mean_3(ch22_neg_mean_3), 
  .neg_mean_2(ch22_neg_mean_2), 
  .neg_mean_1(ch22_neg_mean_1), 

  //Section 4 coefficients (x > 0, |x| > section_limit)
  .coeff_4_10(ch22_coeff_4_10), 
  .coeff_4_9(ch22_coeff_4_9), 
  .coeff_4_8(ch22_coeff_4_8), 
  .coeff_4_7(ch22_coeff_4_7), 
  .coeff_4_6(ch22_coeff_4_6), 
  .coeff_4_5(ch22_coeff_4_5), 
  .coeff_4_4(ch22_coeff_4_4), 
  .coeff_4_3(ch22_coeff_4_3), 
  .coeff_4_2(ch22_coeff_4_2), 
  .coeff_4_1(ch22_coeff_4_1), 
  .coeff_4_0(ch22_coeff_4_0), 

  //Section 3 coefficients (x > 0, |x| <= section_limit)
  .coeff_3_10(ch22_coeff_3_10), 
  .coeff_3_9(ch22_coeff_3_9), 
  .coeff_3_8(ch22_coeff_3_8), 
  .coeff_3_7(ch22_coeff_3_7), 
  .coeff_3_6(ch22_coeff_3_6), 
  .coeff_3_5(ch22_coeff_3_5), 
  .coeff_3_4(ch22_coeff_3_4), 
  .coeff_3_3(ch22_coeff_3_3), 
  .coeff_3_2(ch22_coeff_3_2), 
  .coeff_3_1(ch22_coeff_3_1), 
  .coeff_3_0(ch22_coeff_3_0), 

  //Section 2 coefficients (x <= 0, |x| <= section_limit)
  .coeff_2_10(ch22_coeff_2_10), 
  .coeff_2_9(ch22_coeff_2_9), 
  .coeff_2_8(ch22_coeff_2_8), 
  .coeff_2_7(ch22_coeff_2_7), 
  .coeff_2_6(ch22_coeff_2_6), 
  .coeff_2_5(ch22_coeff_2_5), 
  .coeff_2_4(ch22_coeff_2_4), 
  .coeff_2_3(ch22_coeff_2_3), 
  .coeff_2_2(ch22_coeff_2_2), 
  .coeff_2_1(ch22_coeff_2_1), 
  .coeff_2_0(ch22_coeff_2_0), 

  //Section 1 coefficients (x <= 0, |x| > section_limit)
  .coeff_1_10(ch22_coeff_1_10), 
  .coeff_1_9(ch22_coeff_1_9), 
  .coeff_1_8(ch22_coeff_1_8), 
  .coeff_1_7(ch22_coeff_1_7), 
  .coeff_1_6(ch22_coeff_1_6), 
  .coeff_1_5(ch22_coeff_1_5), 
  .coeff_1_4(ch22_coeff_1_4), 
  .coeff_1_3(ch22_coeff_1_3), 
  .coeff_1_2(ch22_coeff_1_2), 
  .coeff_1_1(ch22_coeff_1_1), 
  .coeff_1_0(ch22_coeff_1_0)
);

NLC_1ch_1 ch21(
  //System clock and reset
  .clk(clk),
  .reset(reset),
  
  //ADC output
  .srdyi(srdyi), 
  .x_lin(ch21_x_lin),

  //NLC output
  .srdyo(srdyo), 
  .x_adc(ch21_x_adc), 

  //X-value that separates the sections
  .section_limit(ch21_section_limit),

  //Reciprocal standard deviation for the centered and scaled fit
  .recip_stdev_4(ch21_recip_stdev_4), 
  .recip_stdev_3(ch21_recip_stdev_3), 
  .recip_stdev_2(ch21_recip_stdev_2), 
  .recip_stdev_1(ch21_recip_stdev_1), 

  //Negative meand for the centered and scaled fit
  .neg_mean_4(ch21_neg_mean_4), 
  .neg_mean_3(ch21_neg_mean_3), 
  .neg_mean_2(ch21_neg_mean_2), 
  .neg_mean_1(ch21_neg_mean_1), 

  //Section 4 coefficients (x > 0, |x| > section_limit)
  .coeff_4_10(ch21_coeff_4_10), 
  .coeff_4_9(ch21_coeff_4_9), 
  .coeff_4_8(ch21_coeff_4_8), 
  .coeff_4_7(ch21_coeff_4_7), 
  .coeff_4_6(ch21_coeff_4_6), 
  .coeff_4_5(ch21_coeff_4_5), 
  .coeff_4_4(ch21_coeff_4_4), 
  .coeff_4_3(ch21_coeff_4_3), 
  .coeff_4_2(ch21_coeff_4_2), 
  .coeff_4_1(ch21_coeff_4_1), 
  .coeff_4_0(ch21_coeff_4_0), 

  //Section 3 coefficients (x > 0, |x| <= section_limit)
  .coeff_3_10(ch21_coeff_3_10), 
  .coeff_3_9(ch21_coeff_3_9), 
  .coeff_3_8(ch21_coeff_3_8), 
  .coeff_3_7(ch21_coeff_3_7), 
  .coeff_3_6(ch21_coeff_3_6), 
  .coeff_3_5(ch21_coeff_3_5), 
  .coeff_3_4(ch21_coeff_3_4), 
  .coeff_3_3(ch21_coeff_3_3), 
  .coeff_3_2(ch21_coeff_3_2), 
  .coeff_3_1(ch21_coeff_3_1), 
  .coeff_3_0(ch21_coeff_3_0), 

  //Section 2 coefficients (x <= 0, |x| <= section_limit)
  .coeff_2_10(ch21_coeff_2_10), 
  .coeff_2_9(ch21_coeff_2_9), 
  .coeff_2_8(ch21_coeff_2_8), 
  .coeff_2_7(ch21_coeff_2_7), 
  .coeff_2_6(ch21_coeff_2_6), 
  .coeff_2_5(ch21_coeff_2_5), 
  .coeff_2_4(ch21_coeff_2_4), 
  .coeff_2_3(ch21_coeff_2_3), 
  .coeff_2_2(ch21_coeff_2_2), 
  .coeff_2_1(ch21_coeff_2_1), 
  .coeff_2_0(ch21_coeff_2_0), 

  //Section 1 coefficients (x <= 0, |x| > section_limit)
  .coeff_1_10(ch21_coeff_1_10), 
  .coeff_1_9(ch21_coeff_1_9), 
  .coeff_1_8(ch21_coeff_1_8), 
  .coeff_1_7(ch21_coeff_1_7), 
  .coeff_1_6(ch21_coeff_1_6), 
  .coeff_1_5(ch21_coeff_1_5), 
  .coeff_1_4(ch21_coeff_1_4), 
  .coeff_1_3(ch21_coeff_1_3), 
  .coeff_1_2(ch21_coeff_1_2), 
  .coeff_1_1(ch21_coeff_1_1), 
  .coeff_1_0(ch21_coeff_1_0)
);

NLC_1ch_1 ch20(
  //System clock and reset
  .clk(clk),
  .reset(reset),
  
  //ADC output
  .srdyi(srdyi), 
  .x_lin(ch20_x_lin),

  //NLC output
  .srdyo(srdyo), 
  .x_adc(ch20_x_adc), 

  //X-value that separates the sections
  .section_limit(ch20_section_limit),

  //Reciprocal standard deviation for the centered and scaled fit
  .recip_stdev_4(ch20_recip_stdev_4), 
  .recip_stdev_3(ch20_recip_stdev_3), 
  .recip_stdev_2(ch20_recip_stdev_2), 
  .recip_stdev_1(ch20_recip_stdev_1), 

  //Negative meand for the centered and scaled fit
  .neg_mean_4(ch20_neg_mean_4), 
  .neg_mean_3(ch20_neg_mean_3), 
  .neg_mean_2(ch20_neg_mean_2), 
  .neg_mean_1(ch20_neg_mean_1), 

  //Section 4 coefficients (x > 0, |x| > section_limit)
  .coeff_4_10(ch20_coeff_4_10), 
  .coeff_4_9(ch20_coeff_4_9), 
  .coeff_4_8(ch20_coeff_4_8), 
  .coeff_4_7(ch20_coeff_4_7), 
  .coeff_4_6(ch20_coeff_4_6), 
  .coeff_4_5(ch20_coeff_4_5), 
  .coeff_4_4(ch20_coeff_4_4), 
  .coeff_4_3(ch20_coeff_4_3), 
  .coeff_4_2(ch20_coeff_4_2), 
  .coeff_4_1(ch20_coeff_4_1), 
  .coeff_4_0(ch20_coeff_4_0), 

  //Section 3 coefficients (x > 0, |x| <= section_limit)
  .coeff_3_10(ch20_coeff_3_10), 
  .coeff_3_9(ch20_coeff_3_9), 
  .coeff_3_8(ch20_coeff_3_8), 
  .coeff_3_7(ch20_coeff_3_7), 
  .coeff_3_6(ch20_coeff_3_6), 
  .coeff_3_5(ch20_coeff_3_5), 
  .coeff_3_4(ch20_coeff_3_4), 
  .coeff_3_3(ch20_coeff_3_3), 
  .coeff_3_2(ch20_coeff_3_2), 
  .coeff_3_1(ch20_coeff_3_1), 
  .coeff_3_0(ch20_coeff_3_0), 

  //Section 2 coefficients (x <= 0, |x| <= section_limit)
  .coeff_2_10(ch20_coeff_2_10), 
  .coeff_2_9(ch20_coeff_2_9), 
  .coeff_2_8(ch20_coeff_2_8), 
  .coeff_2_7(ch20_coeff_2_7), 
  .coeff_2_6(ch20_coeff_2_6), 
  .coeff_2_5(ch20_coeff_2_5), 
  .coeff_2_4(ch20_coeff_2_4), 
  .coeff_2_3(ch20_coeff_2_3), 
  .coeff_2_2(ch20_coeff_2_2), 
  .coeff_2_1(ch20_coeff_2_1), 
  .coeff_2_0(ch20_coeff_2_0), 

  //Section 1 coefficients (x <= 0, |x| > section_limit)
  .coeff_1_10(ch20_coeff_1_10), 
  .coeff_1_9(ch20_coeff_1_9), 
  .coeff_1_8(ch20_coeff_1_8), 
  .coeff_1_7(ch20_coeff_1_7), 
  .coeff_1_6(ch20_coeff_1_6), 
  .coeff_1_5(ch20_coeff_1_5), 
  .coeff_1_4(ch20_coeff_1_4), 
  .coeff_1_3(ch20_coeff_1_3), 
  .coeff_1_2(ch20_coeff_1_2), 
  .coeff_1_1(ch20_coeff_1_1), 
  .coeff_1_0(ch20_coeff_1_0)
);

NLC_1ch_1 ch19(
  //System clock and reset
  .clk(clk),
  .reset(reset),
  
  //ADC output
  .srdyi(srdyi), 
  .x_lin(ch19_x_lin),

  //NLC output
  .srdyo(srdyo), 
  .x_adc(ch19_x_adc), 

  //X-value that separates the sections
  .section_limit(ch19_section_limit),

  //Reciprocal standard deviation for the centered and scaled fit
  .recip_stdev_4(ch19_recip_stdev_4), 
  .recip_stdev_3(ch19_recip_stdev_3), 
  .recip_stdev_2(ch19_recip_stdev_2), 
  .recip_stdev_1(ch19_recip_stdev_1), 

  //Negative meand for the centered and scaled fit
  .neg_mean_4(ch19_neg_mean_4), 
  .neg_mean_3(ch19_neg_mean_3), 
  .neg_mean_2(ch19_neg_mean_2), 
  .neg_mean_1(ch19_neg_mean_1), 

  //Section 4 coefficients (x > 0, |x| > section_limit)
  .coeff_4_10(ch19_coeff_4_10), 
  .coeff_4_9(ch19_coeff_4_9), 
  .coeff_4_8(ch19_coeff_4_8), 
  .coeff_4_7(ch19_coeff_4_7), 
  .coeff_4_6(ch19_coeff_4_6), 
  .coeff_4_5(ch19_coeff_4_5), 
  .coeff_4_4(ch19_coeff_4_4), 
  .coeff_4_3(ch19_coeff_4_3), 
  .coeff_4_2(ch19_coeff_4_2), 
  .coeff_4_1(ch19_coeff_4_1), 
  .coeff_4_0(ch19_coeff_4_0), 

  //Section 3 coefficients (x > 0, |x| <= section_limit)
  .coeff_3_10(ch19_coeff_3_10), 
  .coeff_3_9(ch19_coeff_3_9), 
  .coeff_3_8(ch19_coeff_3_8), 
  .coeff_3_7(ch19_coeff_3_7), 
  .coeff_3_6(ch19_coeff_3_6), 
  .coeff_3_5(ch19_coeff_3_5), 
  .coeff_3_4(ch19_coeff_3_4), 
  .coeff_3_3(ch19_coeff_3_3), 
  .coeff_3_2(ch19_coeff_3_2), 
  .coeff_3_1(ch19_coeff_3_1), 
  .coeff_3_0(ch19_coeff_3_0), 

  //Section 2 coefficients (x <= 0, |x| <= section_limit)
  .coeff_2_10(ch19_coeff_2_10), 
  .coeff_2_9(ch19_coeff_2_9), 
  .coeff_2_8(ch19_coeff_2_8), 
  .coeff_2_7(ch19_coeff_2_7), 
  .coeff_2_6(ch19_coeff_2_6), 
  .coeff_2_5(ch19_coeff_2_5), 
  .coeff_2_4(ch19_coeff_2_4), 
  .coeff_2_3(ch19_coeff_2_3), 
  .coeff_2_2(ch19_coeff_2_2), 
  .coeff_2_1(ch19_coeff_2_1), 
  .coeff_2_0(ch19_coeff_2_0), 

  //Section 1 coefficients (x <= 0, |x| > section_limit)
  .coeff_1_10(ch19_coeff_1_10), 
  .coeff_1_9(ch19_coeff_1_9), 
  .coeff_1_8(ch19_coeff_1_8), 
  .coeff_1_7(ch19_coeff_1_7), 
  .coeff_1_6(ch19_coeff_1_6), 
  .coeff_1_5(ch19_coeff_1_5), 
  .coeff_1_4(ch19_coeff_1_4), 
  .coeff_1_3(ch19_coeff_1_3), 
  .coeff_1_2(ch19_coeff_1_2), 
  .coeff_1_1(ch19_coeff_1_1), 
  .coeff_1_0(ch19_coeff_1_0)
);

NLC_1ch_1 ch18(
  //System clock and reset
  .clk(clk),
  .reset(reset),
  
  //ADC output
  .srdyi(srdyi), 
  .x_lin(ch18_x_lin),

  //NLC output
  .srdyo(srdyo), 
  .x_adc(ch18_x_adc), 

  //X-value that separates the sections
  .section_limit(ch18_section_limit),

  //Reciprocal standard deviation for the centered and scaled fit
  .recip_stdev_4(ch18_recip_stdev_4), 
  .recip_stdev_3(ch18_recip_stdev_3), 
  .recip_stdev_2(ch18_recip_stdev_2), 
  .recip_stdev_1(ch18_recip_stdev_1), 

  //Negative meand for the centered and scaled fit
  .neg_mean_4(ch18_neg_mean_4), 
  .neg_mean_3(ch18_neg_mean_3), 
  .neg_mean_2(ch18_neg_mean_2), 
  .neg_mean_1(ch18_neg_mean_1), 

  //Section 4 coefficients (x > 0, |x| > section_limit)
  .coeff_4_10(ch18_coeff_4_10), 
  .coeff_4_9(ch18_coeff_4_9), 
  .coeff_4_8(ch18_coeff_4_8), 
  .coeff_4_7(ch18_coeff_4_7), 
  .coeff_4_6(ch18_coeff_4_6), 
  .coeff_4_5(ch18_coeff_4_5), 
  .coeff_4_4(ch18_coeff_4_4), 
  .coeff_4_3(ch18_coeff_4_3), 
  .coeff_4_2(ch18_coeff_4_2), 
  .coeff_4_1(ch18_coeff_4_1), 
  .coeff_4_0(ch18_coeff_4_0), 

  //Section 3 coefficients (x > 0, |x| <= section_limit)
  .coeff_3_10(ch18_coeff_3_10), 
  .coeff_3_9(ch18_coeff_3_9), 
  .coeff_3_8(ch18_coeff_3_8), 
  .coeff_3_7(ch18_coeff_3_7), 
  .coeff_3_6(ch18_coeff_3_6), 
  .coeff_3_5(ch18_coeff_3_5), 
  .coeff_3_4(ch18_coeff_3_4), 
  .coeff_3_3(ch18_coeff_3_3), 
  .coeff_3_2(ch18_coeff_3_2), 
  .coeff_3_1(ch18_coeff_3_1), 
  .coeff_3_0(ch18_coeff_3_0), 

  //Section 2 coefficients (x <= 0, |x| <= section_limit)
  .coeff_2_10(ch18_coeff_2_10), 
  .coeff_2_9(ch18_coeff_2_9), 
  .coeff_2_8(ch18_coeff_2_8), 
  .coeff_2_7(ch18_coeff_2_7), 
  .coeff_2_6(ch18_coeff_2_6), 
  .coeff_2_5(ch18_coeff_2_5), 
  .coeff_2_4(ch18_coeff_2_4), 
  .coeff_2_3(ch18_coeff_2_3), 
  .coeff_2_2(ch18_coeff_2_2), 
  .coeff_2_1(ch18_coeff_2_1), 
  .coeff_2_0(ch18_coeff_2_0), 

  //Section 1 coefficients (x <= 0, |x| > section_limit)
  .coeff_1_10(ch18_coeff_1_10), 
  .coeff_1_9(ch18_coeff_1_9), 
  .coeff_1_8(ch18_coeff_1_8), 
  .coeff_1_7(ch18_coeff_1_7), 
  .coeff_1_6(ch18_coeff_1_6), 
  .coeff_1_5(ch18_coeff_1_5), 
  .coeff_1_4(ch18_coeff_1_4), 
  .coeff_1_3(ch18_coeff_1_3), 
  .coeff_1_2(ch18_coeff_1_2), 
  .coeff_1_1(ch18_coeff_1_1), 
  .coeff_1_0(ch18_coeff_1_0)
);

NLC_1ch_1 ch17(
  //System clock and reset
  .clk(clk),
  .reset(reset),
  
  //ADC output
  .srdyi(srdyi), 
  .x_lin(ch17_x_lin),

  //NLC output
  .srdyo(srdyo), 
  .x_adc(ch17_x_adc), 

  //X-value that separates the sections
  .section_limit(ch17_section_limit),

  //Reciprocal standard deviation for the centered and scaled fit
  .recip_stdev_4(ch17_recip_stdev_4), 
  .recip_stdev_3(ch17_recip_stdev_3), 
  .recip_stdev_2(ch17_recip_stdev_2), 
  .recip_stdev_1(ch17_recip_stdev_1), 

  //Negative meand for the centered and scaled fit
  .neg_mean_4(ch17_neg_mean_4), 
  .neg_mean_3(ch17_neg_mean_3), 
  .neg_mean_2(ch17_neg_mean_2), 
  .neg_mean_1(ch17_neg_mean_1), 

  //Section 4 coefficients (x > 0, |x| > section_limit)
  .coeff_4_10(ch17_coeff_4_10), 
  .coeff_4_9(ch17_coeff_4_9), 
  .coeff_4_8(ch17_coeff_4_8), 
  .coeff_4_7(ch17_coeff_4_7), 
  .coeff_4_6(ch17_coeff_4_6), 
  .coeff_4_5(ch17_coeff_4_5), 
  .coeff_4_4(ch17_coeff_4_4), 
  .coeff_4_3(ch17_coeff_4_3), 
  .coeff_4_2(ch17_coeff_4_2), 
  .coeff_4_1(ch17_coeff_4_1), 
  .coeff_4_0(ch17_coeff_4_0), 

  //Section 3 coefficients (x > 0, |x| <= section_limit)
  .coeff_3_10(ch17_coeff_3_10), 
  .coeff_3_9(ch17_coeff_3_9), 
  .coeff_3_8(ch17_coeff_3_8), 
  .coeff_3_7(ch17_coeff_3_7), 
  .coeff_3_6(ch17_coeff_3_6), 
  .coeff_3_5(ch17_coeff_3_5), 
  .coeff_3_4(ch17_coeff_3_4), 
  .coeff_3_3(ch17_coeff_3_3), 
  .coeff_3_2(ch17_coeff_3_2), 
  .coeff_3_1(ch17_coeff_3_1), 
  .coeff_3_0(ch17_coeff_3_0), 

  //Section 2 coefficients (x <= 0, |x| <= section_limit)
  .coeff_2_10(ch17_coeff_2_10), 
  .coeff_2_9(ch17_coeff_2_9), 
  .coeff_2_8(ch17_coeff_2_8), 
  .coeff_2_7(ch17_coeff_2_7), 
  .coeff_2_6(ch17_coeff_2_6), 
  .coeff_2_5(ch17_coeff_2_5), 
  .coeff_2_4(ch17_coeff_2_4), 
  .coeff_2_3(ch17_coeff_2_3), 
  .coeff_2_2(ch17_coeff_2_2), 
  .coeff_2_1(ch17_coeff_2_1), 
  .coeff_2_0(ch17_coeff_2_0), 

  //Section 1 coefficients (x <= 0, |x| > section_limit)
  .coeff_1_10(ch17_coeff_1_10), 
  .coeff_1_9(ch17_coeff_1_9), 
  .coeff_1_8(ch17_coeff_1_8), 
  .coeff_1_7(ch17_coeff_1_7), 
  .coeff_1_6(ch17_coeff_1_6), 
  .coeff_1_5(ch17_coeff_1_5), 
  .coeff_1_4(ch17_coeff_1_4), 
  .coeff_1_3(ch17_coeff_1_3), 
  .coeff_1_2(ch17_coeff_1_2), 
  .coeff_1_1(ch17_coeff_1_1), 
  .coeff_1_0(ch17_coeff_1_0)
);

NLC_1ch_1 ch16(
  //System clock and reset
  .clk(clk),
  .reset(reset),
  
  //ADC output
  .srdyi(srdyi), 
  .x_lin(ch16_x_lin),

  //NLC output
  .srdyo(srdyo), 
  .x_adc(ch16_x_adc), 

  //X-value that separates the sections
  .section_limit(ch16_section_limit),

  //Reciprocal standard deviation for the centered and scaled fit
  .recip_stdev_4(ch16_recip_stdev_4), 
  .recip_stdev_3(ch16_recip_stdev_3), 
  .recip_stdev_2(ch16_recip_stdev_2), 
  .recip_stdev_1(ch16_recip_stdev_1), 

  //Negative meand for the centered and scaled fit
  .neg_mean_4(ch16_neg_mean_4), 
  .neg_mean_3(ch16_neg_mean_3), 
  .neg_mean_2(ch16_neg_mean_2), 
  .neg_mean_1(ch16_neg_mean_1), 

  //Section 4 coefficients (x > 0, |x| > section_limit)
  .coeff_4_10(ch16_coeff_4_10), 
  .coeff_4_9(ch16_coeff_4_9), 
  .coeff_4_8(ch16_coeff_4_8), 
  .coeff_4_7(ch16_coeff_4_7), 
  .coeff_4_6(ch16_coeff_4_6), 
  .coeff_4_5(ch16_coeff_4_5), 
  .coeff_4_4(ch16_coeff_4_4), 
  .coeff_4_3(ch16_coeff_4_3), 
  .coeff_4_2(ch16_coeff_4_2), 
  .coeff_4_1(ch16_coeff_4_1), 
  .coeff_4_0(ch16_coeff_4_0), 

  //Section 3 coefficients (x > 0, |x| <= section_limit)
  .coeff_3_10(ch16_coeff_3_10), 
  .coeff_3_9(ch16_coeff_3_9), 
  .coeff_3_8(ch16_coeff_3_8), 
  .coeff_3_7(ch16_coeff_3_7), 
  .coeff_3_6(ch16_coeff_3_6), 
  .coeff_3_5(ch16_coeff_3_5), 
  .coeff_3_4(ch16_coeff_3_4), 
  .coeff_3_3(ch16_coeff_3_3), 
  .coeff_3_2(ch16_coeff_3_2), 
  .coeff_3_1(ch16_coeff_3_1), 
  .coeff_3_0(ch16_coeff_3_0), 

  //Section 2 coefficients (x <= 0, |x| <= section_limit)
  .coeff_2_10(ch16_coeff_2_10), 
  .coeff_2_9(ch16_coeff_2_9), 
  .coeff_2_8(ch16_coeff_2_8), 
  .coeff_2_7(ch16_coeff_2_7), 
  .coeff_2_6(ch16_coeff_2_6), 
  .coeff_2_5(ch16_coeff_2_5), 
  .coeff_2_4(ch16_coeff_2_4), 
  .coeff_2_3(ch16_coeff_2_3), 
  .coeff_2_2(ch16_coeff_2_2), 
  .coeff_2_1(ch16_coeff_2_1), 
  .coeff_2_0(ch16_coeff_2_0), 

  //Section 1 coefficients (x <= 0, |x| > section_limit)
  .coeff_1_10(ch16_coeff_1_10), 
  .coeff_1_9(ch16_coeff_1_9), 
  .coeff_1_8(ch16_coeff_1_8), 
  .coeff_1_7(ch16_coeff_1_7), 
  .coeff_1_6(ch16_coeff_1_6), 
  .coeff_1_5(ch16_coeff_1_5), 
  .coeff_1_4(ch16_coeff_1_4), 
  .coeff_1_3(ch16_coeff_1_3), 
  .coeff_1_2(ch16_coeff_1_2), 
  .coeff_1_1(ch16_coeff_1_1), 
  .coeff_1_0(ch16_coeff_1_0)
);

NLC_1ch_1 ch15(
  //System clock and reset
  .clk(clk),
  .reset(reset),
  
  //ADC output
  .srdyi(srdyi), 
  .x_lin(ch15_x_lin),

  //NLC output
  .srdyo(srdyo), 
  .x_adc(ch15_x_adc), 

  //X-value that separates the sections
  .section_limit(ch15_section_limit),

  //Reciprocal standard deviation for the centered and scaled fit
  .recip_stdev_4(ch15_recip_stdev_4), 
  .recip_stdev_3(ch15_recip_stdev_3), 
  .recip_stdev_2(ch15_recip_stdev_2), 
  .recip_stdev_1(ch15_recip_stdev_1), 

  //Negative meand for the centered and scaled fit
  .neg_mean_4(ch15_neg_mean_4), 
  .neg_mean_3(ch15_neg_mean_3), 
  .neg_mean_2(ch15_neg_mean_2), 
  .neg_mean_1(ch15_neg_mean_1), 

  //Section 4 coefficients (x > 0, |x| > section_limit)
  .coeff_4_10(ch15_coeff_4_10), 
  .coeff_4_9(ch15_coeff_4_9), 
  .coeff_4_8(ch15_coeff_4_8), 
  .coeff_4_7(ch15_coeff_4_7), 
  .coeff_4_6(ch15_coeff_4_6), 
  .coeff_4_5(ch15_coeff_4_5), 
  .coeff_4_4(ch15_coeff_4_4), 
  .coeff_4_3(ch15_coeff_4_3), 
  .coeff_4_2(ch15_coeff_4_2), 
  .coeff_4_1(ch15_coeff_4_1), 
  .coeff_4_0(ch15_coeff_4_0), 

  //Section 3 coefficients (x > 0, |x| <= section_limit)
  .coeff_3_10(ch15_coeff_3_10), 
  .coeff_3_9(ch15_coeff_3_9), 
  .coeff_3_8(ch15_coeff_3_8), 
  .coeff_3_7(ch15_coeff_3_7), 
  .coeff_3_6(ch15_coeff_3_6), 
  .coeff_3_5(ch15_coeff_3_5), 
  .coeff_3_4(ch15_coeff_3_4), 
  .coeff_3_3(ch15_coeff_3_3), 
  .coeff_3_2(ch15_coeff_3_2), 
  .coeff_3_1(ch15_coeff_3_1), 
  .coeff_3_0(ch15_coeff_3_0), 

  //Section 2 coefficients (x <= 0, |x| <= section_limit)
  .coeff_2_10(ch15_coeff_2_10), 
  .coeff_2_9(ch15_coeff_2_9), 
  .coeff_2_8(ch15_coeff_2_8), 
  .coeff_2_7(ch15_coeff_2_7), 
  .coeff_2_6(ch15_coeff_2_6), 
  .coeff_2_5(ch15_coeff_2_5), 
  .coeff_2_4(ch15_coeff_2_4), 
  .coeff_2_3(ch15_coeff_2_3), 
  .coeff_2_2(ch15_coeff_2_2), 
  .coeff_2_1(ch15_coeff_2_1), 
  .coeff_2_0(ch15_coeff_2_0), 

  //Section 1 coefficients (x <= 0, |x| > section_limit)
  .coeff_1_10(ch15_coeff_1_10), 
  .coeff_1_9(ch15_coeff_1_9), 
  .coeff_1_8(ch15_coeff_1_8), 
  .coeff_1_7(ch15_coeff_1_7), 
  .coeff_1_6(ch15_coeff_1_6), 
  .coeff_1_5(ch15_coeff_1_5), 
  .coeff_1_4(ch15_coeff_1_4), 
  .coeff_1_3(ch15_coeff_1_3), 
  .coeff_1_2(ch15_coeff_1_2), 
  .coeff_1_1(ch15_coeff_1_1), 
  .coeff_1_0(ch15_coeff_1_0)
);

NLC_1ch_1 ch14(
  //System clock and reset
  .clk(clk),
  .reset(reset),
  
  //ADC output
  .srdyi(srdyi), 
  .x_lin(ch14_x_lin),

  //NLC output
  .srdyo(srdyo), 
  .x_adc(ch14_x_adc), 

  //X-value that separates the sections
  .section_limit(ch14_section_limit),

  //Reciprocal standard deviation for the centered and scaled fit
  .recip_stdev_4(ch14_recip_stdev_4), 
  .recip_stdev_3(ch14_recip_stdev_3), 
  .recip_stdev_2(ch14_recip_stdev_2), 
  .recip_stdev_1(ch14_recip_stdev_1), 

  //Negative meand for the centered and scaled fit
  .neg_mean_4(ch14_neg_mean_4), 
  .neg_mean_3(ch14_neg_mean_3), 
  .neg_mean_2(ch14_neg_mean_2), 
  .neg_mean_1(ch14_neg_mean_1), 

  //Section 4 coefficients (x > 0, |x| > section_limit)
  .coeff_4_10(ch14_coeff_4_10), 
  .coeff_4_9(ch14_coeff_4_9), 
  .coeff_4_8(ch14_coeff_4_8), 
  .coeff_4_7(ch14_coeff_4_7), 
  .coeff_4_6(ch14_coeff_4_6), 
  .coeff_4_5(ch14_coeff_4_5), 
  .coeff_4_4(ch14_coeff_4_4), 
  .coeff_4_3(ch14_coeff_4_3), 
  .coeff_4_2(ch14_coeff_4_2), 
  .coeff_4_1(ch14_coeff_4_1), 
  .coeff_4_0(ch14_coeff_4_0), 

  //Section 3 coefficients (x > 0, |x| <= section_limit)
  .coeff_3_10(ch14_coeff_3_10), 
  .coeff_3_9(ch14_coeff_3_9), 
  .coeff_3_8(ch14_coeff_3_8), 
  .coeff_3_7(ch14_coeff_3_7), 
  .coeff_3_6(ch14_coeff_3_6), 
  .coeff_3_5(ch14_coeff_3_5), 
  .coeff_3_4(ch14_coeff_3_4), 
  .coeff_3_3(ch14_coeff_3_3), 
  .coeff_3_2(ch14_coeff_3_2), 
  .coeff_3_1(ch14_coeff_3_1), 
  .coeff_3_0(ch14_coeff_3_0), 

  //Section 2 coefficients (x <= 0, |x| <= section_limit)
  .coeff_2_10(ch14_coeff_2_10), 
  .coeff_2_9(ch14_coeff_2_9), 
  .coeff_2_8(ch14_coeff_2_8), 
  .coeff_2_7(ch14_coeff_2_7), 
  .coeff_2_6(ch14_coeff_2_6), 
  .coeff_2_5(ch14_coeff_2_5), 
  .coeff_2_4(ch14_coeff_2_4), 
  .coeff_2_3(ch14_coeff_2_3), 
  .coeff_2_2(ch14_coeff_2_2), 
  .coeff_2_1(ch14_coeff_2_1), 
  .coeff_2_0(ch14_coeff_2_0), 

  //Section 1 coefficients (x <= 0, |x| > section_limit)
  .coeff_1_10(ch14_coeff_1_10), 
  .coeff_1_9(ch14_coeff_1_9), 
  .coeff_1_8(ch14_coeff_1_8), 
  .coeff_1_7(ch14_coeff_1_7), 
  .coeff_1_6(ch14_coeff_1_6), 
  .coeff_1_5(ch14_coeff_1_5), 
  .coeff_1_4(ch14_coeff_1_4), 
  .coeff_1_3(ch14_coeff_1_3), 
  .coeff_1_2(ch14_coeff_1_2), 
  .coeff_1_1(ch14_coeff_1_1), 
  .coeff_1_0(ch14_coeff_1_0)
);

NLC_1ch_1 ch13(
  //System clock and reset
  .clk(clk),
  .reset(reset),
  
  //ADC output
  .srdyi(srdyi), 
  .x_lin(ch13_x_lin),

  //NLC output
  .srdyo(srdyo), 
  .x_adc(ch13_x_adc), 

  //X-value that separates the sections
  .section_limit(ch13_section_limit),

  //Reciprocal standard deviation for the centered and scaled fit
  .recip_stdev_4(ch13_recip_stdev_4), 
  .recip_stdev_3(ch13_recip_stdev_3), 
  .recip_stdev_2(ch13_recip_stdev_2), 
  .recip_stdev_1(ch13_recip_stdev_1), 

  //Negative meand for the centered and scaled fit
  .neg_mean_4(ch13_neg_mean_4), 
  .neg_mean_3(ch13_neg_mean_3), 
  .neg_mean_2(ch13_neg_mean_2), 
  .neg_mean_1(ch13_neg_mean_1), 

  //Section 4 coefficients (x > 0, |x| > section_limit)
  .coeff_4_10(ch13_coeff_4_10), 
  .coeff_4_9(ch13_coeff_4_9), 
  .coeff_4_8(ch13_coeff_4_8), 
  .coeff_4_7(ch13_coeff_4_7), 
  .coeff_4_6(ch13_coeff_4_6), 
  .coeff_4_5(ch13_coeff_4_5), 
  .coeff_4_4(ch13_coeff_4_4), 
  .coeff_4_3(ch13_coeff_4_3), 
  .coeff_4_2(ch13_coeff_4_2), 
  .coeff_4_1(ch13_coeff_4_1), 
  .coeff_4_0(ch13_coeff_4_0), 

  //Section 3 coefficients (x > 0, |x| <= section_limit)
  .coeff_3_10(ch13_coeff_3_10), 
  .coeff_3_9(ch13_coeff_3_9), 
  .coeff_3_8(ch13_coeff_3_8), 
  .coeff_3_7(ch13_coeff_3_7), 
  .coeff_3_6(ch13_coeff_3_6), 
  .coeff_3_5(ch13_coeff_3_5), 
  .coeff_3_4(ch13_coeff_3_4), 
  .coeff_3_3(ch13_coeff_3_3), 
  .coeff_3_2(ch13_coeff_3_2), 
  .coeff_3_1(ch13_coeff_3_1), 
  .coeff_3_0(ch13_coeff_3_0), 

  //Section 2 coefficients (x <= 0, |x| <= section_limit)
  .coeff_2_10(ch13_coeff_2_10), 
  .coeff_2_9(ch13_coeff_2_9), 
  .coeff_2_8(ch13_coeff_2_8), 
  .coeff_2_7(ch13_coeff_2_7), 
  .coeff_2_6(ch13_coeff_2_6), 
  .coeff_2_5(ch13_coeff_2_5), 
  .coeff_2_4(ch13_coeff_2_4), 
  .coeff_2_3(ch13_coeff_2_3), 
  .coeff_2_2(ch13_coeff_2_2), 
  .coeff_2_1(ch13_coeff_2_1), 
  .coeff_2_0(ch13_coeff_2_0), 

  //Section 1 coefficients (x <= 0, |x| > section_limit)
  .coeff_1_10(ch13_coeff_1_10), 
  .coeff_1_9(ch13_coeff_1_9), 
  .coeff_1_8(ch13_coeff_1_8), 
  .coeff_1_7(ch13_coeff_1_7), 
  .coeff_1_6(ch13_coeff_1_6), 
  .coeff_1_5(ch13_coeff_1_5), 
  .coeff_1_4(ch13_coeff_1_4), 
  .coeff_1_3(ch13_coeff_1_3), 
  .coeff_1_2(ch13_coeff_1_2), 
  .coeff_1_1(ch13_coeff_1_1), 
  .coeff_1_0(ch13_coeff_1_0)
);

NLC_1ch_1 ch12(
  //System clock and reset
  .clk(clk),
  .reset(reset),
  
  //ADC output
  .srdyi(srdyi), 
  .x_lin(ch12_x_lin),

  //NLC output
  .srdyo(srdyo), 
  .x_adc(ch12_x_adc), 

  //X-value that separates the sections
  .section_limit(ch12_section_limit),

  //Reciprocal standard deviation for the centered and scaled fit
  .recip_stdev_4(ch12_recip_stdev_4), 
  .recip_stdev_3(ch12_recip_stdev_3), 
  .recip_stdev_2(ch12_recip_stdev_2), 
  .recip_stdev_1(ch12_recip_stdev_1), 

  //Negative meand for the centered and scaled fit
  .neg_mean_4(ch12_neg_mean_4), 
  .neg_mean_3(ch12_neg_mean_3), 
  .neg_mean_2(ch12_neg_mean_2), 
  .neg_mean_1(ch12_neg_mean_1), 

  //Section 4 coefficients (x > 0, |x| > section_limit)
  .coeff_4_10(ch12_coeff_4_10), 
  .coeff_4_9(ch12_coeff_4_9), 
  .coeff_4_8(ch12_coeff_4_8), 
  .coeff_4_7(ch12_coeff_4_7), 
  .coeff_4_6(ch12_coeff_4_6), 
  .coeff_4_5(ch12_coeff_4_5), 
  .coeff_4_4(ch12_coeff_4_4), 
  .coeff_4_3(ch12_coeff_4_3), 
  .coeff_4_2(ch12_coeff_4_2), 
  .coeff_4_1(ch12_coeff_4_1), 
  .coeff_4_0(ch12_coeff_4_0), 

  //Section 3 coefficients (x > 0, |x| <= section_limit)
  .coeff_3_10(ch12_coeff_3_10), 
  .coeff_3_9(ch12_coeff_3_9), 
  .coeff_3_8(ch12_coeff_3_8), 
  .coeff_3_7(ch12_coeff_3_7), 
  .coeff_3_6(ch12_coeff_3_6), 
  .coeff_3_5(ch12_coeff_3_5), 
  .coeff_3_4(ch12_coeff_3_4), 
  .coeff_3_3(ch12_coeff_3_3), 
  .coeff_3_2(ch12_coeff_3_2), 
  .coeff_3_1(ch12_coeff_3_1), 
  .coeff_3_0(ch12_coeff_3_0), 

  //Section 2 coefficients (x <= 0, |x| <= section_limit)
  .coeff_2_10(ch12_coeff_2_10), 
  .coeff_2_9(ch12_coeff_2_9), 
  .coeff_2_8(ch12_coeff_2_8), 
  .coeff_2_7(ch12_coeff_2_7), 
  .coeff_2_6(ch12_coeff_2_6), 
  .coeff_2_5(ch12_coeff_2_5), 
  .coeff_2_4(ch12_coeff_2_4), 
  .coeff_2_3(ch12_coeff_2_3), 
  .coeff_2_2(ch12_coeff_2_2), 
  .coeff_2_1(ch12_coeff_2_1), 
  .coeff_2_0(ch12_coeff_2_0), 

  //Section 1 coefficients (x <= 0, |x| > section_limit)
  .coeff_1_10(ch12_coeff_1_10), 
  .coeff_1_9(ch12_coeff_1_9), 
  .coeff_1_8(ch12_coeff_1_8), 
  .coeff_1_7(ch12_coeff_1_7), 
  .coeff_1_6(ch12_coeff_1_6), 
  .coeff_1_5(ch12_coeff_1_5), 
  .coeff_1_4(ch12_coeff_1_4), 
  .coeff_1_3(ch12_coeff_1_3), 
  .coeff_1_2(ch12_coeff_1_2), 
  .coeff_1_1(ch12_coeff_1_1), 
  .coeff_1_0(ch12_coeff_1_0)
);

NLC_1ch_1 ch11(
  //System clock and reset
  .clk(clk),
  .reset(reset),
  
  //ADC output
  .srdyi(srdyi), 
  .x_lin(ch11_x_lin),

  //NLC output
  .srdyo(srdyo), 
  .x_adc(ch11_x_adc), 

  //X-value that separates the sections
  .section_limit(ch11_section_limit),

  //Reciprocal standard deviation for the centered and scaled fit
  .recip_stdev_4(ch11_recip_stdev_4), 
  .recip_stdev_3(ch11_recip_stdev_3), 
  .recip_stdev_2(ch11_recip_stdev_2), 
  .recip_stdev_1(ch11_recip_stdev_1), 

  //Negative meand for the centered and scaled fit
  .neg_mean_4(ch11_neg_mean_4), 
  .neg_mean_3(ch11_neg_mean_3), 
  .neg_mean_2(ch11_neg_mean_2), 
  .neg_mean_1(ch11_neg_mean_1), 

  //Section 4 coefficients (x > 0, |x| > section_limit)
  .coeff_4_10(ch11_coeff_4_10), 
  .coeff_4_9(ch11_coeff_4_9), 
  .coeff_4_8(ch11_coeff_4_8), 
  .coeff_4_7(ch11_coeff_4_7), 
  .coeff_4_6(ch11_coeff_4_6), 
  .coeff_4_5(ch11_coeff_4_5), 
  .coeff_4_4(ch11_coeff_4_4), 
  .coeff_4_3(ch11_coeff_4_3), 
  .coeff_4_2(ch11_coeff_4_2), 
  .coeff_4_1(ch11_coeff_4_1), 
  .coeff_4_0(ch11_coeff_4_0), 

  //Section 3 coefficients (x > 0, |x| <= section_limit)
  .coeff_3_10(ch11_coeff_3_10), 
  .coeff_3_9(ch11_coeff_3_9), 
  .coeff_3_8(ch11_coeff_3_8), 
  .coeff_3_7(ch11_coeff_3_7), 
  .coeff_3_6(ch11_coeff_3_6), 
  .coeff_3_5(ch11_coeff_3_5), 
  .coeff_3_4(ch11_coeff_3_4), 
  .coeff_3_3(ch11_coeff_3_3), 
  .coeff_3_2(ch11_coeff_3_2), 
  .coeff_3_1(ch11_coeff_3_1), 
  .coeff_3_0(ch11_coeff_3_0), 

  //Section 2 coefficients (x <= 0, |x| <= section_limit)
  .coeff_2_10(ch11_coeff_2_10), 
  .coeff_2_9(ch11_coeff_2_9), 
  .coeff_2_8(ch11_coeff_2_8), 
  .coeff_2_7(ch11_coeff_2_7), 
  .coeff_2_6(ch11_coeff_2_6), 
  .coeff_2_5(ch11_coeff_2_5), 
  .coeff_2_4(ch11_coeff_2_4), 
  .coeff_2_3(ch11_coeff_2_3), 
  .coeff_2_2(ch11_coeff_2_2), 
  .coeff_2_1(ch11_coeff_2_1), 
  .coeff_2_0(ch11_coeff_2_0), 

  //Section 1 coefficients (x <= 0, |x| > section_limit)
  .coeff_1_10(ch11_coeff_1_10), 
  .coeff_1_9(ch11_coeff_1_9), 
  .coeff_1_8(ch11_coeff_1_8), 
  .coeff_1_7(ch11_coeff_1_7), 
  .coeff_1_6(ch11_coeff_1_6), 
  .coeff_1_5(ch11_coeff_1_5), 
  .coeff_1_4(ch11_coeff_1_4), 
  .coeff_1_3(ch11_coeff_1_3), 
  .coeff_1_2(ch11_coeff_1_2), 
  .coeff_1_1(ch11_coeff_1_1), 
  .coeff_1_0(ch11_coeff_1_0)
);

NLC_1ch_1 ch10(
  //System clock and reset
  .clk(clk),
  .reset(reset),
  
  //ADC output
  .srdyi(srdyi), 
  .x_lin(ch10_x_lin),

  //NLC output
  .srdyo(srdyo), 
  .x_adc(ch10_x_adc), 

  //X-value that separates the sections
  .section_limit(ch10_section_limit),

  //Reciprocal standard deviation for the centered and scaled fit
  .recip_stdev_4(ch10_recip_stdev_4), 
  .recip_stdev_3(ch10_recip_stdev_3), 
  .recip_stdev_2(ch10_recip_stdev_2), 
  .recip_stdev_1(ch10_recip_stdev_1), 

  //Negative meand for the centered and scaled fit
  .neg_mean_4(ch10_neg_mean_4), 
  .neg_mean_3(ch10_neg_mean_3), 
  .neg_mean_2(ch10_neg_mean_2), 
  .neg_mean_1(ch10_neg_mean_1), 

  //Section 4 coefficients (x > 0, |x| > section_limit)
  .coeff_4_10(ch10_coeff_4_10), 
  .coeff_4_9(ch10_coeff_4_9), 
  .coeff_4_8(ch10_coeff_4_8), 
  .coeff_4_7(ch10_coeff_4_7), 
  .coeff_4_6(ch10_coeff_4_6), 
  .coeff_4_5(ch10_coeff_4_5), 
  .coeff_4_4(ch10_coeff_4_4), 
  .coeff_4_3(ch10_coeff_4_3), 
  .coeff_4_2(ch10_coeff_4_2), 
  .coeff_4_1(ch10_coeff_4_1), 
  .coeff_4_0(ch10_coeff_4_0), 

  //Section 3 coefficients (x > 0, |x| <= section_limit)
  .coeff_3_10(ch10_coeff_3_10), 
  .coeff_3_9(ch10_coeff_3_9), 
  .coeff_3_8(ch10_coeff_3_8), 
  .coeff_3_7(ch10_coeff_3_7), 
  .coeff_3_6(ch10_coeff_3_6), 
  .coeff_3_5(ch10_coeff_3_5), 
  .coeff_3_4(ch10_coeff_3_4), 
  .coeff_3_3(ch10_coeff_3_3), 
  .coeff_3_2(ch10_coeff_3_2), 
  .coeff_3_1(ch10_coeff_3_1), 
  .coeff_3_0(ch10_coeff_3_0), 

  //Section 2 coefficients (x <= 0, |x| <= section_limit)
  .coeff_2_10(ch10_coeff_2_10), 
  .coeff_2_9(ch10_coeff_2_9), 
  .coeff_2_8(ch10_coeff_2_8), 
  .coeff_2_7(ch10_coeff_2_7), 
  .coeff_2_6(ch10_coeff_2_6), 
  .coeff_2_5(ch10_coeff_2_5), 
  .coeff_2_4(ch10_coeff_2_4), 
  .coeff_2_3(ch10_coeff_2_3), 
  .coeff_2_2(ch10_coeff_2_2), 
  .coeff_2_1(ch10_coeff_2_1), 
  .coeff_2_0(ch10_coeff_2_0), 

  //Section 1 coefficients (x <= 0, |x| > section_limit)
  .coeff_1_10(ch10_coeff_1_10), 
  .coeff_1_9(ch10_coeff_1_9), 
  .coeff_1_8(ch10_coeff_1_8), 
  .coeff_1_7(ch10_coeff_1_7), 
  .coeff_1_6(ch10_coeff_1_6), 
  .coeff_1_5(ch10_coeff_1_5), 
  .coeff_1_4(ch10_coeff_1_4), 
  .coeff_1_3(ch10_coeff_1_3), 
  .coeff_1_2(ch10_coeff_1_2), 
  .coeff_1_1(ch10_coeff_1_1), 
  .coeff_1_0(ch10_coeff_1_0)
);

NLC_1ch_1 ch9(
  //System clock and reset
  .clk(clk),
  .reset(reset),
  
  //ADC output
  .srdyi(srdyi), 
  .x_lin(ch9_x_lin),

  //NLC output
  .srdyo(srdyo), 
  .x_adc(ch9_x_adc), 

  //X-value that separates the sections
  .section_limit(ch9_section_limit),

  //Reciprocal standard deviation for the centered and scaled fit
  .recip_stdev_4(ch9_recip_stdev_4), 
  .recip_stdev_3(ch9_recip_stdev_3), 
  .recip_stdev_2(ch9_recip_stdev_2), 
  .recip_stdev_1(ch9_recip_stdev_1), 

  //Negative meand for the centered and scaled fit
  .neg_mean_4(ch9_neg_mean_4), 
  .neg_mean_3(ch9_neg_mean_3), 
  .neg_mean_2(ch9_neg_mean_2), 
  .neg_mean_1(ch9_neg_mean_1), 

  //Section 4 coefficients (x > 0, |x| > section_limit)
  .coeff_4_10(ch9_coeff_4_10), 
  .coeff_4_9(ch9_coeff_4_9), 
  .coeff_4_8(ch9_coeff_4_8), 
  .coeff_4_7(ch9_coeff_4_7), 
  .coeff_4_6(ch9_coeff_4_6), 
  .coeff_4_5(ch9_coeff_4_5), 
  .coeff_4_4(ch9_coeff_4_4), 
  .coeff_4_3(ch9_coeff_4_3), 
  .coeff_4_2(ch9_coeff_4_2), 
  .coeff_4_1(ch9_coeff_4_1), 
  .coeff_4_0(ch9_coeff_4_0), 

  //Section 3 coefficients (x > 0, |x| <= section_limit)
  .coeff_3_10(ch9_coeff_3_10), 
  .coeff_3_9(ch9_coeff_3_9), 
  .coeff_3_8(ch9_coeff_3_8), 
  .coeff_3_7(ch9_coeff_3_7), 
  .coeff_3_6(ch9_coeff_3_6), 
  .coeff_3_5(ch9_coeff_3_5), 
  .coeff_3_4(ch9_coeff_3_4), 
  .coeff_3_3(ch9_coeff_3_3), 
  .coeff_3_2(ch9_coeff_3_2), 
  .coeff_3_1(ch9_coeff_3_1), 
  .coeff_3_0(ch9_coeff_3_0), 

  //Section 2 coefficients (x <= 0, |x| <= section_limit)
  .coeff_2_10(ch9_coeff_2_10), 
  .coeff_2_9(ch9_coeff_2_9), 
  .coeff_2_8(ch9_coeff_2_8), 
  .coeff_2_7(ch9_coeff_2_7), 
  .coeff_2_6(ch9_coeff_2_6), 
  .coeff_2_5(ch9_coeff_2_5), 
  .coeff_2_4(ch9_coeff_2_4), 
  .coeff_2_3(ch9_coeff_2_3), 
  .coeff_2_2(ch9_coeff_2_2), 
  .coeff_2_1(ch9_coeff_2_1), 
  .coeff_2_0(ch9_coeff_2_0), 

  //Section 1 coefficients (x <= 0, |x| > section_limit)
  .coeff_1_10(ch9_coeff_1_10), 
  .coeff_1_9(ch9_coeff_1_9), 
  .coeff_1_8(ch9_coeff_1_8), 
  .coeff_1_7(ch9_coeff_1_7), 
  .coeff_1_6(ch9_coeff_1_6), 
  .coeff_1_5(ch9_coeff_1_5), 
  .coeff_1_4(ch9_coeff_1_4), 
  .coeff_1_3(ch9_coeff_1_3), 
  .coeff_1_2(ch9_coeff_1_2), 
  .coeff_1_1(ch9_coeff_1_1), 
  .coeff_1_0(ch9_coeff_1_0)
);

NLC_1ch_1 ch8(
  //System clock and reset
  .clk(clk),
  .reset(reset),
  
  //ADC output
  .srdyi(srdyi), 
  .x_lin(ch8_x_lin),

  //NLC output
  .srdyo(srdyo), 
  .x_adc(ch8_x_adc), 

  //X-value that separates the sections
  .section_limit(ch8_section_limit),

  //Reciprocal standard deviation for the centered and scaled fit
  .recip_stdev_4(ch8_recip_stdev_4), 
  .recip_stdev_3(ch8_recip_stdev_3), 
  .recip_stdev_2(ch8_recip_stdev_2), 
  .recip_stdev_1(ch8_recip_stdev_1), 

  //Negative meand for the centered and scaled fit
  .neg_mean_4(ch8_neg_mean_4), 
  .neg_mean_3(ch8_neg_mean_3), 
  .neg_mean_2(ch8_neg_mean_2), 
  .neg_mean_1(ch8_neg_mean_1), 

  //Section 4 coefficients (x > 0, |x| > section_limit)
  .coeff_4_10(ch8_coeff_4_10), 
  .coeff_4_9(ch8_coeff_4_9), 
  .coeff_4_8(ch8_coeff_4_8), 
  .coeff_4_7(ch8_coeff_4_7), 
  .coeff_4_6(ch8_coeff_4_6), 
  .coeff_4_5(ch8_coeff_4_5), 
  .coeff_4_4(ch8_coeff_4_4), 
  .coeff_4_3(ch8_coeff_4_3), 
  .coeff_4_2(ch8_coeff_4_2), 
  .coeff_4_1(ch8_coeff_4_1), 
  .coeff_4_0(ch8_coeff_4_0), 

  //Section 3 coefficients (x > 0, |x| <= section_limit)
  .coeff_3_10(ch8_coeff_3_10), 
  .coeff_3_9(ch8_coeff_3_9), 
  .coeff_3_8(ch8_coeff_3_8), 
  .coeff_3_7(ch8_coeff_3_7), 
  .coeff_3_6(ch8_coeff_3_6), 
  .coeff_3_5(ch8_coeff_3_5), 
  .coeff_3_4(ch8_coeff_3_4), 
  .coeff_3_3(ch8_coeff_3_3), 
  .coeff_3_2(ch8_coeff_3_2), 
  .coeff_3_1(ch8_coeff_3_1), 
  .coeff_3_0(ch8_coeff_3_0), 

  //Section 2 coefficients (x <= 0, |x| <= section_limit)
  .coeff_2_10(ch8_coeff_2_10), 
  .coeff_2_9(ch8_coeff_2_9), 
  .coeff_2_8(ch8_coeff_2_8), 
  .coeff_2_7(ch8_coeff_2_7), 
  .coeff_2_6(ch8_coeff_2_6), 
  .coeff_2_5(ch8_coeff_2_5), 
  .coeff_2_4(ch8_coeff_2_4), 
  .coeff_2_3(ch8_coeff_2_3), 
  .coeff_2_2(ch8_coeff_2_2), 
  .coeff_2_1(ch8_coeff_2_1), 
  .coeff_2_0(ch8_coeff_2_0), 

  //Section 1 coefficients (x <= 0, |x| > section_limit)
  .coeff_1_10(ch8_coeff_1_10), 
  .coeff_1_9(ch8_coeff_1_9), 
  .coeff_1_8(ch8_coeff_1_8), 
  .coeff_1_7(ch8_coeff_1_7), 
  .coeff_1_6(ch8_coeff_1_6), 
  .coeff_1_5(ch8_coeff_1_5), 
  .coeff_1_4(ch8_coeff_1_4), 
  .coeff_1_3(ch8_coeff_1_3), 
  .coeff_1_2(ch8_coeff_1_2), 
  .coeff_1_1(ch8_coeff_1_1), 
  .coeff_1_0(ch8_coeff_1_0)
);

NLC_1ch_1 ch7(
  //System clock and reset
  .clk(clk),
  .reset(reset),
  
  //ADC output
  .srdyi(srdyi), 
  .x_lin(ch7_x_lin),

  //NLC output
  .srdyo(srdyo), 
  .x_adc(ch7_x_adc), 

  //X-value that separates the sections
  .section_limit(ch7_section_limit),

  //Reciprocal standard deviation for the centered and scaled fit
  .recip_stdev_4(ch7_recip_stdev_4), 
  .recip_stdev_3(ch7_recip_stdev_3), 
  .recip_stdev_2(ch7_recip_stdev_2), 
  .recip_stdev_1(ch7_recip_stdev_1), 

  //Negative meand for the centered and scaled fit
  .neg_mean_4(ch7_neg_mean_4), 
  .neg_mean_3(ch7_neg_mean_3), 
  .neg_mean_2(ch7_neg_mean_2), 
  .neg_mean_1(ch7_neg_mean_1), 

  //Section 4 coefficients (x > 0, |x| > section_limit)
  .coeff_4_10(ch7_coeff_4_10), 
  .coeff_4_9(ch7_coeff_4_9), 
  .coeff_4_8(ch7_coeff_4_8), 
  .coeff_4_7(ch7_coeff_4_7), 
  .coeff_4_6(ch7_coeff_4_6), 
  .coeff_4_5(ch7_coeff_4_5), 
  .coeff_4_4(ch7_coeff_4_4), 
  .coeff_4_3(ch7_coeff_4_3), 
  .coeff_4_2(ch7_coeff_4_2), 
  .coeff_4_1(ch7_coeff_4_1), 
  .coeff_4_0(ch7_coeff_4_0), 

  //Section 3 coefficients (x > 0, |x| <= section_limit)
  .coeff_3_10(ch7_coeff_3_10), 
  .coeff_3_9(ch7_coeff_3_9), 
  .coeff_3_8(ch7_coeff_3_8), 
  .coeff_3_7(ch7_coeff_3_7), 
  .coeff_3_6(ch7_coeff_3_6), 
  .coeff_3_5(ch7_coeff_3_5), 
  .coeff_3_4(ch7_coeff_3_4), 
  .coeff_3_3(ch7_coeff_3_3), 
  .coeff_3_2(ch7_coeff_3_2), 
  .coeff_3_1(ch7_coeff_3_1), 
  .coeff_3_0(ch7_coeff_3_0), 

  //Section 2 coefficients (x <= 0, |x| <= section_limit)
  .coeff_2_10(ch7_coeff_2_10), 
  .coeff_2_9(ch7_coeff_2_9), 
  .coeff_2_8(ch7_coeff_2_8), 
  .coeff_2_7(ch7_coeff_2_7), 
  .coeff_2_6(ch7_coeff_2_6), 
  .coeff_2_5(ch7_coeff_2_5), 
  .coeff_2_4(ch7_coeff_2_4), 
  .coeff_2_3(ch7_coeff_2_3), 
  .coeff_2_2(ch7_coeff_2_2), 
  .coeff_2_1(ch7_coeff_2_1), 
  .coeff_2_0(ch7_coeff_2_0), 

  //Section 1 coefficients (x <= 0, |x| > section_limit)
  .coeff_1_10(ch7_coeff_1_10), 
  .coeff_1_9(ch7_coeff_1_9), 
  .coeff_1_8(ch7_coeff_1_8), 
  .coeff_1_7(ch7_coeff_1_7), 
  .coeff_1_6(ch7_coeff_1_6), 
  .coeff_1_5(ch7_coeff_1_5), 
  .coeff_1_4(ch7_coeff_1_4), 
  .coeff_1_3(ch7_coeff_1_3), 
  .coeff_1_2(ch7_coeff_1_2), 
  .coeff_1_1(ch7_coeff_1_1), 
  .coeff_1_0(ch7_coeff_1_0)
);

NLC_1ch_1 ch6(
  //System clock and reset
  .clk(clk),
  .reset(reset),
  
  //ADC output
  .srdyi(srdyi), 
  .x_lin(ch6_x_lin),

  //NLC output
  .srdyo(srdyo), 
  .x_adc(ch6_x_adc), 

  //X-value that separates the sections
  .section_limit(ch6_section_limit),

  //Reciprocal standard deviation for the centered and scaled fit
  .recip_stdev_4(ch6_recip_stdev_4), 
  .recip_stdev_3(ch6_recip_stdev_3), 
  .recip_stdev_2(ch6_recip_stdev_2), 
  .recip_stdev_1(ch6_recip_stdev_1), 

  //Negative meand for the centered and scaled fit
  .neg_mean_4(ch6_neg_mean_4), 
  .neg_mean_3(ch6_neg_mean_3), 
  .neg_mean_2(ch6_neg_mean_2), 
  .neg_mean_1(ch6_neg_mean_1), 

  //Section 4 coefficients (x > 0, |x| > section_limit)
  .coeff_4_10(ch6_coeff_4_10), 
  .coeff_4_9(ch6_coeff_4_9), 
  .coeff_4_8(ch6_coeff_4_8), 
  .coeff_4_7(ch6_coeff_4_7), 
  .coeff_4_6(ch6_coeff_4_6), 
  .coeff_4_5(ch6_coeff_4_5), 
  .coeff_4_4(ch6_coeff_4_4), 
  .coeff_4_3(ch6_coeff_4_3), 
  .coeff_4_2(ch6_coeff_4_2), 
  .coeff_4_1(ch6_coeff_4_1), 
  .coeff_4_0(ch6_coeff_4_0), 

  //Section 3 coefficients (x > 0, |x| <= section_limit)
  .coeff_3_10(ch6_coeff_3_10), 
  .coeff_3_9(ch6_coeff_3_9), 
  .coeff_3_8(ch6_coeff_3_8), 
  .coeff_3_7(ch6_coeff_3_7), 
  .coeff_3_6(ch6_coeff_3_6), 
  .coeff_3_5(ch6_coeff_3_5), 
  .coeff_3_4(ch6_coeff_3_4), 
  .coeff_3_3(ch6_coeff_3_3), 
  .coeff_3_2(ch6_coeff_3_2), 
  .coeff_3_1(ch6_coeff_3_1), 
  .coeff_3_0(ch6_coeff_3_0), 

  //Section 2 coefficients (x <= 0, |x| <= section_limit)
  .coeff_2_10(ch6_coeff_2_10), 
  .coeff_2_9(ch6_coeff_2_9), 
  .coeff_2_8(ch6_coeff_2_8), 
  .coeff_2_7(ch6_coeff_2_7), 
  .coeff_2_6(ch6_coeff_2_6), 
  .coeff_2_5(ch6_coeff_2_5), 
  .coeff_2_4(ch6_coeff_2_4), 
  .coeff_2_3(ch6_coeff_2_3), 
  .coeff_2_2(ch6_coeff_2_2), 
  .coeff_2_1(ch6_coeff_2_1), 
  .coeff_2_0(ch6_coeff_2_0), 

  //Section 1 coefficients (x <= 0, |x| > section_limit)
  .coeff_1_10(ch6_coeff_1_10), 
  .coeff_1_9(ch6_coeff_1_9), 
  .coeff_1_8(ch6_coeff_1_8), 
  .coeff_1_7(ch6_coeff_1_7), 
  .coeff_1_6(ch6_coeff_1_6), 
  .coeff_1_5(ch6_coeff_1_5), 
  .coeff_1_4(ch6_coeff_1_4), 
  .coeff_1_3(ch6_coeff_1_3), 
  .coeff_1_2(ch6_coeff_1_2), 
  .coeff_1_1(ch6_coeff_1_1), 
  .coeff_1_0(ch6_coeff_1_0)
);

NLC_1ch_1 ch5(
  //System clock and reset
  .clk(clk),
  .reset(reset),
  
  //ADC output
  .srdyi(srdyi), 
  .x_lin(ch5_x_lin),

  //NLC output
  .srdyo(srdyo), 
  .x_adc(ch5_x_adc), 

  //X-value that separates the sections
  .section_limit(ch5_section_limit),

  //Reciprocal standard deviation for the centered and scaled fit
  .recip_stdev_4(ch5_recip_stdev_4), 
  .recip_stdev_3(ch5_recip_stdev_3), 
  .recip_stdev_2(ch5_recip_stdev_2), 
  .recip_stdev_1(ch5_recip_stdev_1), 

  //Negative meand for the centered and scaled fit
  .neg_mean_4(ch5_neg_mean_4), 
  .neg_mean_3(ch5_neg_mean_3), 
  .neg_mean_2(ch5_neg_mean_2), 
  .neg_mean_1(ch5_neg_mean_1), 

  //Section 4 coefficients (x > 0, |x| > section_limit)
  .coeff_4_10(ch5_coeff_4_10), 
  .coeff_4_9(ch5_coeff_4_9), 
  .coeff_4_8(ch5_coeff_4_8), 
  .coeff_4_7(ch5_coeff_4_7), 
  .coeff_4_6(ch5_coeff_4_6), 
  .coeff_4_5(ch5_coeff_4_5), 
  .coeff_4_4(ch5_coeff_4_4), 
  .coeff_4_3(ch5_coeff_4_3), 
  .coeff_4_2(ch5_coeff_4_2), 
  .coeff_4_1(ch5_coeff_4_1), 
  .coeff_4_0(ch5_coeff_4_0), 

  //Section 3 coefficients (x > 0, |x| <= section_limit)
  .coeff_3_10(ch5_coeff_3_10), 
  .coeff_3_9(ch5_coeff_3_9), 
  .coeff_3_8(ch5_coeff_3_8), 
  .coeff_3_7(ch5_coeff_3_7), 
  .coeff_3_6(ch5_coeff_3_6), 
  .coeff_3_5(ch5_coeff_3_5), 
  .coeff_3_4(ch5_coeff_3_4), 
  .coeff_3_3(ch5_coeff_3_3), 
  .coeff_3_2(ch5_coeff_3_2), 
  .coeff_3_1(ch5_coeff_3_1), 
  .coeff_3_0(ch5_coeff_3_0), 

  //Section 2 coefficients (x <= 0, |x| <= section_limit)
  .coeff_2_10(ch5_coeff_2_10), 
  .coeff_2_9(ch5_coeff_2_9), 
  .coeff_2_8(ch5_coeff_2_8), 
  .coeff_2_7(ch5_coeff_2_7), 
  .coeff_2_6(ch5_coeff_2_6), 
  .coeff_2_5(ch5_coeff_2_5), 
  .coeff_2_4(ch5_coeff_2_4), 
  .coeff_2_3(ch5_coeff_2_3), 
  .coeff_2_2(ch5_coeff_2_2), 
  .coeff_2_1(ch5_coeff_2_1), 
  .coeff_2_0(ch5_coeff_2_0), 

  //Section 1 coefficients (x <= 0, |x| > section_limit)
  .coeff_1_10(ch5_coeff_1_10), 
  .coeff_1_9(ch5_coeff_1_9), 
  .coeff_1_8(ch5_coeff_1_8), 
  .coeff_1_7(ch5_coeff_1_7), 
  .coeff_1_6(ch5_coeff_1_6), 
  .coeff_1_5(ch5_coeff_1_5), 
  .coeff_1_4(ch5_coeff_1_4), 
  .coeff_1_3(ch5_coeff_1_3), 
  .coeff_1_2(ch5_coeff_1_2), 
  .coeff_1_1(ch5_coeff_1_1), 
  .coeff_1_0(ch5_coeff_1_0)
);

NLC_1ch_1 ch4(
  //System clock and reset
  .clk(clk),
  .reset(reset),
  
  //ADC output
  .srdyi(srdyi), 
  .x_lin(ch4_x_lin),

  //NLC output
  .srdyo(srdyo), 
  .x_adc(ch4_x_adc), 

  //X-value that separates the sections
  .section_limit(ch4_section_limit),

  //Reciprocal standard deviation for the centered and scaled fit
  .recip_stdev_4(ch4_recip_stdev_4), 
  .recip_stdev_3(ch4_recip_stdev_3), 
  .recip_stdev_2(ch4_recip_stdev_2), 
  .recip_stdev_1(ch4_recip_stdev_1), 

  //Negative meand for the centered and scaled fit
  .neg_mean_4(ch4_neg_mean_4), 
  .neg_mean_3(ch4_neg_mean_3), 
  .neg_mean_2(ch4_neg_mean_2), 
  .neg_mean_1(ch4_neg_mean_1), 

  //Section 4 coefficients (x > 0, |x| > section_limit)
  .coeff_4_10(ch4_coeff_4_10), 
  .coeff_4_9(ch4_coeff_4_9), 
  .coeff_4_8(ch4_coeff_4_8), 
  .coeff_4_7(ch4_coeff_4_7), 
  .coeff_4_6(ch4_coeff_4_6), 
  .coeff_4_5(ch4_coeff_4_5), 
  .coeff_4_4(ch4_coeff_4_4), 
  .coeff_4_3(ch4_coeff_4_3), 
  .coeff_4_2(ch4_coeff_4_2), 
  .coeff_4_1(ch4_coeff_4_1), 
  .coeff_4_0(ch4_coeff_4_0), 

  //Section 3 coefficients (x > 0, |x| <= section_limit)
  .coeff_3_10(ch4_coeff_3_10), 
  .coeff_3_9(ch4_coeff_3_9), 
  .coeff_3_8(ch4_coeff_3_8), 
  .coeff_3_7(ch4_coeff_3_7), 
  .coeff_3_6(ch4_coeff_3_6), 
  .coeff_3_5(ch4_coeff_3_5), 
  .coeff_3_4(ch4_coeff_3_4), 
  .coeff_3_3(ch4_coeff_3_3), 
  .coeff_3_2(ch4_coeff_3_2), 
  .coeff_3_1(ch4_coeff_3_1), 
  .coeff_3_0(ch4_coeff_3_0), 

  //Section 2 coefficients (x <= 0, |x| <= section_limit)
  .coeff_2_10(ch4_coeff_2_10), 
  .coeff_2_9(ch4_coeff_2_9), 
  .coeff_2_8(ch4_coeff_2_8), 
  .coeff_2_7(ch4_coeff_2_7), 
  .coeff_2_6(ch4_coeff_2_6), 
  .coeff_2_5(ch4_coeff_2_5), 
  .coeff_2_4(ch4_coeff_2_4), 
  .coeff_2_3(ch4_coeff_2_3), 
  .coeff_2_2(ch4_coeff_2_2), 
  .coeff_2_1(ch4_coeff_2_1), 
  .coeff_2_0(ch4_coeff_2_0), 

  //Section 1 coefficients (x <= 0, |x| > section_limit)
  .coeff_1_10(ch4_coeff_1_10), 
  .coeff_1_9(ch4_coeff_1_9), 
  .coeff_1_8(ch4_coeff_1_8), 
  .coeff_1_7(ch4_coeff_1_7), 
  .coeff_1_6(ch4_coeff_1_6), 
  .coeff_1_5(ch4_coeff_1_5), 
  .coeff_1_4(ch4_coeff_1_4), 
  .coeff_1_3(ch4_coeff_1_3), 
  .coeff_1_2(ch4_coeff_1_2), 
  .coeff_1_1(ch4_coeff_1_1), 
  .coeff_1_0(ch4_coeff_1_0)
);

NLC_1ch_1 ch3(
  //System clock and reset
  .clk(clk),
  .reset(reset),
  
  //ADC output
  .srdyi(srdyi), 
  .x_lin(ch3_x_lin),

  //NLC output
  .srdyo(srdyo), 
  .x_adc(ch3_x_adc), 

  //X-value that separates the sections
  .section_limit(ch3_section_limit),

  //Reciprocal standard deviation for the centered and scaled fit
  .recip_stdev_4(ch3_recip_stdev_4), 
  .recip_stdev_3(ch3_recip_stdev_3), 
  .recip_stdev_2(ch3_recip_stdev_2), 
  .recip_stdev_1(ch3_recip_stdev_1), 

  //Negative meand for the centered and scaled fit
  .neg_mean_4(ch3_neg_mean_4), 
  .neg_mean_3(ch3_neg_mean_3), 
  .neg_mean_2(ch3_neg_mean_2), 
  .neg_mean_1(ch3_neg_mean_1), 

  //Section 4 coefficients (x > 0, |x| > section_limit)
  .coeff_4_10(ch3_coeff_4_10), 
  .coeff_4_9(ch3_coeff_4_9), 
  .coeff_4_8(ch3_coeff_4_8), 
  .coeff_4_7(ch3_coeff_4_7), 
  .coeff_4_6(ch3_coeff_4_6), 
  .coeff_4_5(ch3_coeff_4_5), 
  .coeff_4_4(ch3_coeff_4_4), 
  .coeff_4_3(ch3_coeff_4_3), 
  .coeff_4_2(ch3_coeff_4_2), 
  .coeff_4_1(ch3_coeff_4_1), 
  .coeff_4_0(ch3_coeff_4_0), 

  //Section 3 coefficients (x > 0, |x| <= section_limit)
  .coeff_3_10(ch3_coeff_3_10), 
  .coeff_3_9(ch3_coeff_3_9), 
  .coeff_3_8(ch3_coeff_3_8), 
  .coeff_3_7(ch3_coeff_3_7), 
  .coeff_3_6(ch3_coeff_3_6), 
  .coeff_3_5(ch3_coeff_3_5), 
  .coeff_3_4(ch3_coeff_3_4), 
  .coeff_3_3(ch3_coeff_3_3), 
  .coeff_3_2(ch3_coeff_3_2), 
  .coeff_3_1(ch3_coeff_3_1), 
  .coeff_3_0(ch3_coeff_3_0), 

  //Section 2 coefficients (x <= 0, |x| <= section_limit)
  .coeff_2_10(ch3_coeff_2_10), 
  .coeff_2_9(ch3_coeff_2_9), 
  .coeff_2_8(ch3_coeff_2_8), 
  .coeff_2_7(ch3_coeff_2_7), 
  .coeff_2_6(ch3_coeff_2_6), 
  .coeff_2_5(ch3_coeff_2_5), 
  .coeff_2_4(ch3_coeff_2_4), 
  .coeff_2_3(ch3_coeff_2_3), 
  .coeff_2_2(ch3_coeff_2_2), 
  .coeff_2_1(ch3_coeff_2_1), 
  .coeff_2_0(ch3_coeff_2_0), 

  //Section 1 coefficients (x <= 0, |x| > section_limit)
  .coeff_1_10(ch3_coeff_1_10), 
  .coeff_1_9(ch3_coeff_1_9), 
  .coeff_1_8(ch3_coeff_1_8), 
  .coeff_1_7(ch3_coeff_1_7), 
  .coeff_1_6(ch3_coeff_1_6), 
  .coeff_1_5(ch3_coeff_1_5), 
  .coeff_1_4(ch3_coeff_1_4), 
  .coeff_1_3(ch3_coeff_1_3), 
  .coeff_1_2(ch3_coeff_1_2), 
  .coeff_1_1(ch3_coeff_1_1), 
  .coeff_1_0(ch3_coeff_1_0)
);

NLC_1ch_1 ch2(
  //System clock and reset
  .clk(clk),
  .reset(reset),
  
  //ADC output
  .srdyi(srdyi), 
  .x_lin(ch2_x_lin),

  //NLC output
  .srdyo(srdyo), 
  .x_adc(ch2_x_adc), 

  //X-value that separates the sections
  .section_limit(ch2_section_limit),

  //Reciprocal standard deviation for the centered and scaled fit
  .recip_stdev_4(ch2_recip_stdev_4), 
  .recip_stdev_3(ch2_recip_stdev_3), 
  .recip_stdev_2(ch2_recip_stdev_2), 
  .recip_stdev_1(ch2_recip_stdev_1), 

  //Negative meand for the centered and scaled fit
  .neg_mean_4(ch2_neg_mean_4), 
  .neg_mean_3(ch2_neg_mean_3), 
  .neg_mean_2(ch2_neg_mean_2), 
  .neg_mean_1(ch2_neg_mean_1), 

  //Section 4 coefficients (x > 0, |x| > section_limit)
  .coeff_4_10(ch2_coeff_4_10), 
  .coeff_4_9(ch2_coeff_4_9), 
  .coeff_4_8(ch2_coeff_4_8), 
  .coeff_4_7(ch2_coeff_4_7), 
  .coeff_4_6(ch2_coeff_4_6), 
  .coeff_4_5(ch2_coeff_4_5), 
  .coeff_4_4(ch2_coeff_4_4), 
  .coeff_4_3(ch2_coeff_4_3), 
  .coeff_4_2(ch2_coeff_4_2), 
  .coeff_4_1(ch2_coeff_4_1), 
  .coeff_4_0(ch2_coeff_4_0), 

  //Section 3 coefficients (x > 0, |x| <= section_limit)
  .coeff_3_10(ch2_coeff_3_10), 
  .coeff_3_9(ch2_coeff_3_9), 
  .coeff_3_8(ch2_coeff_3_8), 
  .coeff_3_7(ch2_coeff_3_7), 
  .coeff_3_6(ch2_coeff_3_6), 
  .coeff_3_5(ch2_coeff_3_5), 
  .coeff_3_4(ch2_coeff_3_4), 
  .coeff_3_3(ch2_coeff_3_3), 
  .coeff_3_2(ch2_coeff_3_2), 
  .coeff_3_1(ch2_coeff_3_1), 
  .coeff_3_0(ch2_coeff_3_0), 

  //Section 2 coefficients (x <= 0, |x| <= section_limit)
  .coeff_2_10(ch2_coeff_2_10), 
  .coeff_2_9(ch2_coeff_2_9), 
  .coeff_2_8(ch2_coeff_2_8), 
  .coeff_2_7(ch2_coeff_2_7), 
  .coeff_2_6(ch2_coeff_2_6), 
  .coeff_2_5(ch2_coeff_2_5), 
  .coeff_2_4(ch2_coeff_2_4), 
  .coeff_2_3(ch2_coeff_2_3), 
  .coeff_2_2(ch2_coeff_2_2), 
  .coeff_2_1(ch2_coeff_2_1), 
  .coeff_2_0(ch2_coeff_2_0), 

  //Section 1 coefficients (x <= 0, |x| > section_limit)
  .coeff_1_10(ch2_coeff_1_10), 
  .coeff_1_9(ch2_coeff_1_9), 
  .coeff_1_8(ch2_coeff_1_8), 
  .coeff_1_7(ch2_coeff_1_7), 
  .coeff_1_6(ch2_coeff_1_6), 
  .coeff_1_5(ch2_coeff_1_5), 
  .coeff_1_4(ch2_coeff_1_4), 
  .coeff_1_3(ch2_coeff_1_3), 
  .coeff_1_2(ch2_coeff_1_2), 
  .coeff_1_1(ch2_coeff_1_1), 
  .coeff_1_0(ch2_coeff_1_0)
);

NLC_1ch_1 ch1(
  //System clock and reset
  .clk(clk),
  .reset(reset),
  
  //ADC output
  .srdyi(srdyi), 
  .x_lin(ch1_x_lin),

  //NLC output
  .srdyo(srdyo), 
  .x_adc(ch1_x_adc), 

  //X-value that separates the sections
  .section_limit(ch1_section_limit),

  //Reciprocal standard deviation for the centered and scaled fit
  .recip_stdev_4(ch1_recip_stdev_4), 
  .recip_stdev_3(ch1_recip_stdev_3), 
  .recip_stdev_2(ch1_recip_stdev_2), 
  .recip_stdev_1(ch1_recip_stdev_1), 

  //Negative meand for the centered and scaled fit
  .neg_mean_4(ch1_neg_mean_4), 
  .neg_mean_3(ch1_neg_mean_3), 
  .neg_mean_2(ch1_neg_mean_2), 
  .neg_mean_1(ch1_neg_mean_1), 

  //Section 4 coefficients (x > 0, |x| > section_limit)
  .coeff_4_10(ch1_coeff_4_10), 
  .coeff_4_9(ch1_coeff_4_9), 
  .coeff_4_8(ch1_coeff_4_8), 
  .coeff_4_7(ch1_coeff_4_7), 
  .coeff_4_6(ch1_coeff_4_6), 
  .coeff_4_5(ch1_coeff_4_5), 
  .coeff_4_4(ch1_coeff_4_4), 
  .coeff_4_3(ch1_coeff_4_3), 
  .coeff_4_2(ch1_coeff_4_2), 
  .coeff_4_1(ch1_coeff_4_1), 
  .coeff_4_0(ch1_coeff_4_0), 

  //Section 3 coefficients (x > 0, |x| <= section_limit)
  .coeff_3_10(ch1_coeff_3_10), 
  .coeff_3_9(ch1_coeff_3_9), 
  .coeff_3_8(ch1_coeff_3_8), 
  .coeff_3_7(ch1_coeff_3_7), 
  .coeff_3_6(ch1_coeff_3_6), 
  .coeff_3_5(ch1_coeff_3_5), 
  .coeff_3_4(ch1_coeff_3_4), 
  .coeff_3_3(ch1_coeff_3_3), 
  .coeff_3_2(ch1_coeff_3_2), 
  .coeff_3_1(ch1_coeff_3_1), 
  .coeff_3_0(ch1_coeff_3_0), 

  //Section 2 coefficients (x <= 0, |x| <= section_limit)
  .coeff_2_10(ch1_coeff_2_10), 
  .coeff_2_9(ch1_coeff_2_9), 
  .coeff_2_8(ch1_coeff_2_8), 
  .coeff_2_7(ch1_coeff_2_7), 
  .coeff_2_6(ch1_coeff_2_6), 
  .coeff_2_5(ch1_coeff_2_5), 
  .coeff_2_4(ch1_coeff_2_4), 
  .coeff_2_3(ch1_coeff_2_3), 
  .coeff_2_2(ch1_coeff_2_2), 
  .coeff_2_1(ch1_coeff_2_1), 
  .coeff_2_0(ch1_coeff_2_0), 

  //Section 1 coefficients (x <= 0, |x| > section_limit)
  .coeff_1_10(ch1_coeff_1_10), 
  .coeff_1_9(ch1_coeff_1_9), 
  .coeff_1_8(ch1_coeff_1_8), 
  .coeff_1_7(ch1_coeff_1_7), 
  .coeff_1_6(ch1_coeff_1_6), 
  .coeff_1_5(ch1_coeff_1_5), 
  .coeff_1_4(ch1_coeff_1_4), 
  .coeff_1_3(ch1_coeff_1_3), 
  .coeff_1_2(ch1_coeff_1_2), 
  .coeff_1_1(ch1_coeff_1_1), 
  .coeff_1_0(ch1_coeff_1_0)
);

NLC_1ch_1 ch0(
  //System clock and reset
  .clk(clk),
  .reset(reset),
  
  //ADC output
  .srdyi(srdyi), 
  .x_lin(ch0_x_lin),

  //NLC output
  .srdyo(srdyo), 
  .x_adc(ch0_x_adc), 

  //X-value that separates the sections
  .section_limit(ch0_section_limit),

  //Reciprocal standard deviation for the centered and scaled fit
  .recip_stdev_4(ch0_recip_stdev_4), 
  .recip_stdev_3(ch0_recip_stdev_3), 
  .recip_stdev_2(ch0_recip_stdev_2), 
  .recip_stdev_1(ch0_recip_stdev_1), 

  //Negative meand for the centered and scaled fit
  .neg_mean_4(ch0_neg_mean_4), 
  .neg_mean_3(ch0_neg_mean_3), 
  .neg_mean_2(ch0_neg_mean_2), 
  .neg_mean_1(ch0_neg_mean_1), 

  //Section 4 coefficients (x > 0, |x| > section_limit)
  .coeff_4_10(ch0_coeff_4_10), 
  .coeff_4_9(ch0_coeff_4_9), 
  .coeff_4_8(ch0_coeff_4_8), 
  .coeff_4_7(ch0_coeff_4_7), 
  .coeff_4_6(ch0_coeff_4_6), 
  .coeff_4_5(ch0_coeff_4_5), 
  .coeff_4_4(ch0_coeff_4_4), 
  .coeff_4_3(ch0_coeff_4_3), 
  .coeff_4_2(ch0_coeff_4_2), 
  .coeff_4_1(ch0_coeff_4_1), 
  .coeff_4_0(ch0_coeff_4_0), 

  //Section 3 coefficients (x > 0, |x| <= section_limit)
  .coeff_3_10(ch0_coeff_3_10), 
  .coeff_3_9(ch0_coeff_3_9), 
  .coeff_3_8(ch0_coeff_3_8), 
  .coeff_3_7(ch0_coeff_3_7), 
  .coeff_3_6(ch0_coeff_3_6), 
  .coeff_3_5(ch0_coeff_3_5), 
  .coeff_3_4(ch0_coeff_3_4), 
  .coeff_3_3(ch0_coeff_3_3), 
  .coeff_3_2(ch0_coeff_3_2), 
  .coeff_3_1(ch0_coeff_3_1), 
  .coeff_3_0(ch0_coeff_3_0), 

  //Section 2 coefficients (x <= 0, |x| <= section_limit)
  .coeff_2_10(ch0_coeff_2_10), 
  .coeff_2_9(ch0_coeff_2_9), 
  .coeff_2_8(ch0_coeff_2_8), 
  .coeff_2_7(ch0_coeff_2_7), 
  .coeff_2_6(ch0_coeff_2_6), 
  .coeff_2_5(ch0_coeff_2_5), 
  .coeff_2_4(ch0_coeff_2_4), 
  .coeff_2_3(ch0_coeff_2_3), 
  .coeff_2_2(ch0_coeff_2_2), 
  .coeff_2_1(ch0_coeff_2_1), 
  .coeff_2_0(ch0_coeff_2_0), 

  //Section 1 coefficients (x <= 0, |x| > section_limit)
  .coeff_1_10(ch0_coeff_1_10), 
  .coeff_1_9(ch0_coeff_1_9), 
  .coeff_1_8(ch0_coeff_1_8), 
  .coeff_1_7(ch0_coeff_1_7), 
  .coeff_1_6(ch0_coeff_1_6), 
  .coeff_1_5(ch0_coeff_1_5), 
  .coeff_1_4(ch0_coeff_1_4), 
  .coeff_1_3(ch0_coeff_1_3), 
  .coeff_1_2(ch0_coeff_1_2), 
  .coeff_1_1(ch0_coeff_1_1), 
  .coeff_1_0(ch0_coeff_1_0)
);

////////////////////////////////////////////////////////////////
//  Combinational Logic

////////////////////////////////////////////////////////////////
//  Registers

endmodule
