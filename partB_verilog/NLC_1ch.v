////////////////////////////////////////////////////////////////
//
// Module: NLC_1ch.v
// Author: Jordi Burbano
//         jburbanoalgarte@gmail.com
//
// Description:
//	Optimized 32-channel NLC

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

//x_adc_valid
wire [20:0] x_adc_valid0;
wire [20:0] x_adc_valid1;
wire [20:0] x_adc_valid2;
wire [20:0] x_adc_valid3;
wire [20:0] x_adc_valid4;
wire [20:0] x_adc_valid5;
wire [20:0] x_adc_valid6;
wire [20:0] x_adc_valid7;
wire [20:0] x_adc_valid8;
wire [20:0] x_adc_valid9;
wire [20:0] x_adc_valid10;
wire [20:0] x_adc_valid11;
wire [20:0] x_adc_valid12;
wire [20:0] x_adc_valid13;
wire [20:0] x_adc_valid14;
wire [20:0] x_adc_valid15;
wire [20:0] x_adc_valid16;
wire [20:0] x_adc_valid17;
wire [20:0] x_adc_valid18;
wire [20:0] x_adc_valid19;
wire [20:0] x_adc_valid20;
wire [20:0] x_adc_valid21;
wire [20:0] x_adc_valid22;
wire [20:0] x_adc_valid23;
wire [20:0] x_adc_valid24;
wire [20:0] x_adc_valid25;
wire [20:0] x_adc_valid26;
wire [20:0] x_adc_valid27;
wire [20:0] x_adc_valid28;
wire [20:0] x_adc_valid29;
wire [20:0] x_adc_valid30;
wire [20:0] x_adc_valid31;

//upper_mux_32
wire [20:0] um32_x_adc;
wire [19:0] um32_section_limit;
wire [31:0] um32_coeff_1_0;
wire [31:0] um32_coeff_1_1;
wire [31:0] um32_coeff_1_2;
wire [31:0] um32_coeff_1_3;
wire [31:0] um32_coeff_1_4;
wire [31:0] um32_coeff_1_5;
wire [31:0] um32_coeff_1_6;
wire [31:0] um32_coeff_1_7;
wire [31:0] um32_coeff_1_8;
wire [31:0] um32_coeff_1_9;
wire [31:0] um32_coeff_1_10;
wire [31:0] um32_mean1;
wire [31:0] um32_std1;
wire [31:0] um32_coeff_2_0;
wire [31:0] um32_coeff_2_1;
wire [31:0] um32_coeff_2_2;
wire [31:0] um32_coeff_2_3;
wire [31:0] um32_coeff_2_4;
wire [31:0] um32_coeff_2_5;
wire [31:0] um32_coeff_2_6;
wire [31:0] um32_coeff_2_7;
wire [31:0] um32_coeff_2_8;
wire [31:0] um32_coeff_2_9;
wire [31:0] um32_coeff_2_10;
wire [31:0] um32_mean2;
wire [31:0] um32_std2;
wire [31:0] um32_coeff_3_0;
wire [31:0] um32_coeff_3_1;
wire [31:0] um32_coeff_3_2;
wire [31:0] um32_coeff_3_3;
wire [31:0] um32_coeff_3_4;
wire [31:0] um32_coeff_3_5;
wire [31:0] um32_coeff_3_6;
wire [31:0] um32_coeff_3_7;
wire [31:0] um32_coeff_3_8;
wire [31:0] um32_coeff_3_9;
wire [31:0] um32_coeff_3_10;
wire [31:0] um32_mean3;
wire [31:0] um32_std3;
wire [31:0] um32_coeff_4_0;
wire [31:0] um32_coeff_4_1;
wire [31:0] um32_coeff_4_2;
wire [31:0] um32_coeff_4_3;
wire [31:0] um32_coeff_4_4;
wire [31:0] um32_coeff_4_5;
wire [31:0] um32_coeff_4_6;
wire [31:0] um32_coeff_4_7;
wire [31:0] um32_coeff_4_8;
wire [31:0] um32_coeff_4_9;
wire [31:0] um32_coeff_4_10;
wire [31:0] um32_mean4;
wire [31:0] um32_std4;

//comparator
wire [31:0] comp_coeff0;
wire [31:0] comp_coeff1;
wire [31:0] comp_coeff2;
wire [31:0] comp_coeff3;
wire [31:0] comp_coeff4;
wire [31:0] comp_coeff5;
wire [31:0] comp_coeff6;
wire [31:0] comp_coeff7;
wire [31:0] comp_coeff8;
wire [31:0] comp_coeff9;
wire [31:0] comp_coeff10;
wire [31:0] comp_mean;
wire [31:0] comp_std;

//mean_Z1
wire [31:0] mean_Z1_o;

//std_Z1
wire [31:0] std_Z1_o;

//centerScale3
wire [31:0] cs3_x_centScale;
wire cs3_srdyo_o;

//control2
wire [3:0] c2_coeff_sel;
wire c2_sum_rst;
wire c2_sum_en;
wire [4:0] c2_channel_select;
wire [31:0] c2_enableRegControl;

//mux
wire [31:0] mux_coeff;

//delay_Z21
wire [31:0] delay_coeff;

//hornerLoop
wire [20:0] hl_x_lin;

////////////////////////////////////////////////////////////////
//  Modules
x_adc_valid theX_adc_valid( 
	.clk(clk),
	.GlobalReset(GlobalReset),
	.srdyi(srdyi),
    .x_adc_0(ch0_x_adc),
	.x_adc_1(ch1_x_adc),
	.x_adc_2(ch2_x_adc),
	.x_adc_3(ch3_x_adc),
	.x_adc_4(ch4_x_adc),
	.x_adc_5(ch5_x_adc),
	.x_adc_6(ch6_x_adc),
	.x_adc_7(ch7_x_adc),
	.x_adc_8(ch8_x_adc),
	.x_adc_9(ch9_x_adc),
	.x_adc_10(ch10_x_adc),
	.x_adc_11(ch11_x_adc),
	.x_adc_12(ch12_x_adc),
	.x_adc_13(ch13_x_adc),
	.x_adc_14(ch14_x_adc),
	.x_adc_15(ch15_x_adc),
	.x_adc_16(ch16_x_adc),
	.x_adc_17(ch17_x_adc),
	.x_adc_18(ch18_x_adc),
	.x_adc_19(ch19_x_adc),
	.x_adc_20(ch20_x_adc),
	.x_adc_21(ch21_x_adc),
	.x_adc_22(ch22_x_adc),
	.x_adc_23(ch23_x_adc),
	.x_adc_24(ch24_x_adc),
	.x_adc_25(ch25_x_adc),
	.x_adc_26(ch26_x_adc),
	.x_adc_27(ch27_x_adc),
	.x_adc_28(ch28_x_adc),
	.x_adc_29(ch29_x_adc),
	.x_adc_30(ch30_x_adc),
	.x_adc_31(ch31_x_adc),
    .x_adc_valid_0(x_adc_valid0),
	.x_adc_valid_1(x_adc_valid1),
	.x_adc_valid_2(x_adc_valid2),
	.x_adc_valid_3(x_adc_valid3),
	.x_adc_valid_4(x_adc_valid4),
	.x_adc_valid_5(x_adc_valid5),
	.x_adc_valid_6(x_adc_valid6),
	.x_adc_valid_7(x_adc_valid7),
	.x_adc_valid_8(x_adc_valid8),
	.x_adc_valid_9(x_adc_valid9),
	.x_adc_valid_10(x_adc_valid10),
	.x_adc_valid_11(x_adc_valid11),
	.x_adc_valid_12(x_adc_valid12),
	.x_adc_valid_13(x_adc_valid13),
	.x_adc_valid_14(x_adc_valid14),
	.x_adc_valid_15(x_adc_valid15),
	.x_adc_valid_16(x_adc_valid16),
	.x_adc_valid_17(x_adc_valid17),
	.x_adc_valid_18(x_adc_valid18),
	.x_adc_valid_19(x_adc_valid19),
	.x_adc_valid_20(x_adc_valid20),
	.x_adc_valid_21(x_adc_valid21),
	.x_adc_valid_22(x_adc_valid22),
	.x_adc_valid_23(x_adc_valid23),
	.x_adc_valid_24(x_adc_valid24),
	.x_adc_valid_25(x_adc_valid25),
	.x_adc_valid_26(x_adc_valid26),
	.x_adc_valid_27(x_adc_valid27),
	.x_adc_valid_28(x_adc_valid28),
	.x_adc_valid_29(x_adc_valid29),
	.x_adc_valid_30(x_adc_valid30),
	.x_adc_valid_31(x_adc_valid31)
    );

upper_mux_32 theUpper_mux_32(
	.clk(clk),
	.GlobalReset(GlobalReset),
	.channel_select(c2_channel_select),
	.x_adc_ch0(x_adc_valid0),
	.x_adc_ch1(x_adc_valid1),
	.x_adc_ch2(x_adc_valid2),
	.x_adc_ch3(x_adc_valid3),
	.x_adc_ch4(x_adc_valid4),
	.x_adc_ch5(x_adc_valid5),
	.x_adc_ch6(x_adc_valid6),
	.x_adc_ch7(x_adc_valid7),
	.x_adc_ch8(x_adc_valid8),
	.x_adc_ch9(x_adc_valid9),
	.x_adc_ch10(x_adc_valid10),
	.x_adc_ch11(x_adc_valid11),
	.x_adc_ch12(x_adc_valid12),
	.x_adc_ch13(x_adc_valid13),
	.x_adc_ch14(x_adc_valid14),
	.x_adc_ch15(x_adc_valid15),
	.x_adc_ch16(x_adc_valid16),
	.x_adc_ch17(x_adc_valid17),
	.x_adc_ch18(x_adc_valid18),
	.x_adc_ch19(x_adc_valid19),
	.x_adc_ch20(x_adc_valid20),
	.x_adc_ch21(x_adc_valid21),
	.x_adc_ch22(x_adc_valid22),
	.x_adc_ch23(x_adc_valid23),
	.x_adc_ch24(x_adc_valid24),
	.x_adc_ch25(x_adc_valid25),
	.x_adc_ch26(x_adc_valid26),
	.x_adc_ch27(x_adc_valid27),
	.x_adc_ch28(x_adc_valid28),
	.x_adc_ch29(x_adc_valid29),
	.x_adc_ch30(x_adc_valid30),
	.x_adc_ch31(x_adc_valid31),
	.section_limit_ch0(ch0_section_limit),
	.section_limit_ch1(ch1_section_limit),
	.section_limit_ch2(ch2_section_limit),
	.section_limit_ch3(ch3_section_limit),
	.section_limit_ch4(ch4_section_limit),
	.section_limit_ch5(ch5_section_limit),
	.section_limit_ch6(ch6_section_limit),
	.section_limit_ch7(ch7_section_limit),
	.section_limit_ch8(ch8_section_limit),
	.section_limit_ch9(ch9_section_limit),
	.section_limit_ch10(ch10_section_limit),
	.section_limit_ch11(ch11_section_limit),
	.section_limit_ch12(ch12_section_limit),
	.section_limit_ch13(ch13_section_limit),
	.section_limit_ch14(ch14_section_limit),
	.section_limit_ch15(ch15_section_limit),
	.section_limit_ch16(ch16_section_limit),
	.section_limit_ch17(ch17_section_limit),
	.section_limit_ch18(ch18_section_limit),
	.section_limit_ch19(ch19_section_limit),
	.section_limit_ch20(ch20_section_limit),
	.section_limit_ch21(ch21_section_limit),
	.section_limit_ch22(ch22_section_limit),
	.section_limit_ch23(ch23_section_limit),
	.section_limit_ch24(ch24_section_limit),
	.section_limit_ch25(ch25_section_limit),
	.section_limit_ch26(ch26_section_limit),
	.section_limit_ch27(ch27_section_limit),
	.section_limit_ch28(ch28_section_limit),
	.section_limit_ch29(ch29_section_limit),
	.section_limit_ch30(ch30_section_limit),
	.section_limit_ch31(ch31_section_limit),
	.ch0_coeff_1_0(ch0_coeff_1_0),
	.ch0_coeff_1_1(ch0_coeff_1_1),
	.ch0_coeff_1_2(ch0_coeff_1_2),
	.ch0_coeff_1_3(ch0_coeff_1_3),
	.ch0_coeff_1_4(ch0_coeff_1_4),
	.ch0_coeff_1_5(ch0_coeff_1_5),
	.ch0_coeff_1_6(ch0_coeff_1_6),
	.ch0_coeff_1_7(ch0_coeff_1_7),
	.ch0_coeff_1_8(ch0_coeff_1_8),
	.ch0_coeff_1_9(ch0_coeff_1_9),
	.ch0_coeff_1_10(ch0_coeff_1_10),
	.ch0_mean1(ch0_neg_mean_1),
	.ch0_std1(ch0_recip_stdev_1),
	.ch0_coeff_2_0(ch0_coeff_2_0),
	.ch0_coeff_2_1(ch0_coeff_2_1),
	.ch0_coeff_2_2(ch0_coeff_2_2),
	.ch0_coeff_2_3(ch0_coeff_2_3),
	.ch0_coeff_2_4(ch0_coeff_2_4),
	.ch0_coeff_2_5(ch0_coeff_2_5),
	.ch0_coeff_2_6(ch0_coeff_2_6),
	.ch0_coeff_2_7(ch0_coeff_2_7),
	.ch0_coeff_2_8(ch0_coeff_2_8),
	.ch0_coeff_2_9(ch0_coeff_2_9),
	.ch0_coeff_2_10(ch0_coeff_2_10),
	.ch0_mean2(ch0_neg_mean_2),
	.ch0_std2(ch0_recip_stdev_2),
	.ch0_coeff_3_0(ch0_coeff_3_0),
	.ch0_coeff_3_1(ch0_coeff_3_1),
	.ch0_coeff_3_2(ch0_coeff_3_2),
	.ch0_coeff_3_3(ch0_coeff_3_3),
	.ch0_coeff_3_4(ch0_coeff_3_4),
	.ch0_coeff_3_5(ch0_coeff_3_5),
	.ch0_coeff_3_6(ch0_coeff_3_6),
	.ch0_coeff_3_7(ch0_coeff_3_7),
	.ch0_coeff_3_8(ch0_coeff_3_8),
	.ch0_coeff_3_9(ch0_coeff_3_9),
	.ch0_coeff_3_10(ch0_coeff_3_10),
	.ch0_mean3(ch0_neg_mean_3),
	.ch0_std3(ch0_recip_stdev_3),
	.ch0_coeff_4_0(ch0_coeff_4_0),
	.ch0_coeff_4_1(ch0_coeff_4_1),
	.ch0_coeff_4_2(ch0_coeff_4_2),
	.ch0_coeff_4_3(ch0_coeff_4_3),
	.ch0_coeff_4_4(ch0_coeff_4_4),
	.ch0_coeff_4_5(ch0_coeff_4_5),
	.ch0_coeff_4_6(ch0_coeff_4_6),
	.ch0_coeff_4_7(ch0_coeff_4_7),
	.ch0_coeff_4_8(ch0_coeff_4_8),
	.ch0_coeff_4_9(ch0_coeff_4_9),
	.ch0_coeff_4_10(ch0_coeff_4_10),
	.ch0_mean4(ch0_neg_mean_4),
	.ch0_std4(ch0_recip_stdev_4),
	.ch1_coeff_1_0(ch1_coeff_1_0),
	.ch1_coeff_1_1(ch1_coeff_1_1),
	.ch1_coeff_1_2(ch1_coeff_1_2),
	.ch1_coeff_1_3(ch1_coeff_1_3),
	.ch1_coeff_1_4(ch1_coeff_1_4),
	.ch1_coeff_1_5(ch1_coeff_1_5),
	.ch1_coeff_1_6(ch1_coeff_1_6),
	.ch1_coeff_1_7(ch1_coeff_1_7),
	.ch1_coeff_1_8(ch1_coeff_1_8),
	.ch1_coeff_1_9(ch1_coeff_1_9),
	.ch1_coeff_1_10(ch1_coeff_1_10),
	.ch1_mean1(ch1_neg_mean_1),
	.ch1_std1(ch1_recip_stdev_1),
	.ch1_coeff_2_0(ch1_coeff_2_0),
	.ch1_coeff_2_1(ch1_coeff_2_1),
	.ch1_coeff_2_2(ch1_coeff_2_2),
	.ch1_coeff_2_3(ch1_coeff_2_3),
	.ch1_coeff_2_4(ch1_coeff_2_4),
	.ch1_coeff_2_5(ch1_coeff_2_5),
	.ch1_coeff_2_6(ch1_coeff_2_6),
	.ch1_coeff_2_7(ch1_coeff_2_7),
	.ch1_coeff_2_8(ch1_coeff_2_8),
	.ch1_coeff_2_9(ch1_coeff_2_9),
	.ch1_coeff_2_10(ch1_coeff_2_10),
	.ch1_mean2(ch1_neg_mean_2),
	.ch1_std2(ch1_recip_stdev_2),
	.ch1_coeff_3_0(ch1_coeff_3_0),
	.ch1_coeff_3_1(ch1_coeff_3_1),
	.ch1_coeff_3_2(ch1_coeff_3_2),
	.ch1_coeff_3_3(ch1_coeff_3_3),
	.ch1_coeff_3_4(ch1_coeff_3_4),
	.ch1_coeff_3_5(ch1_coeff_3_5),
	.ch1_coeff_3_6(ch1_coeff_3_6),
	.ch1_coeff_3_7(ch1_coeff_3_7),
	.ch1_coeff_3_8(ch1_coeff_3_8),
	.ch1_coeff_3_9(ch1_coeff_3_9),
	.ch1_coeff_3_10(ch1_coeff_3_10),
	.ch1_mean3(ch1_neg_mean_3),
	.ch1_std3(ch1_recip_stdev_3),
	.ch1_coeff_4_0(ch1_coeff_4_0),
	.ch1_coeff_4_1(ch1_coeff_4_1),
	.ch1_coeff_4_2(ch1_coeff_4_2),
	.ch1_coeff_4_3(ch1_coeff_4_3),
	.ch1_coeff_4_4(ch1_coeff_4_4),
	.ch1_coeff_4_5(ch1_coeff_4_5),
	.ch1_coeff_4_6(ch1_coeff_4_6),
	.ch1_coeff_4_7(ch1_coeff_4_7),
	.ch1_coeff_4_8(ch1_coeff_4_8),
	.ch1_coeff_4_9(ch1_coeff_4_9),
	.ch1_coeff_4_10(ch1_coeff_4_10),
	.ch1_mean4(ch1_neg_mean_4),
	.ch1_std4(ch1_recip_stdev_4),
	.ch2_coeff_1_0(ch2_coeff_1_0),
	.ch2_coeff_1_1(ch2_coeff_1_1),
	.ch2_coeff_1_2(ch2_coeff_1_2),
	.ch2_coeff_1_3(ch2_coeff_1_3),
	.ch2_coeff_1_4(ch2_coeff_1_4),
	.ch2_coeff_1_5(ch2_coeff_1_5),
	.ch2_coeff_1_6(ch2_coeff_1_6),
	.ch2_coeff_1_7(ch2_coeff_1_7),
	.ch2_coeff_1_8(ch2_coeff_1_8),
	.ch2_coeff_1_9(ch2_coeff_1_9),
	.ch2_coeff_1_10(ch2_coeff_1_10),
	.ch2_mean1(ch2_neg_mean_1),
	.ch2_std1(ch2_recip_stdev_1),
	.ch2_coeff_2_0(ch2_coeff_2_0),
	.ch2_coeff_2_1(ch2_coeff_2_1),
	.ch2_coeff_2_2(ch2_coeff_2_2),
	.ch2_coeff_2_3(ch2_coeff_2_3),
	.ch2_coeff_2_4(ch2_coeff_2_4),
	.ch2_coeff_2_5(ch2_coeff_2_5),
	.ch2_coeff_2_6(ch2_coeff_2_6),
	.ch2_coeff_2_7(ch2_coeff_2_7),
	.ch2_coeff_2_8(ch2_coeff_2_8),
	.ch2_coeff_2_9(ch2_coeff_2_9),
	.ch2_coeff_2_10(ch2_coeff_2_10),
	.ch2_mean2(ch2_neg_mean_2),
	.ch2_std2(ch2_recip_stdev_2),
	.ch2_coeff_3_0(ch2_coeff_3_0),
	.ch2_coeff_3_1(ch2_coeff_3_1),
	.ch2_coeff_3_2(ch2_coeff_3_2),
	.ch2_coeff_3_3(ch2_coeff_3_3),
	.ch2_coeff_3_4(ch2_coeff_3_4),
	.ch2_coeff_3_5(ch2_coeff_3_5),
	.ch2_coeff_3_6(ch2_coeff_3_6),
	.ch2_coeff_3_7(ch2_coeff_3_7),
	.ch2_coeff_3_8(ch2_coeff_3_8),
	.ch2_coeff_3_9(ch2_coeff_3_9),
	.ch2_coeff_3_10(ch2_coeff_3_10),
	.ch2_mean3(ch2_neg_mean_3),
	.ch2_std3(ch2_recip_stdev_3),
	.ch2_coeff_4_0(ch2_coeff_4_0),
	.ch2_coeff_4_1(ch2_coeff_4_1),
	.ch2_coeff_4_2(ch2_coeff_4_2),
	.ch2_coeff_4_3(ch2_coeff_4_3),
	.ch2_coeff_4_4(ch2_coeff_4_4),
	.ch2_coeff_4_5(ch2_coeff_4_5),
	.ch2_coeff_4_6(ch2_coeff_4_6),
	.ch2_coeff_4_7(ch2_coeff_4_7),
	.ch2_coeff_4_8(ch2_coeff_4_8),
	.ch2_coeff_4_9(ch2_coeff_4_9),
	.ch2_coeff_4_10(ch2_coeff_4_10),
	.ch2_mean4(ch2_neg_mean_4),
	.ch2_std4(ch2_recip_stdev_4),
	.ch3_coeff_1_0(ch3_coeff_1_0),
	.ch3_coeff_1_1(ch3_coeff_1_1),
	.ch3_coeff_1_2(ch3_coeff_1_2),
	.ch3_coeff_1_3(ch3_coeff_1_3),
	.ch3_coeff_1_4(ch3_coeff_1_4),
	.ch3_coeff_1_5(ch3_coeff_1_5),
	.ch3_coeff_1_6(ch3_coeff_1_6),
	.ch3_coeff_1_7(ch3_coeff_1_7),
	.ch3_coeff_1_8(ch3_coeff_1_8),
	.ch3_coeff_1_9(ch3_coeff_1_9),
	.ch3_coeff_1_10(ch3_coeff_1_10),
	.ch3_mean1(ch3_neg_mean_1),
	.ch3_std1(ch3_recip_stdev_1),
	.ch3_coeff_2_0(ch3_coeff_2_0),
	.ch3_coeff_2_1(ch3_coeff_2_1),
	.ch3_coeff_2_2(ch3_coeff_2_2),
	.ch3_coeff_2_3(ch3_coeff_2_3),
	.ch3_coeff_2_4(ch3_coeff_2_4),
	.ch3_coeff_2_5(ch3_coeff_2_5),
	.ch3_coeff_2_6(ch3_coeff_2_6),
	.ch3_coeff_2_7(ch3_coeff_2_7),
	.ch3_coeff_2_8(ch3_coeff_2_8),
	.ch3_coeff_2_9(ch3_coeff_2_9),
	.ch3_coeff_2_10(ch3_coeff_2_10),
	.ch3_mean2(ch3_neg_mean_2),
	.ch3_std2(ch3_recip_stdev_2),
	.ch3_coeff_3_0(ch3_coeff_3_0),
	.ch3_coeff_3_1(ch3_coeff_3_1),
	.ch3_coeff_3_2(ch3_coeff_3_2),
	.ch3_coeff_3_3(ch3_coeff_3_3),
	.ch3_coeff_3_4(ch3_coeff_3_4),
	.ch3_coeff_3_5(ch3_coeff_3_5),
	.ch3_coeff_3_6(ch3_coeff_3_6),
	.ch3_coeff_3_7(ch3_coeff_3_7),
	.ch3_coeff_3_8(ch3_coeff_3_8),
	.ch3_coeff_3_9(ch3_coeff_3_9),
	.ch3_coeff_3_10(ch3_coeff_3_10),
	.ch3_mean3(ch3_neg_mean_3),
	.ch3_std3(ch3_recip_stdev_3),
	.ch3_coeff_4_0(ch3_coeff_4_0),
	.ch3_coeff_4_1(ch3_coeff_4_1),
	.ch3_coeff_4_2(ch3_coeff_4_2),
	.ch3_coeff_4_3(ch3_coeff_4_3),
	.ch3_coeff_4_4(ch3_coeff_4_4),
	.ch3_coeff_4_5(ch3_coeff_4_5),
	.ch3_coeff_4_6(ch3_coeff_4_6),
	.ch3_coeff_4_7(ch3_coeff_4_7),
	.ch3_coeff_4_8(ch3_coeff_4_8),
	.ch3_coeff_4_9(ch3_coeff_4_9),
	.ch3_coeff_4_10(ch3_coeff_4_10),
	.ch3_mean4(ch3_neg_mean_4),
	.ch3_std4(ch3_recip_stdev_4),
	.ch4_coeff_1_0(ch4_coeff_1_0),
	.ch4_coeff_1_1(ch4_coeff_1_1),
	.ch4_coeff_1_2(ch4_coeff_1_2),
	.ch4_coeff_1_3(ch4_coeff_1_3),
	.ch4_coeff_1_4(ch4_coeff_1_4),
	.ch4_coeff_1_5(ch4_coeff_1_5),
	.ch4_coeff_1_6(ch4_coeff_1_6),
	.ch4_coeff_1_7(ch4_coeff_1_7),
	.ch4_coeff_1_8(ch4_coeff_1_8),
	.ch4_coeff_1_9(ch4_coeff_1_9),
	.ch4_coeff_1_10(ch4_coeff_1_10),
	.ch4_mean1(ch4_neg_mean_1),
	.ch4_std1(ch4_recip_stdev_1),
	.ch4_coeff_2_0(ch4_coeff_2_0),
	.ch4_coeff_2_1(ch4_coeff_2_1),
	.ch4_coeff_2_2(ch4_coeff_2_2),
	.ch4_coeff_2_3(ch4_coeff_2_3),
	.ch4_coeff_2_4(ch4_coeff_2_4),
	.ch4_coeff_2_5(ch4_coeff_2_5),
	.ch4_coeff_2_6(ch4_coeff_2_6),
	.ch4_coeff_2_7(ch4_coeff_2_7),
	.ch4_coeff_2_8(ch4_coeff_2_8),
	.ch4_coeff_2_9(ch4_coeff_2_9),
	.ch4_coeff_2_10(ch4_coeff_2_10),
	.ch4_mean2(ch4_neg_mean_2),
	.ch4_std2(ch4_recip_stdev_2),
	.ch4_coeff_3_0(ch4_coeff_3_0),
	.ch4_coeff_3_1(ch4_coeff_3_1),
	.ch4_coeff_3_2(ch4_coeff_3_2),
	.ch4_coeff_3_3(ch4_coeff_3_3),
	.ch4_coeff_3_4(ch4_coeff_3_4),
	.ch4_coeff_3_5(ch4_coeff_3_5),
	.ch4_coeff_3_6(ch4_coeff_3_6),
	.ch4_coeff_3_7(ch4_coeff_3_7),
	.ch4_coeff_3_8(ch4_coeff_3_8),
	.ch4_coeff_3_9(ch4_coeff_3_9),
	.ch4_coeff_3_10(ch4_coeff_3_10),
	.ch4_mean3(ch4_neg_mean_3),
	.ch4_std3(ch4_recip_stdev_3),
	.ch4_coeff_4_0(ch4_coeff_4_0),
	.ch4_coeff_4_1(ch4_coeff_4_1),
	.ch4_coeff_4_2(ch4_coeff_4_2),
	.ch4_coeff_4_3(ch4_coeff_4_3),
	.ch4_coeff_4_4(ch4_coeff_4_4),
	.ch4_coeff_4_5(ch4_coeff_4_5),
	.ch4_coeff_4_6(ch4_coeff_4_6),
	.ch4_coeff_4_7(ch4_coeff_4_7),
	.ch4_coeff_4_8(ch4_coeff_4_8),
	.ch4_coeff_4_9(ch4_coeff_4_9),
	.ch4_coeff_4_10(ch4_coeff_4_10),
	.ch4_mean4(ch4_neg_mean_4),
	.ch4_std4(ch4_recip_stdev_4),
	.ch5_coeff_1_0(ch5_coeff_1_0),
	.ch5_coeff_1_1(ch5_coeff_1_1),
	.ch5_coeff_1_2(ch5_coeff_1_2),
	.ch5_coeff_1_3(ch5_coeff_1_3),
	.ch5_coeff_1_4(ch5_coeff_1_4),
	.ch5_coeff_1_5(ch5_coeff_1_5),
	.ch5_coeff_1_6(ch5_coeff_1_6),
	.ch5_coeff_1_7(ch5_coeff_1_7),
	.ch5_coeff_1_8(ch5_coeff_1_8),
	.ch5_coeff_1_9(ch5_coeff_1_9),
	.ch5_coeff_1_10(ch5_coeff_1_10),
	.ch5_mean1(ch5_neg_mean_1),
	.ch5_std1(ch5_recip_stdev_1),
	.ch5_coeff_2_0(ch5_coeff_2_0),
	.ch5_coeff_2_1(ch5_coeff_2_1),
	.ch5_coeff_2_2(ch5_coeff_2_2),
	.ch5_coeff_2_3(ch5_coeff_2_3),
	.ch5_coeff_2_4(ch5_coeff_2_4),
	.ch5_coeff_2_5(ch5_coeff_2_5),
	.ch5_coeff_2_6(ch5_coeff_2_6),
	.ch5_coeff_2_7(ch5_coeff_2_7),
	.ch5_coeff_2_8(ch5_coeff_2_8),
	.ch5_coeff_2_9(ch5_coeff_2_9),
	.ch5_coeff_2_10(ch5_coeff_2_10),
	.ch5_mean2(ch5_neg_mean_2),
	.ch5_std2(ch5_recip_stdev_2),
	.ch5_coeff_3_0(ch5_coeff_3_0),
	.ch5_coeff_3_1(ch5_coeff_3_1),
	.ch5_coeff_3_2(ch5_coeff_3_2),
	.ch5_coeff_3_3(ch5_coeff_3_3),
	.ch5_coeff_3_4(ch5_coeff_3_4),
	.ch5_coeff_3_5(ch5_coeff_3_5),
	.ch5_coeff_3_6(ch5_coeff_3_6),
	.ch5_coeff_3_7(ch5_coeff_3_7),
	.ch5_coeff_3_8(ch5_coeff_3_8),
	.ch5_coeff_3_9(ch5_coeff_3_9),
	.ch5_coeff_3_10(ch5_coeff_3_10),
	.ch5_mean3(ch5_neg_mean_3),
	.ch5_std3(ch5_recip_stdev_3),
	.ch5_coeff_4_0(ch5_coeff_4_0),
	.ch5_coeff_4_1(ch5_coeff_4_1),
	.ch5_coeff_4_2(ch5_coeff_4_2),
	.ch5_coeff_4_3(ch5_coeff_4_3),
	.ch5_coeff_4_4(ch5_coeff_4_4),
	.ch5_coeff_4_5(ch5_coeff_4_5),
	.ch5_coeff_4_6(ch5_coeff_4_6),
	.ch5_coeff_4_7(ch5_coeff_4_7),
	.ch5_coeff_4_8(ch5_coeff_4_8),
	.ch5_coeff_4_9(ch5_coeff_4_9),
	.ch5_coeff_4_10(ch5_coeff_4_10),
	.ch5_mean4(ch5_neg_mean_4),
	.ch5_std4(ch5_recip_stdev_4),
	.ch6_coeff_1_0(ch6_coeff_1_0),
	.ch6_coeff_1_1(ch6_coeff_1_1),
	.ch6_coeff_1_2(ch6_coeff_1_2),
	.ch6_coeff_1_3(ch6_coeff_1_3),
	.ch6_coeff_1_4(ch6_coeff_1_4),
	.ch6_coeff_1_5(ch6_coeff_1_5),
	.ch6_coeff_1_6(ch6_coeff_1_6),
	.ch6_coeff_1_7(ch6_coeff_1_7),
	.ch6_coeff_1_8(ch6_coeff_1_8),
	.ch6_coeff_1_9(ch6_coeff_1_9),
	.ch6_coeff_1_10(ch6_coeff_1_10),
	.ch6_mean1(ch6_neg_mean_1),
	.ch6_std1(ch6_recip_stdev_1),
	.ch6_coeff_2_0(ch6_coeff_2_0),
	.ch6_coeff_2_1(ch6_coeff_2_1),
	.ch6_coeff_2_2(ch6_coeff_2_2),
	.ch6_coeff_2_3(ch6_coeff_2_3),
	.ch6_coeff_2_4(ch6_coeff_2_4),
	.ch6_coeff_2_5(ch6_coeff_2_5),
	.ch6_coeff_2_6(ch6_coeff_2_6),
	.ch6_coeff_2_7(ch6_coeff_2_7),
	.ch6_coeff_2_8(ch6_coeff_2_8),
	.ch6_coeff_2_9(ch6_coeff_2_9),
	.ch6_coeff_2_10(ch6_coeff_2_10),
	.ch6_mean2(ch6_neg_mean_2),
	.ch6_std2(ch6_recip_stdev_2),
	.ch6_coeff_3_0(ch6_coeff_3_0),
	.ch6_coeff_3_1(ch6_coeff_3_1),
	.ch6_coeff_3_2(ch6_coeff_3_2),
	.ch6_coeff_3_3(ch6_coeff_3_3),
	.ch6_coeff_3_4(ch6_coeff_3_4),
	.ch6_coeff_3_5(ch6_coeff_3_5),
	.ch6_coeff_3_6(ch6_coeff_3_6),
	.ch6_coeff_3_7(ch6_coeff_3_7),
	.ch6_coeff_3_8(ch6_coeff_3_8),
	.ch6_coeff_3_9(ch6_coeff_3_9),
	.ch6_coeff_3_10(ch6_coeff_3_10),
	.ch6_mean3(ch6_neg_mean_3),
	.ch6_std3(ch6_recip_stdev_3),
	.ch6_coeff_4_0(ch6_coeff_4_0),
	.ch6_coeff_4_1(ch6_coeff_4_1),
	.ch6_coeff_4_2(ch6_coeff_4_2),
	.ch6_coeff_4_3(ch6_coeff_4_3),
	.ch6_coeff_4_4(ch6_coeff_4_4),
	.ch6_coeff_4_5(ch6_coeff_4_5),
	.ch6_coeff_4_6(ch6_coeff_4_6),
	.ch6_coeff_4_7(ch6_coeff_4_7),
	.ch6_coeff_4_8(ch6_coeff_4_8),
	.ch6_coeff_4_9(ch6_coeff_4_9),
	.ch6_coeff_4_10(ch6_coeff_4_10),
	.ch6_mean4(ch6_neg_mean_4),
	.ch6_std4(ch6_recip_stdev_4),
	.ch7_coeff_1_0(ch7_coeff_1_0),
	.ch7_coeff_1_1(ch7_coeff_1_1),
	.ch7_coeff_1_2(ch7_coeff_1_2),
	.ch7_coeff_1_3(ch7_coeff_1_3),
	.ch7_coeff_1_4(ch7_coeff_1_4),
	.ch7_coeff_1_5(ch7_coeff_1_5),
	.ch7_coeff_1_6(ch7_coeff_1_6),
	.ch7_coeff_1_7(ch7_coeff_1_7),
	.ch7_coeff_1_8(ch7_coeff_1_8),
	.ch7_coeff_1_9(ch7_coeff_1_9),
	.ch7_coeff_1_10(ch7_coeff_1_10),
	.ch7_mean1(ch7_neg_mean_1),
	.ch7_std1(ch7_recip_stdev_1),
	.ch7_coeff_2_0(ch7_coeff_2_0),
	.ch7_coeff_2_1(ch7_coeff_2_1),
	.ch7_coeff_2_2(ch7_coeff_2_2),
	.ch7_coeff_2_3(ch7_coeff_2_3),
	.ch7_coeff_2_4(ch7_coeff_2_4),
	.ch7_coeff_2_5(ch7_coeff_2_5),
	.ch7_coeff_2_6(ch7_coeff_2_6),
	.ch7_coeff_2_7(ch7_coeff_2_7),
	.ch7_coeff_2_8(ch7_coeff_2_8),
	.ch7_coeff_2_9(ch7_coeff_2_9),
	.ch7_coeff_2_10(ch7_coeff_2_10),
	.ch7_mean2(ch7_neg_mean_2),
	.ch7_std2(ch7_recip_stdev_2),
	.ch7_coeff_3_0(ch7_coeff_3_0),
	.ch7_coeff_3_1(ch7_coeff_3_1),
	.ch7_coeff_3_2(ch7_coeff_3_2),
	.ch7_coeff_3_3(ch7_coeff_3_3),
	.ch7_coeff_3_4(ch7_coeff_3_4),
	.ch7_coeff_3_5(ch7_coeff_3_5),
	.ch7_coeff_3_6(ch7_coeff_3_6),
	.ch7_coeff_3_7(ch7_coeff_3_7),
	.ch7_coeff_3_8(ch7_coeff_3_8),
	.ch7_coeff_3_9(ch7_coeff_3_9),
	.ch7_coeff_3_10(ch7_coeff_3_10),
	.ch7_mean3(ch7_neg_mean_3),
	.ch7_std3(ch7_recip_stdev_3),
	.ch7_coeff_4_0(ch7_coeff_4_0),
	.ch7_coeff_4_1(ch7_coeff_4_1),
	.ch7_coeff_4_2(ch7_coeff_4_2),
	.ch7_coeff_4_3(ch7_coeff_4_3),
	.ch7_coeff_4_4(ch7_coeff_4_4),
	.ch7_coeff_4_5(ch7_coeff_4_5),
	.ch7_coeff_4_6(ch7_coeff_4_6),
	.ch7_coeff_4_7(ch7_coeff_4_7),
	.ch7_coeff_4_8(ch7_coeff_4_8),
	.ch7_coeff_4_9(ch7_coeff_4_9),
	.ch7_coeff_4_10(ch7_coeff_4_10),
	.ch7_mean4(ch7_neg_mean_4),
	.ch7_std4(ch7_recip_stdev_4),
	.ch8_coeff_1_0(ch8_coeff_1_0),
	.ch8_coeff_1_1(ch8_coeff_1_1),
	.ch8_coeff_1_2(ch8_coeff_1_2),
	.ch8_coeff_1_3(ch8_coeff_1_3),
	.ch8_coeff_1_4(ch8_coeff_1_4),
	.ch8_coeff_1_5(ch8_coeff_1_5),
	.ch8_coeff_1_6(ch8_coeff_1_6),
	.ch8_coeff_1_7(ch8_coeff_1_7),
	.ch8_coeff_1_8(ch8_coeff_1_8),
	.ch8_coeff_1_9(ch8_coeff_1_9),
	.ch8_coeff_1_10(ch8_coeff_1_10),
	.ch8_mean1(ch8_neg_mean_1),
	.ch8_std1(ch8_recip_stdev_1),
	.ch8_coeff_2_0(ch8_coeff_2_0),
	.ch8_coeff_2_1(ch8_coeff_2_1),
	.ch8_coeff_2_2(ch8_coeff_2_2),
	.ch8_coeff_2_3(ch8_coeff_2_3),
	.ch8_coeff_2_4(ch8_coeff_2_4),
	.ch8_coeff_2_5(ch8_coeff_2_5),
	.ch8_coeff_2_6(ch8_coeff_2_6),
	.ch8_coeff_2_7(ch8_coeff_2_7),
	.ch8_coeff_2_8(ch8_coeff_2_8),
	.ch8_coeff_2_9(ch8_coeff_2_9),
	.ch8_coeff_2_10(ch8_coeff_2_10),
	.ch8_mean2(ch8_neg_mean_2),
	.ch8_std2(ch8_recip_stdev_2),
	.ch8_coeff_3_0(ch8_coeff_3_0),
	.ch8_coeff_3_1(ch8_coeff_3_1),
	.ch8_coeff_3_2(ch8_coeff_3_2),
	.ch8_coeff_3_3(ch8_coeff_3_3),
	.ch8_coeff_3_4(ch8_coeff_3_4),
	.ch8_coeff_3_5(ch8_coeff_3_5),
	.ch8_coeff_3_6(ch8_coeff_3_6),
	.ch8_coeff_3_7(ch8_coeff_3_7),
	.ch8_coeff_3_8(ch8_coeff_3_8),
	.ch8_coeff_3_9(ch8_coeff_3_9),
	.ch8_coeff_3_10(ch8_coeff_3_10),
	.ch8_mean3(ch8_neg_mean_3),
	.ch8_std3(ch8_recip_stdev_3),
	.ch8_coeff_4_0(ch8_coeff_4_0),
	.ch8_coeff_4_1(ch8_coeff_4_1),
	.ch8_coeff_4_2(ch8_coeff_4_2),
	.ch8_coeff_4_3(ch8_coeff_4_3),
	.ch8_coeff_4_4(ch8_coeff_4_4),
	.ch8_coeff_4_5(ch8_coeff_4_5),
	.ch8_coeff_4_6(ch8_coeff_4_6),
	.ch8_coeff_4_7(ch8_coeff_4_7),
	.ch8_coeff_4_8(ch8_coeff_4_8),
	.ch8_coeff_4_9(ch8_coeff_4_9),
	.ch8_coeff_4_10(ch8_coeff_4_10),
	.ch8_mean4(ch8_neg_mean_4),
	.ch8_std4(ch8_recip_stdev_4),
	.ch9_coeff_1_0(ch9_coeff_1_0),
	.ch9_coeff_1_1(ch9_coeff_1_1),
	.ch9_coeff_1_2(ch9_coeff_1_2),
	.ch9_coeff_1_3(ch9_coeff_1_3),
	.ch9_coeff_1_4(ch9_coeff_1_4),
	.ch9_coeff_1_5(ch9_coeff_1_5),
	.ch9_coeff_1_6(ch9_coeff_1_6),
	.ch9_coeff_1_7(ch9_coeff_1_7),
	.ch9_coeff_1_8(ch9_coeff_1_8),
	.ch9_coeff_1_9(ch9_coeff_1_9),
	.ch9_coeff_1_10(ch9_coeff_1_10),
	.ch9_mean1(ch9_neg_mean_1),
	.ch9_std1(ch9_recip_stdev_1),
	.ch9_coeff_2_0(ch9_coeff_2_0),
	.ch9_coeff_2_1(ch9_coeff_2_1),
	.ch9_coeff_2_2(ch9_coeff_2_2),
	.ch9_coeff_2_3(ch9_coeff_2_3),
	.ch9_coeff_2_4(ch9_coeff_2_4),
	.ch9_coeff_2_5(ch9_coeff_2_5),
	.ch9_coeff_2_6(ch9_coeff_2_6),
	.ch9_coeff_2_7(ch9_coeff_2_7),
	.ch9_coeff_2_8(ch9_coeff_2_8),
	.ch9_coeff_2_9(ch9_coeff_2_9),
	.ch9_coeff_2_10(ch9_coeff_2_10),
	.ch9_mean2(ch9_neg_mean_2),
	.ch9_std2(ch9_recip_stdev_2),
	.ch9_coeff_3_0(ch9_coeff_3_0),
	.ch9_coeff_3_1(ch9_coeff_3_1),
	.ch9_coeff_3_2(ch9_coeff_3_2),
	.ch9_coeff_3_3(ch9_coeff_3_3),
	.ch9_coeff_3_4(ch9_coeff_3_4),
	.ch9_coeff_3_5(ch9_coeff_3_5),
	.ch9_coeff_3_6(ch9_coeff_3_6),
	.ch9_coeff_3_7(ch9_coeff_3_7),
	.ch9_coeff_3_8(ch9_coeff_3_8),
	.ch9_coeff_3_9(ch9_coeff_3_9),
	.ch9_coeff_3_10(ch9_coeff_3_10),
	.ch9_mean3(ch9_neg_mean_3),
	.ch9_std3(ch9_recip_stdev_3),
	.ch9_coeff_4_0(ch9_coeff_4_0),
	.ch9_coeff_4_1(ch9_coeff_4_1),
	.ch9_coeff_4_2(ch9_coeff_4_2),
	.ch9_coeff_4_3(ch9_coeff_4_3),
	.ch9_coeff_4_4(ch9_coeff_4_4),
	.ch9_coeff_4_5(ch9_coeff_4_5),
	.ch9_coeff_4_6(ch9_coeff_4_6),
	.ch9_coeff_4_7(ch9_coeff_4_7),
	.ch9_coeff_4_8(ch9_coeff_4_8),
	.ch9_coeff_4_9(ch9_coeff_4_9),
	.ch9_coeff_4_10(ch9_coeff_4_10),
	.ch9_mean4(ch9_neg_mean_4),
	.ch9_std4(ch9_recip_stdev_4),
	.ch10_coeff_1_0(ch10_coeff_1_0),
	.ch10_coeff_1_1(ch10_coeff_1_1),
	.ch10_coeff_1_2(ch10_coeff_1_2),
	.ch10_coeff_1_3(ch10_coeff_1_3),
	.ch10_coeff_1_4(ch10_coeff_1_4),
	.ch10_coeff_1_5(ch10_coeff_1_5),
	.ch10_coeff_1_6(ch10_coeff_1_6),
	.ch10_coeff_1_7(ch10_coeff_1_7),
	.ch10_coeff_1_8(ch10_coeff_1_8),
	.ch10_coeff_1_9(ch10_coeff_1_9),
	.ch10_coeff_1_10(ch10_coeff_1_10),
	.ch10_mean1(ch10_neg_mean_1),
	.ch10_std1(ch10_recip_stdev_1),
	.ch10_coeff_2_0(ch10_coeff_2_0),
	.ch10_coeff_2_1(ch10_coeff_2_1),
	.ch10_coeff_2_2(ch10_coeff_2_2),
	.ch10_coeff_2_3(ch10_coeff_2_3),
	.ch10_coeff_2_4(ch10_coeff_2_4),
	.ch10_coeff_2_5(ch10_coeff_2_5),
	.ch10_coeff_2_6(ch10_coeff_2_6),
	.ch10_coeff_2_7(ch10_coeff_2_7),
	.ch10_coeff_2_8(ch10_coeff_2_8),
	.ch10_coeff_2_9(ch10_coeff_2_9),
	.ch10_coeff_2_10(ch10_coeff_2_10),
	.ch10_mean2(ch10_neg_mean_2),
	.ch10_std2(ch10_recip_stdev_2),
	.ch10_coeff_3_0(ch10_coeff_3_0),
	.ch10_coeff_3_1(ch10_coeff_3_1),
	.ch10_coeff_3_2(ch10_coeff_3_2),
	.ch10_coeff_3_3(ch10_coeff_3_3),
	.ch10_coeff_3_4(ch10_coeff_3_4),
	.ch10_coeff_3_5(ch10_coeff_3_5),
	.ch10_coeff_3_6(ch10_coeff_3_6),
	.ch10_coeff_3_7(ch10_coeff_3_7),
	.ch10_coeff_3_8(ch10_coeff_3_8),
	.ch10_coeff_3_9(ch10_coeff_3_9),
	.ch10_coeff_3_10(ch10_coeff_3_10),
	.ch10_mean3(ch10_neg_mean_3),
	.ch10_std3(ch10_recip_stdev_3),
	.ch10_coeff_4_0(ch10_coeff_4_0),
	.ch10_coeff_4_1(ch10_coeff_4_1),
	.ch10_coeff_4_2(ch10_coeff_4_2),
	.ch10_coeff_4_3(ch10_coeff_4_3),
	.ch10_coeff_4_4(ch10_coeff_4_4),
	.ch10_coeff_4_5(ch10_coeff_4_5),
	.ch10_coeff_4_6(ch10_coeff_4_6),
	.ch10_coeff_4_7(ch10_coeff_4_7),
	.ch10_coeff_4_8(ch10_coeff_4_8),
	.ch10_coeff_4_9(ch10_coeff_4_9),
	.ch10_coeff_4_10(ch10_coeff_4_10),
	.ch10_mean4(ch10_neg_mean_4),
	.ch10_std4(ch10_recip_stdev_4),
	.ch11_coeff_1_0(ch11_coeff_1_0),
	.ch11_coeff_1_1(ch11_coeff_1_1),
	.ch11_coeff_1_2(ch11_coeff_1_2),
	.ch11_coeff_1_3(ch11_coeff_1_3),
	.ch11_coeff_1_4(ch11_coeff_1_4),
	.ch11_coeff_1_5(ch11_coeff_1_5),
	.ch11_coeff_1_6(ch11_coeff_1_6),
	.ch11_coeff_1_7(ch11_coeff_1_7),
	.ch11_coeff_1_8(ch11_coeff_1_8),
	.ch11_coeff_1_9(ch11_coeff_1_9),
	.ch11_coeff_1_10(ch11_coeff_1_10),
	.ch11_mean1(ch11_neg_mean_1),
	.ch11_std1(ch11_recip_stdev_1),
	.ch11_coeff_2_0(ch11_coeff_2_0),
	.ch11_coeff_2_1(ch11_coeff_2_1),
	.ch11_coeff_2_2(ch11_coeff_2_2),
	.ch11_coeff_2_3(ch11_coeff_2_3),
	.ch11_coeff_2_4(ch11_coeff_2_4),
	.ch11_coeff_2_5(ch11_coeff_2_5),
	.ch11_coeff_2_6(ch11_coeff_2_6),
	.ch11_coeff_2_7(ch11_coeff_2_7),
	.ch11_coeff_2_8(ch11_coeff_2_8),
	.ch11_coeff_2_9(ch11_coeff_2_9),
	.ch11_coeff_2_10(ch11_coeff_2_10),
	.ch11_mean2(ch11_neg_mean_2),
	.ch11_std2(ch11_recip_stdev_2),
	.ch11_coeff_3_0(ch11_coeff_3_0),
	.ch11_coeff_3_1(ch11_coeff_3_1),
	.ch11_coeff_3_2(ch11_coeff_3_2),
	.ch11_coeff_3_3(ch11_coeff_3_3),
	.ch11_coeff_3_4(ch11_coeff_3_4),
	.ch11_coeff_3_5(ch11_coeff_3_5),
	.ch11_coeff_3_6(ch11_coeff_3_6),
	.ch11_coeff_3_7(ch11_coeff_3_7),
	.ch11_coeff_3_8(ch11_coeff_3_8),
	.ch11_coeff_3_9(ch11_coeff_3_9),
	.ch11_coeff_3_10(ch11_coeff_3_10),
	.ch11_mean3(ch11_neg_mean_3),
	.ch11_std3(ch11_recip_stdev_3),
	.ch11_coeff_4_0(ch11_coeff_4_0),
	.ch11_coeff_4_1(ch11_coeff_4_1),
	.ch11_coeff_4_2(ch11_coeff_4_2),
	.ch11_coeff_4_3(ch11_coeff_4_3),
	.ch11_coeff_4_4(ch11_coeff_4_4),
	.ch11_coeff_4_5(ch11_coeff_4_5),
	.ch11_coeff_4_6(ch11_coeff_4_6),
	.ch11_coeff_4_7(ch11_coeff_4_7),
	.ch11_coeff_4_8(ch11_coeff_4_8),
	.ch11_coeff_4_9(ch11_coeff_4_9),
	.ch11_coeff_4_10(ch11_coeff_4_10),
	.ch11_mean4(ch11_neg_mean_4),
	.ch11_std4(ch11_recip_stdev_4),
	.ch12_coeff_1_0(ch12_coeff_1_0),
	.ch12_coeff_1_1(ch12_coeff_1_1),
	.ch12_coeff_1_2(ch12_coeff_1_2),
	.ch12_coeff_1_3(ch12_coeff_1_3),
	.ch12_coeff_1_4(ch12_coeff_1_4),
	.ch12_coeff_1_5(ch12_coeff_1_5),
	.ch12_coeff_1_6(ch12_coeff_1_6),
	.ch12_coeff_1_7(ch12_coeff_1_7),
	.ch12_coeff_1_8(ch12_coeff_1_8),
	.ch12_coeff_1_9(ch12_coeff_1_9),
	.ch12_coeff_1_10(ch12_coeff_1_10),
	.ch12_mean1(ch12_neg_mean_1),
	.ch12_std1(ch12_recip_stdev_1),
	.ch12_coeff_2_0(ch12_coeff_2_0),
	.ch12_coeff_2_1(ch12_coeff_2_1),
	.ch12_coeff_2_2(ch12_coeff_2_2),
	.ch12_coeff_2_3(ch12_coeff_2_3),
	.ch12_coeff_2_4(ch12_coeff_2_4),
	.ch12_coeff_2_5(ch12_coeff_2_5),
	.ch12_coeff_2_6(ch12_coeff_2_6),
	.ch12_coeff_2_7(ch12_coeff_2_7),
	.ch12_coeff_2_8(ch12_coeff_2_8),
	.ch12_coeff_2_9(ch12_coeff_2_9),
	.ch12_coeff_2_10(ch12_coeff_2_10),
	.ch12_mean2(ch12_neg_mean_2),
	.ch12_std2(ch12_recip_stdev_2),
	.ch12_coeff_3_0(ch12_coeff_3_0),
	.ch12_coeff_3_1(ch12_coeff_3_1),
	.ch12_coeff_3_2(ch12_coeff_3_2),
	.ch12_coeff_3_3(ch12_coeff_3_3),
	.ch12_coeff_3_4(ch12_coeff_3_4),
	.ch12_coeff_3_5(ch12_coeff_3_5),
	.ch12_coeff_3_6(ch12_coeff_3_6),
	.ch12_coeff_3_7(ch12_coeff_3_7),
	.ch12_coeff_3_8(ch12_coeff_3_8),
	.ch12_coeff_3_9(ch12_coeff_3_9),
	.ch12_coeff_3_10(ch12_coeff_3_10),
	.ch12_mean3(ch12_neg_mean_3),
	.ch12_std3(ch12_recip_stdev_3),
	.ch12_coeff_4_0(ch12_coeff_4_0),
	.ch12_coeff_4_1(ch12_coeff_4_1),
	.ch12_coeff_4_2(ch12_coeff_4_2),
	.ch12_coeff_4_3(ch12_coeff_4_3),
	.ch12_coeff_4_4(ch12_coeff_4_4),
	.ch12_coeff_4_5(ch12_coeff_4_5),
	.ch12_coeff_4_6(ch12_coeff_4_6),
	.ch12_coeff_4_7(ch12_coeff_4_7),
	.ch12_coeff_4_8(ch12_coeff_4_8),
	.ch12_coeff_4_9(ch12_coeff_4_9),
	.ch12_coeff_4_10(ch12_coeff_4_10),
	.ch12_mean4(ch12_neg_mean_4),
	.ch12_std4(ch12_recip_stdev_4),
	.ch13_coeff_1_0(ch13_coeff_1_0),
	.ch13_coeff_1_1(ch13_coeff_1_1),
	.ch13_coeff_1_2(ch13_coeff_1_2),
	.ch13_coeff_1_3(ch13_coeff_1_3),
	.ch13_coeff_1_4(ch13_coeff_1_4),
	.ch13_coeff_1_5(ch13_coeff_1_5),
	.ch13_coeff_1_6(ch13_coeff_1_6),
	.ch13_coeff_1_7(ch13_coeff_1_7),
	.ch13_coeff_1_8(ch13_coeff_1_8),
	.ch13_coeff_1_9(ch13_coeff_1_9),
	.ch13_coeff_1_10(ch13_coeff_1_10),
	.ch13_mean1(ch13_neg_mean_1),
	.ch13_std1(ch13_recip_stdev_1),
	.ch13_coeff_2_0(ch13_coeff_2_0),
	.ch13_coeff_2_1(ch13_coeff_2_1),
	.ch13_coeff_2_2(ch13_coeff_2_2),
	.ch13_coeff_2_3(ch13_coeff_2_3),
	.ch13_coeff_2_4(ch13_coeff_2_4),
	.ch13_coeff_2_5(ch13_coeff_2_5),
	.ch13_coeff_2_6(ch13_coeff_2_6),
	.ch13_coeff_2_7(ch13_coeff_2_7),
	.ch13_coeff_2_8(ch13_coeff_2_8),
	.ch13_coeff_2_9(ch13_coeff_2_9),
	.ch13_coeff_2_10(ch13_coeff_2_10),
	.ch13_mean2(ch13_neg_mean_2),
	.ch13_std2(ch13_recip_stdev_2),
	.ch13_coeff_3_0(ch13_coeff_3_0),
	.ch13_coeff_3_1(ch13_coeff_3_1),
	.ch13_coeff_3_2(ch13_coeff_3_2),
	.ch13_coeff_3_3(ch13_coeff_3_3),
	.ch13_coeff_3_4(ch13_coeff_3_4),
	.ch13_coeff_3_5(ch13_coeff_3_5),
	.ch13_coeff_3_6(ch13_coeff_3_6),
	.ch13_coeff_3_7(ch13_coeff_3_7),
	.ch13_coeff_3_8(ch13_coeff_3_8),
	.ch13_coeff_3_9(ch13_coeff_3_9),
	.ch13_coeff_3_10(ch13_coeff_3_10),
	.ch13_mean3(ch13_neg_mean_3),
	.ch13_std3(ch13_recip_stdev_3),
	.ch13_coeff_4_0(ch13_coeff_4_0),
	.ch13_coeff_4_1(ch13_coeff_4_1),
	.ch13_coeff_4_2(ch13_coeff_4_2),
	.ch13_coeff_4_3(ch13_coeff_4_3),
	.ch13_coeff_4_4(ch13_coeff_4_4),
	.ch13_coeff_4_5(ch13_coeff_4_5),
	.ch13_coeff_4_6(ch13_coeff_4_6),
	.ch13_coeff_4_7(ch13_coeff_4_7),
	.ch13_coeff_4_8(ch13_coeff_4_8),
	.ch13_coeff_4_9(ch13_coeff_4_9),
	.ch13_coeff_4_10(ch13_coeff_4_10),
	.ch13_mean4(ch13_neg_mean_4),
	.ch13_std4(ch13_recip_stdev_4),
	.ch14_coeff_1_0(ch14_coeff_1_0),
	.ch14_coeff_1_1(ch14_coeff_1_1),
	.ch14_coeff_1_2(ch14_coeff_1_2),
	.ch14_coeff_1_3(ch14_coeff_1_3),
	.ch14_coeff_1_4(ch14_coeff_1_4),
	.ch14_coeff_1_5(ch14_coeff_1_5),
	.ch14_coeff_1_6(ch14_coeff_1_6),
	.ch14_coeff_1_7(ch14_coeff_1_7),
	.ch14_coeff_1_8(ch14_coeff_1_8),
	.ch14_coeff_1_9(ch14_coeff_1_9),
	.ch14_coeff_1_10(ch14_coeff_1_10),
	.ch14_mean1(ch14_neg_mean_1),
	.ch14_std1(ch14_recip_stdev_1),
	.ch14_coeff_2_0(ch14_coeff_2_0),
	.ch14_coeff_2_1(ch14_coeff_2_1),
	.ch14_coeff_2_2(ch14_coeff_2_2),
	.ch14_coeff_2_3(ch14_coeff_2_3),
	.ch14_coeff_2_4(ch14_coeff_2_4),
	.ch14_coeff_2_5(ch14_coeff_2_5),
	.ch14_coeff_2_6(ch14_coeff_2_6),
	.ch14_coeff_2_7(ch14_coeff_2_7),
	.ch14_coeff_2_8(ch14_coeff_2_8),
	.ch14_coeff_2_9(ch14_coeff_2_9),
	.ch14_coeff_2_10(ch14_coeff_2_10),
	.ch14_mean2(ch14_neg_mean_2),
	.ch14_std2(ch14_recip_stdev_2),
	.ch14_coeff_3_0(ch14_coeff_3_0),
	.ch14_coeff_3_1(ch14_coeff_3_1),
	.ch14_coeff_3_2(ch14_coeff_3_2),
	.ch14_coeff_3_3(ch14_coeff_3_3),
	.ch14_coeff_3_4(ch14_coeff_3_4),
	.ch14_coeff_3_5(ch14_coeff_3_5),
	.ch14_coeff_3_6(ch14_coeff_3_6),
	.ch14_coeff_3_7(ch14_coeff_3_7),
	.ch14_coeff_3_8(ch14_coeff_3_8),
	.ch14_coeff_3_9(ch14_coeff_3_9),
	.ch14_coeff_3_10(ch14_coeff_3_10),
	.ch14_mean3(ch14_neg_mean_3),
	.ch14_std3(ch14_recip_stdev_3),
	.ch14_coeff_4_0(ch14_coeff_4_0),
	.ch14_coeff_4_1(ch14_coeff_4_1),
	.ch14_coeff_4_2(ch14_coeff_4_2),
	.ch14_coeff_4_3(ch14_coeff_4_3),
	.ch14_coeff_4_4(ch14_coeff_4_4),
	.ch14_coeff_4_5(ch14_coeff_4_5),
	.ch14_coeff_4_6(ch14_coeff_4_6),
	.ch14_coeff_4_7(ch14_coeff_4_7),
	.ch14_coeff_4_8(ch14_coeff_4_8),
	.ch14_coeff_4_9(ch14_coeff_4_9),
	.ch14_coeff_4_10(ch14_coeff_4_10),
	.ch14_mean4(ch14_neg_mean_4),
	.ch14_std4(ch14_recip_stdev_4),
	.ch15_coeff_1_0(ch15_coeff_1_0),
	.ch15_coeff_1_1(ch15_coeff_1_1),
	.ch15_coeff_1_2(ch15_coeff_1_2),
	.ch15_coeff_1_3(ch15_coeff_1_3),
	.ch15_coeff_1_4(ch15_coeff_1_4),
	.ch15_coeff_1_5(ch15_coeff_1_5),
	.ch15_coeff_1_6(ch15_coeff_1_6),
	.ch15_coeff_1_7(ch15_coeff_1_7),
	.ch15_coeff_1_8(ch15_coeff_1_8),
	.ch15_coeff_1_9(ch15_coeff_1_9),
	.ch15_coeff_1_10(ch15_coeff_1_10),
	.ch15_mean1(ch15_neg_mean_1),
	.ch15_std1(ch15_recip_stdev_1),
	.ch15_coeff_2_0(ch15_coeff_2_0),
	.ch15_coeff_2_1(ch15_coeff_2_1),
	.ch15_coeff_2_2(ch15_coeff_2_2),
	.ch15_coeff_2_3(ch15_coeff_2_3),
	.ch15_coeff_2_4(ch15_coeff_2_4),
	.ch15_coeff_2_5(ch15_coeff_2_5),
	.ch15_coeff_2_6(ch15_coeff_2_6),
	.ch15_coeff_2_7(ch15_coeff_2_7),
	.ch15_coeff_2_8(ch15_coeff_2_8),
	.ch15_coeff_2_9(ch15_coeff_2_9),
	.ch15_coeff_2_10(ch15_coeff_2_10),
	.ch15_mean2(ch15_neg_mean_2),
	.ch15_std2(ch15_recip_stdev_2),
	.ch15_coeff_3_0(ch15_coeff_3_0),
	.ch15_coeff_3_1(ch15_coeff_3_1),
	.ch15_coeff_3_2(ch15_coeff_3_2),
	.ch15_coeff_3_3(ch15_coeff_3_3),
	.ch15_coeff_3_4(ch15_coeff_3_4),
	.ch15_coeff_3_5(ch15_coeff_3_5),
	.ch15_coeff_3_6(ch15_coeff_3_6),
	.ch15_coeff_3_7(ch15_coeff_3_7),
	.ch15_coeff_3_8(ch15_coeff_3_8),
	.ch15_coeff_3_9(ch15_coeff_3_9),
	.ch15_coeff_3_10(ch15_coeff_3_10),
	.ch15_mean3(ch15_neg_mean_3),
	.ch15_std3(ch15_recip_stdev_3),
	.ch15_coeff_4_0(ch15_coeff_4_0),
	.ch15_coeff_4_1(ch15_coeff_4_1),
	.ch15_coeff_4_2(ch15_coeff_4_2),
	.ch15_coeff_4_3(ch15_coeff_4_3),
	.ch15_coeff_4_4(ch15_coeff_4_4),
	.ch15_coeff_4_5(ch15_coeff_4_5),
	.ch15_coeff_4_6(ch15_coeff_4_6),
	.ch15_coeff_4_7(ch15_coeff_4_7),
	.ch15_coeff_4_8(ch15_coeff_4_8),
	.ch15_coeff_4_9(ch15_coeff_4_9),
	.ch15_coeff_4_10(ch15_coeff_4_10),
	.ch15_mean4(ch15_neg_mean_4),
	.ch15_std4(ch15_recip_stdev_4),
	.ch16_coeff_1_0(ch16_coeff_1_0),
	.ch16_coeff_1_1(ch16_coeff_1_1),
	.ch16_coeff_1_2(ch16_coeff_1_2),
	.ch16_coeff_1_3(ch16_coeff_1_3),
	.ch16_coeff_1_4(ch16_coeff_1_4),
	.ch16_coeff_1_5(ch16_coeff_1_5),
	.ch16_coeff_1_6(ch16_coeff_1_6),
	.ch16_coeff_1_7(ch16_coeff_1_7),
	.ch16_coeff_1_8(ch16_coeff_1_8),
	.ch16_coeff_1_9(ch16_coeff_1_9),
	.ch16_coeff_1_10(ch16_coeff_1_10),
	.ch16_mean1(ch16_neg_mean_1),
	.ch16_std1(ch16_recip_stdev_1),
	.ch16_coeff_2_0(ch16_coeff_2_0),
	.ch16_coeff_2_1(ch16_coeff_2_1),
	.ch16_coeff_2_2(ch16_coeff_2_2),
	.ch16_coeff_2_3(ch16_coeff_2_3),
	.ch16_coeff_2_4(ch16_coeff_2_4),
	.ch16_coeff_2_5(ch16_coeff_2_5),
	.ch16_coeff_2_6(ch16_coeff_2_6),
	.ch16_coeff_2_7(ch16_coeff_2_7),
	.ch16_coeff_2_8(ch16_coeff_2_8),
	.ch16_coeff_2_9(ch16_coeff_2_9),
	.ch16_coeff_2_10(ch16_coeff_2_10),
	.ch16_mean2(ch16_neg_mean_2),
	.ch16_std2(ch16_recip_stdev_2),
	.ch16_coeff_3_0(ch16_coeff_3_0),
	.ch16_coeff_3_1(ch16_coeff_3_1),
	.ch16_coeff_3_2(ch16_coeff_3_2),
	.ch16_coeff_3_3(ch16_coeff_3_3),
	.ch16_coeff_3_4(ch16_coeff_3_4),
	.ch16_coeff_3_5(ch16_coeff_3_5),
	.ch16_coeff_3_6(ch16_coeff_3_6),
	.ch16_coeff_3_7(ch16_coeff_3_7),
	.ch16_coeff_3_8(ch16_coeff_3_8),
	.ch16_coeff_3_9(ch16_coeff_3_9),
	.ch16_coeff_3_10(ch16_coeff_3_10),
	.ch16_mean3(ch16_neg_mean_3),
	.ch16_std3(ch16_recip_stdev_3),
	.ch16_coeff_4_0(ch16_coeff_4_0),
	.ch16_coeff_4_1(ch16_coeff_4_1),
	.ch16_coeff_4_2(ch16_coeff_4_2),
	.ch16_coeff_4_3(ch16_coeff_4_3),
	.ch16_coeff_4_4(ch16_coeff_4_4),
	.ch16_coeff_4_5(ch16_coeff_4_5),
	.ch16_coeff_4_6(ch16_coeff_4_6),
	.ch16_coeff_4_7(ch16_coeff_4_7),
	.ch16_coeff_4_8(ch16_coeff_4_8),
	.ch16_coeff_4_9(ch16_coeff_4_9),
	.ch16_coeff_4_10(ch16_coeff_4_10),
	.ch16_mean4(ch16_neg_mean_4),
	.ch16_std4(ch16_recip_stdev_4),
	.ch17_coeff_1_0(ch17_coeff_1_0),
	.ch17_coeff_1_1(ch17_coeff_1_1),
	.ch17_coeff_1_2(ch17_coeff_1_2),
	.ch17_coeff_1_3(ch17_coeff_1_3),
	.ch17_coeff_1_4(ch17_coeff_1_4),
	.ch17_coeff_1_5(ch17_coeff_1_5),
	.ch17_coeff_1_6(ch17_coeff_1_6),
	.ch17_coeff_1_7(ch17_coeff_1_7),
	.ch17_coeff_1_8(ch17_coeff_1_8),
	.ch17_coeff_1_9(ch17_coeff_1_9),
	.ch17_coeff_1_10(ch17_coeff_1_10),
	.ch17_mean1(ch17_neg_mean_1),
	.ch17_std1(ch17_recip_stdev_1),
	.ch17_coeff_2_0(ch17_coeff_2_0),
	.ch17_coeff_2_1(ch17_coeff_2_1),
	.ch17_coeff_2_2(ch17_coeff_2_2),
	.ch17_coeff_2_3(ch17_coeff_2_3),
	.ch17_coeff_2_4(ch17_coeff_2_4),
	.ch17_coeff_2_5(ch17_coeff_2_5),
	.ch17_coeff_2_6(ch17_coeff_2_6),
	.ch17_coeff_2_7(ch17_coeff_2_7),
	.ch17_coeff_2_8(ch17_coeff_2_8),
	.ch17_coeff_2_9(ch17_coeff_2_9),
	.ch17_coeff_2_10(ch17_coeff_2_10),
	.ch17_mean2(ch17_neg_mean_2),
	.ch17_std2(ch17_recip_stdev_2),
	.ch17_coeff_3_0(ch17_coeff_3_0),
	.ch17_coeff_3_1(ch17_coeff_3_1),
	.ch17_coeff_3_2(ch17_coeff_3_2),
	.ch17_coeff_3_3(ch17_coeff_3_3),
	.ch17_coeff_3_4(ch17_coeff_3_4),
	.ch17_coeff_3_5(ch17_coeff_3_5),
	.ch17_coeff_3_6(ch17_coeff_3_6),
	.ch17_coeff_3_7(ch17_coeff_3_7),
	.ch17_coeff_3_8(ch17_coeff_3_8),
	.ch17_coeff_3_9(ch17_coeff_3_9),
	.ch17_coeff_3_10(ch17_coeff_3_10),
	.ch17_mean3(ch17_neg_mean_3),
	.ch17_std3(ch17_recip_stdev_3),
	.ch17_coeff_4_0(ch17_coeff_4_0),
	.ch17_coeff_4_1(ch17_coeff_4_1),
	.ch17_coeff_4_2(ch17_coeff_4_2),
	.ch17_coeff_4_3(ch17_coeff_4_3),
	.ch17_coeff_4_4(ch17_coeff_4_4),
	.ch17_coeff_4_5(ch17_coeff_4_5),
	.ch17_coeff_4_6(ch17_coeff_4_6),
	.ch17_coeff_4_7(ch17_coeff_4_7),
	.ch17_coeff_4_8(ch17_coeff_4_8),
	.ch17_coeff_4_9(ch17_coeff_4_9),
	.ch17_coeff_4_10(ch17_coeff_4_10),
	.ch17_mean4(ch17_neg_mean_4),
	.ch17_std4(ch17_recip_stdev_4),
	.ch18_coeff_1_0(ch18_coeff_1_0),
	.ch18_coeff_1_1(ch18_coeff_1_1),
	.ch18_coeff_1_2(ch18_coeff_1_2),
	.ch18_coeff_1_3(ch18_coeff_1_3),
	.ch18_coeff_1_4(ch18_coeff_1_4),
	.ch18_coeff_1_5(ch18_coeff_1_5),
	.ch18_coeff_1_6(ch18_coeff_1_6),
	.ch18_coeff_1_7(ch18_coeff_1_7),
	.ch18_coeff_1_8(ch18_coeff_1_8),
	.ch18_coeff_1_9(ch18_coeff_1_9),
	.ch18_coeff_1_10(ch18_coeff_1_10),
	.ch18_mean1(ch18_neg_mean_1),
	.ch18_std1(ch18_recip_stdev_1),
	.ch18_coeff_2_0(ch18_coeff_2_0),
	.ch18_coeff_2_1(ch18_coeff_2_1),
	.ch18_coeff_2_2(ch18_coeff_2_2),
	.ch18_coeff_2_3(ch18_coeff_2_3),
	.ch18_coeff_2_4(ch18_coeff_2_4),
	.ch18_coeff_2_5(ch18_coeff_2_5),
	.ch18_coeff_2_6(ch18_coeff_2_6),
	.ch18_coeff_2_7(ch18_coeff_2_7),
	.ch18_coeff_2_8(ch18_coeff_2_8),
	.ch18_coeff_2_9(ch18_coeff_2_9),
	.ch18_coeff_2_10(ch18_coeff_2_10),
	.ch18_mean2(ch18_neg_mean_2),
	.ch18_std2(ch18_recip_stdev_2),
	.ch18_coeff_3_0(ch18_coeff_3_0),
	.ch18_coeff_3_1(ch18_coeff_3_1),
	.ch18_coeff_3_2(ch18_coeff_3_2),
	.ch18_coeff_3_3(ch18_coeff_3_3),
	.ch18_coeff_3_4(ch18_coeff_3_4),
	.ch18_coeff_3_5(ch18_coeff_3_5),
	.ch18_coeff_3_6(ch18_coeff_3_6),
	.ch18_coeff_3_7(ch18_coeff_3_7),
	.ch18_coeff_3_8(ch18_coeff_3_8),
	.ch18_coeff_3_9(ch18_coeff_3_9),
	.ch18_coeff_3_10(ch18_coeff_3_10),
	.ch18_mean3(ch18_neg_mean_3),
	.ch18_std3(ch18_recip_stdev_3),
	.ch18_coeff_4_0(ch18_coeff_4_0),
	.ch18_coeff_4_1(ch18_coeff_4_1),
	.ch18_coeff_4_2(ch18_coeff_4_2),
	.ch18_coeff_4_3(ch18_coeff_4_3),
	.ch18_coeff_4_4(ch18_coeff_4_4),
	.ch18_coeff_4_5(ch18_coeff_4_5),
	.ch18_coeff_4_6(ch18_coeff_4_6),
	.ch18_coeff_4_7(ch18_coeff_4_7),
	.ch18_coeff_4_8(ch18_coeff_4_8),
	.ch18_coeff_4_9(ch18_coeff_4_9),
	.ch18_coeff_4_10(ch18_coeff_4_10),
	.ch18_mean4(ch18_neg_mean_4),
	.ch18_std4(ch18_recip_stdev_4),
	.ch19_coeff_1_0(ch19_coeff_1_0),
	.ch19_coeff_1_1(ch19_coeff_1_1),
	.ch19_coeff_1_2(ch19_coeff_1_2),
	.ch19_coeff_1_3(ch19_coeff_1_3),
	.ch19_coeff_1_4(ch19_coeff_1_4),
	.ch19_coeff_1_5(ch19_coeff_1_5),
	.ch19_coeff_1_6(ch19_coeff_1_6),
	.ch19_coeff_1_7(ch19_coeff_1_7),
	.ch19_coeff_1_8(ch19_coeff_1_8),
	.ch19_coeff_1_9(ch19_coeff_1_9),
	.ch19_coeff_1_10(ch19_coeff_1_10),
	.ch19_mean1(ch19_neg_mean_1),
	.ch19_std1(ch19_recip_stdev_1),
	.ch19_coeff_2_0(ch19_coeff_2_0),
	.ch19_coeff_2_1(ch19_coeff_2_1),
	.ch19_coeff_2_2(ch19_coeff_2_2),
	.ch19_coeff_2_3(ch19_coeff_2_3),
	.ch19_coeff_2_4(ch19_coeff_2_4),
	.ch19_coeff_2_5(ch19_coeff_2_5),
	.ch19_coeff_2_6(ch19_coeff_2_6),
	.ch19_coeff_2_7(ch19_coeff_2_7),
	.ch19_coeff_2_8(ch19_coeff_2_8),
	.ch19_coeff_2_9(ch19_coeff_2_9),
	.ch19_coeff_2_10(ch19_coeff_2_10),
	.ch19_mean2(ch19_neg_mean_2),
	.ch19_std2(ch19_recip_stdev_2),
	.ch19_coeff_3_0(ch19_coeff_3_0),
	.ch19_coeff_3_1(ch19_coeff_3_1),
	.ch19_coeff_3_2(ch19_coeff_3_2),
	.ch19_coeff_3_3(ch19_coeff_3_3),
	.ch19_coeff_3_4(ch19_coeff_3_4),
	.ch19_coeff_3_5(ch19_coeff_3_5),
	.ch19_coeff_3_6(ch19_coeff_3_6),
	.ch19_coeff_3_7(ch19_coeff_3_7),
	.ch19_coeff_3_8(ch19_coeff_3_8),
	.ch19_coeff_3_9(ch19_coeff_3_9),
	.ch19_coeff_3_10(ch19_coeff_3_10),
	.ch19_mean3(ch19_neg_mean_3),
	.ch19_std3(ch19_recip_stdev_3),
	.ch19_coeff_4_0(ch19_coeff_4_0),
	.ch19_coeff_4_1(ch19_coeff_4_1),
	.ch19_coeff_4_2(ch19_coeff_4_2),
	.ch19_coeff_4_3(ch19_coeff_4_3),
	.ch19_coeff_4_4(ch19_coeff_4_4),
	.ch19_coeff_4_5(ch19_coeff_4_5),
	.ch19_coeff_4_6(ch19_coeff_4_6),
	.ch19_coeff_4_7(ch19_coeff_4_7),
	.ch19_coeff_4_8(ch19_coeff_4_8),
	.ch19_coeff_4_9(ch19_coeff_4_9),
	.ch19_coeff_4_10(ch19_coeff_4_10),
	.ch19_mean4(ch19_neg_mean_4),
	.ch19_std4(ch19_recip_stdev_4),
	.ch20_coeff_1_0(ch20_coeff_1_0),
	.ch20_coeff_1_1(ch20_coeff_1_1),
	.ch20_coeff_1_2(ch20_coeff_1_2),
	.ch20_coeff_1_3(ch20_coeff_1_3),
	.ch20_coeff_1_4(ch20_coeff_1_4),
	.ch20_coeff_1_5(ch20_coeff_1_5),
	.ch20_coeff_1_6(ch20_coeff_1_6),
	.ch20_coeff_1_7(ch20_coeff_1_7),
	.ch20_coeff_1_8(ch20_coeff_1_8),
	.ch20_coeff_1_9(ch20_coeff_1_9),
	.ch20_coeff_1_10(ch20_coeff_1_10),
	.ch20_mean1(ch20_neg_mean_1),
	.ch20_std1(ch20_recip_stdev_1),
	.ch20_coeff_2_0(ch20_coeff_2_0),
	.ch20_coeff_2_1(ch20_coeff_2_1),
	.ch20_coeff_2_2(ch20_coeff_2_2),
	.ch20_coeff_2_3(ch20_coeff_2_3),
	.ch20_coeff_2_4(ch20_coeff_2_4),
	.ch20_coeff_2_5(ch20_coeff_2_5),
	.ch20_coeff_2_6(ch20_coeff_2_6),
	.ch20_coeff_2_7(ch20_coeff_2_7),
	.ch20_coeff_2_8(ch20_coeff_2_8),
	.ch20_coeff_2_9(ch20_coeff_2_9),
	.ch20_coeff_2_10(ch20_coeff_2_10),
	.ch20_mean2(ch20_neg_mean_2),
	.ch20_std2(ch20_recip_stdev_2),
	.ch20_coeff_3_0(ch20_coeff_3_0),
	.ch20_coeff_3_1(ch20_coeff_3_1),
	.ch20_coeff_3_2(ch20_coeff_3_2),
	.ch20_coeff_3_3(ch20_coeff_3_3),
	.ch20_coeff_3_4(ch20_coeff_3_4),
	.ch20_coeff_3_5(ch20_coeff_3_5),
	.ch20_coeff_3_6(ch20_coeff_3_6),
	.ch20_coeff_3_7(ch20_coeff_3_7),
	.ch20_coeff_3_8(ch20_coeff_3_8),
	.ch20_coeff_3_9(ch20_coeff_3_9),
	.ch20_coeff_3_10(ch20_coeff_3_10),
	.ch20_mean3(ch20_neg_mean_3),
	.ch20_std3(ch20_recip_stdev_3),
	.ch20_coeff_4_0(ch20_coeff_4_0),
	.ch20_coeff_4_1(ch20_coeff_4_1),
	.ch20_coeff_4_2(ch20_coeff_4_2),
	.ch20_coeff_4_3(ch20_coeff_4_3),
	.ch20_coeff_4_4(ch20_coeff_4_4),
	.ch20_coeff_4_5(ch20_coeff_4_5),
	.ch20_coeff_4_6(ch20_coeff_4_6),
	.ch20_coeff_4_7(ch20_coeff_4_7),
	.ch20_coeff_4_8(ch20_coeff_4_8),
	.ch20_coeff_4_9(ch20_coeff_4_9),
	.ch20_coeff_4_10(ch20_coeff_4_10),
	.ch20_mean4(ch20_neg_mean_4),
	.ch20_std4(ch20_recip_stdev_4),
	.ch21_coeff_1_0(ch21_coeff_1_0),
	.ch21_coeff_1_1(ch21_coeff_1_1),
	.ch21_coeff_1_2(ch21_coeff_1_2),
	.ch21_coeff_1_3(ch21_coeff_1_3),
	.ch21_coeff_1_4(ch21_coeff_1_4),
	.ch21_coeff_1_5(ch21_coeff_1_5),
	.ch21_coeff_1_6(ch21_coeff_1_6),
	.ch21_coeff_1_7(ch21_coeff_1_7),
	.ch21_coeff_1_8(ch21_coeff_1_8),
	.ch21_coeff_1_9(ch21_coeff_1_9),
	.ch21_coeff_1_10(ch21_coeff_1_10),
	.ch21_mean1(ch21_neg_mean_1),
	.ch21_std1(ch21_recip_stdev_1),
	.ch21_coeff_2_0(ch21_coeff_2_0),
	.ch21_coeff_2_1(ch21_coeff_2_1),
	.ch21_coeff_2_2(ch21_coeff_2_2),
	.ch21_coeff_2_3(ch21_coeff_2_3),
	.ch21_coeff_2_4(ch21_coeff_2_4),
	.ch21_coeff_2_5(ch21_coeff_2_5),
	.ch21_coeff_2_6(ch21_coeff_2_6),
	.ch21_coeff_2_7(ch21_coeff_2_7),
	.ch21_coeff_2_8(ch21_coeff_2_8),
	.ch21_coeff_2_9(ch21_coeff_2_9),
	.ch21_coeff_2_10(ch21_coeff_2_10),
	.ch21_mean2(ch21_neg_mean_2),
	.ch21_std2(ch21_recip_stdev_2),
	.ch21_coeff_3_0(ch21_coeff_3_0),
	.ch21_coeff_3_1(ch21_coeff_3_1),
	.ch21_coeff_3_2(ch21_coeff_3_2),
	.ch21_coeff_3_3(ch21_coeff_3_3),
	.ch21_coeff_3_4(ch21_coeff_3_4),
	.ch21_coeff_3_5(ch21_coeff_3_5),
	.ch21_coeff_3_6(ch21_coeff_3_6),
	.ch21_coeff_3_7(ch21_coeff_3_7),
	.ch21_coeff_3_8(ch21_coeff_3_8),
	.ch21_coeff_3_9(ch21_coeff_3_9),
	.ch21_coeff_3_10(ch21_coeff_3_10),
	.ch21_mean3(ch21_neg_mean_3),
	.ch21_std3(ch21_recip_stdev_3),
	.ch21_coeff_4_0(ch21_coeff_4_0),
	.ch21_coeff_4_1(ch21_coeff_4_1),
	.ch21_coeff_4_2(ch21_coeff_4_2),
	.ch21_coeff_4_3(ch21_coeff_4_3),
	.ch21_coeff_4_4(ch21_coeff_4_4),
	.ch21_coeff_4_5(ch21_coeff_4_5),
	.ch21_coeff_4_6(ch21_coeff_4_6),
	.ch21_coeff_4_7(ch21_coeff_4_7),
	.ch21_coeff_4_8(ch21_coeff_4_8),
	.ch21_coeff_4_9(ch21_coeff_4_9),
	.ch21_coeff_4_10(ch21_coeff_4_10),
	.ch21_mean4(ch21_neg_mean_4),
	.ch21_std4(ch21_recip_stdev_4),
	.ch22_coeff_1_0(ch22_coeff_1_0),
	.ch22_coeff_1_1(ch22_coeff_1_1),
	.ch22_coeff_1_2(ch22_coeff_1_2),
	.ch22_coeff_1_3(ch22_coeff_1_3),
	.ch22_coeff_1_4(ch22_coeff_1_4),
	.ch22_coeff_1_5(ch22_coeff_1_5),
	.ch22_coeff_1_6(ch22_coeff_1_6),
	.ch22_coeff_1_7(ch22_coeff_1_7),
	.ch22_coeff_1_8(ch22_coeff_1_8),
	.ch22_coeff_1_9(ch22_coeff_1_9),
	.ch22_coeff_1_10(ch22_coeff_1_10),
	.ch22_mean1(ch22_neg_mean_1),
	.ch22_std1(ch22_recip_stdev_1),
	.ch22_coeff_2_0(ch22_coeff_2_0),
	.ch22_coeff_2_1(ch22_coeff_2_1),
	.ch22_coeff_2_2(ch22_coeff_2_2),
	.ch22_coeff_2_3(ch22_coeff_2_3),
	.ch22_coeff_2_4(ch22_coeff_2_4),
	.ch22_coeff_2_5(ch22_coeff_2_5),
	.ch22_coeff_2_6(ch22_coeff_2_6),
	.ch22_coeff_2_7(ch22_coeff_2_7),
	.ch22_coeff_2_8(ch22_coeff_2_8),
	.ch22_coeff_2_9(ch22_coeff_2_9),
	.ch22_coeff_2_10(ch22_coeff_2_10),
	.ch22_mean2(ch22_neg_mean_2),
	.ch22_std2(ch22_recip_stdev_2),
	.ch22_coeff_3_0(ch22_coeff_3_0),
	.ch22_coeff_3_1(ch22_coeff_3_1),
	.ch22_coeff_3_2(ch22_coeff_3_2),
	.ch22_coeff_3_3(ch22_coeff_3_3),
	.ch22_coeff_3_4(ch22_coeff_3_4),
	.ch22_coeff_3_5(ch22_coeff_3_5),
	.ch22_coeff_3_6(ch22_coeff_3_6),
	.ch22_coeff_3_7(ch22_coeff_3_7),
	.ch22_coeff_3_8(ch22_coeff_3_8),
	.ch22_coeff_3_9(ch22_coeff_3_9),
	.ch22_coeff_3_10(ch22_coeff_3_10),
	.ch22_mean3(ch22_neg_mean_3),
	.ch22_std3(ch22_recip_stdev_3),
	.ch22_coeff_4_0(ch22_coeff_4_0),
	.ch22_coeff_4_1(ch22_coeff_4_1),
	.ch22_coeff_4_2(ch22_coeff_4_2),
	.ch22_coeff_4_3(ch22_coeff_4_3),
	.ch22_coeff_4_4(ch22_coeff_4_4),
	.ch22_coeff_4_5(ch22_coeff_4_5),
	.ch22_coeff_4_6(ch22_coeff_4_6),
	.ch22_coeff_4_7(ch22_coeff_4_7),
	.ch22_coeff_4_8(ch22_coeff_4_8),
	.ch22_coeff_4_9(ch22_coeff_4_9),
	.ch22_coeff_4_10(ch22_coeff_4_10),
	.ch22_mean4(ch22_neg_mean_4),
	.ch22_std4(ch22_recip_stdev_4),
	.ch23_coeff_1_0(ch23_coeff_1_0),
	.ch23_coeff_1_1(ch23_coeff_1_1),
	.ch23_coeff_1_2(ch23_coeff_1_2),
	.ch23_coeff_1_3(ch23_coeff_1_3),
	.ch23_coeff_1_4(ch23_coeff_1_4),
	.ch23_coeff_1_5(ch23_coeff_1_5),
	.ch23_coeff_1_6(ch23_coeff_1_6),
	.ch23_coeff_1_7(ch23_coeff_1_7),
	.ch23_coeff_1_8(ch23_coeff_1_8),
	.ch23_coeff_1_9(ch23_coeff_1_9),
	.ch23_coeff_1_10(ch23_coeff_1_10),
	.ch23_mean1(ch23_neg_mean_1),
	.ch23_std1(ch23_recip_stdev_1),
	.ch23_coeff_2_0(ch23_coeff_2_0),
	.ch23_coeff_2_1(ch23_coeff_2_1),
	.ch23_coeff_2_2(ch23_coeff_2_2),
	.ch23_coeff_2_3(ch23_coeff_2_3),
	.ch23_coeff_2_4(ch23_coeff_2_4),
	.ch23_coeff_2_5(ch23_coeff_2_5),
	.ch23_coeff_2_6(ch23_coeff_2_6),
	.ch23_coeff_2_7(ch23_coeff_2_7),
	.ch23_coeff_2_8(ch23_coeff_2_8),
	.ch23_coeff_2_9(ch23_coeff_2_9),
	.ch23_coeff_2_10(ch23_coeff_2_10),
	.ch23_mean2(ch23_neg_mean_2),
	.ch23_std2(ch23_recip_stdev_2),
	.ch23_coeff_3_0(ch23_coeff_3_0),
	.ch23_coeff_3_1(ch23_coeff_3_1),
	.ch23_coeff_3_2(ch23_coeff_3_2),
	.ch23_coeff_3_3(ch23_coeff_3_3),
	.ch23_coeff_3_4(ch23_coeff_3_4),
	.ch23_coeff_3_5(ch23_coeff_3_5),
	.ch23_coeff_3_6(ch23_coeff_3_6),
	.ch23_coeff_3_7(ch23_coeff_3_7),
	.ch23_coeff_3_8(ch23_coeff_3_8),
	.ch23_coeff_3_9(ch23_coeff_3_9),
	.ch23_coeff_3_10(ch23_coeff_3_10),
	.ch23_mean3(ch23_neg_mean_3),
	.ch23_std3(ch23_recip_stdev_3),
	.ch23_coeff_4_0(ch23_coeff_4_0),
	.ch23_coeff_4_1(ch23_coeff_4_1),
	.ch23_coeff_4_2(ch23_coeff_4_2),
	.ch23_coeff_4_3(ch23_coeff_4_3),
	.ch23_coeff_4_4(ch23_coeff_4_4),
	.ch23_coeff_4_5(ch23_coeff_4_5),
	.ch23_coeff_4_6(ch23_coeff_4_6),
	.ch23_coeff_4_7(ch23_coeff_4_7),
	.ch23_coeff_4_8(ch23_coeff_4_8),
	.ch23_coeff_4_9(ch23_coeff_4_9),
	.ch23_coeff_4_10(ch23_coeff_4_10),
	.ch23_mean4(ch23_neg_mean_4),
	.ch23_std4(ch23_recip_stdev_4),
	.ch24_coeff_1_0(ch24_coeff_1_0),
	.ch24_coeff_1_1(ch24_coeff_1_1),
	.ch24_coeff_1_2(ch24_coeff_1_2),
	.ch24_coeff_1_3(ch24_coeff_1_3),
	.ch24_coeff_1_4(ch24_coeff_1_4),
	.ch24_coeff_1_5(ch24_coeff_1_5),
	.ch24_coeff_1_6(ch24_coeff_1_6),
	.ch24_coeff_1_7(ch24_coeff_1_7),
	.ch24_coeff_1_8(ch24_coeff_1_8),
	.ch24_coeff_1_9(ch24_coeff_1_9),
	.ch24_coeff_1_10(ch24_coeff_1_10),
	.ch24_mean1(ch24_neg_mean_1),
	.ch24_std1(ch24_recip_stdev_1),
	.ch24_coeff_2_0(ch24_coeff_2_0),
	.ch24_coeff_2_1(ch24_coeff_2_1),
	.ch24_coeff_2_2(ch24_coeff_2_2),
	.ch24_coeff_2_3(ch24_coeff_2_3),
	.ch24_coeff_2_4(ch24_coeff_2_4),
	.ch24_coeff_2_5(ch24_coeff_2_5),
	.ch24_coeff_2_6(ch24_coeff_2_6),
	.ch24_coeff_2_7(ch24_coeff_2_7),
	.ch24_coeff_2_8(ch24_coeff_2_8),
	.ch24_coeff_2_9(ch24_coeff_2_9),
	.ch24_coeff_2_10(ch24_coeff_2_10),
	.ch24_mean2(ch24_neg_mean_2),
	.ch24_std2(ch24_recip_stdev_2),
	.ch24_coeff_3_0(ch24_coeff_3_0),
	.ch24_coeff_3_1(ch24_coeff_3_1),
	.ch24_coeff_3_2(ch24_coeff_3_2),
	.ch24_coeff_3_3(ch24_coeff_3_3),
	.ch24_coeff_3_4(ch24_coeff_3_4),
	.ch24_coeff_3_5(ch24_coeff_3_5),
	.ch24_coeff_3_6(ch24_coeff_3_6),
	.ch24_coeff_3_7(ch24_coeff_3_7),
	.ch24_coeff_3_8(ch24_coeff_3_8),
	.ch24_coeff_3_9(ch24_coeff_3_9),
	.ch24_coeff_3_10(ch24_coeff_3_10),
	.ch24_mean3(ch24_neg_mean_3),
	.ch24_std3(ch24_recip_stdev_3),
	.ch24_coeff_4_0(ch24_coeff_4_0),
	.ch24_coeff_4_1(ch24_coeff_4_1),
	.ch24_coeff_4_2(ch24_coeff_4_2),
	.ch24_coeff_4_3(ch24_coeff_4_3),
	.ch24_coeff_4_4(ch24_coeff_4_4),
	.ch24_coeff_4_5(ch24_coeff_4_5),
	.ch24_coeff_4_6(ch24_coeff_4_6),
	.ch24_coeff_4_7(ch24_coeff_4_7),
	.ch24_coeff_4_8(ch24_coeff_4_8),
	.ch24_coeff_4_9(ch24_coeff_4_9),
	.ch24_coeff_4_10(ch24_coeff_4_10),
	.ch24_mean4(ch24_neg_mean_4),
	.ch24_std4(ch24_recip_stdev_4),
	.ch25_coeff_1_0(ch25_coeff_1_0),
	.ch25_coeff_1_1(ch25_coeff_1_1),
	.ch25_coeff_1_2(ch25_coeff_1_2),
	.ch25_coeff_1_3(ch25_coeff_1_3),
	.ch25_coeff_1_4(ch25_coeff_1_4),
	.ch25_coeff_1_5(ch25_coeff_1_5),
	.ch25_coeff_1_6(ch25_coeff_1_6),
	.ch25_coeff_1_7(ch25_coeff_1_7),
	.ch25_coeff_1_8(ch25_coeff_1_8),
	.ch25_coeff_1_9(ch25_coeff_1_9),
	.ch25_coeff_1_10(ch25_coeff_1_10),
	.ch25_mean1(ch25_neg_mean_1),
	.ch25_std1(ch25_recip_stdev_1),
	.ch25_coeff_2_0(ch25_coeff_2_0),
	.ch25_coeff_2_1(ch25_coeff_2_1),
	.ch25_coeff_2_2(ch25_coeff_2_2),
	.ch25_coeff_2_3(ch25_coeff_2_3),
	.ch25_coeff_2_4(ch25_coeff_2_4),
	.ch25_coeff_2_5(ch25_coeff_2_5),
	.ch25_coeff_2_6(ch25_coeff_2_6),
	.ch25_coeff_2_7(ch25_coeff_2_7),
	.ch25_coeff_2_8(ch25_coeff_2_8),
	.ch25_coeff_2_9(ch25_coeff_2_9),
	.ch25_coeff_2_10(ch25_coeff_2_10),
	.ch25_mean2(ch25_neg_mean_2),
	.ch25_std2(ch25_recip_stdev_2),
	.ch25_coeff_3_0(ch25_coeff_3_0),
	.ch25_coeff_3_1(ch25_coeff_3_1),
	.ch25_coeff_3_2(ch25_coeff_3_2),
	.ch25_coeff_3_3(ch25_coeff_3_3),
	.ch25_coeff_3_4(ch25_coeff_3_4),
	.ch25_coeff_3_5(ch25_coeff_3_5),
	.ch25_coeff_3_6(ch25_coeff_3_6),
	.ch25_coeff_3_7(ch25_coeff_3_7),
	.ch25_coeff_3_8(ch25_coeff_3_8),
	.ch25_coeff_3_9(ch25_coeff_3_9),
	.ch25_coeff_3_10(ch25_coeff_3_10),
	.ch25_mean3(ch25_neg_mean_3),
	.ch25_std3(ch25_recip_stdev_3),
	.ch25_coeff_4_0(ch25_coeff_4_0),
	.ch25_coeff_4_1(ch25_coeff_4_1),
	.ch25_coeff_4_2(ch25_coeff_4_2),
	.ch25_coeff_4_3(ch25_coeff_4_3),
	.ch25_coeff_4_4(ch25_coeff_4_4),
	.ch25_coeff_4_5(ch25_coeff_4_5),
	.ch25_coeff_4_6(ch25_coeff_4_6),
	.ch25_coeff_4_7(ch25_coeff_4_7),
	.ch25_coeff_4_8(ch25_coeff_4_8),
	.ch25_coeff_4_9(ch25_coeff_4_9),
	.ch25_coeff_4_10(ch25_coeff_4_10),
	.ch25_mean4(ch25_neg_mean_4),
	.ch25_std4(ch25_recip_stdev_4),
	.ch26_coeff_1_0(ch26_coeff_1_0),
	.ch26_coeff_1_1(ch26_coeff_1_1),
	.ch26_coeff_1_2(ch26_coeff_1_2),
	.ch26_coeff_1_3(ch26_coeff_1_3),
	.ch26_coeff_1_4(ch26_coeff_1_4),
	.ch26_coeff_1_5(ch26_coeff_1_5),
	.ch26_coeff_1_6(ch26_coeff_1_6),
	.ch26_coeff_1_7(ch26_coeff_1_7),
	.ch26_coeff_1_8(ch26_coeff_1_8),
	.ch26_coeff_1_9(ch26_coeff_1_9),
	.ch26_coeff_1_10(ch26_coeff_1_10),
	.ch26_mean1(ch26_neg_mean_1),
	.ch26_std1(ch26_recip_stdev_1),
	.ch26_coeff_2_0(ch26_coeff_2_0),
	.ch26_coeff_2_1(ch26_coeff_2_1),
	.ch26_coeff_2_2(ch26_coeff_2_2),
	.ch26_coeff_2_3(ch26_coeff_2_3),
	.ch26_coeff_2_4(ch26_coeff_2_4),
	.ch26_coeff_2_5(ch26_coeff_2_5),
	.ch26_coeff_2_6(ch26_coeff_2_6),
	.ch26_coeff_2_7(ch26_coeff_2_7),
	.ch26_coeff_2_8(ch26_coeff_2_8),
	.ch26_coeff_2_9(ch26_coeff_2_9),
	.ch26_coeff_2_10(ch26_coeff_2_10),
	.ch26_mean2(ch26_neg_mean_2),
	.ch26_std2(ch26_recip_stdev_2),
	.ch26_coeff_3_0(ch26_coeff_3_0),
	.ch26_coeff_3_1(ch26_coeff_3_1),
	.ch26_coeff_3_2(ch26_coeff_3_2),
	.ch26_coeff_3_3(ch26_coeff_3_3),
	.ch26_coeff_3_4(ch26_coeff_3_4),
	.ch26_coeff_3_5(ch26_coeff_3_5),
	.ch26_coeff_3_6(ch26_coeff_3_6),
	.ch26_coeff_3_7(ch26_coeff_3_7),
	.ch26_coeff_3_8(ch26_coeff_3_8),
	.ch26_coeff_3_9(ch26_coeff_3_9),
	.ch26_coeff_3_10(ch26_coeff_3_10),
	.ch26_mean3(ch26_neg_mean_3),
	.ch26_std3(ch26_recip_stdev_3),
	.ch26_coeff_4_0(ch26_coeff_4_0),
	.ch26_coeff_4_1(ch26_coeff_4_1),
	.ch26_coeff_4_2(ch26_coeff_4_2),
	.ch26_coeff_4_3(ch26_coeff_4_3),
	.ch26_coeff_4_4(ch26_coeff_4_4),
	.ch26_coeff_4_5(ch26_coeff_4_5),
	.ch26_coeff_4_6(ch26_coeff_4_6),
	.ch26_coeff_4_7(ch26_coeff_4_7),
	.ch26_coeff_4_8(ch26_coeff_4_8),
	.ch26_coeff_4_9(ch26_coeff_4_9),
	.ch26_coeff_4_10(ch26_coeff_4_10),
	.ch26_mean4(ch26_neg_mean_4),
	.ch26_std4(ch26_recip_stdev_4),
	.ch27_coeff_1_0(ch27_coeff_1_0),
	.ch27_coeff_1_1(ch27_coeff_1_1),
	.ch27_coeff_1_2(ch27_coeff_1_2),
	.ch27_coeff_1_3(ch27_coeff_1_3),
	.ch27_coeff_1_4(ch27_coeff_1_4),
	.ch27_coeff_1_5(ch27_coeff_1_5),
	.ch27_coeff_1_6(ch27_coeff_1_6),
	.ch27_coeff_1_7(ch27_coeff_1_7),
	.ch27_coeff_1_8(ch27_coeff_1_8),
	.ch27_coeff_1_9(ch27_coeff_1_9),
	.ch27_coeff_1_10(ch27_coeff_1_10),
	.ch27_mean1(ch27_neg_mean_1),
	.ch27_std1(ch27_recip_stdev_1),
	.ch27_coeff_2_0(ch27_coeff_2_0),
	.ch27_coeff_2_1(ch27_coeff_2_1),
	.ch27_coeff_2_2(ch27_coeff_2_2),
	.ch27_coeff_2_3(ch27_coeff_2_3),
	.ch27_coeff_2_4(ch27_coeff_2_4),
	.ch27_coeff_2_5(ch27_coeff_2_5),
	.ch27_coeff_2_6(ch27_coeff_2_6),
	.ch27_coeff_2_7(ch27_coeff_2_7),
	.ch27_coeff_2_8(ch27_coeff_2_8),
	.ch27_coeff_2_9(ch27_coeff_2_9),
	.ch27_coeff_2_10(ch27_coeff_2_10),
	.ch27_mean2(ch27_neg_mean_2),
	.ch27_std2(ch27_recip_stdev_2),
	.ch27_coeff_3_0(ch27_coeff_3_0),
	.ch27_coeff_3_1(ch27_coeff_3_1),
	.ch27_coeff_3_2(ch27_coeff_3_2),
	.ch27_coeff_3_3(ch27_coeff_3_3),
	.ch27_coeff_3_4(ch27_coeff_3_4),
	.ch27_coeff_3_5(ch27_coeff_3_5),
	.ch27_coeff_3_6(ch27_coeff_3_6),
	.ch27_coeff_3_7(ch27_coeff_3_7),
	.ch27_coeff_3_8(ch27_coeff_3_8),
	.ch27_coeff_3_9(ch27_coeff_3_9),
	.ch27_coeff_3_10(ch27_coeff_3_10),
	.ch27_mean3(ch27_neg_mean_3),
	.ch27_std3(ch27_recip_stdev_3),
	.ch27_coeff_4_0(ch27_coeff_4_0),
	.ch27_coeff_4_1(ch27_coeff_4_1),
	.ch27_coeff_4_2(ch27_coeff_4_2),
	.ch27_coeff_4_3(ch27_coeff_4_3),
	.ch27_coeff_4_4(ch27_coeff_4_4),
	.ch27_coeff_4_5(ch27_coeff_4_5),
	.ch27_coeff_4_6(ch27_coeff_4_6),
	.ch27_coeff_4_7(ch27_coeff_4_7),
	.ch27_coeff_4_8(ch27_coeff_4_8),
	.ch27_coeff_4_9(ch27_coeff_4_9),
	.ch27_coeff_4_10(ch27_coeff_4_10),
	.ch27_mean4(ch27_neg_mean_4),
	.ch27_std4(ch27_recip_stdev_4),
	.ch28_coeff_1_0(ch28_coeff_1_0),
	.ch28_coeff_1_1(ch28_coeff_1_1),
	.ch28_coeff_1_2(ch28_coeff_1_2),
	.ch28_coeff_1_3(ch28_coeff_1_3),
	.ch28_coeff_1_4(ch28_coeff_1_4),
	.ch28_coeff_1_5(ch28_coeff_1_5),
	.ch28_coeff_1_6(ch28_coeff_1_6),
	.ch28_coeff_1_7(ch28_coeff_1_7),
	.ch28_coeff_1_8(ch28_coeff_1_8),
	.ch28_coeff_1_9(ch28_coeff_1_9),
	.ch28_coeff_1_10(ch28_coeff_1_10),
	.ch28_mean1(ch28_neg_mean_1),
	.ch28_std1(ch28_recip_stdev_1),
	.ch28_coeff_2_0(ch28_coeff_2_0),
	.ch28_coeff_2_1(ch28_coeff_2_1),
	.ch28_coeff_2_2(ch28_coeff_2_2),
	.ch28_coeff_2_3(ch28_coeff_2_3),
	.ch28_coeff_2_4(ch28_coeff_2_4),
	.ch28_coeff_2_5(ch28_coeff_2_5),
	.ch28_coeff_2_6(ch28_coeff_2_6),
	.ch28_coeff_2_7(ch28_coeff_2_7),
	.ch28_coeff_2_8(ch28_coeff_2_8),
	.ch28_coeff_2_9(ch28_coeff_2_9),
	.ch28_coeff_2_10(ch28_coeff_2_10),
	.ch28_mean2(ch28_neg_mean_2),
	.ch28_std2(ch28_recip_stdev_2),
	.ch28_coeff_3_0(ch28_coeff_3_0),
	.ch28_coeff_3_1(ch28_coeff_3_1),
	.ch28_coeff_3_2(ch28_coeff_3_2),
	.ch28_coeff_3_3(ch28_coeff_3_3),
	.ch28_coeff_3_4(ch28_coeff_3_4),
	.ch28_coeff_3_5(ch28_coeff_3_5),
	.ch28_coeff_3_6(ch28_coeff_3_6),
	.ch28_coeff_3_7(ch28_coeff_3_7),
	.ch28_coeff_3_8(ch28_coeff_3_8),
	.ch28_coeff_3_9(ch28_coeff_3_9),
	.ch28_coeff_3_10(ch28_coeff_3_10),
	.ch28_mean3(ch28_neg_mean_3),
	.ch28_std3(ch28_recip_stdev_3),
	.ch28_coeff_4_0(ch28_coeff_4_0),
	.ch28_coeff_4_1(ch28_coeff_4_1),
	.ch28_coeff_4_2(ch28_coeff_4_2),
	.ch28_coeff_4_3(ch28_coeff_4_3),
	.ch28_coeff_4_4(ch28_coeff_4_4),
	.ch28_coeff_4_5(ch28_coeff_4_5),
	.ch28_coeff_4_6(ch28_coeff_4_6),
	.ch28_coeff_4_7(ch28_coeff_4_7),
	.ch28_coeff_4_8(ch28_coeff_4_8),
	.ch28_coeff_4_9(ch28_coeff_4_9),
	.ch28_coeff_4_10(ch28_coeff_4_10),
	.ch28_mean4(ch28_neg_mean_4),
	.ch28_std4(ch28_recip_stdev_4),
	.ch29_coeff_1_0(ch29_coeff_1_0),
	.ch29_coeff_1_1(ch29_coeff_1_1),
	.ch29_coeff_1_2(ch29_coeff_1_2),
	.ch29_coeff_1_3(ch29_coeff_1_3),
	.ch29_coeff_1_4(ch29_coeff_1_4),
	.ch29_coeff_1_5(ch29_coeff_1_5),
	.ch29_coeff_1_6(ch29_coeff_1_6),
	.ch29_coeff_1_7(ch29_coeff_1_7),
	.ch29_coeff_1_8(ch29_coeff_1_8),
	.ch29_coeff_1_9(ch29_coeff_1_9),
	.ch29_coeff_1_10(ch29_coeff_1_10),
	.ch29_mean1(ch29_neg_mean_1),
	.ch29_std1(ch29_recip_stdev_1),
	.ch29_coeff_2_0(ch29_coeff_2_0),
	.ch29_coeff_2_1(ch29_coeff_2_1),
	.ch29_coeff_2_2(ch29_coeff_2_2),
	.ch29_coeff_2_3(ch29_coeff_2_3),
	.ch29_coeff_2_4(ch29_coeff_2_4),
	.ch29_coeff_2_5(ch29_coeff_2_5),
	.ch29_coeff_2_6(ch29_coeff_2_6),
	.ch29_coeff_2_7(ch29_coeff_2_7),
	.ch29_coeff_2_8(ch29_coeff_2_8),
	.ch29_coeff_2_9(ch29_coeff_2_9),
	.ch29_coeff_2_10(ch29_coeff_2_10),
	.ch29_mean2(ch29_neg_mean_2),
	.ch29_std2(ch29_recip_stdev_2),
	.ch29_coeff_3_0(ch29_coeff_3_0),
	.ch29_coeff_3_1(ch29_coeff_3_1),
	.ch29_coeff_3_2(ch29_coeff_3_2),
	.ch29_coeff_3_3(ch29_coeff_3_3),
	.ch29_coeff_3_4(ch29_coeff_3_4),
	.ch29_coeff_3_5(ch29_coeff_3_5),
	.ch29_coeff_3_6(ch29_coeff_3_6),
	.ch29_coeff_3_7(ch29_coeff_3_7),
	.ch29_coeff_3_8(ch29_coeff_3_8),
	.ch29_coeff_3_9(ch29_coeff_3_9),
	.ch29_coeff_3_10(ch29_coeff_3_10),
	.ch29_mean3(ch29_neg_mean_3),
	.ch29_std3(ch29_recip_stdev_3),
	.ch29_coeff_4_0(ch29_coeff_4_0),
	.ch29_coeff_4_1(ch29_coeff_4_1),
	.ch29_coeff_4_2(ch29_coeff_4_2),
	.ch29_coeff_4_3(ch29_coeff_4_3),
	.ch29_coeff_4_4(ch29_coeff_4_4),
	.ch29_coeff_4_5(ch29_coeff_4_5),
	.ch29_coeff_4_6(ch29_coeff_4_6),
	.ch29_coeff_4_7(ch29_coeff_4_7),
	.ch29_coeff_4_8(ch29_coeff_4_8),
	.ch29_coeff_4_9(ch29_coeff_4_9),
	.ch29_coeff_4_10(ch29_coeff_4_10),
	.ch29_mean4(ch29_neg_mean_4),
	.ch29_std4(ch29_recip_stdev_4),
	.ch30_coeff_1_0(ch30_coeff_1_0),
	.ch30_coeff_1_1(ch30_coeff_1_1),
	.ch30_coeff_1_2(ch30_coeff_1_2),
	.ch30_coeff_1_3(ch30_coeff_1_3),
	.ch30_coeff_1_4(ch30_coeff_1_4),
	.ch30_coeff_1_5(ch30_coeff_1_5),
	.ch30_coeff_1_6(ch30_coeff_1_6),
	.ch30_coeff_1_7(ch30_coeff_1_7),
	.ch30_coeff_1_8(ch30_coeff_1_8),
	.ch30_coeff_1_9(ch30_coeff_1_9),
	.ch30_coeff_1_10(ch30_coeff_1_10),
	.ch30_mean1(ch30_neg_mean_1),
	.ch30_std1(ch30_recip_stdev_1),
	.ch30_coeff_2_0(ch30_coeff_2_0),
	.ch30_coeff_2_1(ch30_coeff_2_1),
	.ch30_coeff_2_2(ch30_coeff_2_2),
	.ch30_coeff_2_3(ch30_coeff_2_3),
	.ch30_coeff_2_4(ch30_coeff_2_4),
	.ch30_coeff_2_5(ch30_coeff_2_5),
	.ch30_coeff_2_6(ch30_coeff_2_6),
	.ch30_coeff_2_7(ch30_coeff_2_7),
	.ch30_coeff_2_8(ch30_coeff_2_8),
	.ch30_coeff_2_9(ch30_coeff_2_9),
	.ch30_coeff_2_10(ch30_coeff_2_10),
	.ch30_mean2(ch30_neg_mean_2),
	.ch30_std2(ch30_recip_stdev_2),
	.ch30_coeff_3_0(ch30_coeff_3_0),
	.ch30_coeff_3_1(ch30_coeff_3_1),
	.ch30_coeff_3_2(ch30_coeff_3_2),
	.ch30_coeff_3_3(ch30_coeff_3_3),
	.ch30_coeff_3_4(ch30_coeff_3_4),
	.ch30_coeff_3_5(ch30_coeff_3_5),
	.ch30_coeff_3_6(ch30_coeff_3_6),
	.ch30_coeff_3_7(ch30_coeff_3_7),
	.ch30_coeff_3_8(ch30_coeff_3_8),
	.ch30_coeff_3_9(ch30_coeff_3_9),
	.ch30_coeff_3_10(ch30_coeff_3_10),
	.ch30_mean3(ch30_neg_mean_3),
	.ch30_std3(ch30_recip_stdev_3),
	.ch30_coeff_4_0(ch30_coeff_4_0),
	.ch30_coeff_4_1(ch30_coeff_4_1),
	.ch30_coeff_4_2(ch30_coeff_4_2),
	.ch30_coeff_4_3(ch30_coeff_4_3),
	.ch30_coeff_4_4(ch30_coeff_4_4),
	.ch30_coeff_4_5(ch30_coeff_4_5),
	.ch30_coeff_4_6(ch30_coeff_4_6),
	.ch30_coeff_4_7(ch30_coeff_4_7),
	.ch30_coeff_4_8(ch30_coeff_4_8),
	.ch30_coeff_4_9(ch30_coeff_4_9),
	.ch30_coeff_4_10(ch30_coeff_4_10),
	.ch30_mean4(ch30_neg_mean_4),
	.ch30_std4(ch30_recip_stdev_4),
	.ch31_coeff_1_0(ch31_coeff_1_0),
	.ch31_coeff_1_1(ch31_coeff_1_1),
	.ch31_coeff_1_2(ch31_coeff_1_2),
	.ch31_coeff_1_3(ch31_coeff_1_3),
	.ch31_coeff_1_4(ch31_coeff_1_4),
	.ch31_coeff_1_5(ch31_coeff_1_5),
	.ch31_coeff_1_6(ch31_coeff_1_6),
	.ch31_coeff_1_7(ch31_coeff_1_7),
	.ch31_coeff_1_8(ch31_coeff_1_8),
	.ch31_coeff_1_9(ch31_coeff_1_9),
	.ch31_coeff_1_10(ch31_coeff_1_10),
	.ch31_mean1(ch31_neg_mean_1),
	.ch31_std1(ch31_recip_stdev_1),
	.ch31_coeff_2_0(ch31_coeff_2_0),
	.ch31_coeff_2_1(ch31_coeff_2_1),
	.ch31_coeff_2_2(ch31_coeff_2_2),
	.ch31_coeff_2_3(ch31_coeff_2_3),
	.ch31_coeff_2_4(ch31_coeff_2_4),
	.ch31_coeff_2_5(ch31_coeff_2_5),
	.ch31_coeff_2_6(ch31_coeff_2_6),
	.ch31_coeff_2_7(ch31_coeff_2_7),
	.ch31_coeff_2_8(ch31_coeff_2_8),
	.ch31_coeff_2_9(ch31_coeff_2_9),
	.ch31_coeff_2_10(ch31_coeff_2_10),
	.ch31_mean2(ch31_neg_mean_2),
	.ch31_std2(ch31_recip_stdev_2),
	.ch31_coeff_3_0(ch31_coeff_3_0),
	.ch31_coeff_3_1(ch31_coeff_3_1),
	.ch31_coeff_3_2(ch31_coeff_3_2),
	.ch31_coeff_3_3(ch31_coeff_3_3),
	.ch31_coeff_3_4(ch31_coeff_3_4),
	.ch31_coeff_3_5(ch31_coeff_3_5),
	.ch31_coeff_3_6(ch31_coeff_3_6),
	.ch31_coeff_3_7(ch31_coeff_3_7),
	.ch31_coeff_3_8(ch31_coeff_3_8),
	.ch31_coeff_3_9(ch31_coeff_3_9),
	.ch31_coeff_3_10(ch31_coeff_3_10),
	.ch31_mean3(ch31_neg_mean_3),
	.ch31_std3(ch31_recip_stdev_3),
	.ch31_coeff_4_0(ch31_coeff_4_0),
	.ch31_coeff_4_1(ch31_coeff_4_1),
	.ch31_coeff_4_2(ch31_coeff_4_2),
	.ch31_coeff_4_3(ch31_coeff_4_3),
	.ch31_coeff_4_4(ch31_coeff_4_4),
	.ch31_coeff_4_5(ch31_coeff_4_5),
	.ch31_coeff_4_6(ch31_coeff_4_6),
	.ch31_coeff_4_7(ch31_coeff_4_7),
	.ch31_coeff_4_8(ch31_coeff_4_8),
	.ch31_coeff_4_9(ch31_coeff_4_9),
	.ch31_coeff_4_10(ch31_coeff_4_10),
	.ch31_mean4(ch31_neg_mean_4),
	.ch31_std4(ch31_recip_stdev_4),
	.x_adc(um32_x_adc),
	.section_limit(um32_section_limit),
	.coeff_1_0(um32_coeff_1_0),
	.coeff_1_1(um32_coeff_1_1),
	.coeff_1_2(um32_coeff_1_2),
	.coeff_1_3(um32_coeff_1_3),
	.coeff_1_4(um32_coeff_1_4),
	.coeff_1_5(um32_coeff_1_5),
	.coeff_1_6(um32_coeff_1_6),
	.coeff_1_7(um32_coeff_1_7),
	.coeff_1_8(um32_coeff_1_8),
	.coeff_1_9(um32_coeff_1_9),
	.coeff_1_10(um32_coeff_1_10),
	.mean1(um32_mean1),
	.std1(um32_std1),
	.coeff_2_0(um32_coeff_2_0),
	.coeff_2_1(um32_coeff_2_1),
	.coeff_2_2(um32_coeff_2_2),
	.coeff_2_3(um32_coeff_2_3),
	.coeff_2_4(um32_coeff_2_4),
	.coeff_2_5(um32_coeff_2_5),
	.coeff_2_6(um32_coeff_2_6),
	.coeff_2_7(um32_coeff_2_7),
	.coeff_2_8(um32_coeff_2_8),
	.coeff_2_9(um32_coeff_2_9),
	.coeff_2_10(um32_coeff_2_10),
	.mean2(um32_mean2),
	.std2(um32_std2),
	.coeff_3_0(um32_coeff_3_0),
	.coeff_3_1(um32_coeff_3_1),
	.coeff_3_2(um32_coeff_3_2),
	.coeff_3_3(um32_coeff_3_3),
	.coeff_3_4(um32_coeff_3_4),
	.coeff_3_5(um32_coeff_3_5),
	.coeff_3_6(um32_coeff_3_6),
	.coeff_3_7(um32_coeff_3_7),
	.coeff_3_8(um32_coeff_3_8),
	.coeff_3_9(um32_coeff_3_9),
	.coeff_3_10(um32_coeff_3_10),
	.mean3(um32_mean3),
	.std3(um32_std3),
	.coeff_4_0(um32_coeff_4_0),
	.coeff_4_1(um32_coeff_4_1),
	.coeff_4_2(um32_coeff_4_2),
	.coeff_4_3(um32_coeff_4_3),
	.coeff_4_4(um32_coeff_4_4),
	.coeff_4_5(um32_coeff_4_5),
	.coeff_4_6(um32_coeff_4_6),
	.coeff_4_7(um32_coeff_4_7),
	.coeff_4_8(um32_coeff_4_8),
	.coeff_4_9(um32_coeff_4_9),
	.coeff_4_10(um32_coeff_4_10),
	.mean4(um32_mean4),
	.std4(um32_std4)
	);

comparator theComparator( 
	.clk(clk),
	.GlobalReset(GlobalReset),
    .x_adc_valid(um32_x_adc),
	.section_limit(um32_section_limit),
	.coeff1_0(um32_coeff_1_0),
	.coeff1_1(um32_coeff_1_1),
	.coeff1_2(um32_coeff_1_2),
	.coeff1_3(um32_coeff_1_3),
	.coeff1_4(um32_coeff_1_4),
	.coeff1_5(um32_coeff_1_5),
	.coeff1_6(um32_coeff_1_6),
	.coeff1_7(um32_coeff_1_7),
	.coeff1_8(um32_coeff_1_8),
	.coeff1_9(um32_coeff_1_9),
	.coeff1_10(um32_coeff_1_10),
	.mean1(um32_mean1),
	.std1(um32_std1),
	.coeff2_0(um32_coeff_2_0),
	.coeff2_1(um32_coeff_2_1),
	.coeff2_2(um32_coeff_2_2),
	.coeff2_3(um32_coeff_2_3),
	.coeff2_4(um32_coeff_2_4),
	.coeff2_5(um32_coeff_2_5),
	.coeff2_6(um32_coeff_2_6),
	.coeff2_7(um32_coeff_2_7),
	.coeff2_8(um32_coeff_2_8),
	.coeff2_9(um32_coeff_2_9),
	.coeff2_10(um32_coeff_2_10),
	.mean2(um32_mean2),
	.std2(um32_std2),
	.coeff3_0(um32_coeff_3_0),
	.coeff3_1(um32_coeff_3_1),
	.coeff3_2(um32_coeff_3_2),
	.coeff3_3(um32_coeff_3_3),
	.coeff3_4(um32_coeff_3_4),
	.coeff3_5(um32_coeff_3_5),
	.coeff3_6(um32_coeff_3_6),
	.coeff3_7(um32_coeff_3_7),
	.coeff3_8(um32_coeff_3_8),
	.coeff3_9(um32_coeff_3_9),
	.coeff3_10(um32_coeff_3_10),
	.mean3(um32_mean3),
	.std3(um32_std3),
	.coeff4_0(um32_coeff_4_0),
	.coeff4_1(um32_coeff_4_1),
	.coeff4_2(um32_coeff_4_2),
	.coeff4_3(um32_coeff_4_3),
	.coeff4_4(um32_coeff_4_4),
	.coeff4_5(um32_coeff_4_5),
	.coeff4_6(um32_coeff_4_6),
	.coeff4_7(um32_coeff_4_7),
	.coeff4_8(um32_coeff_4_8),
	.coeff4_9(um32_coeff_4_9),
	.coeff4_10(um32_coeff_4_10),
	.mean4(um32_mean4),
	.std4(um32_std4),
	.coeff0(comp_coeff0),
	.coeff1(comp_coeff1),
	.coeff2(comp_coeff2),
	.coeff3(comp_coeff3),
	.coeff4(comp_coeff4),
	.coeff5(comp_coeff5),
	.coeff6(comp_coeff6),
	.coeff7(comp_coeff7),
	.coeff8(comp_coeff8),
	.coeff9(comp_coeff9),
	.coeff10(comp_coeff10),
	.mean(comp_mean),
	.std(comp_std)
    );

delay_Z1 mean_Z1(
	.clk(clk),
	.GlobalReset(GlobalReset),
	.in(comp_mean),
	.out(mean_Z1_o)
	);
	
delay_Z1 std_Z1(
	.clk(clk),
	.GlobalReset(GlobalReset),
	.in(comp_std),
	.out(std_Z1_o)
	);
	
centerScale3 theCenterScale3( 
    .GlobalReset(GlobalReset),
	.clk(clk),
	.x_adc(um32_x_adc),
	.srdyi(srdyi),
	.mean(mean_Z1_o),
	.std(std_Z1_o),
	.x_centScale(cs3_x_centScale),
	.srdyo_o(cs3_srdyo_o)
    );

control2 theControl2( 
    .GlobalReset(GlobalReset),
	.clk(clk),
	.srdyi(srdyi),
	.coeff_sel(c2_coeff_sel),
	.sum_rst(c2_sum_rst),
	.sum_en(c2_sum_en),
	.channel_select(c2_channel_select),
	.enableRegControl(c2_enableRegControl),
	.srdyo(srdyo)/*,
	cnt*/ //used only for testbench
    );

mux theMux( 
	.clk(clk),
	.GlobalReset(GlobalReset),
    .coeff0(comp_coeff0),
    .coeff1(comp_coeff1),
    .coeff2(comp_coeff2),
    .coeff3(comp_coeff3),
    .coeff4(comp_coeff4),
    .coeff5(comp_coeff5),
    .coeff6(comp_coeff6),
    .coeff7(comp_coeff7),
    .coeff8(comp_coeff8),
    .coeff9(comp_coeff9),
    .coeff10(comp_coeff10),
	.coeff_select(c2_coeff_sel),
	.coeff(mux_coeff)
    );

delay_Z21 theDelay_Z21( 
	.clk(clk),
	.GlobalReset(GlobalReset),
	.in(mux_coeff),
	.out(delay_coeff)
    );

hornerLoop theHornerLoop( 
    .GlobalReset(GlobalReset),
	.clk(clk),
	.x_adc_smc(cs3_x_centScale),
	.srdyi_i(cs3_srdyo_o),
	.coeff(delay_coeff),
	.sum_en(c2_sum_en),
	.sum_rst(c2_sum_rst),
	.x_lin(hl_x_lin)
    );

enable_reg_32 theOutputStorage( 
	.clk(clk),
	.GlobalReset(GlobalReset),
	.enable(c2_enableRegControl),
	.in(hl_x_lin),
	.ch0_x_lin(ch0_x_lin),
	.ch1_x_lin(ch1_x_lin),
	.ch2_x_lin(ch2_x_lin),
	.ch3_x_lin(ch3_x_lin),
	.ch4_x_lin(ch4_x_lin),
	.ch5_x_lin(ch5_x_lin),
	.ch6_x_lin(ch6_x_lin),
	.ch7_x_lin(ch7_x_lin),
	.ch8_x_lin(ch8_x_lin),
	.ch9_x_lin(ch9_x_lin),
	.ch10_x_lin(ch10_x_lin),
	.ch11_x_lin(ch11_x_lin),
	.ch12_x_lin(ch12_x_lin),
	.ch13_x_lin(ch13_x_lin),
	.ch14_x_lin(ch14_x_lin),
	.ch15_x_lin(ch15_x_lin),
	.ch16_x_lin(ch16_x_lin),
	.ch17_x_lin(ch17_x_lin),
	.ch18_x_lin(ch18_x_lin),
	.ch19_x_lin(ch19_x_lin),
	.ch20_x_lin(ch20_x_lin),
	.ch21_x_lin(ch21_x_lin),
	.ch22_x_lin(ch22_x_lin),
	.ch23_x_lin(ch23_x_lin),
	.ch24_x_lin(ch24_x_lin),
	.ch25_x_lin(ch25_x_lin),
	.ch26_x_lin(ch26_x_lin),
	.ch27_x_lin(ch27_x_lin),
	.ch28_x_lin(ch28_x_lin),
	.ch29_x_lin(ch29_x_lin),
	.ch30_x_lin(ch30_x_lin),
	.ch31_x_lin(ch31_x_lin)
    );
	
////////////////////////////////////////////////////////////////
//  Combinational Logic

////////////////////////////////////////////////////////////////
//  Registers

endmodule
