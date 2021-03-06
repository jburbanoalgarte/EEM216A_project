module upper_mux_32 (
	clk,
	GlobalReset,
	channel_select,
	x_adc_ch0,
	x_adc_ch1,
	x_adc_ch2,
	x_adc_ch3,
	x_adc_ch4,
	x_adc_ch5,
	x_adc_ch6,
	x_adc_ch7,
	x_adc_ch8,
	x_adc_ch9,
	x_adc_ch10,
	x_adc_ch11,
	x_adc_ch12,
	x_adc_ch13,
	x_adc_ch14,
	x_adc_ch15,
	x_adc_ch16,
	x_adc_ch17,
	x_adc_ch18,
	x_adc_ch19,
	x_adc_ch20,
	x_adc_ch21,
	x_adc_ch22,
	x_adc_ch23,
	x_adc_ch24,
	x_adc_ch25,
	x_adc_ch26,
	x_adc_ch27,
	x_adc_ch28,
	x_adc_ch29,
	x_adc_ch30,
	x_adc_ch31,
	section_limit_ch0,
	section_limit_ch1,
	section_limit_ch2,
	section_limit_ch3,
	section_limit_ch4,
	section_limit_ch5,
	section_limit_ch6,
	section_limit_ch7,
	section_limit_ch8,
	section_limit_ch9,
	section_limit_ch10,
	section_limit_ch11,
	section_limit_ch12,
	section_limit_ch13,
	section_limit_ch14,
	section_limit_ch15,
	section_limit_ch16,
	section_limit_ch17,
	section_limit_ch18,
	section_limit_ch19,
	section_limit_ch20,
	section_limit_ch21,
	section_limit_ch22,
	section_limit_ch23,
	section_limit_ch24,
	section_limit_ch25,
	section_limit_ch26,
	section_limit_ch27,
	section_limit_ch28,
	section_limit_ch29,
	section_limit_ch30,
	section_limit_ch31,
	ch0_coeff_1_0,
	ch0_coeff_1_1,
	ch0_coeff_1_2,
	ch0_coeff_1_3,
	ch0_coeff_1_4,
	ch0_coeff_1_5,
	ch0_coeff_1_6,
	ch0_coeff_1_7,
	ch0_coeff_1_8,
	ch0_coeff_1_9,
	ch0_coeff_1_10,
	ch0_mean1,
	ch0_std1,
	ch0_coeff_2_0,
	ch0_coeff_2_1,
	ch0_coeff_2_2,
	ch0_coeff_2_3,
	ch0_coeff_2_4,
	ch0_coeff_2_5,
	ch0_coeff_2_6,
	ch0_coeff_2_7,
	ch0_coeff_2_8,
	ch0_coeff_2_9,
	ch0_coeff_2_10,
	ch0_mean2,
	ch0_std2,
	ch0_coeff_3_0,
	ch0_coeff_3_1,
	ch0_coeff_3_2,
	ch0_coeff_3_3,
	ch0_coeff_3_4,
	ch0_coeff_3_5,
	ch0_coeff_3_6,
	ch0_coeff_3_7,
	ch0_coeff_3_8,
	ch0_coeff_3_9,
	ch0_coeff_3_10,
	ch0_mean3,
	ch0_std3,
	ch0_coeff_4_0,
	ch0_coeff_4_1,
	ch0_coeff_4_2,
	ch0_coeff_4_3,
	ch0_coeff_4_4,
	ch0_coeff_4_5,
	ch0_coeff_4_6,
	ch0_coeff_4_7,
	ch0_coeff_4_8,
	ch0_coeff_4_9,
	ch0_coeff_4_10,
	ch0_mean4,
	ch0_std4,
	ch1_coeff_1_0,
	ch1_coeff_1_1,
	ch1_coeff_1_2,
	ch1_coeff_1_3,
	ch1_coeff_1_4,
	ch1_coeff_1_5,
	ch1_coeff_1_6,
	ch1_coeff_1_7,
	ch1_coeff_1_8,
	ch1_coeff_1_9,
	ch1_coeff_1_10,
	ch1_mean1,
	ch1_std1,
	ch1_coeff_2_0,
	ch1_coeff_2_1,
	ch1_coeff_2_2,
	ch1_coeff_2_3,
	ch1_coeff_2_4,
	ch1_coeff_2_5,
	ch1_coeff_2_6,
	ch1_coeff_2_7,
	ch1_coeff_2_8,
	ch1_coeff_2_9,
	ch1_coeff_2_10,
	ch1_mean2,
	ch1_std2,
	ch1_coeff_3_0,
	ch1_coeff_3_1,
	ch1_coeff_3_2,
	ch1_coeff_3_3,
	ch1_coeff_3_4,
	ch1_coeff_3_5,
	ch1_coeff_3_6,
	ch1_coeff_3_7,
	ch1_coeff_3_8,
	ch1_coeff_3_9,
	ch1_coeff_3_10,
	ch1_mean3,
	ch1_std3,
	ch1_coeff_4_0,
	ch1_coeff_4_1,
	ch1_coeff_4_2,
	ch1_coeff_4_3,
	ch1_coeff_4_4,
	ch1_coeff_4_5,
	ch1_coeff_4_6,
	ch1_coeff_4_7,
	ch1_coeff_4_8,
	ch1_coeff_4_9,
	ch1_coeff_4_10,
	ch1_mean4,
	ch1_std4,
	ch2_coeff_1_0,
	ch2_coeff_1_1,
	ch2_coeff_1_2,
	ch2_coeff_1_3,
	ch2_coeff_1_4,
	ch2_coeff_1_5,
	ch2_coeff_1_6,
	ch2_coeff_1_7,
	ch2_coeff_1_8,
	ch2_coeff_1_9,
	ch2_coeff_1_10,
	ch2_mean1,
	ch2_std1,
	ch2_coeff_2_0,
	ch2_coeff_2_1,
	ch2_coeff_2_2,
	ch2_coeff_2_3,
	ch2_coeff_2_4,
	ch2_coeff_2_5,
	ch2_coeff_2_6,
	ch2_coeff_2_7,
	ch2_coeff_2_8,
	ch2_coeff_2_9,
	ch2_coeff_2_10,
	ch2_mean2,
	ch2_std2,
	ch2_coeff_3_0,
	ch2_coeff_3_1,
	ch2_coeff_3_2,
	ch2_coeff_3_3,
	ch2_coeff_3_4,
	ch2_coeff_3_5,
	ch2_coeff_3_6,
	ch2_coeff_3_7,
	ch2_coeff_3_8,
	ch2_coeff_3_9,
	ch2_coeff_3_10,
	ch2_mean3,
	ch2_std3,
	ch2_coeff_4_0,
	ch2_coeff_4_1,
	ch2_coeff_4_2,
	ch2_coeff_4_3,
	ch2_coeff_4_4,
	ch2_coeff_4_5,
	ch2_coeff_4_6,
	ch2_coeff_4_7,
	ch2_coeff_4_8,
	ch2_coeff_4_9,
	ch2_coeff_4_10,
	ch2_mean4,
	ch2_std4,
	ch3_coeff_1_0,
	ch3_coeff_1_1,
	ch3_coeff_1_2,
	ch3_coeff_1_3,
	ch3_coeff_1_4,
	ch3_coeff_1_5,
	ch3_coeff_1_6,
	ch3_coeff_1_7,
	ch3_coeff_1_8,
	ch3_coeff_1_9,
	ch3_coeff_1_10,
	ch3_mean1,
	ch3_std1,
	ch3_coeff_2_0,
	ch3_coeff_2_1,
	ch3_coeff_2_2,
	ch3_coeff_2_3,
	ch3_coeff_2_4,
	ch3_coeff_2_5,
	ch3_coeff_2_6,
	ch3_coeff_2_7,
	ch3_coeff_2_8,
	ch3_coeff_2_9,
	ch3_coeff_2_10,
	ch3_mean2,
	ch3_std2,
	ch3_coeff_3_0,
	ch3_coeff_3_1,
	ch3_coeff_3_2,
	ch3_coeff_3_3,
	ch3_coeff_3_4,
	ch3_coeff_3_5,
	ch3_coeff_3_6,
	ch3_coeff_3_7,
	ch3_coeff_3_8,
	ch3_coeff_3_9,
	ch3_coeff_3_10,
	ch3_mean3,
	ch3_std3,
	ch3_coeff_4_0,
	ch3_coeff_4_1,
	ch3_coeff_4_2,
	ch3_coeff_4_3,
	ch3_coeff_4_4,
	ch3_coeff_4_5,
	ch3_coeff_4_6,
	ch3_coeff_4_7,
	ch3_coeff_4_8,
	ch3_coeff_4_9,
	ch3_coeff_4_10,
	ch3_mean4,
	ch3_std4,
	ch4_coeff_1_0,
	ch4_coeff_1_1,
	ch4_coeff_1_2,
	ch4_coeff_1_3,
	ch4_coeff_1_4,
	ch4_coeff_1_5,
	ch4_coeff_1_6,
	ch4_coeff_1_7,
	ch4_coeff_1_8,
	ch4_coeff_1_9,
	ch4_coeff_1_10,
	ch4_mean1,
	ch4_std1,
	ch4_coeff_2_0,
	ch4_coeff_2_1,
	ch4_coeff_2_2,
	ch4_coeff_2_3,
	ch4_coeff_2_4,
	ch4_coeff_2_5,
	ch4_coeff_2_6,
	ch4_coeff_2_7,
	ch4_coeff_2_8,
	ch4_coeff_2_9,
	ch4_coeff_2_10,
	ch4_mean2,
	ch4_std2,
	ch4_coeff_3_0,
	ch4_coeff_3_1,
	ch4_coeff_3_2,
	ch4_coeff_3_3,
	ch4_coeff_3_4,
	ch4_coeff_3_5,
	ch4_coeff_3_6,
	ch4_coeff_3_7,
	ch4_coeff_3_8,
	ch4_coeff_3_9,
	ch4_coeff_3_10,
	ch4_mean3,
	ch4_std3,
	ch4_coeff_4_0,
	ch4_coeff_4_1,
	ch4_coeff_4_2,
	ch4_coeff_4_3,
	ch4_coeff_4_4,
	ch4_coeff_4_5,
	ch4_coeff_4_6,
	ch4_coeff_4_7,
	ch4_coeff_4_8,
	ch4_coeff_4_9,
	ch4_coeff_4_10,
	ch4_mean4,
	ch4_std4,
	ch5_coeff_1_0,
	ch5_coeff_1_1,
	ch5_coeff_1_2,
	ch5_coeff_1_3,
	ch5_coeff_1_4,
	ch5_coeff_1_5,
	ch5_coeff_1_6,
	ch5_coeff_1_7,
	ch5_coeff_1_8,
	ch5_coeff_1_9,
	ch5_coeff_1_10,
	ch5_mean1,
	ch5_std1,
	ch5_coeff_2_0,
	ch5_coeff_2_1,
	ch5_coeff_2_2,
	ch5_coeff_2_3,
	ch5_coeff_2_4,
	ch5_coeff_2_5,
	ch5_coeff_2_6,
	ch5_coeff_2_7,
	ch5_coeff_2_8,
	ch5_coeff_2_9,
	ch5_coeff_2_10,
	ch5_mean2,
	ch5_std2,
	ch5_coeff_3_0,
	ch5_coeff_3_1,
	ch5_coeff_3_2,
	ch5_coeff_3_3,
	ch5_coeff_3_4,
	ch5_coeff_3_5,
	ch5_coeff_3_6,
	ch5_coeff_3_7,
	ch5_coeff_3_8,
	ch5_coeff_3_9,
	ch5_coeff_3_10,
	ch5_mean3,
	ch5_std3,
	ch5_coeff_4_0,
	ch5_coeff_4_1,
	ch5_coeff_4_2,
	ch5_coeff_4_3,
	ch5_coeff_4_4,
	ch5_coeff_4_5,
	ch5_coeff_4_6,
	ch5_coeff_4_7,
	ch5_coeff_4_8,
	ch5_coeff_4_9,
	ch5_coeff_4_10,
	ch5_mean4,
	ch5_std4,
	ch6_coeff_1_0,
	ch6_coeff_1_1,
	ch6_coeff_1_2,
	ch6_coeff_1_3,
	ch6_coeff_1_4,
	ch6_coeff_1_5,
	ch6_coeff_1_6,
	ch6_coeff_1_7,
	ch6_coeff_1_8,
	ch6_coeff_1_9,
	ch6_coeff_1_10,
	ch6_mean1,
	ch6_std1,
	ch6_coeff_2_0,
	ch6_coeff_2_1,
	ch6_coeff_2_2,
	ch6_coeff_2_3,
	ch6_coeff_2_4,
	ch6_coeff_2_5,
	ch6_coeff_2_6,
	ch6_coeff_2_7,
	ch6_coeff_2_8,
	ch6_coeff_2_9,
	ch6_coeff_2_10,
	ch6_mean2,
	ch6_std2,
	ch6_coeff_3_0,
	ch6_coeff_3_1,
	ch6_coeff_3_2,
	ch6_coeff_3_3,
	ch6_coeff_3_4,
	ch6_coeff_3_5,
	ch6_coeff_3_6,
	ch6_coeff_3_7,
	ch6_coeff_3_8,
	ch6_coeff_3_9,
	ch6_coeff_3_10,
	ch6_mean3,
	ch6_std3,
	ch6_coeff_4_0,
	ch6_coeff_4_1,
	ch6_coeff_4_2,
	ch6_coeff_4_3,
	ch6_coeff_4_4,
	ch6_coeff_4_5,
	ch6_coeff_4_6,
	ch6_coeff_4_7,
	ch6_coeff_4_8,
	ch6_coeff_4_9,
	ch6_coeff_4_10,
	ch6_mean4,
	ch6_std4,
	ch7_coeff_1_0,
	ch7_coeff_1_1,
	ch7_coeff_1_2,
	ch7_coeff_1_3,
	ch7_coeff_1_4,
	ch7_coeff_1_5,
	ch7_coeff_1_6,
	ch7_coeff_1_7,
	ch7_coeff_1_8,
	ch7_coeff_1_9,
	ch7_coeff_1_10,
	ch7_mean1,
	ch7_std1,
	ch7_coeff_2_0,
	ch7_coeff_2_1,
	ch7_coeff_2_2,
	ch7_coeff_2_3,
	ch7_coeff_2_4,
	ch7_coeff_2_5,
	ch7_coeff_2_6,
	ch7_coeff_2_7,
	ch7_coeff_2_8,
	ch7_coeff_2_9,
	ch7_coeff_2_10,
	ch7_mean2,
	ch7_std2,
	ch7_coeff_3_0,
	ch7_coeff_3_1,
	ch7_coeff_3_2,
	ch7_coeff_3_3,
	ch7_coeff_3_4,
	ch7_coeff_3_5,
	ch7_coeff_3_6,
	ch7_coeff_3_7,
	ch7_coeff_3_8,
	ch7_coeff_3_9,
	ch7_coeff_3_10,
	ch7_mean3,
	ch7_std3,
	ch7_coeff_4_0,
	ch7_coeff_4_1,
	ch7_coeff_4_2,
	ch7_coeff_4_3,
	ch7_coeff_4_4,
	ch7_coeff_4_5,
	ch7_coeff_4_6,
	ch7_coeff_4_7,
	ch7_coeff_4_8,
	ch7_coeff_4_9,
	ch7_coeff_4_10,
	ch7_mean4,
	ch7_std4,
	ch8_coeff_1_0,
	ch8_coeff_1_1,
	ch8_coeff_1_2,
	ch8_coeff_1_3,
	ch8_coeff_1_4,
	ch8_coeff_1_5,
	ch8_coeff_1_6,
	ch8_coeff_1_7,
	ch8_coeff_1_8,
	ch8_coeff_1_9,
	ch8_coeff_1_10,
	ch8_mean1,
	ch8_std1,
	ch8_coeff_2_0,
	ch8_coeff_2_1,
	ch8_coeff_2_2,
	ch8_coeff_2_3,
	ch8_coeff_2_4,
	ch8_coeff_2_5,
	ch8_coeff_2_6,
	ch8_coeff_2_7,
	ch8_coeff_2_8,
	ch8_coeff_2_9,
	ch8_coeff_2_10,
	ch8_mean2,
	ch8_std2,
	ch8_coeff_3_0,
	ch8_coeff_3_1,
	ch8_coeff_3_2,
	ch8_coeff_3_3,
	ch8_coeff_3_4,
	ch8_coeff_3_5,
	ch8_coeff_3_6,
	ch8_coeff_3_7,
	ch8_coeff_3_8,
	ch8_coeff_3_9,
	ch8_coeff_3_10,
	ch8_mean3,
	ch8_std3,
	ch8_coeff_4_0,
	ch8_coeff_4_1,
	ch8_coeff_4_2,
	ch8_coeff_4_3,
	ch8_coeff_4_4,
	ch8_coeff_4_5,
	ch8_coeff_4_6,
	ch8_coeff_4_7,
	ch8_coeff_4_8,
	ch8_coeff_4_9,
	ch8_coeff_4_10,
	ch8_mean4,
	ch8_std4,
	ch9_coeff_1_0,
	ch9_coeff_1_1,
	ch9_coeff_1_2,
	ch9_coeff_1_3,
	ch9_coeff_1_4,
	ch9_coeff_1_5,
	ch9_coeff_1_6,
	ch9_coeff_1_7,
	ch9_coeff_1_8,
	ch9_coeff_1_9,
	ch9_coeff_1_10,
	ch9_mean1,
	ch9_std1,
	ch9_coeff_2_0,
	ch9_coeff_2_1,
	ch9_coeff_2_2,
	ch9_coeff_2_3,
	ch9_coeff_2_4,
	ch9_coeff_2_5,
	ch9_coeff_2_6,
	ch9_coeff_2_7,
	ch9_coeff_2_8,
	ch9_coeff_2_9,
	ch9_coeff_2_10,
	ch9_mean2,
	ch9_std2,
	ch9_coeff_3_0,
	ch9_coeff_3_1,
	ch9_coeff_3_2,
	ch9_coeff_3_3,
	ch9_coeff_3_4,
	ch9_coeff_3_5,
	ch9_coeff_3_6,
	ch9_coeff_3_7,
	ch9_coeff_3_8,
	ch9_coeff_3_9,
	ch9_coeff_3_10,
	ch9_mean3,
	ch9_std3,
	ch9_coeff_4_0,
	ch9_coeff_4_1,
	ch9_coeff_4_2,
	ch9_coeff_4_3,
	ch9_coeff_4_4,
	ch9_coeff_4_5,
	ch9_coeff_4_6,
	ch9_coeff_4_7,
	ch9_coeff_4_8,
	ch9_coeff_4_9,
	ch9_coeff_4_10,
	ch9_mean4,
	ch9_std4,
	ch10_coeff_1_0,
	ch10_coeff_1_1,
	ch10_coeff_1_2,
	ch10_coeff_1_3,
	ch10_coeff_1_4,
	ch10_coeff_1_5,
	ch10_coeff_1_6,
	ch10_coeff_1_7,
	ch10_coeff_1_8,
	ch10_coeff_1_9,
	ch10_coeff_1_10,
	ch10_mean1,
	ch10_std1,
	ch10_coeff_2_0,
	ch10_coeff_2_1,
	ch10_coeff_2_2,
	ch10_coeff_2_3,
	ch10_coeff_2_4,
	ch10_coeff_2_5,
	ch10_coeff_2_6,
	ch10_coeff_2_7,
	ch10_coeff_2_8,
	ch10_coeff_2_9,
	ch10_coeff_2_10,
	ch10_mean2,
	ch10_std2,
	ch10_coeff_3_0,
	ch10_coeff_3_1,
	ch10_coeff_3_2,
	ch10_coeff_3_3,
	ch10_coeff_3_4,
	ch10_coeff_3_5,
	ch10_coeff_3_6,
	ch10_coeff_3_7,
	ch10_coeff_3_8,
	ch10_coeff_3_9,
	ch10_coeff_3_10,
	ch10_mean3,
	ch10_std3,
	ch10_coeff_4_0,
	ch10_coeff_4_1,
	ch10_coeff_4_2,
	ch10_coeff_4_3,
	ch10_coeff_4_4,
	ch10_coeff_4_5,
	ch10_coeff_4_6,
	ch10_coeff_4_7,
	ch10_coeff_4_8,
	ch10_coeff_4_9,
	ch10_coeff_4_10,
	ch10_mean4,
	ch10_std4,
	ch11_coeff_1_0,
	ch11_coeff_1_1,
	ch11_coeff_1_2,
	ch11_coeff_1_3,
	ch11_coeff_1_4,
	ch11_coeff_1_5,
	ch11_coeff_1_6,
	ch11_coeff_1_7,
	ch11_coeff_1_8,
	ch11_coeff_1_9,
	ch11_coeff_1_10,
	ch11_mean1,
	ch11_std1,
	ch11_coeff_2_0,
	ch11_coeff_2_1,
	ch11_coeff_2_2,
	ch11_coeff_2_3,
	ch11_coeff_2_4,
	ch11_coeff_2_5,
	ch11_coeff_2_6,
	ch11_coeff_2_7,
	ch11_coeff_2_8,
	ch11_coeff_2_9,
	ch11_coeff_2_10,
	ch11_mean2,
	ch11_std2,
	ch11_coeff_3_0,
	ch11_coeff_3_1,
	ch11_coeff_3_2,
	ch11_coeff_3_3,
	ch11_coeff_3_4,
	ch11_coeff_3_5,
	ch11_coeff_3_6,
	ch11_coeff_3_7,
	ch11_coeff_3_8,
	ch11_coeff_3_9,
	ch11_coeff_3_10,
	ch11_mean3,
	ch11_std3,
	ch11_coeff_4_0,
	ch11_coeff_4_1,
	ch11_coeff_4_2,
	ch11_coeff_4_3,
	ch11_coeff_4_4,
	ch11_coeff_4_5,
	ch11_coeff_4_6,
	ch11_coeff_4_7,
	ch11_coeff_4_8,
	ch11_coeff_4_9,
	ch11_coeff_4_10,
	ch11_mean4,
	ch11_std4,
	ch12_coeff_1_0,
	ch12_coeff_1_1,
	ch12_coeff_1_2,
	ch12_coeff_1_3,
	ch12_coeff_1_4,
	ch12_coeff_1_5,
	ch12_coeff_1_6,
	ch12_coeff_1_7,
	ch12_coeff_1_8,
	ch12_coeff_1_9,
	ch12_coeff_1_10,
	ch12_mean1,
	ch12_std1,
	ch12_coeff_2_0,
	ch12_coeff_2_1,
	ch12_coeff_2_2,
	ch12_coeff_2_3,
	ch12_coeff_2_4,
	ch12_coeff_2_5,
	ch12_coeff_2_6,
	ch12_coeff_2_7,
	ch12_coeff_2_8,
	ch12_coeff_2_9,
	ch12_coeff_2_10,
	ch12_mean2,
	ch12_std2,
	ch12_coeff_3_0,
	ch12_coeff_3_1,
	ch12_coeff_3_2,
	ch12_coeff_3_3,
	ch12_coeff_3_4,
	ch12_coeff_3_5,
	ch12_coeff_3_6,
	ch12_coeff_3_7,
	ch12_coeff_3_8,
	ch12_coeff_3_9,
	ch12_coeff_3_10,
	ch12_mean3,
	ch12_std3,
	ch12_coeff_4_0,
	ch12_coeff_4_1,
	ch12_coeff_4_2,
	ch12_coeff_4_3,
	ch12_coeff_4_4,
	ch12_coeff_4_5,
	ch12_coeff_4_6,
	ch12_coeff_4_7,
	ch12_coeff_4_8,
	ch12_coeff_4_9,
	ch12_coeff_4_10,
	ch12_mean4,
	ch12_std4,
	ch13_coeff_1_0,
	ch13_coeff_1_1,
	ch13_coeff_1_2,
	ch13_coeff_1_3,
	ch13_coeff_1_4,
	ch13_coeff_1_5,
	ch13_coeff_1_6,
	ch13_coeff_1_7,
	ch13_coeff_1_8,
	ch13_coeff_1_9,
	ch13_coeff_1_10,
	ch13_mean1,
	ch13_std1,
	ch13_coeff_2_0,
	ch13_coeff_2_1,
	ch13_coeff_2_2,
	ch13_coeff_2_3,
	ch13_coeff_2_4,
	ch13_coeff_2_5,
	ch13_coeff_2_6,
	ch13_coeff_2_7,
	ch13_coeff_2_8,
	ch13_coeff_2_9,
	ch13_coeff_2_10,
	ch13_mean2,
	ch13_std2,
	ch13_coeff_3_0,
	ch13_coeff_3_1,
	ch13_coeff_3_2,
	ch13_coeff_3_3,
	ch13_coeff_3_4,
	ch13_coeff_3_5,
	ch13_coeff_3_6,
	ch13_coeff_3_7,
	ch13_coeff_3_8,
	ch13_coeff_3_9,
	ch13_coeff_3_10,
	ch13_mean3,
	ch13_std3,
	ch13_coeff_4_0,
	ch13_coeff_4_1,
	ch13_coeff_4_2,
	ch13_coeff_4_3,
	ch13_coeff_4_4,
	ch13_coeff_4_5,
	ch13_coeff_4_6,
	ch13_coeff_4_7,
	ch13_coeff_4_8,
	ch13_coeff_4_9,
	ch13_coeff_4_10,
	ch13_mean4,
	ch13_std4,
	ch14_coeff_1_0,
	ch14_coeff_1_1,
	ch14_coeff_1_2,
	ch14_coeff_1_3,
	ch14_coeff_1_4,
	ch14_coeff_1_5,
	ch14_coeff_1_6,
	ch14_coeff_1_7,
	ch14_coeff_1_8,
	ch14_coeff_1_9,
	ch14_coeff_1_10,
	ch14_mean1,
	ch14_std1,
	ch14_coeff_2_0,
	ch14_coeff_2_1,
	ch14_coeff_2_2,
	ch14_coeff_2_3,
	ch14_coeff_2_4,
	ch14_coeff_2_5,
	ch14_coeff_2_6,
	ch14_coeff_2_7,
	ch14_coeff_2_8,
	ch14_coeff_2_9,
	ch14_coeff_2_10,
	ch14_mean2,
	ch14_std2,
	ch14_coeff_3_0,
	ch14_coeff_3_1,
	ch14_coeff_3_2,
	ch14_coeff_3_3,
	ch14_coeff_3_4,
	ch14_coeff_3_5,
	ch14_coeff_3_6,
	ch14_coeff_3_7,
	ch14_coeff_3_8,
	ch14_coeff_3_9,
	ch14_coeff_3_10,
	ch14_mean3,
	ch14_std3,
	ch14_coeff_4_0,
	ch14_coeff_4_1,
	ch14_coeff_4_2,
	ch14_coeff_4_3,
	ch14_coeff_4_4,
	ch14_coeff_4_5,
	ch14_coeff_4_6,
	ch14_coeff_4_7,
	ch14_coeff_4_8,
	ch14_coeff_4_9,
	ch14_coeff_4_10,
	ch14_mean4,
	ch14_std4,
	ch15_coeff_1_0,
	ch15_coeff_1_1,
	ch15_coeff_1_2,
	ch15_coeff_1_3,
	ch15_coeff_1_4,
	ch15_coeff_1_5,
	ch15_coeff_1_6,
	ch15_coeff_1_7,
	ch15_coeff_1_8,
	ch15_coeff_1_9,
	ch15_coeff_1_10,
	ch15_mean1,
	ch15_std1,
	ch15_coeff_2_0,
	ch15_coeff_2_1,
	ch15_coeff_2_2,
	ch15_coeff_2_3,
	ch15_coeff_2_4,
	ch15_coeff_2_5,
	ch15_coeff_2_6,
	ch15_coeff_2_7,
	ch15_coeff_2_8,
	ch15_coeff_2_9,
	ch15_coeff_2_10,
	ch15_mean2,
	ch15_std2,
	ch15_coeff_3_0,
	ch15_coeff_3_1,
	ch15_coeff_3_2,
	ch15_coeff_3_3,
	ch15_coeff_3_4,
	ch15_coeff_3_5,
	ch15_coeff_3_6,
	ch15_coeff_3_7,
	ch15_coeff_3_8,
	ch15_coeff_3_9,
	ch15_coeff_3_10,
	ch15_mean3,
	ch15_std3,
	ch15_coeff_4_0,
	ch15_coeff_4_1,
	ch15_coeff_4_2,
	ch15_coeff_4_3,
	ch15_coeff_4_4,
	ch15_coeff_4_5,
	ch15_coeff_4_6,
	ch15_coeff_4_7,
	ch15_coeff_4_8,
	ch15_coeff_4_9,
	ch15_coeff_4_10,
	ch15_mean4,
	ch15_std4,
	ch16_coeff_1_0,
	ch16_coeff_1_1,
	ch16_coeff_1_2,
	ch16_coeff_1_3,
	ch16_coeff_1_4,
	ch16_coeff_1_5,
	ch16_coeff_1_6,
	ch16_coeff_1_7,
	ch16_coeff_1_8,
	ch16_coeff_1_9,
	ch16_coeff_1_10,
	ch16_mean1,
	ch16_std1,
	ch16_coeff_2_0,
	ch16_coeff_2_1,
	ch16_coeff_2_2,
	ch16_coeff_2_3,
	ch16_coeff_2_4,
	ch16_coeff_2_5,
	ch16_coeff_2_6,
	ch16_coeff_2_7,
	ch16_coeff_2_8,
	ch16_coeff_2_9,
	ch16_coeff_2_10,
	ch16_mean2,
	ch16_std2,
	ch16_coeff_3_0,
	ch16_coeff_3_1,
	ch16_coeff_3_2,
	ch16_coeff_3_3,
	ch16_coeff_3_4,
	ch16_coeff_3_5,
	ch16_coeff_3_6,
	ch16_coeff_3_7,
	ch16_coeff_3_8,
	ch16_coeff_3_9,
	ch16_coeff_3_10,
	ch16_mean3,
	ch16_std3,
	ch16_coeff_4_0,
	ch16_coeff_4_1,
	ch16_coeff_4_2,
	ch16_coeff_4_3,
	ch16_coeff_4_4,
	ch16_coeff_4_5,
	ch16_coeff_4_6,
	ch16_coeff_4_7,
	ch16_coeff_4_8,
	ch16_coeff_4_9,
	ch16_coeff_4_10,
	ch16_mean4,
	ch16_std4,
	ch17_coeff_1_0,
	ch17_coeff_1_1,
	ch17_coeff_1_2,
	ch17_coeff_1_3,
	ch17_coeff_1_4,
	ch17_coeff_1_5,
	ch17_coeff_1_6,
	ch17_coeff_1_7,
	ch17_coeff_1_8,
	ch17_coeff_1_9,
	ch17_coeff_1_10,
	ch17_mean1,
	ch17_std1,
	ch17_coeff_2_0,
	ch17_coeff_2_1,
	ch17_coeff_2_2,
	ch17_coeff_2_3,
	ch17_coeff_2_4,
	ch17_coeff_2_5,
	ch17_coeff_2_6,
	ch17_coeff_2_7,
	ch17_coeff_2_8,
	ch17_coeff_2_9,
	ch17_coeff_2_10,
	ch17_mean2,
	ch17_std2,
	ch17_coeff_3_0,
	ch17_coeff_3_1,
	ch17_coeff_3_2,
	ch17_coeff_3_3,
	ch17_coeff_3_4,
	ch17_coeff_3_5,
	ch17_coeff_3_6,
	ch17_coeff_3_7,
	ch17_coeff_3_8,
	ch17_coeff_3_9,
	ch17_coeff_3_10,
	ch17_mean3,
	ch17_std3,
	ch17_coeff_4_0,
	ch17_coeff_4_1,
	ch17_coeff_4_2,
	ch17_coeff_4_3,
	ch17_coeff_4_4,
	ch17_coeff_4_5,
	ch17_coeff_4_6,
	ch17_coeff_4_7,
	ch17_coeff_4_8,
	ch17_coeff_4_9,
	ch17_coeff_4_10,
	ch17_mean4,
	ch17_std4,
	ch18_coeff_1_0,
	ch18_coeff_1_1,
	ch18_coeff_1_2,
	ch18_coeff_1_3,
	ch18_coeff_1_4,
	ch18_coeff_1_5,
	ch18_coeff_1_6,
	ch18_coeff_1_7,
	ch18_coeff_1_8,
	ch18_coeff_1_9,
	ch18_coeff_1_10,
	ch18_mean1,
	ch18_std1,
	ch18_coeff_2_0,
	ch18_coeff_2_1,
	ch18_coeff_2_2,
	ch18_coeff_2_3,
	ch18_coeff_2_4,
	ch18_coeff_2_5,
	ch18_coeff_2_6,
	ch18_coeff_2_7,
	ch18_coeff_2_8,
	ch18_coeff_2_9,
	ch18_coeff_2_10,
	ch18_mean2,
	ch18_std2,
	ch18_coeff_3_0,
	ch18_coeff_3_1,
	ch18_coeff_3_2,
	ch18_coeff_3_3,
	ch18_coeff_3_4,
	ch18_coeff_3_5,
	ch18_coeff_3_6,
	ch18_coeff_3_7,
	ch18_coeff_3_8,
	ch18_coeff_3_9,
	ch18_coeff_3_10,
	ch18_mean3,
	ch18_std3,
	ch18_coeff_4_0,
	ch18_coeff_4_1,
	ch18_coeff_4_2,
	ch18_coeff_4_3,
	ch18_coeff_4_4,
	ch18_coeff_4_5,
	ch18_coeff_4_6,
	ch18_coeff_4_7,
	ch18_coeff_4_8,
	ch18_coeff_4_9,
	ch18_coeff_4_10,
	ch18_mean4,
	ch18_std4,
	ch19_coeff_1_0,
	ch19_coeff_1_1,
	ch19_coeff_1_2,
	ch19_coeff_1_3,
	ch19_coeff_1_4,
	ch19_coeff_1_5,
	ch19_coeff_1_6,
	ch19_coeff_1_7,
	ch19_coeff_1_8,
	ch19_coeff_1_9,
	ch19_coeff_1_10,
	ch19_mean1,
	ch19_std1,
	ch19_coeff_2_0,
	ch19_coeff_2_1,
	ch19_coeff_2_2,
	ch19_coeff_2_3,
	ch19_coeff_2_4,
	ch19_coeff_2_5,
	ch19_coeff_2_6,
	ch19_coeff_2_7,
	ch19_coeff_2_8,
	ch19_coeff_2_9,
	ch19_coeff_2_10,
	ch19_mean2,
	ch19_std2,
	ch19_coeff_3_0,
	ch19_coeff_3_1,
	ch19_coeff_3_2,
	ch19_coeff_3_3,
	ch19_coeff_3_4,
	ch19_coeff_3_5,
	ch19_coeff_3_6,
	ch19_coeff_3_7,
	ch19_coeff_3_8,
	ch19_coeff_3_9,
	ch19_coeff_3_10,
	ch19_mean3,
	ch19_std3,
	ch19_coeff_4_0,
	ch19_coeff_4_1,
	ch19_coeff_4_2,
	ch19_coeff_4_3,
	ch19_coeff_4_4,
	ch19_coeff_4_5,
	ch19_coeff_4_6,
	ch19_coeff_4_7,
	ch19_coeff_4_8,
	ch19_coeff_4_9,
	ch19_coeff_4_10,
	ch19_mean4,
	ch19_std4,
	ch20_coeff_1_0,
	ch20_coeff_1_1,
	ch20_coeff_1_2,
	ch20_coeff_1_3,
	ch20_coeff_1_4,
	ch20_coeff_1_5,
	ch20_coeff_1_6,
	ch20_coeff_1_7,
	ch20_coeff_1_8,
	ch20_coeff_1_9,
	ch20_coeff_1_10,
	ch20_mean1,
	ch20_std1,
	ch20_coeff_2_0,
	ch20_coeff_2_1,
	ch20_coeff_2_2,
	ch20_coeff_2_3,
	ch20_coeff_2_4,
	ch20_coeff_2_5,
	ch20_coeff_2_6,
	ch20_coeff_2_7,
	ch20_coeff_2_8,
	ch20_coeff_2_9,
	ch20_coeff_2_10,
	ch20_mean2,
	ch20_std2,
	ch20_coeff_3_0,
	ch20_coeff_3_1,
	ch20_coeff_3_2,
	ch20_coeff_3_3,
	ch20_coeff_3_4,
	ch20_coeff_3_5,
	ch20_coeff_3_6,
	ch20_coeff_3_7,
	ch20_coeff_3_8,
	ch20_coeff_3_9,
	ch20_coeff_3_10,
	ch20_mean3,
	ch20_std3,
	ch20_coeff_4_0,
	ch20_coeff_4_1,
	ch20_coeff_4_2,
	ch20_coeff_4_3,
	ch20_coeff_4_4,
	ch20_coeff_4_5,
	ch20_coeff_4_6,
	ch20_coeff_4_7,
	ch20_coeff_4_8,
	ch20_coeff_4_9,
	ch20_coeff_4_10,
	ch20_mean4,
	ch20_std4,
	ch21_coeff_1_0,
	ch21_coeff_1_1,
	ch21_coeff_1_2,
	ch21_coeff_1_3,
	ch21_coeff_1_4,
	ch21_coeff_1_5,
	ch21_coeff_1_6,
	ch21_coeff_1_7,
	ch21_coeff_1_8,
	ch21_coeff_1_9,
	ch21_coeff_1_10,
	ch21_mean1,
	ch21_std1,
	ch21_coeff_2_0,
	ch21_coeff_2_1,
	ch21_coeff_2_2,
	ch21_coeff_2_3,
	ch21_coeff_2_4,
	ch21_coeff_2_5,
	ch21_coeff_2_6,
	ch21_coeff_2_7,
	ch21_coeff_2_8,
	ch21_coeff_2_9,
	ch21_coeff_2_10,
	ch21_mean2,
	ch21_std2,
	ch21_coeff_3_0,
	ch21_coeff_3_1,
	ch21_coeff_3_2,
	ch21_coeff_3_3,
	ch21_coeff_3_4,
	ch21_coeff_3_5,
	ch21_coeff_3_6,
	ch21_coeff_3_7,
	ch21_coeff_3_8,
	ch21_coeff_3_9,
	ch21_coeff_3_10,
	ch21_mean3,
	ch21_std3,
	ch21_coeff_4_0,
	ch21_coeff_4_1,
	ch21_coeff_4_2,
	ch21_coeff_4_3,
	ch21_coeff_4_4,
	ch21_coeff_4_5,
	ch21_coeff_4_6,
	ch21_coeff_4_7,
	ch21_coeff_4_8,
	ch21_coeff_4_9,
	ch21_coeff_4_10,
	ch21_mean4,
	ch21_std4,
	ch22_coeff_1_0,
	ch22_coeff_1_1,
	ch22_coeff_1_2,
	ch22_coeff_1_3,
	ch22_coeff_1_4,
	ch22_coeff_1_5,
	ch22_coeff_1_6,
	ch22_coeff_1_7,
	ch22_coeff_1_8,
	ch22_coeff_1_9,
	ch22_coeff_1_10,
	ch22_mean1,
	ch22_std1,
	ch22_coeff_2_0,
	ch22_coeff_2_1,
	ch22_coeff_2_2,
	ch22_coeff_2_3,
	ch22_coeff_2_4,
	ch22_coeff_2_5,
	ch22_coeff_2_6,
	ch22_coeff_2_7,
	ch22_coeff_2_8,
	ch22_coeff_2_9,
	ch22_coeff_2_10,
	ch22_mean2,
	ch22_std2,
	ch22_coeff_3_0,
	ch22_coeff_3_1,
	ch22_coeff_3_2,
	ch22_coeff_3_3,
	ch22_coeff_3_4,
	ch22_coeff_3_5,
	ch22_coeff_3_6,
	ch22_coeff_3_7,
	ch22_coeff_3_8,
	ch22_coeff_3_9,
	ch22_coeff_3_10,
	ch22_mean3,
	ch22_std3,
	ch22_coeff_4_0,
	ch22_coeff_4_1,
	ch22_coeff_4_2,
	ch22_coeff_4_3,
	ch22_coeff_4_4,
	ch22_coeff_4_5,
	ch22_coeff_4_6,
	ch22_coeff_4_7,
	ch22_coeff_4_8,
	ch22_coeff_4_9,
	ch22_coeff_4_10,
	ch22_mean4,
	ch22_std4,
	ch23_coeff_1_0,
	ch23_coeff_1_1,
	ch23_coeff_1_2,
	ch23_coeff_1_3,
	ch23_coeff_1_4,
	ch23_coeff_1_5,
	ch23_coeff_1_6,
	ch23_coeff_1_7,
	ch23_coeff_1_8,
	ch23_coeff_1_9,
	ch23_coeff_1_10,
	ch23_mean1,
	ch23_std1,
	ch23_coeff_2_0,
	ch23_coeff_2_1,
	ch23_coeff_2_2,
	ch23_coeff_2_3,
	ch23_coeff_2_4,
	ch23_coeff_2_5,
	ch23_coeff_2_6,
	ch23_coeff_2_7,
	ch23_coeff_2_8,
	ch23_coeff_2_9,
	ch23_coeff_2_10,
	ch23_mean2,
	ch23_std2,
	ch23_coeff_3_0,
	ch23_coeff_3_1,
	ch23_coeff_3_2,
	ch23_coeff_3_3,
	ch23_coeff_3_4,
	ch23_coeff_3_5,
	ch23_coeff_3_6,
	ch23_coeff_3_7,
	ch23_coeff_3_8,
	ch23_coeff_3_9,
	ch23_coeff_3_10,
	ch23_mean3,
	ch23_std3,
	ch23_coeff_4_0,
	ch23_coeff_4_1,
	ch23_coeff_4_2,
	ch23_coeff_4_3,
	ch23_coeff_4_4,
	ch23_coeff_4_5,
	ch23_coeff_4_6,
	ch23_coeff_4_7,
	ch23_coeff_4_8,
	ch23_coeff_4_9,
	ch23_coeff_4_10,
	ch23_mean4,
	ch23_std4,
	ch24_coeff_1_0,
	ch24_coeff_1_1,
	ch24_coeff_1_2,
	ch24_coeff_1_3,
	ch24_coeff_1_4,
	ch24_coeff_1_5,
	ch24_coeff_1_6,
	ch24_coeff_1_7,
	ch24_coeff_1_8,
	ch24_coeff_1_9,
	ch24_coeff_1_10,
	ch24_mean1,
	ch24_std1,
	ch24_coeff_2_0,
	ch24_coeff_2_1,
	ch24_coeff_2_2,
	ch24_coeff_2_3,
	ch24_coeff_2_4,
	ch24_coeff_2_5,
	ch24_coeff_2_6,
	ch24_coeff_2_7,
	ch24_coeff_2_8,
	ch24_coeff_2_9,
	ch24_coeff_2_10,
	ch24_mean2,
	ch24_std2,
	ch24_coeff_3_0,
	ch24_coeff_3_1,
	ch24_coeff_3_2,
	ch24_coeff_3_3,
	ch24_coeff_3_4,
	ch24_coeff_3_5,
	ch24_coeff_3_6,
	ch24_coeff_3_7,
	ch24_coeff_3_8,
	ch24_coeff_3_9,
	ch24_coeff_3_10,
	ch24_mean3,
	ch24_std3,
	ch24_coeff_4_0,
	ch24_coeff_4_1,
	ch24_coeff_4_2,
	ch24_coeff_4_3,
	ch24_coeff_4_4,
	ch24_coeff_4_5,
	ch24_coeff_4_6,
	ch24_coeff_4_7,
	ch24_coeff_4_8,
	ch24_coeff_4_9,
	ch24_coeff_4_10,
	ch24_mean4,
	ch24_std4,
	ch25_coeff_1_0,
	ch25_coeff_1_1,
	ch25_coeff_1_2,
	ch25_coeff_1_3,
	ch25_coeff_1_4,
	ch25_coeff_1_5,
	ch25_coeff_1_6,
	ch25_coeff_1_7,
	ch25_coeff_1_8,
	ch25_coeff_1_9,
	ch25_coeff_1_10,
	ch25_mean1,
	ch25_std1,
	ch25_coeff_2_0,
	ch25_coeff_2_1,
	ch25_coeff_2_2,
	ch25_coeff_2_3,
	ch25_coeff_2_4,
	ch25_coeff_2_5,
	ch25_coeff_2_6,
	ch25_coeff_2_7,
	ch25_coeff_2_8,
	ch25_coeff_2_9,
	ch25_coeff_2_10,
	ch25_mean2,
	ch25_std2,
	ch25_coeff_3_0,
	ch25_coeff_3_1,
	ch25_coeff_3_2,
	ch25_coeff_3_3,
	ch25_coeff_3_4,
	ch25_coeff_3_5,
	ch25_coeff_3_6,
	ch25_coeff_3_7,
	ch25_coeff_3_8,
	ch25_coeff_3_9,
	ch25_coeff_3_10,
	ch25_mean3,
	ch25_std3,
	ch25_coeff_4_0,
	ch25_coeff_4_1,
	ch25_coeff_4_2,
	ch25_coeff_4_3,
	ch25_coeff_4_4,
	ch25_coeff_4_5,
	ch25_coeff_4_6,
	ch25_coeff_4_7,
	ch25_coeff_4_8,
	ch25_coeff_4_9,
	ch25_coeff_4_10,
	ch25_mean4,
	ch25_std4,
	ch26_coeff_1_0,
	ch26_coeff_1_1,
	ch26_coeff_1_2,
	ch26_coeff_1_3,
	ch26_coeff_1_4,
	ch26_coeff_1_5,
	ch26_coeff_1_6,
	ch26_coeff_1_7,
	ch26_coeff_1_8,
	ch26_coeff_1_9,
	ch26_coeff_1_10,
	ch26_mean1,
	ch26_std1,
	ch26_coeff_2_0,
	ch26_coeff_2_1,
	ch26_coeff_2_2,
	ch26_coeff_2_3,
	ch26_coeff_2_4,
	ch26_coeff_2_5,
	ch26_coeff_2_6,
	ch26_coeff_2_7,
	ch26_coeff_2_8,
	ch26_coeff_2_9,
	ch26_coeff_2_10,
	ch26_mean2,
	ch26_std2,
	ch26_coeff_3_0,
	ch26_coeff_3_1,
	ch26_coeff_3_2,
	ch26_coeff_3_3,
	ch26_coeff_3_4,
	ch26_coeff_3_5,
	ch26_coeff_3_6,
	ch26_coeff_3_7,
	ch26_coeff_3_8,
	ch26_coeff_3_9,
	ch26_coeff_3_10,
	ch26_mean3,
	ch26_std3,
	ch26_coeff_4_0,
	ch26_coeff_4_1,
	ch26_coeff_4_2,
	ch26_coeff_4_3,
	ch26_coeff_4_4,
	ch26_coeff_4_5,
	ch26_coeff_4_6,
	ch26_coeff_4_7,
	ch26_coeff_4_8,
	ch26_coeff_4_9,
	ch26_coeff_4_10,
	ch26_mean4,
	ch26_std4,
	ch27_coeff_1_0,
	ch27_coeff_1_1,
	ch27_coeff_1_2,
	ch27_coeff_1_3,
	ch27_coeff_1_4,
	ch27_coeff_1_5,
	ch27_coeff_1_6,
	ch27_coeff_1_7,
	ch27_coeff_1_8,
	ch27_coeff_1_9,
	ch27_coeff_1_10,
	ch27_mean1,
	ch27_std1,
	ch27_coeff_2_0,
	ch27_coeff_2_1,
	ch27_coeff_2_2,
	ch27_coeff_2_3,
	ch27_coeff_2_4,
	ch27_coeff_2_5,
	ch27_coeff_2_6,
	ch27_coeff_2_7,
	ch27_coeff_2_8,
	ch27_coeff_2_9,
	ch27_coeff_2_10,
	ch27_mean2,
	ch27_std2,
	ch27_coeff_3_0,
	ch27_coeff_3_1,
	ch27_coeff_3_2,
	ch27_coeff_3_3,
	ch27_coeff_3_4,
	ch27_coeff_3_5,
	ch27_coeff_3_6,
	ch27_coeff_3_7,
	ch27_coeff_3_8,
	ch27_coeff_3_9,
	ch27_coeff_3_10,
	ch27_mean3,
	ch27_std3,
	ch27_coeff_4_0,
	ch27_coeff_4_1,
	ch27_coeff_4_2,
	ch27_coeff_4_3,
	ch27_coeff_4_4,
	ch27_coeff_4_5,
	ch27_coeff_4_6,
	ch27_coeff_4_7,
	ch27_coeff_4_8,
	ch27_coeff_4_9,
	ch27_coeff_4_10,
	ch27_mean4,
	ch27_std4,
	ch28_coeff_1_0,
	ch28_coeff_1_1,
	ch28_coeff_1_2,
	ch28_coeff_1_3,
	ch28_coeff_1_4,
	ch28_coeff_1_5,
	ch28_coeff_1_6,
	ch28_coeff_1_7,
	ch28_coeff_1_8,
	ch28_coeff_1_9,
	ch28_coeff_1_10,
	ch28_mean1,
	ch28_std1,
	ch28_coeff_2_0,
	ch28_coeff_2_1,
	ch28_coeff_2_2,
	ch28_coeff_2_3,
	ch28_coeff_2_4,
	ch28_coeff_2_5,
	ch28_coeff_2_6,
	ch28_coeff_2_7,
	ch28_coeff_2_8,
	ch28_coeff_2_9,
	ch28_coeff_2_10,
	ch28_mean2,
	ch28_std2,
	ch28_coeff_3_0,
	ch28_coeff_3_1,
	ch28_coeff_3_2,
	ch28_coeff_3_3,
	ch28_coeff_3_4,
	ch28_coeff_3_5,
	ch28_coeff_3_6,
	ch28_coeff_3_7,
	ch28_coeff_3_8,
	ch28_coeff_3_9,
	ch28_coeff_3_10,
	ch28_mean3,
	ch28_std3,
	ch28_coeff_4_0,
	ch28_coeff_4_1,
	ch28_coeff_4_2,
	ch28_coeff_4_3,
	ch28_coeff_4_4,
	ch28_coeff_4_5,
	ch28_coeff_4_6,
	ch28_coeff_4_7,
	ch28_coeff_4_8,
	ch28_coeff_4_9,
	ch28_coeff_4_10,
	ch28_mean4,
	ch28_std4,
	ch29_coeff_1_0,
	ch29_coeff_1_1,
	ch29_coeff_1_2,
	ch29_coeff_1_3,
	ch29_coeff_1_4,
	ch29_coeff_1_5,
	ch29_coeff_1_6,
	ch29_coeff_1_7,
	ch29_coeff_1_8,
	ch29_coeff_1_9,
	ch29_coeff_1_10,
	ch29_mean1,
	ch29_std1,
	ch29_coeff_2_0,
	ch29_coeff_2_1,
	ch29_coeff_2_2,
	ch29_coeff_2_3,
	ch29_coeff_2_4,
	ch29_coeff_2_5,
	ch29_coeff_2_6,
	ch29_coeff_2_7,
	ch29_coeff_2_8,
	ch29_coeff_2_9,
	ch29_coeff_2_10,
	ch29_mean2,
	ch29_std2,
	ch29_coeff_3_0,
	ch29_coeff_3_1,
	ch29_coeff_3_2,
	ch29_coeff_3_3,
	ch29_coeff_3_4,
	ch29_coeff_3_5,
	ch29_coeff_3_6,
	ch29_coeff_3_7,
	ch29_coeff_3_8,
	ch29_coeff_3_9,
	ch29_coeff_3_10,
	ch29_mean3,
	ch29_std3,
	ch29_coeff_4_0,
	ch29_coeff_4_1,
	ch29_coeff_4_2,
	ch29_coeff_4_3,
	ch29_coeff_4_4,
	ch29_coeff_4_5,
	ch29_coeff_4_6,
	ch29_coeff_4_7,
	ch29_coeff_4_8,
	ch29_coeff_4_9,
	ch29_coeff_4_10,
	ch29_mean4,
	ch29_std4,
	ch30_coeff_1_0,
	ch30_coeff_1_1,
	ch30_coeff_1_2,
	ch30_coeff_1_3,
	ch30_coeff_1_4,
	ch30_coeff_1_5,
	ch30_coeff_1_6,
	ch30_coeff_1_7,
	ch30_coeff_1_8,
	ch30_coeff_1_9,
	ch30_coeff_1_10,
	ch30_mean1,
	ch30_std1,
	ch30_coeff_2_0,
	ch30_coeff_2_1,
	ch30_coeff_2_2,
	ch30_coeff_2_3,
	ch30_coeff_2_4,
	ch30_coeff_2_5,
	ch30_coeff_2_6,
	ch30_coeff_2_7,
	ch30_coeff_2_8,
	ch30_coeff_2_9,
	ch30_coeff_2_10,
	ch30_mean2,
	ch30_std2,
	ch30_coeff_3_0,
	ch30_coeff_3_1,
	ch30_coeff_3_2,
	ch30_coeff_3_3,
	ch30_coeff_3_4,
	ch30_coeff_3_5,
	ch30_coeff_3_6,
	ch30_coeff_3_7,
	ch30_coeff_3_8,
	ch30_coeff_3_9,
	ch30_coeff_3_10,
	ch30_mean3,
	ch30_std3,
	ch30_coeff_4_0,
	ch30_coeff_4_1,
	ch30_coeff_4_2,
	ch30_coeff_4_3,
	ch30_coeff_4_4,
	ch30_coeff_4_5,
	ch30_coeff_4_6,
	ch30_coeff_4_7,
	ch30_coeff_4_8,
	ch30_coeff_4_9,
	ch30_coeff_4_10,
	ch30_mean4,
	ch30_std4,
	ch31_coeff_1_0,
	ch31_coeff_1_1,
	ch31_coeff_1_2,
	ch31_coeff_1_3,
	ch31_coeff_1_4,
	ch31_coeff_1_5,
	ch31_coeff_1_6,
	ch31_coeff_1_7,
	ch31_coeff_1_8,
	ch31_coeff_1_9,
	ch31_coeff_1_10,
	ch31_mean1,
	ch31_std1,
	ch31_coeff_2_0,
	ch31_coeff_2_1,
	ch31_coeff_2_2,
	ch31_coeff_2_3,
	ch31_coeff_2_4,
	ch31_coeff_2_5,
	ch31_coeff_2_6,
	ch31_coeff_2_7,
	ch31_coeff_2_8,
	ch31_coeff_2_9,
	ch31_coeff_2_10,
	ch31_mean2,
	ch31_std2,
	ch31_coeff_3_0,
	ch31_coeff_3_1,
	ch31_coeff_3_2,
	ch31_coeff_3_3,
	ch31_coeff_3_4,
	ch31_coeff_3_5,
	ch31_coeff_3_6,
	ch31_coeff_3_7,
	ch31_coeff_3_8,
	ch31_coeff_3_9,
	ch31_coeff_3_10,
	ch31_mean3,
	ch31_std3,
	ch31_coeff_4_0,
	ch31_coeff_4_1,
	ch31_coeff_4_2,
	ch31_coeff_4_3,
	ch31_coeff_4_4,
	ch31_coeff_4_5,
	ch31_coeff_4_6,
	ch31_coeff_4_7,
	ch31_coeff_4_8,
	ch31_coeff_4_9,
	ch31_coeff_4_10,
	ch31_mean4,
	ch31_std4,
	x_adc,
	section_limit,
	coeff_1_0,
	coeff_1_1,
	coeff_1_2,
	coeff_1_3,
	coeff_1_4,
	coeff_1_5,
	coeff_1_6,
	coeff_1_7,
	coeff_1_8,
	coeff_1_9,
	coeff_1_10,
	mean1,
	std1,
	coeff_2_0,
	coeff_2_1,
	coeff_2_2,
	coeff_2_3,
	coeff_2_4,
	coeff_2_5,
	coeff_2_6,
	coeff_2_7,
	coeff_2_8,
	coeff_2_9,
	coeff_2_10,
	mean2,
	std2,
	coeff_3_0,
	coeff_3_1,
	coeff_3_2,
	coeff_3_3,
	coeff_3_4,
	coeff_3_5,
	coeff_3_6,
	coeff_3_7,
	coeff_3_8,
	coeff_3_9,
	coeff_3_10,
	mean3,
	std3,
	coeff_4_0,
	coeff_4_1,
	coeff_4_2,
	coeff_4_3,
	coeff_4_4,
	coeff_4_5,
	coeff_4_6,
	coeff_4_7,
	coeff_4_8,
	coeff_4_9,
	coeff_4_10,
	mean4,
	std4
	);

input clk;
input GlobalReset;
input [4:0] channel_select;
input [20:0] x_adc_ch0;
input [20:0] x_adc_ch1;
input [20:0] x_adc_ch2;
input [20:0] x_adc_ch3;
input [20:0] x_adc_ch4;
input [20:0] x_adc_ch5;
input [20:0] x_adc_ch6;
input [20:0] x_adc_ch7;
input [20:0] x_adc_ch8;
input [20:0] x_adc_ch9;
input [20:0] x_adc_ch10;
input [20:0] x_adc_ch11;
input [20:0] x_adc_ch12;
input [20:0] x_adc_ch13;
input [20:0] x_adc_ch14;
input [20:0] x_adc_ch15;
input [20:0] x_adc_ch16;
input [20:0] x_adc_ch17;
input [20:0] x_adc_ch18;
input [20:0] x_adc_ch19;
input [20:0] x_adc_ch20;
input [20:0] x_adc_ch21;
input [20:0] x_adc_ch22;
input [20:0] x_adc_ch23;
input [20:0] x_adc_ch24;
input [20:0] x_adc_ch25;
input [20:0] x_adc_ch26;
input [20:0] x_adc_ch27;
input [20:0] x_adc_ch28;
input [20:0] x_adc_ch29;
input [20:0] x_adc_ch30;
input [20:0] x_adc_ch31;
input [19:0] section_limit_ch0;
input [19:0] section_limit_ch1;
input [19:0] section_limit_ch2;
input [19:0] section_limit_ch3;
input [19:0] section_limit_ch4;
input [19:0] section_limit_ch5;
input [19:0] section_limit_ch6;
input [19:0] section_limit_ch7;
input [19:0] section_limit_ch8;
input [19:0] section_limit_ch9;
input [19:0] section_limit_ch10;
input [19:0] section_limit_ch11;
input [19:0] section_limit_ch12;
input [19:0] section_limit_ch13;
input [19:0] section_limit_ch14;
input [19:0] section_limit_ch15;
input [19:0] section_limit_ch16;
input [19:0] section_limit_ch17;
input [19:0] section_limit_ch18;
input [19:0] section_limit_ch19;
input [19:0] section_limit_ch20;
input [19:0] section_limit_ch21;
input [19:0] section_limit_ch22;
input [19:0] section_limit_ch23;
input [19:0] section_limit_ch24;
input [19:0] section_limit_ch25;
input [19:0] section_limit_ch26;
input [19:0] section_limit_ch27;
input [19:0] section_limit_ch28;
input [19:0] section_limit_ch29;
input [19:0] section_limit_ch30;
input [19:0] section_limit_ch31;
input [31:0] ch0_coeff_1_0;
input [31:0] ch0_coeff_1_1;
input [31:0] ch0_coeff_1_2;
input [31:0] ch0_coeff_1_3;
input [31:0] ch0_coeff_1_4;
input [31:0] ch0_coeff_1_5;
input [31:0] ch0_coeff_1_6;
input [31:0] ch0_coeff_1_7;
input [31:0] ch0_coeff_1_8;
input [31:0] ch0_coeff_1_9;
input [31:0] ch0_coeff_1_10;
input [31:0] ch0_mean1;
input [31:0] ch0_std1;
input [31:0] ch0_coeff_2_0;
input [31:0] ch0_coeff_2_1;
input [31:0] ch0_coeff_2_2;
input [31:0] ch0_coeff_2_3;
input [31:0] ch0_coeff_2_4;
input [31:0] ch0_coeff_2_5;
input [31:0] ch0_coeff_2_6;
input [31:0] ch0_coeff_2_7;
input [31:0] ch0_coeff_2_8;
input [31:0] ch0_coeff_2_9;
input [31:0] ch0_coeff_2_10;
input [31:0] ch0_mean2;
input [31:0] ch0_std2;
input [31:0] ch0_coeff_3_0;
input [31:0] ch0_coeff_3_1;
input [31:0] ch0_coeff_3_2;
input [31:0] ch0_coeff_3_3;
input [31:0] ch0_coeff_3_4;
input [31:0] ch0_coeff_3_5;
input [31:0] ch0_coeff_3_6;
input [31:0] ch0_coeff_3_7;
input [31:0] ch0_coeff_3_8;
input [31:0] ch0_coeff_3_9;
input [31:0] ch0_coeff_3_10;
input [31:0] ch0_mean3;
input [31:0] ch0_std3;
input [31:0] ch0_coeff_4_0;
input [31:0] ch0_coeff_4_1;
input [31:0] ch0_coeff_4_2;
input [31:0] ch0_coeff_4_3;
input [31:0] ch0_coeff_4_4;
input [31:0] ch0_coeff_4_5;
input [31:0] ch0_coeff_4_6;
input [31:0] ch0_coeff_4_7;
input [31:0] ch0_coeff_4_8;
input [31:0] ch0_coeff_4_9;
input [31:0] ch0_coeff_4_10;
input [31:0] ch0_mean4;
input [31:0] ch0_std4;
input [31:0] ch1_coeff_1_0;
input [31:0] ch1_coeff_1_1;
input [31:0] ch1_coeff_1_2;
input [31:0] ch1_coeff_1_3;
input [31:0] ch1_coeff_1_4;
input [31:0] ch1_coeff_1_5;
input [31:0] ch1_coeff_1_6;
input [31:0] ch1_coeff_1_7;
input [31:0] ch1_coeff_1_8;
input [31:0] ch1_coeff_1_9;
input [31:0] ch1_coeff_1_10;
input [31:0] ch1_mean1;
input [31:0] ch1_std1;
input [31:0] ch1_coeff_2_0;
input [31:0] ch1_coeff_2_1;
input [31:0] ch1_coeff_2_2;
input [31:0] ch1_coeff_2_3;
input [31:0] ch1_coeff_2_4;
input [31:0] ch1_coeff_2_5;
input [31:0] ch1_coeff_2_6;
input [31:0] ch1_coeff_2_7;
input [31:0] ch1_coeff_2_8;
input [31:0] ch1_coeff_2_9;
input [31:0] ch1_coeff_2_10;
input [31:0] ch1_mean2;
input [31:0] ch1_std2;
input [31:0] ch1_coeff_3_0;
input [31:0] ch1_coeff_3_1;
input [31:0] ch1_coeff_3_2;
input [31:0] ch1_coeff_3_3;
input [31:0] ch1_coeff_3_4;
input [31:0] ch1_coeff_3_5;
input [31:0] ch1_coeff_3_6;
input [31:0] ch1_coeff_3_7;
input [31:0] ch1_coeff_3_8;
input [31:0] ch1_coeff_3_9;
input [31:0] ch1_coeff_3_10;
input [31:0] ch1_mean3;
input [31:0] ch1_std3;
input [31:0] ch1_coeff_4_0;
input [31:0] ch1_coeff_4_1;
input [31:0] ch1_coeff_4_2;
input [31:0] ch1_coeff_4_3;
input [31:0] ch1_coeff_4_4;
input [31:0] ch1_coeff_4_5;
input [31:0] ch1_coeff_4_6;
input [31:0] ch1_coeff_4_7;
input [31:0] ch1_coeff_4_8;
input [31:0] ch1_coeff_4_9;
input [31:0] ch1_coeff_4_10;
input [31:0] ch1_mean4;
input [31:0] ch1_std4;
input [31:0] ch2_coeff_1_0;
input [31:0] ch2_coeff_1_1;
input [31:0] ch2_coeff_1_2;
input [31:0] ch2_coeff_1_3;
input [31:0] ch2_coeff_1_4;
input [31:0] ch2_coeff_1_5;
input [31:0] ch2_coeff_1_6;
input [31:0] ch2_coeff_1_7;
input [31:0] ch2_coeff_1_8;
input [31:0] ch2_coeff_1_9;
input [31:0] ch2_coeff_1_10;
input [31:0] ch2_mean1;
input [31:0] ch2_std1;
input [31:0] ch2_coeff_2_0;
input [31:0] ch2_coeff_2_1;
input [31:0] ch2_coeff_2_2;
input [31:0] ch2_coeff_2_3;
input [31:0] ch2_coeff_2_4;
input [31:0] ch2_coeff_2_5;
input [31:0] ch2_coeff_2_6;
input [31:0] ch2_coeff_2_7;
input [31:0] ch2_coeff_2_8;
input [31:0] ch2_coeff_2_9;
input [31:0] ch2_coeff_2_10;
input [31:0] ch2_mean2;
input [31:0] ch2_std2;
input [31:0] ch2_coeff_3_0;
input [31:0] ch2_coeff_3_1;
input [31:0] ch2_coeff_3_2;
input [31:0] ch2_coeff_3_3;
input [31:0] ch2_coeff_3_4;
input [31:0] ch2_coeff_3_5;
input [31:0] ch2_coeff_3_6;
input [31:0] ch2_coeff_3_7;
input [31:0] ch2_coeff_3_8;
input [31:0] ch2_coeff_3_9;
input [31:0] ch2_coeff_3_10;
input [31:0] ch2_mean3;
input [31:0] ch2_std3;
input [31:0] ch2_coeff_4_0;
input [31:0] ch2_coeff_4_1;
input [31:0] ch2_coeff_4_2;
input [31:0] ch2_coeff_4_3;
input [31:0] ch2_coeff_4_4;
input [31:0] ch2_coeff_4_5;
input [31:0] ch2_coeff_4_6;
input [31:0] ch2_coeff_4_7;
input [31:0] ch2_coeff_4_8;
input [31:0] ch2_coeff_4_9;
input [31:0] ch2_coeff_4_10;
input [31:0] ch2_mean4;
input [31:0] ch2_std4;
input [31:0] ch3_coeff_1_0;
input [31:0] ch3_coeff_1_1;
input [31:0] ch3_coeff_1_2;
input [31:0] ch3_coeff_1_3;
input [31:0] ch3_coeff_1_4;
input [31:0] ch3_coeff_1_5;
input [31:0] ch3_coeff_1_6;
input [31:0] ch3_coeff_1_7;
input [31:0] ch3_coeff_1_8;
input [31:0] ch3_coeff_1_9;
input [31:0] ch3_coeff_1_10;
input [31:0] ch3_mean1;
input [31:0] ch3_std1;
input [31:0] ch3_coeff_2_0;
input [31:0] ch3_coeff_2_1;
input [31:0] ch3_coeff_2_2;
input [31:0] ch3_coeff_2_3;
input [31:0] ch3_coeff_2_4;
input [31:0] ch3_coeff_2_5;
input [31:0] ch3_coeff_2_6;
input [31:0] ch3_coeff_2_7;
input [31:0] ch3_coeff_2_8;
input [31:0] ch3_coeff_2_9;
input [31:0] ch3_coeff_2_10;
input [31:0] ch3_mean2;
input [31:0] ch3_std2;
input [31:0] ch3_coeff_3_0;
input [31:0] ch3_coeff_3_1;
input [31:0] ch3_coeff_3_2;
input [31:0] ch3_coeff_3_3;
input [31:0] ch3_coeff_3_4;
input [31:0] ch3_coeff_3_5;
input [31:0] ch3_coeff_3_6;
input [31:0] ch3_coeff_3_7;
input [31:0] ch3_coeff_3_8;
input [31:0] ch3_coeff_3_9;
input [31:0] ch3_coeff_3_10;
input [31:0] ch3_mean3;
input [31:0] ch3_std3;
input [31:0] ch3_coeff_4_0;
input [31:0] ch3_coeff_4_1;
input [31:0] ch3_coeff_4_2;
input [31:0] ch3_coeff_4_3;
input [31:0] ch3_coeff_4_4;
input [31:0] ch3_coeff_4_5;
input [31:0] ch3_coeff_4_6;
input [31:0] ch3_coeff_4_7;
input [31:0] ch3_coeff_4_8;
input [31:0] ch3_coeff_4_9;
input [31:0] ch3_coeff_4_10;
input [31:0] ch3_mean4;
input [31:0] ch3_std4;
input [31:0] ch4_coeff_1_0;
input [31:0] ch4_coeff_1_1;
input [31:0] ch4_coeff_1_2;
input [31:0] ch4_coeff_1_3;
input [31:0] ch4_coeff_1_4;
input [31:0] ch4_coeff_1_5;
input [31:0] ch4_coeff_1_6;
input [31:0] ch4_coeff_1_7;
input [31:0] ch4_coeff_1_8;
input [31:0] ch4_coeff_1_9;
input [31:0] ch4_coeff_1_10;
input [31:0] ch4_mean1;
input [31:0] ch4_std1;
input [31:0] ch4_coeff_2_0;
input [31:0] ch4_coeff_2_1;
input [31:0] ch4_coeff_2_2;
input [31:0] ch4_coeff_2_3;
input [31:0] ch4_coeff_2_4;
input [31:0] ch4_coeff_2_5;
input [31:0] ch4_coeff_2_6;
input [31:0] ch4_coeff_2_7;
input [31:0] ch4_coeff_2_8;
input [31:0] ch4_coeff_2_9;
input [31:0] ch4_coeff_2_10;
input [31:0] ch4_mean2;
input [31:0] ch4_std2;
input [31:0] ch4_coeff_3_0;
input [31:0] ch4_coeff_3_1;
input [31:0] ch4_coeff_3_2;
input [31:0] ch4_coeff_3_3;
input [31:0] ch4_coeff_3_4;
input [31:0] ch4_coeff_3_5;
input [31:0] ch4_coeff_3_6;
input [31:0] ch4_coeff_3_7;
input [31:0] ch4_coeff_3_8;
input [31:0] ch4_coeff_3_9;
input [31:0] ch4_coeff_3_10;
input [31:0] ch4_mean3;
input [31:0] ch4_std3;
input [31:0] ch4_coeff_4_0;
input [31:0] ch4_coeff_4_1;
input [31:0] ch4_coeff_4_2;
input [31:0] ch4_coeff_4_3;
input [31:0] ch4_coeff_4_4;
input [31:0] ch4_coeff_4_5;
input [31:0] ch4_coeff_4_6;
input [31:0] ch4_coeff_4_7;
input [31:0] ch4_coeff_4_8;
input [31:0] ch4_coeff_4_9;
input [31:0] ch4_coeff_4_10;
input [31:0] ch4_mean4;
input [31:0] ch4_std4;
input [31:0] ch5_coeff_1_0;
input [31:0] ch5_coeff_1_1;
input [31:0] ch5_coeff_1_2;
input [31:0] ch5_coeff_1_3;
input [31:0] ch5_coeff_1_4;
input [31:0] ch5_coeff_1_5;
input [31:0] ch5_coeff_1_6;
input [31:0] ch5_coeff_1_7;
input [31:0] ch5_coeff_1_8;
input [31:0] ch5_coeff_1_9;
input [31:0] ch5_coeff_1_10;
input [31:0] ch5_mean1;
input [31:0] ch5_std1;
input [31:0] ch5_coeff_2_0;
input [31:0] ch5_coeff_2_1;
input [31:0] ch5_coeff_2_2;
input [31:0] ch5_coeff_2_3;
input [31:0] ch5_coeff_2_4;
input [31:0] ch5_coeff_2_5;
input [31:0] ch5_coeff_2_6;
input [31:0] ch5_coeff_2_7;
input [31:0] ch5_coeff_2_8;
input [31:0] ch5_coeff_2_9;
input [31:0] ch5_coeff_2_10;
input [31:0] ch5_mean2;
input [31:0] ch5_std2;
input [31:0] ch5_coeff_3_0;
input [31:0] ch5_coeff_3_1;
input [31:0] ch5_coeff_3_2;
input [31:0] ch5_coeff_3_3;
input [31:0] ch5_coeff_3_4;
input [31:0] ch5_coeff_3_5;
input [31:0] ch5_coeff_3_6;
input [31:0] ch5_coeff_3_7;
input [31:0] ch5_coeff_3_8;
input [31:0] ch5_coeff_3_9;
input [31:0] ch5_coeff_3_10;
input [31:0] ch5_mean3;
input [31:0] ch5_std3;
input [31:0] ch5_coeff_4_0;
input [31:0] ch5_coeff_4_1;
input [31:0] ch5_coeff_4_2;
input [31:0] ch5_coeff_4_3;
input [31:0] ch5_coeff_4_4;
input [31:0] ch5_coeff_4_5;
input [31:0] ch5_coeff_4_6;
input [31:0] ch5_coeff_4_7;
input [31:0] ch5_coeff_4_8;
input [31:0] ch5_coeff_4_9;
input [31:0] ch5_coeff_4_10;
input [31:0] ch5_mean4;
input [31:0] ch5_std4;
input [31:0] ch6_coeff_1_0;
input [31:0] ch6_coeff_1_1;
input [31:0] ch6_coeff_1_2;
input [31:0] ch6_coeff_1_3;
input [31:0] ch6_coeff_1_4;
input [31:0] ch6_coeff_1_5;
input [31:0] ch6_coeff_1_6;
input [31:0] ch6_coeff_1_7;
input [31:0] ch6_coeff_1_8;
input [31:0] ch6_coeff_1_9;
input [31:0] ch6_coeff_1_10;
input [31:0] ch6_mean1;
input [31:0] ch6_std1;
input [31:0] ch6_coeff_2_0;
input [31:0] ch6_coeff_2_1;
input [31:0] ch6_coeff_2_2;
input [31:0] ch6_coeff_2_3;
input [31:0] ch6_coeff_2_4;
input [31:0] ch6_coeff_2_5;
input [31:0] ch6_coeff_2_6;
input [31:0] ch6_coeff_2_7;
input [31:0] ch6_coeff_2_8;
input [31:0] ch6_coeff_2_9;
input [31:0] ch6_coeff_2_10;
input [31:0] ch6_mean2;
input [31:0] ch6_std2;
input [31:0] ch6_coeff_3_0;
input [31:0] ch6_coeff_3_1;
input [31:0] ch6_coeff_3_2;
input [31:0] ch6_coeff_3_3;
input [31:0] ch6_coeff_3_4;
input [31:0] ch6_coeff_3_5;
input [31:0] ch6_coeff_3_6;
input [31:0] ch6_coeff_3_7;
input [31:0] ch6_coeff_3_8;
input [31:0] ch6_coeff_3_9;
input [31:0] ch6_coeff_3_10;
input [31:0] ch6_mean3;
input [31:0] ch6_std3;
input [31:0] ch6_coeff_4_0;
input [31:0] ch6_coeff_4_1;
input [31:0] ch6_coeff_4_2;
input [31:0] ch6_coeff_4_3;
input [31:0] ch6_coeff_4_4;
input [31:0] ch6_coeff_4_5;
input [31:0] ch6_coeff_4_6;
input [31:0] ch6_coeff_4_7;
input [31:0] ch6_coeff_4_8;
input [31:0] ch6_coeff_4_9;
input [31:0] ch6_coeff_4_10;
input [31:0] ch6_mean4;
input [31:0] ch6_std4;
input [31:0] ch7_coeff_1_0;
input [31:0] ch7_coeff_1_1;
input [31:0] ch7_coeff_1_2;
input [31:0] ch7_coeff_1_3;
input [31:0] ch7_coeff_1_4;
input [31:0] ch7_coeff_1_5;
input [31:0] ch7_coeff_1_6;
input [31:0] ch7_coeff_1_7;
input [31:0] ch7_coeff_1_8;
input [31:0] ch7_coeff_1_9;
input [31:0] ch7_coeff_1_10;
input [31:0] ch7_mean1;
input [31:0] ch7_std1;
input [31:0] ch7_coeff_2_0;
input [31:0] ch7_coeff_2_1;
input [31:0] ch7_coeff_2_2;
input [31:0] ch7_coeff_2_3;
input [31:0] ch7_coeff_2_4;
input [31:0] ch7_coeff_2_5;
input [31:0] ch7_coeff_2_6;
input [31:0] ch7_coeff_2_7;
input [31:0] ch7_coeff_2_8;
input [31:0] ch7_coeff_2_9;
input [31:0] ch7_coeff_2_10;
input [31:0] ch7_mean2;
input [31:0] ch7_std2;
input [31:0] ch7_coeff_3_0;
input [31:0] ch7_coeff_3_1;
input [31:0] ch7_coeff_3_2;
input [31:0] ch7_coeff_3_3;
input [31:0] ch7_coeff_3_4;
input [31:0] ch7_coeff_3_5;
input [31:0] ch7_coeff_3_6;
input [31:0] ch7_coeff_3_7;
input [31:0] ch7_coeff_3_8;
input [31:0] ch7_coeff_3_9;
input [31:0] ch7_coeff_3_10;
input [31:0] ch7_mean3;
input [31:0] ch7_std3;
input [31:0] ch7_coeff_4_0;
input [31:0] ch7_coeff_4_1;
input [31:0] ch7_coeff_4_2;
input [31:0] ch7_coeff_4_3;
input [31:0] ch7_coeff_4_4;
input [31:0] ch7_coeff_4_5;
input [31:0] ch7_coeff_4_6;
input [31:0] ch7_coeff_4_7;
input [31:0] ch7_coeff_4_8;
input [31:0] ch7_coeff_4_9;
input [31:0] ch7_coeff_4_10;
input [31:0] ch7_mean4;
input [31:0] ch7_std4;
input [31:0] ch8_coeff_1_0;
input [31:0] ch8_coeff_1_1;
input [31:0] ch8_coeff_1_2;
input [31:0] ch8_coeff_1_3;
input [31:0] ch8_coeff_1_4;
input [31:0] ch8_coeff_1_5;
input [31:0] ch8_coeff_1_6;
input [31:0] ch8_coeff_1_7;
input [31:0] ch8_coeff_1_8;
input [31:0] ch8_coeff_1_9;
input [31:0] ch8_coeff_1_10;
input [31:0] ch8_mean1;
input [31:0] ch8_std1;
input [31:0] ch8_coeff_2_0;
input [31:0] ch8_coeff_2_1;
input [31:0] ch8_coeff_2_2;
input [31:0] ch8_coeff_2_3;
input [31:0] ch8_coeff_2_4;
input [31:0] ch8_coeff_2_5;
input [31:0] ch8_coeff_2_6;
input [31:0] ch8_coeff_2_7;
input [31:0] ch8_coeff_2_8;
input [31:0] ch8_coeff_2_9;
input [31:0] ch8_coeff_2_10;
input [31:0] ch8_mean2;
input [31:0] ch8_std2;
input [31:0] ch8_coeff_3_0;
input [31:0] ch8_coeff_3_1;
input [31:0] ch8_coeff_3_2;
input [31:0] ch8_coeff_3_3;
input [31:0] ch8_coeff_3_4;
input [31:0] ch8_coeff_3_5;
input [31:0] ch8_coeff_3_6;
input [31:0] ch8_coeff_3_7;
input [31:0] ch8_coeff_3_8;
input [31:0] ch8_coeff_3_9;
input [31:0] ch8_coeff_3_10;
input [31:0] ch8_mean3;
input [31:0] ch8_std3;
input [31:0] ch8_coeff_4_0;
input [31:0] ch8_coeff_4_1;
input [31:0] ch8_coeff_4_2;
input [31:0] ch8_coeff_4_3;
input [31:0] ch8_coeff_4_4;
input [31:0] ch8_coeff_4_5;
input [31:0] ch8_coeff_4_6;
input [31:0] ch8_coeff_4_7;
input [31:0] ch8_coeff_4_8;
input [31:0] ch8_coeff_4_9;
input [31:0] ch8_coeff_4_10;
input [31:0] ch8_mean4;
input [31:0] ch8_std4;
input [31:0] ch9_coeff_1_0;
input [31:0] ch9_coeff_1_1;
input [31:0] ch9_coeff_1_2;
input [31:0] ch9_coeff_1_3;
input [31:0] ch9_coeff_1_4;
input [31:0] ch9_coeff_1_5;
input [31:0] ch9_coeff_1_6;
input [31:0] ch9_coeff_1_7;
input [31:0] ch9_coeff_1_8;
input [31:0] ch9_coeff_1_9;
input [31:0] ch9_coeff_1_10;
input [31:0] ch9_mean1;
input [31:0] ch9_std1;
input [31:0] ch9_coeff_2_0;
input [31:0] ch9_coeff_2_1;
input [31:0] ch9_coeff_2_2;
input [31:0] ch9_coeff_2_3;
input [31:0] ch9_coeff_2_4;
input [31:0] ch9_coeff_2_5;
input [31:0] ch9_coeff_2_6;
input [31:0] ch9_coeff_2_7;
input [31:0] ch9_coeff_2_8;
input [31:0] ch9_coeff_2_9;
input [31:0] ch9_coeff_2_10;
input [31:0] ch9_mean2;
input [31:0] ch9_std2;
input [31:0] ch9_coeff_3_0;
input [31:0] ch9_coeff_3_1;
input [31:0] ch9_coeff_3_2;
input [31:0] ch9_coeff_3_3;
input [31:0] ch9_coeff_3_4;
input [31:0] ch9_coeff_3_5;
input [31:0] ch9_coeff_3_6;
input [31:0] ch9_coeff_3_7;
input [31:0] ch9_coeff_3_8;
input [31:0] ch9_coeff_3_9;
input [31:0] ch9_coeff_3_10;
input [31:0] ch9_mean3;
input [31:0] ch9_std3;
input [31:0] ch9_coeff_4_0;
input [31:0] ch9_coeff_4_1;
input [31:0] ch9_coeff_4_2;
input [31:0] ch9_coeff_4_3;
input [31:0] ch9_coeff_4_4;
input [31:0] ch9_coeff_4_5;
input [31:0] ch9_coeff_4_6;
input [31:0] ch9_coeff_4_7;
input [31:0] ch9_coeff_4_8;
input [31:0] ch9_coeff_4_9;
input [31:0] ch9_coeff_4_10;
input [31:0] ch9_mean4;
input [31:0] ch9_std4;
input [31:0] ch10_coeff_1_0;
input [31:0] ch10_coeff_1_1;
input [31:0] ch10_coeff_1_2;
input [31:0] ch10_coeff_1_3;
input [31:0] ch10_coeff_1_4;
input [31:0] ch10_coeff_1_5;
input [31:0] ch10_coeff_1_6;
input [31:0] ch10_coeff_1_7;
input [31:0] ch10_coeff_1_8;
input [31:0] ch10_coeff_1_9;
input [31:0] ch10_coeff_1_10;
input [31:0] ch10_mean1;
input [31:0] ch10_std1;
input [31:0] ch10_coeff_2_0;
input [31:0] ch10_coeff_2_1;
input [31:0] ch10_coeff_2_2;
input [31:0] ch10_coeff_2_3;
input [31:0] ch10_coeff_2_4;
input [31:0] ch10_coeff_2_5;
input [31:0] ch10_coeff_2_6;
input [31:0] ch10_coeff_2_7;
input [31:0] ch10_coeff_2_8;
input [31:0] ch10_coeff_2_9;
input [31:0] ch10_coeff_2_10;
input [31:0] ch10_mean2;
input [31:0] ch10_std2;
input [31:0] ch10_coeff_3_0;
input [31:0] ch10_coeff_3_1;
input [31:0] ch10_coeff_3_2;
input [31:0] ch10_coeff_3_3;
input [31:0] ch10_coeff_3_4;
input [31:0] ch10_coeff_3_5;
input [31:0] ch10_coeff_3_6;
input [31:0] ch10_coeff_3_7;
input [31:0] ch10_coeff_3_8;
input [31:0] ch10_coeff_3_9;
input [31:0] ch10_coeff_3_10;
input [31:0] ch10_mean3;
input [31:0] ch10_std3;
input [31:0] ch10_coeff_4_0;
input [31:0] ch10_coeff_4_1;
input [31:0] ch10_coeff_4_2;
input [31:0] ch10_coeff_4_3;
input [31:0] ch10_coeff_4_4;
input [31:0] ch10_coeff_4_5;
input [31:0] ch10_coeff_4_6;
input [31:0] ch10_coeff_4_7;
input [31:0] ch10_coeff_4_8;
input [31:0] ch10_coeff_4_9;
input [31:0] ch10_coeff_4_10;
input [31:0] ch10_mean4;
input [31:0] ch10_std4;
input [31:0] ch11_coeff_1_0;
input [31:0] ch11_coeff_1_1;
input [31:0] ch11_coeff_1_2;
input [31:0] ch11_coeff_1_3;
input [31:0] ch11_coeff_1_4;
input [31:0] ch11_coeff_1_5;
input [31:0] ch11_coeff_1_6;
input [31:0] ch11_coeff_1_7;
input [31:0] ch11_coeff_1_8;
input [31:0] ch11_coeff_1_9;
input [31:0] ch11_coeff_1_10;
input [31:0] ch11_mean1;
input [31:0] ch11_std1;
input [31:0] ch11_coeff_2_0;
input [31:0] ch11_coeff_2_1;
input [31:0] ch11_coeff_2_2;
input [31:0] ch11_coeff_2_3;
input [31:0] ch11_coeff_2_4;
input [31:0] ch11_coeff_2_5;
input [31:0] ch11_coeff_2_6;
input [31:0] ch11_coeff_2_7;
input [31:0] ch11_coeff_2_8;
input [31:0] ch11_coeff_2_9;
input [31:0] ch11_coeff_2_10;
input [31:0] ch11_mean2;
input [31:0] ch11_std2;
input [31:0] ch11_coeff_3_0;
input [31:0] ch11_coeff_3_1;
input [31:0] ch11_coeff_3_2;
input [31:0] ch11_coeff_3_3;
input [31:0] ch11_coeff_3_4;
input [31:0] ch11_coeff_3_5;
input [31:0] ch11_coeff_3_6;
input [31:0] ch11_coeff_3_7;
input [31:0] ch11_coeff_3_8;
input [31:0] ch11_coeff_3_9;
input [31:0] ch11_coeff_3_10;
input [31:0] ch11_mean3;
input [31:0] ch11_std3;
input [31:0] ch11_coeff_4_0;
input [31:0] ch11_coeff_4_1;
input [31:0] ch11_coeff_4_2;
input [31:0] ch11_coeff_4_3;
input [31:0] ch11_coeff_4_4;
input [31:0] ch11_coeff_4_5;
input [31:0] ch11_coeff_4_6;
input [31:0] ch11_coeff_4_7;
input [31:0] ch11_coeff_4_8;
input [31:0] ch11_coeff_4_9;
input [31:0] ch11_coeff_4_10;
input [31:0] ch11_mean4;
input [31:0] ch11_std4;
input [31:0] ch12_coeff_1_0;
input [31:0] ch12_coeff_1_1;
input [31:0] ch12_coeff_1_2;
input [31:0] ch12_coeff_1_3;
input [31:0] ch12_coeff_1_4;
input [31:0] ch12_coeff_1_5;
input [31:0] ch12_coeff_1_6;
input [31:0] ch12_coeff_1_7;
input [31:0] ch12_coeff_1_8;
input [31:0] ch12_coeff_1_9;
input [31:0] ch12_coeff_1_10;
input [31:0] ch12_mean1;
input [31:0] ch12_std1;
input [31:0] ch12_coeff_2_0;
input [31:0] ch12_coeff_2_1;
input [31:0] ch12_coeff_2_2;
input [31:0] ch12_coeff_2_3;
input [31:0] ch12_coeff_2_4;
input [31:0] ch12_coeff_2_5;
input [31:0] ch12_coeff_2_6;
input [31:0] ch12_coeff_2_7;
input [31:0] ch12_coeff_2_8;
input [31:0] ch12_coeff_2_9;
input [31:0] ch12_coeff_2_10;
input [31:0] ch12_mean2;
input [31:0] ch12_std2;
input [31:0] ch12_coeff_3_0;
input [31:0] ch12_coeff_3_1;
input [31:0] ch12_coeff_3_2;
input [31:0] ch12_coeff_3_3;
input [31:0] ch12_coeff_3_4;
input [31:0] ch12_coeff_3_5;
input [31:0] ch12_coeff_3_6;
input [31:0] ch12_coeff_3_7;
input [31:0] ch12_coeff_3_8;
input [31:0] ch12_coeff_3_9;
input [31:0] ch12_coeff_3_10;
input [31:0] ch12_mean3;
input [31:0] ch12_std3;
input [31:0] ch12_coeff_4_0;
input [31:0] ch12_coeff_4_1;
input [31:0] ch12_coeff_4_2;
input [31:0] ch12_coeff_4_3;
input [31:0] ch12_coeff_4_4;
input [31:0] ch12_coeff_4_5;
input [31:0] ch12_coeff_4_6;
input [31:0] ch12_coeff_4_7;
input [31:0] ch12_coeff_4_8;
input [31:0] ch12_coeff_4_9;
input [31:0] ch12_coeff_4_10;
input [31:0] ch12_mean4;
input [31:0] ch12_std4;
input [31:0] ch13_coeff_1_0;
input [31:0] ch13_coeff_1_1;
input [31:0] ch13_coeff_1_2;
input [31:0] ch13_coeff_1_3;
input [31:0] ch13_coeff_1_4;
input [31:0] ch13_coeff_1_5;
input [31:0] ch13_coeff_1_6;
input [31:0] ch13_coeff_1_7;
input [31:0] ch13_coeff_1_8;
input [31:0] ch13_coeff_1_9;
input [31:0] ch13_coeff_1_10;
input [31:0] ch13_mean1;
input [31:0] ch13_std1;
input [31:0] ch13_coeff_2_0;
input [31:0] ch13_coeff_2_1;
input [31:0] ch13_coeff_2_2;
input [31:0] ch13_coeff_2_3;
input [31:0] ch13_coeff_2_4;
input [31:0] ch13_coeff_2_5;
input [31:0] ch13_coeff_2_6;
input [31:0] ch13_coeff_2_7;
input [31:0] ch13_coeff_2_8;
input [31:0] ch13_coeff_2_9;
input [31:0] ch13_coeff_2_10;
input [31:0] ch13_mean2;
input [31:0] ch13_std2;
input [31:0] ch13_coeff_3_0;
input [31:0] ch13_coeff_3_1;
input [31:0] ch13_coeff_3_2;
input [31:0] ch13_coeff_3_3;
input [31:0] ch13_coeff_3_4;
input [31:0] ch13_coeff_3_5;
input [31:0] ch13_coeff_3_6;
input [31:0] ch13_coeff_3_7;
input [31:0] ch13_coeff_3_8;
input [31:0] ch13_coeff_3_9;
input [31:0] ch13_coeff_3_10;
input [31:0] ch13_mean3;
input [31:0] ch13_std3;
input [31:0] ch13_coeff_4_0;
input [31:0] ch13_coeff_4_1;
input [31:0] ch13_coeff_4_2;
input [31:0] ch13_coeff_4_3;
input [31:0] ch13_coeff_4_4;
input [31:0] ch13_coeff_4_5;
input [31:0] ch13_coeff_4_6;
input [31:0] ch13_coeff_4_7;
input [31:0] ch13_coeff_4_8;
input [31:0] ch13_coeff_4_9;
input [31:0] ch13_coeff_4_10;
input [31:0] ch13_mean4;
input [31:0] ch13_std4;
input [31:0] ch14_coeff_1_0;
input [31:0] ch14_coeff_1_1;
input [31:0] ch14_coeff_1_2;
input [31:0] ch14_coeff_1_3;
input [31:0] ch14_coeff_1_4;
input [31:0] ch14_coeff_1_5;
input [31:0] ch14_coeff_1_6;
input [31:0] ch14_coeff_1_7;
input [31:0] ch14_coeff_1_8;
input [31:0] ch14_coeff_1_9;
input [31:0] ch14_coeff_1_10;
input [31:0] ch14_mean1;
input [31:0] ch14_std1;
input [31:0] ch14_coeff_2_0;
input [31:0] ch14_coeff_2_1;
input [31:0] ch14_coeff_2_2;
input [31:0] ch14_coeff_2_3;
input [31:0] ch14_coeff_2_4;
input [31:0] ch14_coeff_2_5;
input [31:0] ch14_coeff_2_6;
input [31:0] ch14_coeff_2_7;
input [31:0] ch14_coeff_2_8;
input [31:0] ch14_coeff_2_9;
input [31:0] ch14_coeff_2_10;
input [31:0] ch14_mean2;
input [31:0] ch14_std2;
input [31:0] ch14_coeff_3_0;
input [31:0] ch14_coeff_3_1;
input [31:0] ch14_coeff_3_2;
input [31:0] ch14_coeff_3_3;
input [31:0] ch14_coeff_3_4;
input [31:0] ch14_coeff_3_5;
input [31:0] ch14_coeff_3_6;
input [31:0] ch14_coeff_3_7;
input [31:0] ch14_coeff_3_8;
input [31:0] ch14_coeff_3_9;
input [31:0] ch14_coeff_3_10;
input [31:0] ch14_mean3;
input [31:0] ch14_std3;
input [31:0] ch14_coeff_4_0;
input [31:0] ch14_coeff_4_1;
input [31:0] ch14_coeff_4_2;
input [31:0] ch14_coeff_4_3;
input [31:0] ch14_coeff_4_4;
input [31:0] ch14_coeff_4_5;
input [31:0] ch14_coeff_4_6;
input [31:0] ch14_coeff_4_7;
input [31:0] ch14_coeff_4_8;
input [31:0] ch14_coeff_4_9;
input [31:0] ch14_coeff_4_10;
input [31:0] ch14_mean4;
input [31:0] ch14_std4;
input [31:0] ch15_coeff_1_0;
input [31:0] ch15_coeff_1_1;
input [31:0] ch15_coeff_1_2;
input [31:0] ch15_coeff_1_3;
input [31:0] ch15_coeff_1_4;
input [31:0] ch15_coeff_1_5;
input [31:0] ch15_coeff_1_6;
input [31:0] ch15_coeff_1_7;
input [31:0] ch15_coeff_1_8;
input [31:0] ch15_coeff_1_9;
input [31:0] ch15_coeff_1_10;
input [31:0] ch15_mean1;
input [31:0] ch15_std1;
input [31:0] ch15_coeff_2_0;
input [31:0] ch15_coeff_2_1;
input [31:0] ch15_coeff_2_2;
input [31:0] ch15_coeff_2_3;
input [31:0] ch15_coeff_2_4;
input [31:0] ch15_coeff_2_5;
input [31:0] ch15_coeff_2_6;
input [31:0] ch15_coeff_2_7;
input [31:0] ch15_coeff_2_8;
input [31:0] ch15_coeff_2_9;
input [31:0] ch15_coeff_2_10;
input [31:0] ch15_mean2;
input [31:0] ch15_std2;
input [31:0] ch15_coeff_3_0;
input [31:0] ch15_coeff_3_1;
input [31:0] ch15_coeff_3_2;
input [31:0] ch15_coeff_3_3;
input [31:0] ch15_coeff_3_4;
input [31:0] ch15_coeff_3_5;
input [31:0] ch15_coeff_3_6;
input [31:0] ch15_coeff_3_7;
input [31:0] ch15_coeff_3_8;
input [31:0] ch15_coeff_3_9;
input [31:0] ch15_coeff_3_10;
input [31:0] ch15_mean3;
input [31:0] ch15_std3;
input [31:0] ch15_coeff_4_0;
input [31:0] ch15_coeff_4_1;
input [31:0] ch15_coeff_4_2;
input [31:0] ch15_coeff_4_3;
input [31:0] ch15_coeff_4_4;
input [31:0] ch15_coeff_4_5;
input [31:0] ch15_coeff_4_6;
input [31:0] ch15_coeff_4_7;
input [31:0] ch15_coeff_4_8;
input [31:0] ch15_coeff_4_9;
input [31:0] ch15_coeff_4_10;
input [31:0] ch15_mean4;
input [31:0] ch15_std4;
input [31:0] ch16_coeff_1_0;
input [31:0] ch16_coeff_1_1;
input [31:0] ch16_coeff_1_2;
input [31:0] ch16_coeff_1_3;
input [31:0] ch16_coeff_1_4;
input [31:0] ch16_coeff_1_5;
input [31:0] ch16_coeff_1_6;
input [31:0] ch16_coeff_1_7;
input [31:0] ch16_coeff_1_8;
input [31:0] ch16_coeff_1_9;
input [31:0] ch16_coeff_1_10;
input [31:0] ch16_mean1;
input [31:0] ch16_std1;
input [31:0] ch16_coeff_2_0;
input [31:0] ch16_coeff_2_1;
input [31:0] ch16_coeff_2_2;
input [31:0] ch16_coeff_2_3;
input [31:0] ch16_coeff_2_4;
input [31:0] ch16_coeff_2_5;
input [31:0] ch16_coeff_2_6;
input [31:0] ch16_coeff_2_7;
input [31:0] ch16_coeff_2_8;
input [31:0] ch16_coeff_2_9;
input [31:0] ch16_coeff_2_10;
input [31:0] ch16_mean2;
input [31:0] ch16_std2;
input [31:0] ch16_coeff_3_0;
input [31:0] ch16_coeff_3_1;
input [31:0] ch16_coeff_3_2;
input [31:0] ch16_coeff_3_3;
input [31:0] ch16_coeff_3_4;
input [31:0] ch16_coeff_3_5;
input [31:0] ch16_coeff_3_6;
input [31:0] ch16_coeff_3_7;
input [31:0] ch16_coeff_3_8;
input [31:0] ch16_coeff_3_9;
input [31:0] ch16_coeff_3_10;
input [31:0] ch16_mean3;
input [31:0] ch16_std3;
input [31:0] ch16_coeff_4_0;
input [31:0] ch16_coeff_4_1;
input [31:0] ch16_coeff_4_2;
input [31:0] ch16_coeff_4_3;
input [31:0] ch16_coeff_4_4;
input [31:0] ch16_coeff_4_5;
input [31:0] ch16_coeff_4_6;
input [31:0] ch16_coeff_4_7;
input [31:0] ch16_coeff_4_8;
input [31:0] ch16_coeff_4_9;
input [31:0] ch16_coeff_4_10;
input [31:0] ch16_mean4;
input [31:0] ch16_std4;
input [31:0] ch17_coeff_1_0;
input [31:0] ch17_coeff_1_1;
input [31:0] ch17_coeff_1_2;
input [31:0] ch17_coeff_1_3;
input [31:0] ch17_coeff_1_4;
input [31:0] ch17_coeff_1_5;
input [31:0] ch17_coeff_1_6;
input [31:0] ch17_coeff_1_7;
input [31:0] ch17_coeff_1_8;
input [31:0] ch17_coeff_1_9;
input [31:0] ch17_coeff_1_10;
input [31:0] ch17_mean1;
input [31:0] ch17_std1;
input [31:0] ch17_coeff_2_0;
input [31:0] ch17_coeff_2_1;
input [31:0] ch17_coeff_2_2;
input [31:0] ch17_coeff_2_3;
input [31:0] ch17_coeff_2_4;
input [31:0] ch17_coeff_2_5;
input [31:0] ch17_coeff_2_6;
input [31:0] ch17_coeff_2_7;
input [31:0] ch17_coeff_2_8;
input [31:0] ch17_coeff_2_9;
input [31:0] ch17_coeff_2_10;
input [31:0] ch17_mean2;
input [31:0] ch17_std2;
input [31:0] ch17_coeff_3_0;
input [31:0] ch17_coeff_3_1;
input [31:0] ch17_coeff_3_2;
input [31:0] ch17_coeff_3_3;
input [31:0] ch17_coeff_3_4;
input [31:0] ch17_coeff_3_5;
input [31:0] ch17_coeff_3_6;
input [31:0] ch17_coeff_3_7;
input [31:0] ch17_coeff_3_8;
input [31:0] ch17_coeff_3_9;
input [31:0] ch17_coeff_3_10;
input [31:0] ch17_mean3;
input [31:0] ch17_std3;
input [31:0] ch17_coeff_4_0;
input [31:0] ch17_coeff_4_1;
input [31:0] ch17_coeff_4_2;
input [31:0] ch17_coeff_4_3;
input [31:0] ch17_coeff_4_4;
input [31:0] ch17_coeff_4_5;
input [31:0] ch17_coeff_4_6;
input [31:0] ch17_coeff_4_7;
input [31:0] ch17_coeff_4_8;
input [31:0] ch17_coeff_4_9;
input [31:0] ch17_coeff_4_10;
input [31:0] ch17_mean4;
input [31:0] ch17_std4;
input [31:0] ch18_coeff_1_0;
input [31:0] ch18_coeff_1_1;
input [31:0] ch18_coeff_1_2;
input [31:0] ch18_coeff_1_3;
input [31:0] ch18_coeff_1_4;
input [31:0] ch18_coeff_1_5;
input [31:0] ch18_coeff_1_6;
input [31:0] ch18_coeff_1_7;
input [31:0] ch18_coeff_1_8;
input [31:0] ch18_coeff_1_9;
input [31:0] ch18_coeff_1_10;
input [31:0] ch18_mean1;
input [31:0] ch18_std1;
input [31:0] ch18_coeff_2_0;
input [31:0] ch18_coeff_2_1;
input [31:0] ch18_coeff_2_2;
input [31:0] ch18_coeff_2_3;
input [31:0] ch18_coeff_2_4;
input [31:0] ch18_coeff_2_5;
input [31:0] ch18_coeff_2_6;
input [31:0] ch18_coeff_2_7;
input [31:0] ch18_coeff_2_8;
input [31:0] ch18_coeff_2_9;
input [31:0] ch18_coeff_2_10;
input [31:0] ch18_mean2;
input [31:0] ch18_std2;
input [31:0] ch18_coeff_3_0;
input [31:0] ch18_coeff_3_1;
input [31:0] ch18_coeff_3_2;
input [31:0] ch18_coeff_3_3;
input [31:0] ch18_coeff_3_4;
input [31:0] ch18_coeff_3_5;
input [31:0] ch18_coeff_3_6;
input [31:0] ch18_coeff_3_7;
input [31:0] ch18_coeff_3_8;
input [31:0] ch18_coeff_3_9;
input [31:0] ch18_coeff_3_10;
input [31:0] ch18_mean3;
input [31:0] ch18_std3;
input [31:0] ch18_coeff_4_0;
input [31:0] ch18_coeff_4_1;
input [31:0] ch18_coeff_4_2;
input [31:0] ch18_coeff_4_3;
input [31:0] ch18_coeff_4_4;
input [31:0] ch18_coeff_4_5;
input [31:0] ch18_coeff_4_6;
input [31:0] ch18_coeff_4_7;
input [31:0] ch18_coeff_4_8;
input [31:0] ch18_coeff_4_9;
input [31:0] ch18_coeff_4_10;
input [31:0] ch18_mean4;
input [31:0] ch18_std4;
input [31:0] ch19_coeff_1_0;
input [31:0] ch19_coeff_1_1;
input [31:0] ch19_coeff_1_2;
input [31:0] ch19_coeff_1_3;
input [31:0] ch19_coeff_1_4;
input [31:0] ch19_coeff_1_5;
input [31:0] ch19_coeff_1_6;
input [31:0] ch19_coeff_1_7;
input [31:0] ch19_coeff_1_8;
input [31:0] ch19_coeff_1_9;
input [31:0] ch19_coeff_1_10;
input [31:0] ch19_mean1;
input [31:0] ch19_std1;
input [31:0] ch19_coeff_2_0;
input [31:0] ch19_coeff_2_1;
input [31:0] ch19_coeff_2_2;
input [31:0] ch19_coeff_2_3;
input [31:0] ch19_coeff_2_4;
input [31:0] ch19_coeff_2_5;
input [31:0] ch19_coeff_2_6;
input [31:0] ch19_coeff_2_7;
input [31:0] ch19_coeff_2_8;
input [31:0] ch19_coeff_2_9;
input [31:0] ch19_coeff_2_10;
input [31:0] ch19_mean2;
input [31:0] ch19_std2;
input [31:0] ch19_coeff_3_0;
input [31:0] ch19_coeff_3_1;
input [31:0] ch19_coeff_3_2;
input [31:0] ch19_coeff_3_3;
input [31:0] ch19_coeff_3_4;
input [31:0] ch19_coeff_3_5;
input [31:0] ch19_coeff_3_6;
input [31:0] ch19_coeff_3_7;
input [31:0] ch19_coeff_3_8;
input [31:0] ch19_coeff_3_9;
input [31:0] ch19_coeff_3_10;
input [31:0] ch19_mean3;
input [31:0] ch19_std3;
input [31:0] ch19_coeff_4_0;
input [31:0] ch19_coeff_4_1;
input [31:0] ch19_coeff_4_2;
input [31:0] ch19_coeff_4_3;
input [31:0] ch19_coeff_4_4;
input [31:0] ch19_coeff_4_5;
input [31:0] ch19_coeff_4_6;
input [31:0] ch19_coeff_4_7;
input [31:0] ch19_coeff_4_8;
input [31:0] ch19_coeff_4_9;
input [31:0] ch19_coeff_4_10;
input [31:0] ch19_mean4;
input [31:0] ch19_std4;
input [31:0] ch20_coeff_1_0;
input [31:0] ch20_coeff_1_1;
input [31:0] ch20_coeff_1_2;
input [31:0] ch20_coeff_1_3;
input [31:0] ch20_coeff_1_4;
input [31:0] ch20_coeff_1_5;
input [31:0] ch20_coeff_1_6;
input [31:0] ch20_coeff_1_7;
input [31:0] ch20_coeff_1_8;
input [31:0] ch20_coeff_1_9;
input [31:0] ch20_coeff_1_10;
input [31:0] ch20_mean1;
input [31:0] ch20_std1;
input [31:0] ch20_coeff_2_0;
input [31:0] ch20_coeff_2_1;
input [31:0] ch20_coeff_2_2;
input [31:0] ch20_coeff_2_3;
input [31:0] ch20_coeff_2_4;
input [31:0] ch20_coeff_2_5;
input [31:0] ch20_coeff_2_6;
input [31:0] ch20_coeff_2_7;
input [31:0] ch20_coeff_2_8;
input [31:0] ch20_coeff_2_9;
input [31:0] ch20_coeff_2_10;
input [31:0] ch20_mean2;
input [31:0] ch20_std2;
input [31:0] ch20_coeff_3_0;
input [31:0] ch20_coeff_3_1;
input [31:0] ch20_coeff_3_2;
input [31:0] ch20_coeff_3_3;
input [31:0] ch20_coeff_3_4;
input [31:0] ch20_coeff_3_5;
input [31:0] ch20_coeff_3_6;
input [31:0] ch20_coeff_3_7;
input [31:0] ch20_coeff_3_8;
input [31:0] ch20_coeff_3_9;
input [31:0] ch20_coeff_3_10;
input [31:0] ch20_mean3;
input [31:0] ch20_std3;
input [31:0] ch20_coeff_4_0;
input [31:0] ch20_coeff_4_1;
input [31:0] ch20_coeff_4_2;
input [31:0] ch20_coeff_4_3;
input [31:0] ch20_coeff_4_4;
input [31:0] ch20_coeff_4_5;
input [31:0] ch20_coeff_4_6;
input [31:0] ch20_coeff_4_7;
input [31:0] ch20_coeff_4_8;
input [31:0] ch20_coeff_4_9;
input [31:0] ch20_coeff_4_10;
input [31:0] ch20_mean4;
input [31:0] ch20_std4;
input [31:0] ch21_coeff_1_0;
input [31:0] ch21_coeff_1_1;
input [31:0] ch21_coeff_1_2;
input [31:0] ch21_coeff_1_3;
input [31:0] ch21_coeff_1_4;
input [31:0] ch21_coeff_1_5;
input [31:0] ch21_coeff_1_6;
input [31:0] ch21_coeff_1_7;
input [31:0] ch21_coeff_1_8;
input [31:0] ch21_coeff_1_9;
input [31:0] ch21_coeff_1_10;
input [31:0] ch21_mean1;
input [31:0] ch21_std1;
input [31:0] ch21_coeff_2_0;
input [31:0] ch21_coeff_2_1;
input [31:0] ch21_coeff_2_2;
input [31:0] ch21_coeff_2_3;
input [31:0] ch21_coeff_2_4;
input [31:0] ch21_coeff_2_5;
input [31:0] ch21_coeff_2_6;
input [31:0] ch21_coeff_2_7;
input [31:0] ch21_coeff_2_8;
input [31:0] ch21_coeff_2_9;
input [31:0] ch21_coeff_2_10;
input [31:0] ch21_mean2;
input [31:0] ch21_std2;
input [31:0] ch21_coeff_3_0;
input [31:0] ch21_coeff_3_1;
input [31:0] ch21_coeff_3_2;
input [31:0] ch21_coeff_3_3;
input [31:0] ch21_coeff_3_4;
input [31:0] ch21_coeff_3_5;
input [31:0] ch21_coeff_3_6;
input [31:0] ch21_coeff_3_7;
input [31:0] ch21_coeff_3_8;
input [31:0] ch21_coeff_3_9;
input [31:0] ch21_coeff_3_10;
input [31:0] ch21_mean3;
input [31:0] ch21_std3;
input [31:0] ch21_coeff_4_0;
input [31:0] ch21_coeff_4_1;
input [31:0] ch21_coeff_4_2;
input [31:0] ch21_coeff_4_3;
input [31:0] ch21_coeff_4_4;
input [31:0] ch21_coeff_4_5;
input [31:0] ch21_coeff_4_6;
input [31:0] ch21_coeff_4_7;
input [31:0] ch21_coeff_4_8;
input [31:0] ch21_coeff_4_9;
input [31:0] ch21_coeff_4_10;
input [31:0] ch21_mean4;
input [31:0] ch21_std4;
input [31:0] ch22_coeff_1_0;
input [31:0] ch22_coeff_1_1;
input [31:0] ch22_coeff_1_2;
input [31:0] ch22_coeff_1_3;
input [31:0] ch22_coeff_1_4;
input [31:0] ch22_coeff_1_5;
input [31:0] ch22_coeff_1_6;
input [31:0] ch22_coeff_1_7;
input [31:0] ch22_coeff_1_8;
input [31:0] ch22_coeff_1_9;
input [31:0] ch22_coeff_1_10;
input [31:0] ch22_mean1;
input [31:0] ch22_std1;
input [31:0] ch22_coeff_2_0;
input [31:0] ch22_coeff_2_1;
input [31:0] ch22_coeff_2_2;
input [31:0] ch22_coeff_2_3;
input [31:0] ch22_coeff_2_4;
input [31:0] ch22_coeff_2_5;
input [31:0] ch22_coeff_2_6;
input [31:0] ch22_coeff_2_7;
input [31:0] ch22_coeff_2_8;
input [31:0] ch22_coeff_2_9;
input [31:0] ch22_coeff_2_10;
input [31:0] ch22_mean2;
input [31:0] ch22_std2;
input [31:0] ch22_coeff_3_0;
input [31:0] ch22_coeff_3_1;
input [31:0] ch22_coeff_3_2;
input [31:0] ch22_coeff_3_3;
input [31:0] ch22_coeff_3_4;
input [31:0] ch22_coeff_3_5;
input [31:0] ch22_coeff_3_6;
input [31:0] ch22_coeff_3_7;
input [31:0] ch22_coeff_3_8;
input [31:0] ch22_coeff_3_9;
input [31:0] ch22_coeff_3_10;
input [31:0] ch22_mean3;
input [31:0] ch22_std3;
input [31:0] ch22_coeff_4_0;
input [31:0] ch22_coeff_4_1;
input [31:0] ch22_coeff_4_2;
input [31:0] ch22_coeff_4_3;
input [31:0] ch22_coeff_4_4;
input [31:0] ch22_coeff_4_5;
input [31:0] ch22_coeff_4_6;
input [31:0] ch22_coeff_4_7;
input [31:0] ch22_coeff_4_8;
input [31:0] ch22_coeff_4_9;
input [31:0] ch22_coeff_4_10;
input [31:0] ch22_mean4;
input [31:0] ch22_std4;
input [31:0] ch23_coeff_1_0;
input [31:0] ch23_coeff_1_1;
input [31:0] ch23_coeff_1_2;
input [31:0] ch23_coeff_1_3;
input [31:0] ch23_coeff_1_4;
input [31:0] ch23_coeff_1_5;
input [31:0] ch23_coeff_1_6;
input [31:0] ch23_coeff_1_7;
input [31:0] ch23_coeff_1_8;
input [31:0] ch23_coeff_1_9;
input [31:0] ch23_coeff_1_10;
input [31:0] ch23_mean1;
input [31:0] ch23_std1;
input [31:0] ch23_coeff_2_0;
input [31:0] ch23_coeff_2_1;
input [31:0] ch23_coeff_2_2;
input [31:0] ch23_coeff_2_3;
input [31:0] ch23_coeff_2_4;
input [31:0] ch23_coeff_2_5;
input [31:0] ch23_coeff_2_6;
input [31:0] ch23_coeff_2_7;
input [31:0] ch23_coeff_2_8;
input [31:0] ch23_coeff_2_9;
input [31:0] ch23_coeff_2_10;
input [31:0] ch23_mean2;
input [31:0] ch23_std2;
input [31:0] ch23_coeff_3_0;
input [31:0] ch23_coeff_3_1;
input [31:0] ch23_coeff_3_2;
input [31:0] ch23_coeff_3_3;
input [31:0] ch23_coeff_3_4;
input [31:0] ch23_coeff_3_5;
input [31:0] ch23_coeff_3_6;
input [31:0] ch23_coeff_3_7;
input [31:0] ch23_coeff_3_8;
input [31:0] ch23_coeff_3_9;
input [31:0] ch23_coeff_3_10;
input [31:0] ch23_mean3;
input [31:0] ch23_std3;
input [31:0] ch23_coeff_4_0;
input [31:0] ch23_coeff_4_1;
input [31:0] ch23_coeff_4_2;
input [31:0] ch23_coeff_4_3;
input [31:0] ch23_coeff_4_4;
input [31:0] ch23_coeff_4_5;
input [31:0] ch23_coeff_4_6;
input [31:0] ch23_coeff_4_7;
input [31:0] ch23_coeff_4_8;
input [31:0] ch23_coeff_4_9;
input [31:0] ch23_coeff_4_10;
input [31:0] ch23_mean4;
input [31:0] ch23_std4;
input [31:0] ch24_coeff_1_0;
input [31:0] ch24_coeff_1_1;
input [31:0] ch24_coeff_1_2;
input [31:0] ch24_coeff_1_3;
input [31:0] ch24_coeff_1_4;
input [31:0] ch24_coeff_1_5;
input [31:0] ch24_coeff_1_6;
input [31:0] ch24_coeff_1_7;
input [31:0] ch24_coeff_1_8;
input [31:0] ch24_coeff_1_9;
input [31:0] ch24_coeff_1_10;
input [31:0] ch24_mean1;
input [31:0] ch24_std1;
input [31:0] ch24_coeff_2_0;
input [31:0] ch24_coeff_2_1;
input [31:0] ch24_coeff_2_2;
input [31:0] ch24_coeff_2_3;
input [31:0] ch24_coeff_2_4;
input [31:0] ch24_coeff_2_5;
input [31:0] ch24_coeff_2_6;
input [31:0] ch24_coeff_2_7;
input [31:0] ch24_coeff_2_8;
input [31:0] ch24_coeff_2_9;
input [31:0] ch24_coeff_2_10;
input [31:0] ch24_mean2;
input [31:0] ch24_std2;
input [31:0] ch24_coeff_3_0;
input [31:0] ch24_coeff_3_1;
input [31:0] ch24_coeff_3_2;
input [31:0] ch24_coeff_3_3;
input [31:0] ch24_coeff_3_4;
input [31:0] ch24_coeff_3_5;
input [31:0] ch24_coeff_3_6;
input [31:0] ch24_coeff_3_7;
input [31:0] ch24_coeff_3_8;
input [31:0] ch24_coeff_3_9;
input [31:0] ch24_coeff_3_10;
input [31:0] ch24_mean3;
input [31:0] ch24_std3;
input [31:0] ch24_coeff_4_0;
input [31:0] ch24_coeff_4_1;
input [31:0] ch24_coeff_4_2;
input [31:0] ch24_coeff_4_3;
input [31:0] ch24_coeff_4_4;
input [31:0] ch24_coeff_4_5;
input [31:0] ch24_coeff_4_6;
input [31:0] ch24_coeff_4_7;
input [31:0] ch24_coeff_4_8;
input [31:0] ch24_coeff_4_9;
input [31:0] ch24_coeff_4_10;
input [31:0] ch24_mean4;
input [31:0] ch24_std4;
input [31:0] ch25_coeff_1_0;
input [31:0] ch25_coeff_1_1;
input [31:0] ch25_coeff_1_2;
input [31:0] ch25_coeff_1_3;
input [31:0] ch25_coeff_1_4;
input [31:0] ch25_coeff_1_5;
input [31:0] ch25_coeff_1_6;
input [31:0] ch25_coeff_1_7;
input [31:0] ch25_coeff_1_8;
input [31:0] ch25_coeff_1_9;
input [31:0] ch25_coeff_1_10;
input [31:0] ch25_mean1;
input [31:0] ch25_std1;
input [31:0] ch25_coeff_2_0;
input [31:0] ch25_coeff_2_1;
input [31:0] ch25_coeff_2_2;
input [31:0] ch25_coeff_2_3;
input [31:0] ch25_coeff_2_4;
input [31:0] ch25_coeff_2_5;
input [31:0] ch25_coeff_2_6;
input [31:0] ch25_coeff_2_7;
input [31:0] ch25_coeff_2_8;
input [31:0] ch25_coeff_2_9;
input [31:0] ch25_coeff_2_10;
input [31:0] ch25_mean2;
input [31:0] ch25_std2;
input [31:0] ch25_coeff_3_0;
input [31:0] ch25_coeff_3_1;
input [31:0] ch25_coeff_3_2;
input [31:0] ch25_coeff_3_3;
input [31:0] ch25_coeff_3_4;
input [31:0] ch25_coeff_3_5;
input [31:0] ch25_coeff_3_6;
input [31:0] ch25_coeff_3_7;
input [31:0] ch25_coeff_3_8;
input [31:0] ch25_coeff_3_9;
input [31:0] ch25_coeff_3_10;
input [31:0] ch25_mean3;
input [31:0] ch25_std3;
input [31:0] ch25_coeff_4_0;
input [31:0] ch25_coeff_4_1;
input [31:0] ch25_coeff_4_2;
input [31:0] ch25_coeff_4_3;
input [31:0] ch25_coeff_4_4;
input [31:0] ch25_coeff_4_5;
input [31:0] ch25_coeff_4_6;
input [31:0] ch25_coeff_4_7;
input [31:0] ch25_coeff_4_8;
input [31:0] ch25_coeff_4_9;
input [31:0] ch25_coeff_4_10;
input [31:0] ch25_mean4;
input [31:0] ch25_std4;
input [31:0] ch26_coeff_1_0;
input [31:0] ch26_coeff_1_1;
input [31:0] ch26_coeff_1_2;
input [31:0] ch26_coeff_1_3;
input [31:0] ch26_coeff_1_4;
input [31:0] ch26_coeff_1_5;
input [31:0] ch26_coeff_1_6;
input [31:0] ch26_coeff_1_7;
input [31:0] ch26_coeff_1_8;
input [31:0] ch26_coeff_1_9;
input [31:0] ch26_coeff_1_10;
input [31:0] ch26_mean1;
input [31:0] ch26_std1;
input [31:0] ch26_coeff_2_0;
input [31:0] ch26_coeff_2_1;
input [31:0] ch26_coeff_2_2;
input [31:0] ch26_coeff_2_3;
input [31:0] ch26_coeff_2_4;
input [31:0] ch26_coeff_2_5;
input [31:0] ch26_coeff_2_6;
input [31:0] ch26_coeff_2_7;
input [31:0] ch26_coeff_2_8;
input [31:0] ch26_coeff_2_9;
input [31:0] ch26_coeff_2_10;
input [31:0] ch26_mean2;
input [31:0] ch26_std2;
input [31:0] ch26_coeff_3_0;
input [31:0] ch26_coeff_3_1;
input [31:0] ch26_coeff_3_2;
input [31:0] ch26_coeff_3_3;
input [31:0] ch26_coeff_3_4;
input [31:0] ch26_coeff_3_5;
input [31:0] ch26_coeff_3_6;
input [31:0] ch26_coeff_3_7;
input [31:0] ch26_coeff_3_8;
input [31:0] ch26_coeff_3_9;
input [31:0] ch26_coeff_3_10;
input [31:0] ch26_mean3;
input [31:0] ch26_std3;
input [31:0] ch26_coeff_4_0;
input [31:0] ch26_coeff_4_1;
input [31:0] ch26_coeff_4_2;
input [31:0] ch26_coeff_4_3;
input [31:0] ch26_coeff_4_4;
input [31:0] ch26_coeff_4_5;
input [31:0] ch26_coeff_4_6;
input [31:0] ch26_coeff_4_7;
input [31:0] ch26_coeff_4_8;
input [31:0] ch26_coeff_4_9;
input [31:0] ch26_coeff_4_10;
input [31:0] ch26_mean4;
input [31:0] ch26_std4;
input [31:0] ch27_coeff_1_0;
input [31:0] ch27_coeff_1_1;
input [31:0] ch27_coeff_1_2;
input [31:0] ch27_coeff_1_3;
input [31:0] ch27_coeff_1_4;
input [31:0] ch27_coeff_1_5;
input [31:0] ch27_coeff_1_6;
input [31:0] ch27_coeff_1_7;
input [31:0] ch27_coeff_1_8;
input [31:0] ch27_coeff_1_9;
input [31:0] ch27_coeff_1_10;
input [31:0] ch27_mean1;
input [31:0] ch27_std1;
input [31:0] ch27_coeff_2_0;
input [31:0] ch27_coeff_2_1;
input [31:0] ch27_coeff_2_2;
input [31:0] ch27_coeff_2_3;
input [31:0] ch27_coeff_2_4;
input [31:0] ch27_coeff_2_5;
input [31:0] ch27_coeff_2_6;
input [31:0] ch27_coeff_2_7;
input [31:0] ch27_coeff_2_8;
input [31:0] ch27_coeff_2_9;
input [31:0] ch27_coeff_2_10;
input [31:0] ch27_mean2;
input [31:0] ch27_std2;
input [31:0] ch27_coeff_3_0;
input [31:0] ch27_coeff_3_1;
input [31:0] ch27_coeff_3_2;
input [31:0] ch27_coeff_3_3;
input [31:0] ch27_coeff_3_4;
input [31:0] ch27_coeff_3_5;
input [31:0] ch27_coeff_3_6;
input [31:0] ch27_coeff_3_7;
input [31:0] ch27_coeff_3_8;
input [31:0] ch27_coeff_3_9;
input [31:0] ch27_coeff_3_10;
input [31:0] ch27_mean3;
input [31:0] ch27_std3;
input [31:0] ch27_coeff_4_0;
input [31:0] ch27_coeff_4_1;
input [31:0] ch27_coeff_4_2;
input [31:0] ch27_coeff_4_3;
input [31:0] ch27_coeff_4_4;
input [31:0] ch27_coeff_4_5;
input [31:0] ch27_coeff_4_6;
input [31:0] ch27_coeff_4_7;
input [31:0] ch27_coeff_4_8;
input [31:0] ch27_coeff_4_9;
input [31:0] ch27_coeff_4_10;
input [31:0] ch27_mean4;
input [31:0] ch27_std4;
input [31:0] ch28_coeff_1_0;
input [31:0] ch28_coeff_1_1;
input [31:0] ch28_coeff_1_2;
input [31:0] ch28_coeff_1_3;
input [31:0] ch28_coeff_1_4;
input [31:0] ch28_coeff_1_5;
input [31:0] ch28_coeff_1_6;
input [31:0] ch28_coeff_1_7;
input [31:0] ch28_coeff_1_8;
input [31:0] ch28_coeff_1_9;
input [31:0] ch28_coeff_1_10;
input [31:0] ch28_mean1;
input [31:0] ch28_std1;
input [31:0] ch28_coeff_2_0;
input [31:0] ch28_coeff_2_1;
input [31:0] ch28_coeff_2_2;
input [31:0] ch28_coeff_2_3;
input [31:0] ch28_coeff_2_4;
input [31:0] ch28_coeff_2_5;
input [31:0] ch28_coeff_2_6;
input [31:0] ch28_coeff_2_7;
input [31:0] ch28_coeff_2_8;
input [31:0] ch28_coeff_2_9;
input [31:0] ch28_coeff_2_10;
input [31:0] ch28_mean2;
input [31:0] ch28_std2;
input [31:0] ch28_coeff_3_0;
input [31:0] ch28_coeff_3_1;
input [31:0] ch28_coeff_3_2;
input [31:0] ch28_coeff_3_3;
input [31:0] ch28_coeff_3_4;
input [31:0] ch28_coeff_3_5;
input [31:0] ch28_coeff_3_6;
input [31:0] ch28_coeff_3_7;
input [31:0] ch28_coeff_3_8;
input [31:0] ch28_coeff_3_9;
input [31:0] ch28_coeff_3_10;
input [31:0] ch28_mean3;
input [31:0] ch28_std3;
input [31:0] ch28_coeff_4_0;
input [31:0] ch28_coeff_4_1;
input [31:0] ch28_coeff_4_2;
input [31:0] ch28_coeff_4_3;
input [31:0] ch28_coeff_4_4;
input [31:0] ch28_coeff_4_5;
input [31:0] ch28_coeff_4_6;
input [31:0] ch28_coeff_4_7;
input [31:0] ch28_coeff_4_8;
input [31:0] ch28_coeff_4_9;
input [31:0] ch28_coeff_4_10;
input [31:0] ch28_mean4;
input [31:0] ch28_std4;
input [31:0] ch29_coeff_1_0;
input [31:0] ch29_coeff_1_1;
input [31:0] ch29_coeff_1_2;
input [31:0] ch29_coeff_1_3;
input [31:0] ch29_coeff_1_4;
input [31:0] ch29_coeff_1_5;
input [31:0] ch29_coeff_1_6;
input [31:0] ch29_coeff_1_7;
input [31:0] ch29_coeff_1_8;
input [31:0] ch29_coeff_1_9;
input [31:0] ch29_coeff_1_10;
input [31:0] ch29_mean1;
input [31:0] ch29_std1;
input [31:0] ch29_coeff_2_0;
input [31:0] ch29_coeff_2_1;
input [31:0] ch29_coeff_2_2;
input [31:0] ch29_coeff_2_3;
input [31:0] ch29_coeff_2_4;
input [31:0] ch29_coeff_2_5;
input [31:0] ch29_coeff_2_6;
input [31:0] ch29_coeff_2_7;
input [31:0] ch29_coeff_2_8;
input [31:0] ch29_coeff_2_9;
input [31:0] ch29_coeff_2_10;
input [31:0] ch29_mean2;
input [31:0] ch29_std2;
input [31:0] ch29_coeff_3_0;
input [31:0] ch29_coeff_3_1;
input [31:0] ch29_coeff_3_2;
input [31:0] ch29_coeff_3_3;
input [31:0] ch29_coeff_3_4;
input [31:0] ch29_coeff_3_5;
input [31:0] ch29_coeff_3_6;
input [31:0] ch29_coeff_3_7;
input [31:0] ch29_coeff_3_8;
input [31:0] ch29_coeff_3_9;
input [31:0] ch29_coeff_3_10;
input [31:0] ch29_mean3;
input [31:0] ch29_std3;
input [31:0] ch29_coeff_4_0;
input [31:0] ch29_coeff_4_1;
input [31:0] ch29_coeff_4_2;
input [31:0] ch29_coeff_4_3;
input [31:0] ch29_coeff_4_4;
input [31:0] ch29_coeff_4_5;
input [31:0] ch29_coeff_4_6;
input [31:0] ch29_coeff_4_7;
input [31:0] ch29_coeff_4_8;
input [31:0] ch29_coeff_4_9;
input [31:0] ch29_coeff_4_10;
input [31:0] ch29_mean4;
input [31:0] ch29_std4;
input [31:0] ch30_coeff_1_0;
input [31:0] ch30_coeff_1_1;
input [31:0] ch30_coeff_1_2;
input [31:0] ch30_coeff_1_3;
input [31:0] ch30_coeff_1_4;
input [31:0] ch30_coeff_1_5;
input [31:0] ch30_coeff_1_6;
input [31:0] ch30_coeff_1_7;
input [31:0] ch30_coeff_1_8;
input [31:0] ch30_coeff_1_9;
input [31:0] ch30_coeff_1_10;
input [31:0] ch30_mean1;
input [31:0] ch30_std1;
input [31:0] ch30_coeff_2_0;
input [31:0] ch30_coeff_2_1;
input [31:0] ch30_coeff_2_2;
input [31:0] ch30_coeff_2_3;
input [31:0] ch30_coeff_2_4;
input [31:0] ch30_coeff_2_5;
input [31:0] ch30_coeff_2_6;
input [31:0] ch30_coeff_2_7;
input [31:0] ch30_coeff_2_8;
input [31:0] ch30_coeff_2_9;
input [31:0] ch30_coeff_2_10;
input [31:0] ch30_mean2;
input [31:0] ch30_std2;
input [31:0] ch30_coeff_3_0;
input [31:0] ch30_coeff_3_1;
input [31:0] ch30_coeff_3_2;
input [31:0] ch30_coeff_3_3;
input [31:0] ch30_coeff_3_4;
input [31:0] ch30_coeff_3_5;
input [31:0] ch30_coeff_3_6;
input [31:0] ch30_coeff_3_7;
input [31:0] ch30_coeff_3_8;
input [31:0] ch30_coeff_3_9;
input [31:0] ch30_coeff_3_10;
input [31:0] ch30_mean3;
input [31:0] ch30_std3;
input [31:0] ch30_coeff_4_0;
input [31:0] ch30_coeff_4_1;
input [31:0] ch30_coeff_4_2;
input [31:0] ch30_coeff_4_3;
input [31:0] ch30_coeff_4_4;
input [31:0] ch30_coeff_4_5;
input [31:0] ch30_coeff_4_6;
input [31:0] ch30_coeff_4_7;
input [31:0] ch30_coeff_4_8;
input [31:0] ch30_coeff_4_9;
input [31:0] ch30_coeff_4_10;
input [31:0] ch30_mean4;
input [31:0] ch30_std4;
input [31:0] ch31_coeff_1_0;
input [31:0] ch31_coeff_1_1;
input [31:0] ch31_coeff_1_2;
input [31:0] ch31_coeff_1_3;
input [31:0] ch31_coeff_1_4;
input [31:0] ch31_coeff_1_5;
input [31:0] ch31_coeff_1_6;
input [31:0] ch31_coeff_1_7;
input [31:0] ch31_coeff_1_8;
input [31:0] ch31_coeff_1_9;
input [31:0] ch31_coeff_1_10;
input [31:0] ch31_mean1;
input [31:0] ch31_std1;
input [31:0] ch31_coeff_2_0;
input [31:0] ch31_coeff_2_1;
input [31:0] ch31_coeff_2_2;
input [31:0] ch31_coeff_2_3;
input [31:0] ch31_coeff_2_4;
input [31:0] ch31_coeff_2_5;
input [31:0] ch31_coeff_2_6;
input [31:0] ch31_coeff_2_7;
input [31:0] ch31_coeff_2_8;
input [31:0] ch31_coeff_2_9;
input [31:0] ch31_coeff_2_10;
input [31:0] ch31_mean2;
input [31:0] ch31_std2;
input [31:0] ch31_coeff_3_0;
input [31:0] ch31_coeff_3_1;
input [31:0] ch31_coeff_3_2;
input [31:0] ch31_coeff_3_3;
input [31:0] ch31_coeff_3_4;
input [31:0] ch31_coeff_3_5;
input [31:0] ch31_coeff_3_6;
input [31:0] ch31_coeff_3_7;
input [31:0] ch31_coeff_3_8;
input [31:0] ch31_coeff_3_9;
input [31:0] ch31_coeff_3_10;
input [31:0] ch31_mean3;
input [31:0] ch31_std3;
input [31:0] ch31_coeff_4_0;
input [31:0] ch31_coeff_4_1;
input [31:0] ch31_coeff_4_2;
input [31:0] ch31_coeff_4_3;
input [31:0] ch31_coeff_4_4;
input [31:0] ch31_coeff_4_5;
input [31:0] ch31_coeff_4_6;
input [31:0] ch31_coeff_4_7;
input [31:0] ch31_coeff_4_8;
input [31:0] ch31_coeff_4_9;
input [31:0] ch31_coeff_4_10;
input [31:0] ch31_mean4;
input [31:0] ch31_std4;
output reg [20:0] x_adc;
output reg [19:0] section_limit;
output reg [31:0] coeff_1_0;
output reg [31:0] coeff_1_1;
output reg [31:0] coeff_1_2;
output reg [31:0] coeff_1_3;
output reg [31:0] coeff_1_4;
output reg [31:0] coeff_1_5;
output reg [31:0] coeff_1_6;
output reg [31:0] coeff_1_7;
output reg [31:0] coeff_1_8;
output reg [31:0] coeff_1_9;
output reg [31:0] coeff_1_10;
output reg [31:0] mean1;
output reg [31:0] std1;
output reg [31:0] coeff_2_0;
output reg [31:0] coeff_2_1;
output reg [31:0] coeff_2_2;
output reg [31:0] coeff_2_3;
output reg [31:0] coeff_2_4;
output reg [31:0] coeff_2_5;
output reg [31:0] coeff_2_6;
output reg [31:0] coeff_2_7;
output reg [31:0] coeff_2_8;
output reg [31:0] coeff_2_9;
output reg [31:0] coeff_2_10;
output reg [31:0] mean2;
output reg [31:0] std2;
output reg [31:0] coeff_3_0;
output reg [31:0] coeff_3_1;
output reg [31:0] coeff_3_2;
output reg [31:0] coeff_3_3;
output reg [31:0] coeff_3_4;
output reg [31:0] coeff_3_5;
output reg [31:0] coeff_3_6;
output reg [31:0] coeff_3_7;
output reg [31:0] coeff_3_8;
output reg [31:0] coeff_3_9;
output reg [31:0] coeff_3_10;
output reg [31:0] mean3;
output reg [31:0] std3;
output reg [31:0] coeff_4_0;
output reg [31:0] coeff_4_1;
output reg [31:0] coeff_4_2;
output reg [31:0] coeff_4_3;
output reg [31:0] coeff_4_4;
output reg [31:0] coeff_4_5;
output reg [31:0] coeff_4_6;
output reg [31:0] coeff_4_7;
output reg [31:0] coeff_4_8;
output reg [31:0] coeff_4_9;
output reg [31:0] coeff_4_10;
output reg [31:0] mean4;
output reg [31:0] std4;

reg [20:0] x_adc_r;
reg [19:0] section_limit_r;
reg [31:0] coeff_1_0_r;
reg [31:0] coeff_1_1_r;
reg [31:0] coeff_1_2_r;
reg [31:0] coeff_1_3_r;
reg [31:0] coeff_1_4_r;
reg [31:0] coeff_1_5_r;
reg [31:0] coeff_1_6_r;
reg [31:0] coeff_1_7_r;
reg [31:0] coeff_1_8_r;
reg [31:0] coeff_1_9_r;
reg [31:0] coeff_1_10_r;
reg [31:0] mean1_r;
reg [31:0] std1_r;
reg [31:0] coeff_2_0_r;
reg [31:0] coeff_2_1_r;
reg [31:0] coeff_2_2_r;
reg [31:0] coeff_2_3_r;
reg [31:0] coeff_2_4_r;
reg [31:0] coeff_2_5_r;
reg [31:0] coeff_2_6_r;
reg [31:0] coeff_2_7_r;
reg [31:0] coeff_2_8_r;
reg [31:0] coeff_2_9_r;
reg [31:0] coeff_2_10_r;
reg [31:0] mean2_r;
reg [31:0] std2_r;
reg [31:0] coeff_3_0_r;
reg [31:0] coeff_3_1_r;
reg [31:0] coeff_3_2_r;
reg [31:0] coeff_3_3_r;
reg [31:0] coeff_3_4_r;
reg [31:0] coeff_3_5_r;
reg [31:0] coeff_3_6_r;
reg [31:0] coeff_3_7_r;
reg [31:0] coeff_3_8_r;
reg [31:0] coeff_3_9_r;
reg [31:0] coeff_3_10_r;
reg [31:0] mean3_r;
reg [31:0] std3_r;
reg [31:0] coeff_4_0_r;
reg [31:0] coeff_4_1_r;
reg [31:0] coeff_4_2_r;
reg [31:0] coeff_4_3_r;
reg [31:0] coeff_4_4_r;
reg [31:0] coeff_4_5_r;
reg [31:0] coeff_4_6_r;
reg [31:0] coeff_4_7_r;
reg [31:0] coeff_4_8_r;
reg [31:0] coeff_4_9_r;
reg [31:0] coeff_4_10_r;
reg [31:0] mean4_r;
reg [31:0] std4_r;

always @( * ) begin
	case (channel_select)

		5'd0:
		begin
			x_adc_r = x_adc_ch0;
			section_limit_r = section_limit_ch0;
			coeff_1_0_r = ch0_coeff_1_0;
			coeff_1_1_r = ch0_coeff_1_1;
			coeff_1_2_r = ch0_coeff_1_2;
			coeff_1_3_r = ch0_coeff_1_3;
			coeff_1_4_r = ch0_coeff_1_4;
			coeff_1_5_r = ch0_coeff_1_5;
			coeff_1_6_r = ch0_coeff_1_6;
			coeff_1_7_r = ch0_coeff_1_7;
			coeff_1_8_r = ch0_coeff_1_8;
			coeff_1_9_r = ch0_coeff_1_9;
			coeff_1_10_r = ch0_coeff_1_10;
			mean1_r = ch0_mean1;
			std1_r = ch0_std1;
			coeff_2_0_r = ch0_coeff_2_0;
			coeff_2_1_r = ch0_coeff_2_1;
			coeff_2_2_r = ch0_coeff_2_2;
			coeff_2_3_r = ch0_coeff_2_3;
			coeff_2_4_r = ch0_coeff_2_4;
			coeff_2_5_r = ch0_coeff_2_5;
			coeff_2_6_r = ch0_coeff_2_6;
			coeff_2_7_r = ch0_coeff_2_7;
			coeff_2_8_r = ch0_coeff_2_8;
			coeff_2_9_r = ch0_coeff_2_9;
			coeff_2_10_r = ch0_coeff_2_10;
			mean2_r = ch0_mean2;
			std2_r = ch0_std2;
			coeff_3_0_r = ch0_coeff_3_0;
			coeff_3_1_r = ch0_coeff_3_1;
			coeff_3_2_r = ch0_coeff_3_2;
			coeff_3_3_r = ch0_coeff_3_3;
			coeff_3_4_r = ch0_coeff_3_4;
			coeff_3_5_r = ch0_coeff_3_5;
			coeff_3_6_r = ch0_coeff_3_6;
			coeff_3_7_r = ch0_coeff_3_7;
			coeff_3_8_r = ch0_coeff_3_8;
			coeff_3_9_r = ch0_coeff_3_9;
			coeff_3_10_r = ch0_coeff_3_10;
			mean3_r = ch0_mean3;
			std3_r = ch0_std3;
			coeff_4_0_r = ch0_coeff_4_0;
			coeff_4_1_r = ch0_coeff_4_1;
			coeff_4_2_r = ch0_coeff_4_2;
			coeff_4_3_r = ch0_coeff_4_3;
			coeff_4_4_r = ch0_coeff_4_4;
			coeff_4_5_r = ch0_coeff_4_5;
			coeff_4_6_r = ch0_coeff_4_6;
			coeff_4_7_r = ch0_coeff_4_7;
			coeff_4_8_r = ch0_coeff_4_8;
			coeff_4_9_r = ch0_coeff_4_9;
			coeff_4_10_r = ch0_coeff_4_10;
			mean4_r = ch0_mean4;
			std4_r = ch0_std4;
		end

		5'd1:
		begin
			x_adc_r = x_adc_ch1;
			section_limit_r = section_limit_ch1;
			coeff_1_0_r = ch1_coeff_1_0;
			coeff_1_1_r = ch1_coeff_1_1;
			coeff_1_2_r = ch1_coeff_1_2;
			coeff_1_3_r = ch1_coeff_1_3;
			coeff_1_4_r = ch1_coeff_1_4;
			coeff_1_5_r = ch1_coeff_1_5;
			coeff_1_6_r = ch1_coeff_1_6;
			coeff_1_7_r = ch1_coeff_1_7;
			coeff_1_8_r = ch1_coeff_1_8;
			coeff_1_9_r = ch1_coeff_1_9;
			coeff_1_10_r = ch1_coeff_1_10;
			mean1_r = ch1_mean1;
			std1_r = ch1_std1;
			coeff_2_0_r = ch1_coeff_2_0;
			coeff_2_1_r = ch1_coeff_2_1;
			coeff_2_2_r = ch1_coeff_2_2;
			coeff_2_3_r = ch1_coeff_2_3;
			coeff_2_4_r = ch1_coeff_2_4;
			coeff_2_5_r = ch1_coeff_2_5;
			coeff_2_6_r = ch1_coeff_2_6;
			coeff_2_7_r = ch1_coeff_2_7;
			coeff_2_8_r = ch1_coeff_2_8;
			coeff_2_9_r = ch1_coeff_2_9;
			coeff_2_10_r = ch1_coeff_2_10;
			mean2_r = ch1_mean2;
			std2_r = ch1_std2;
			coeff_3_0_r = ch1_coeff_3_0;
			coeff_3_1_r = ch1_coeff_3_1;
			coeff_3_2_r = ch1_coeff_3_2;
			coeff_3_3_r = ch1_coeff_3_3;
			coeff_3_4_r = ch1_coeff_3_4;
			coeff_3_5_r = ch1_coeff_3_5;
			coeff_3_6_r = ch1_coeff_3_6;
			coeff_3_7_r = ch1_coeff_3_7;
			coeff_3_8_r = ch1_coeff_3_8;
			coeff_3_9_r = ch1_coeff_3_9;
			coeff_3_10_r = ch1_coeff_3_10;
			mean3_r = ch1_mean3;
			std3_r = ch1_std3;
			coeff_4_0_r = ch1_coeff_4_0;
			coeff_4_1_r = ch1_coeff_4_1;
			coeff_4_2_r = ch1_coeff_4_2;
			coeff_4_3_r = ch1_coeff_4_3;
			coeff_4_4_r = ch1_coeff_4_4;
			coeff_4_5_r = ch1_coeff_4_5;
			coeff_4_6_r = ch1_coeff_4_6;
			coeff_4_7_r = ch1_coeff_4_7;
			coeff_4_8_r = ch1_coeff_4_8;
			coeff_4_9_r = ch1_coeff_4_9;
			coeff_4_10_r = ch1_coeff_4_10;
			mean4_r = ch1_mean4;
			std4_r = ch1_std4;
		end

		5'd2:
		begin
			x_adc_r = x_adc_ch2;
			section_limit_r = section_limit_ch2;
			coeff_1_0_r = ch2_coeff_1_0;
			coeff_1_1_r = ch2_coeff_1_1;
			coeff_1_2_r = ch2_coeff_1_2;
			coeff_1_3_r = ch2_coeff_1_3;
			coeff_1_4_r = ch2_coeff_1_4;
			coeff_1_5_r = ch2_coeff_1_5;
			coeff_1_6_r = ch2_coeff_1_6;
			coeff_1_7_r = ch2_coeff_1_7;
			coeff_1_8_r = ch2_coeff_1_8;
			coeff_1_9_r = ch2_coeff_1_9;
			coeff_1_10_r = ch2_coeff_1_10;
			mean1_r = ch2_mean1;
			std1_r = ch2_std1;
			coeff_2_0_r = ch2_coeff_2_0;
			coeff_2_1_r = ch2_coeff_2_1;
			coeff_2_2_r = ch2_coeff_2_2;
			coeff_2_3_r = ch2_coeff_2_3;
			coeff_2_4_r = ch2_coeff_2_4;
			coeff_2_5_r = ch2_coeff_2_5;
			coeff_2_6_r = ch2_coeff_2_6;
			coeff_2_7_r = ch2_coeff_2_7;
			coeff_2_8_r = ch2_coeff_2_8;
			coeff_2_9_r = ch2_coeff_2_9;
			coeff_2_10_r = ch2_coeff_2_10;
			mean2_r = ch2_mean2;
			std2_r = ch2_std2;
			coeff_3_0_r = ch2_coeff_3_0;
			coeff_3_1_r = ch2_coeff_3_1;
			coeff_3_2_r = ch2_coeff_3_2;
			coeff_3_3_r = ch2_coeff_3_3;
			coeff_3_4_r = ch2_coeff_3_4;
			coeff_3_5_r = ch2_coeff_3_5;
			coeff_3_6_r = ch2_coeff_3_6;
			coeff_3_7_r = ch2_coeff_3_7;
			coeff_3_8_r = ch2_coeff_3_8;
			coeff_3_9_r = ch2_coeff_3_9;
			coeff_3_10_r = ch2_coeff_3_10;
			mean3_r = ch2_mean3;
			std3_r = ch2_std3;
			coeff_4_0_r = ch2_coeff_4_0;
			coeff_4_1_r = ch2_coeff_4_1;
			coeff_4_2_r = ch2_coeff_4_2;
			coeff_4_3_r = ch2_coeff_4_3;
			coeff_4_4_r = ch2_coeff_4_4;
			coeff_4_5_r = ch2_coeff_4_5;
			coeff_4_6_r = ch2_coeff_4_6;
			coeff_4_7_r = ch2_coeff_4_7;
			coeff_4_8_r = ch2_coeff_4_8;
			coeff_4_9_r = ch2_coeff_4_9;
			coeff_4_10_r = ch2_coeff_4_10;
			mean4_r = ch2_mean4;
			std4_r = ch2_std4;
		end

		5'd3:
		begin
			x_adc_r = x_adc_ch3;
			section_limit_r = section_limit_ch3;
			coeff_1_0_r = ch3_coeff_1_0;
			coeff_1_1_r = ch3_coeff_1_1;
			coeff_1_2_r = ch3_coeff_1_2;
			coeff_1_3_r = ch3_coeff_1_3;
			coeff_1_4_r = ch3_coeff_1_4;
			coeff_1_5_r = ch3_coeff_1_5;
			coeff_1_6_r = ch3_coeff_1_6;
			coeff_1_7_r = ch3_coeff_1_7;
			coeff_1_8_r = ch3_coeff_1_8;
			coeff_1_9_r = ch3_coeff_1_9;
			coeff_1_10_r = ch3_coeff_1_10;
			mean1_r = ch3_mean1;
			std1_r = ch3_std1;
			coeff_2_0_r = ch3_coeff_2_0;
			coeff_2_1_r = ch3_coeff_2_1;
			coeff_2_2_r = ch3_coeff_2_2;
			coeff_2_3_r = ch3_coeff_2_3;
			coeff_2_4_r = ch3_coeff_2_4;
			coeff_2_5_r = ch3_coeff_2_5;
			coeff_2_6_r = ch3_coeff_2_6;
			coeff_2_7_r = ch3_coeff_2_7;
			coeff_2_8_r = ch3_coeff_2_8;
			coeff_2_9_r = ch3_coeff_2_9;
			coeff_2_10_r = ch3_coeff_2_10;
			mean2_r = ch3_mean2;
			std2_r = ch3_std2;
			coeff_3_0_r = ch3_coeff_3_0;
			coeff_3_1_r = ch3_coeff_3_1;
			coeff_3_2_r = ch3_coeff_3_2;
			coeff_3_3_r = ch3_coeff_3_3;
			coeff_3_4_r = ch3_coeff_3_4;
			coeff_3_5_r = ch3_coeff_3_5;
			coeff_3_6_r = ch3_coeff_3_6;
			coeff_3_7_r = ch3_coeff_3_7;
			coeff_3_8_r = ch3_coeff_3_8;
			coeff_3_9_r = ch3_coeff_3_9;
			coeff_3_10_r = ch3_coeff_3_10;
			mean3_r = ch3_mean3;
			std3_r = ch3_std3;
			coeff_4_0_r = ch3_coeff_4_0;
			coeff_4_1_r = ch3_coeff_4_1;
			coeff_4_2_r = ch3_coeff_4_2;
			coeff_4_3_r = ch3_coeff_4_3;
			coeff_4_4_r = ch3_coeff_4_4;
			coeff_4_5_r = ch3_coeff_4_5;
			coeff_4_6_r = ch3_coeff_4_6;
			coeff_4_7_r = ch3_coeff_4_7;
			coeff_4_8_r = ch3_coeff_4_8;
			coeff_4_9_r = ch3_coeff_4_9;
			coeff_4_10_r = ch3_coeff_4_10;
			mean4_r = ch3_mean4;
			std4_r = ch3_std4;
		end

		5'd4:
		begin
			x_adc_r = x_adc_ch4;
			section_limit_r = section_limit_ch4;
			coeff_1_0_r = ch4_coeff_1_0;
			coeff_1_1_r = ch4_coeff_1_1;
			coeff_1_2_r = ch4_coeff_1_2;
			coeff_1_3_r = ch4_coeff_1_3;
			coeff_1_4_r = ch4_coeff_1_4;
			coeff_1_5_r = ch4_coeff_1_5;
			coeff_1_6_r = ch4_coeff_1_6;
			coeff_1_7_r = ch4_coeff_1_7;
			coeff_1_8_r = ch4_coeff_1_8;
			coeff_1_9_r = ch4_coeff_1_9;
			coeff_1_10_r = ch4_coeff_1_10;
			mean1_r = ch4_mean1;
			std1_r = ch4_std1;
			coeff_2_0_r = ch4_coeff_2_0;
			coeff_2_1_r = ch4_coeff_2_1;
			coeff_2_2_r = ch4_coeff_2_2;
			coeff_2_3_r = ch4_coeff_2_3;
			coeff_2_4_r = ch4_coeff_2_4;
			coeff_2_5_r = ch4_coeff_2_5;
			coeff_2_6_r = ch4_coeff_2_6;
			coeff_2_7_r = ch4_coeff_2_7;
			coeff_2_8_r = ch4_coeff_2_8;
			coeff_2_9_r = ch4_coeff_2_9;
			coeff_2_10_r = ch4_coeff_2_10;
			mean2_r = ch4_mean2;
			std2_r = ch4_std2;
			coeff_3_0_r = ch4_coeff_3_0;
			coeff_3_1_r = ch4_coeff_3_1;
			coeff_3_2_r = ch4_coeff_3_2;
			coeff_3_3_r = ch4_coeff_3_3;
			coeff_3_4_r = ch4_coeff_3_4;
			coeff_3_5_r = ch4_coeff_3_5;
			coeff_3_6_r = ch4_coeff_3_6;
			coeff_3_7_r = ch4_coeff_3_7;
			coeff_3_8_r = ch4_coeff_3_8;
			coeff_3_9_r = ch4_coeff_3_9;
			coeff_3_10_r = ch4_coeff_3_10;
			mean3_r = ch4_mean3;
			std3_r = ch4_std3;
			coeff_4_0_r = ch4_coeff_4_0;
			coeff_4_1_r = ch4_coeff_4_1;
			coeff_4_2_r = ch4_coeff_4_2;
			coeff_4_3_r = ch4_coeff_4_3;
			coeff_4_4_r = ch4_coeff_4_4;
			coeff_4_5_r = ch4_coeff_4_5;
			coeff_4_6_r = ch4_coeff_4_6;
			coeff_4_7_r = ch4_coeff_4_7;
			coeff_4_8_r = ch4_coeff_4_8;
			coeff_4_9_r = ch4_coeff_4_9;
			coeff_4_10_r = ch4_coeff_4_10;
			mean4_r = ch4_mean4;
			std4_r = ch4_std4;
		end

		5'd5:
		begin
			x_adc_r = x_adc_ch5;
			section_limit_r = section_limit_ch5;
			coeff_1_0_r = ch5_coeff_1_0;
			coeff_1_1_r = ch5_coeff_1_1;
			coeff_1_2_r = ch5_coeff_1_2;
			coeff_1_3_r = ch5_coeff_1_3;
			coeff_1_4_r = ch5_coeff_1_4;
			coeff_1_5_r = ch5_coeff_1_5;
			coeff_1_6_r = ch5_coeff_1_6;
			coeff_1_7_r = ch5_coeff_1_7;
			coeff_1_8_r = ch5_coeff_1_8;
			coeff_1_9_r = ch5_coeff_1_9;
			coeff_1_10_r = ch5_coeff_1_10;
			mean1_r = ch5_mean1;
			std1_r = ch5_std1;
			coeff_2_0_r = ch5_coeff_2_0;
			coeff_2_1_r = ch5_coeff_2_1;
			coeff_2_2_r = ch5_coeff_2_2;
			coeff_2_3_r = ch5_coeff_2_3;
			coeff_2_4_r = ch5_coeff_2_4;
			coeff_2_5_r = ch5_coeff_2_5;
			coeff_2_6_r = ch5_coeff_2_6;
			coeff_2_7_r = ch5_coeff_2_7;
			coeff_2_8_r = ch5_coeff_2_8;
			coeff_2_9_r = ch5_coeff_2_9;
			coeff_2_10_r = ch5_coeff_2_10;
			mean2_r = ch5_mean2;
			std2_r = ch5_std2;
			coeff_3_0_r = ch5_coeff_3_0;
			coeff_3_1_r = ch5_coeff_3_1;
			coeff_3_2_r = ch5_coeff_3_2;
			coeff_3_3_r = ch5_coeff_3_3;
			coeff_3_4_r = ch5_coeff_3_4;
			coeff_3_5_r = ch5_coeff_3_5;
			coeff_3_6_r = ch5_coeff_3_6;
			coeff_3_7_r = ch5_coeff_3_7;
			coeff_3_8_r = ch5_coeff_3_8;
			coeff_3_9_r = ch5_coeff_3_9;
			coeff_3_10_r = ch5_coeff_3_10;
			mean3_r = ch5_mean3;
			std3_r = ch5_std3;
			coeff_4_0_r = ch5_coeff_4_0;
			coeff_4_1_r = ch5_coeff_4_1;
			coeff_4_2_r = ch5_coeff_4_2;
			coeff_4_3_r = ch5_coeff_4_3;
			coeff_4_4_r = ch5_coeff_4_4;
			coeff_4_5_r = ch5_coeff_4_5;
			coeff_4_6_r = ch5_coeff_4_6;
			coeff_4_7_r = ch5_coeff_4_7;
			coeff_4_8_r = ch5_coeff_4_8;
			coeff_4_9_r = ch5_coeff_4_9;
			coeff_4_10_r = ch5_coeff_4_10;
			mean4_r = ch5_mean4;
			std4_r = ch5_std4;
		end

		5'd6:
		begin
			x_adc_r = x_adc_ch6;
			section_limit_r = section_limit_ch6;
			coeff_1_0_r = ch6_coeff_1_0;
			coeff_1_1_r = ch6_coeff_1_1;
			coeff_1_2_r = ch6_coeff_1_2;
			coeff_1_3_r = ch6_coeff_1_3;
			coeff_1_4_r = ch6_coeff_1_4;
			coeff_1_5_r = ch6_coeff_1_5;
			coeff_1_6_r = ch6_coeff_1_6;
			coeff_1_7_r = ch6_coeff_1_7;
			coeff_1_8_r = ch6_coeff_1_8;
			coeff_1_9_r = ch6_coeff_1_9;
			coeff_1_10_r = ch6_coeff_1_10;
			mean1_r = ch6_mean1;
			std1_r = ch6_std1;
			coeff_2_0_r = ch6_coeff_2_0;
			coeff_2_1_r = ch6_coeff_2_1;
			coeff_2_2_r = ch6_coeff_2_2;
			coeff_2_3_r = ch6_coeff_2_3;
			coeff_2_4_r = ch6_coeff_2_4;
			coeff_2_5_r = ch6_coeff_2_5;
			coeff_2_6_r = ch6_coeff_2_6;
			coeff_2_7_r = ch6_coeff_2_7;
			coeff_2_8_r = ch6_coeff_2_8;
			coeff_2_9_r = ch6_coeff_2_9;
			coeff_2_10_r = ch6_coeff_2_10;
			mean2_r = ch6_mean2;
			std2_r = ch6_std2;
			coeff_3_0_r = ch6_coeff_3_0;
			coeff_3_1_r = ch6_coeff_3_1;
			coeff_3_2_r = ch6_coeff_3_2;
			coeff_3_3_r = ch6_coeff_3_3;
			coeff_3_4_r = ch6_coeff_3_4;
			coeff_3_5_r = ch6_coeff_3_5;
			coeff_3_6_r = ch6_coeff_3_6;
			coeff_3_7_r = ch6_coeff_3_7;
			coeff_3_8_r = ch6_coeff_3_8;
			coeff_3_9_r = ch6_coeff_3_9;
			coeff_3_10_r = ch6_coeff_3_10;
			mean3_r = ch6_mean3;
			std3_r = ch6_std3;
			coeff_4_0_r = ch6_coeff_4_0;
			coeff_4_1_r = ch6_coeff_4_1;
			coeff_4_2_r = ch6_coeff_4_2;
			coeff_4_3_r = ch6_coeff_4_3;
			coeff_4_4_r = ch6_coeff_4_4;
			coeff_4_5_r = ch6_coeff_4_5;
			coeff_4_6_r = ch6_coeff_4_6;
			coeff_4_7_r = ch6_coeff_4_7;
			coeff_4_8_r = ch6_coeff_4_8;
			coeff_4_9_r = ch6_coeff_4_9;
			coeff_4_10_r = ch6_coeff_4_10;
			mean4_r = ch6_mean4;
			std4_r = ch6_std4;
		end

		5'd7:
		begin
			x_adc_r = x_adc_ch7;
			section_limit_r = section_limit_ch7;
			coeff_1_0_r = ch7_coeff_1_0;
			coeff_1_1_r = ch7_coeff_1_1;
			coeff_1_2_r = ch7_coeff_1_2;
			coeff_1_3_r = ch7_coeff_1_3;
			coeff_1_4_r = ch7_coeff_1_4;
			coeff_1_5_r = ch7_coeff_1_5;
			coeff_1_6_r = ch7_coeff_1_6;
			coeff_1_7_r = ch7_coeff_1_7;
			coeff_1_8_r = ch7_coeff_1_8;
			coeff_1_9_r = ch7_coeff_1_9;
			coeff_1_10_r = ch7_coeff_1_10;
			mean1_r = ch7_mean1;
			std1_r = ch7_std1;
			coeff_2_0_r = ch7_coeff_2_0;
			coeff_2_1_r = ch7_coeff_2_1;
			coeff_2_2_r = ch7_coeff_2_2;
			coeff_2_3_r = ch7_coeff_2_3;
			coeff_2_4_r = ch7_coeff_2_4;
			coeff_2_5_r = ch7_coeff_2_5;
			coeff_2_6_r = ch7_coeff_2_6;
			coeff_2_7_r = ch7_coeff_2_7;
			coeff_2_8_r = ch7_coeff_2_8;
			coeff_2_9_r = ch7_coeff_2_9;
			coeff_2_10_r = ch7_coeff_2_10;
			mean2_r = ch7_mean2;
			std2_r = ch7_std2;
			coeff_3_0_r = ch7_coeff_3_0;
			coeff_3_1_r = ch7_coeff_3_1;
			coeff_3_2_r = ch7_coeff_3_2;
			coeff_3_3_r = ch7_coeff_3_3;
			coeff_3_4_r = ch7_coeff_3_4;
			coeff_3_5_r = ch7_coeff_3_5;
			coeff_3_6_r = ch7_coeff_3_6;
			coeff_3_7_r = ch7_coeff_3_7;
			coeff_3_8_r = ch7_coeff_3_8;
			coeff_3_9_r = ch7_coeff_3_9;
			coeff_3_10_r = ch7_coeff_3_10;
			mean3_r = ch7_mean3;
			std3_r = ch7_std3;
			coeff_4_0_r = ch7_coeff_4_0;
			coeff_4_1_r = ch7_coeff_4_1;
			coeff_4_2_r = ch7_coeff_4_2;
			coeff_4_3_r = ch7_coeff_4_3;
			coeff_4_4_r = ch7_coeff_4_4;
			coeff_4_5_r = ch7_coeff_4_5;
			coeff_4_6_r = ch7_coeff_4_6;
			coeff_4_7_r = ch7_coeff_4_7;
			coeff_4_8_r = ch7_coeff_4_8;
			coeff_4_9_r = ch7_coeff_4_9;
			coeff_4_10_r = ch7_coeff_4_10;
			mean4_r = ch7_mean4;
			std4_r = ch7_std4;
		end

		5'd8:
		begin
			x_adc_r = x_adc_ch8;
			section_limit_r = section_limit_ch8;
			coeff_1_0_r = ch8_coeff_1_0;
			coeff_1_1_r = ch8_coeff_1_1;
			coeff_1_2_r = ch8_coeff_1_2;
			coeff_1_3_r = ch8_coeff_1_3;
			coeff_1_4_r = ch8_coeff_1_4;
			coeff_1_5_r = ch8_coeff_1_5;
			coeff_1_6_r = ch8_coeff_1_6;
			coeff_1_7_r = ch8_coeff_1_7;
			coeff_1_8_r = ch8_coeff_1_8;
			coeff_1_9_r = ch8_coeff_1_9;
			coeff_1_10_r = ch8_coeff_1_10;
			mean1_r = ch8_mean1;
			std1_r = ch8_std1;
			coeff_2_0_r = ch8_coeff_2_0;
			coeff_2_1_r = ch8_coeff_2_1;
			coeff_2_2_r = ch8_coeff_2_2;
			coeff_2_3_r = ch8_coeff_2_3;
			coeff_2_4_r = ch8_coeff_2_4;
			coeff_2_5_r = ch8_coeff_2_5;
			coeff_2_6_r = ch8_coeff_2_6;
			coeff_2_7_r = ch8_coeff_2_7;
			coeff_2_8_r = ch8_coeff_2_8;
			coeff_2_9_r = ch8_coeff_2_9;
			coeff_2_10_r = ch8_coeff_2_10;
			mean2_r = ch8_mean2;
			std2_r = ch8_std2;
			coeff_3_0_r = ch8_coeff_3_0;
			coeff_3_1_r = ch8_coeff_3_1;
			coeff_3_2_r = ch8_coeff_3_2;
			coeff_3_3_r = ch8_coeff_3_3;
			coeff_3_4_r = ch8_coeff_3_4;
			coeff_3_5_r = ch8_coeff_3_5;
			coeff_3_6_r = ch8_coeff_3_6;
			coeff_3_7_r = ch8_coeff_3_7;
			coeff_3_8_r = ch8_coeff_3_8;
			coeff_3_9_r = ch8_coeff_3_9;
			coeff_3_10_r = ch8_coeff_3_10;
			mean3_r = ch8_mean3;
			std3_r = ch8_std3;
			coeff_4_0_r = ch8_coeff_4_0;
			coeff_4_1_r = ch8_coeff_4_1;
			coeff_4_2_r = ch8_coeff_4_2;
			coeff_4_3_r = ch8_coeff_4_3;
			coeff_4_4_r = ch8_coeff_4_4;
			coeff_4_5_r = ch8_coeff_4_5;
			coeff_4_6_r = ch8_coeff_4_6;
			coeff_4_7_r = ch8_coeff_4_7;
			coeff_4_8_r = ch8_coeff_4_8;
			coeff_4_9_r = ch8_coeff_4_9;
			coeff_4_10_r = ch8_coeff_4_10;
			mean4_r = ch8_mean4;
			std4_r = ch8_std4;
		end

		5'd9:
		begin
			x_adc_r = x_adc_ch9;
			section_limit_r = section_limit_ch9;
			coeff_1_0_r = ch9_coeff_1_0;
			coeff_1_1_r = ch9_coeff_1_1;
			coeff_1_2_r = ch9_coeff_1_2;
			coeff_1_3_r = ch9_coeff_1_3;
			coeff_1_4_r = ch9_coeff_1_4;
			coeff_1_5_r = ch9_coeff_1_5;
			coeff_1_6_r = ch9_coeff_1_6;
			coeff_1_7_r = ch9_coeff_1_7;
			coeff_1_8_r = ch9_coeff_1_8;
			coeff_1_9_r = ch9_coeff_1_9;
			coeff_1_10_r = ch9_coeff_1_10;
			mean1_r = ch9_mean1;
			std1_r = ch9_std1;
			coeff_2_0_r = ch9_coeff_2_0;
			coeff_2_1_r = ch9_coeff_2_1;
			coeff_2_2_r = ch9_coeff_2_2;
			coeff_2_3_r = ch9_coeff_2_3;
			coeff_2_4_r = ch9_coeff_2_4;
			coeff_2_5_r = ch9_coeff_2_5;
			coeff_2_6_r = ch9_coeff_2_6;
			coeff_2_7_r = ch9_coeff_2_7;
			coeff_2_8_r = ch9_coeff_2_8;
			coeff_2_9_r = ch9_coeff_2_9;
			coeff_2_10_r = ch9_coeff_2_10;
			mean2_r = ch9_mean2;
			std2_r = ch9_std2;
			coeff_3_0_r = ch9_coeff_3_0;
			coeff_3_1_r = ch9_coeff_3_1;
			coeff_3_2_r = ch9_coeff_3_2;
			coeff_3_3_r = ch9_coeff_3_3;
			coeff_3_4_r = ch9_coeff_3_4;
			coeff_3_5_r = ch9_coeff_3_5;
			coeff_3_6_r = ch9_coeff_3_6;
			coeff_3_7_r = ch9_coeff_3_7;
			coeff_3_8_r = ch9_coeff_3_8;
			coeff_3_9_r = ch9_coeff_3_9;
			coeff_3_10_r = ch9_coeff_3_10;
			mean3_r = ch9_mean3;
			std3_r = ch9_std3;
			coeff_4_0_r = ch9_coeff_4_0;
			coeff_4_1_r = ch9_coeff_4_1;
			coeff_4_2_r = ch9_coeff_4_2;
			coeff_4_3_r = ch9_coeff_4_3;
			coeff_4_4_r = ch9_coeff_4_4;
			coeff_4_5_r = ch9_coeff_4_5;
			coeff_4_6_r = ch9_coeff_4_6;
			coeff_4_7_r = ch9_coeff_4_7;
			coeff_4_8_r = ch9_coeff_4_8;
			coeff_4_9_r = ch9_coeff_4_9;
			coeff_4_10_r = ch9_coeff_4_10;
			mean4_r = ch9_mean4;
			std4_r = ch9_std4;
		end

		5'd10:
		begin
			x_adc_r = x_adc_ch10;
			section_limit_r = section_limit_ch10;
			coeff_1_0_r = ch10_coeff_1_0;
			coeff_1_1_r = ch10_coeff_1_1;
			coeff_1_2_r = ch10_coeff_1_2;
			coeff_1_3_r = ch10_coeff_1_3;
			coeff_1_4_r = ch10_coeff_1_4;
			coeff_1_5_r = ch10_coeff_1_5;
			coeff_1_6_r = ch10_coeff_1_6;
			coeff_1_7_r = ch10_coeff_1_7;
			coeff_1_8_r = ch10_coeff_1_8;
			coeff_1_9_r = ch10_coeff_1_9;
			coeff_1_10_r = ch10_coeff_1_10;
			mean1_r = ch10_mean1;
			std1_r = ch10_std1;
			coeff_2_0_r = ch10_coeff_2_0;
			coeff_2_1_r = ch10_coeff_2_1;
			coeff_2_2_r = ch10_coeff_2_2;
			coeff_2_3_r = ch10_coeff_2_3;
			coeff_2_4_r = ch10_coeff_2_4;
			coeff_2_5_r = ch10_coeff_2_5;
			coeff_2_6_r = ch10_coeff_2_6;
			coeff_2_7_r = ch10_coeff_2_7;
			coeff_2_8_r = ch10_coeff_2_8;
			coeff_2_9_r = ch10_coeff_2_9;
			coeff_2_10_r = ch10_coeff_2_10;
			mean2_r = ch10_mean2;
			std2_r = ch10_std2;
			coeff_3_0_r = ch10_coeff_3_0;
			coeff_3_1_r = ch10_coeff_3_1;
			coeff_3_2_r = ch10_coeff_3_2;
			coeff_3_3_r = ch10_coeff_3_3;
			coeff_3_4_r = ch10_coeff_3_4;
			coeff_3_5_r = ch10_coeff_3_5;
			coeff_3_6_r = ch10_coeff_3_6;
			coeff_3_7_r = ch10_coeff_3_7;
			coeff_3_8_r = ch10_coeff_3_8;
			coeff_3_9_r = ch10_coeff_3_9;
			coeff_3_10_r = ch10_coeff_3_10;
			mean3_r = ch10_mean3;
			std3_r = ch10_std3;
			coeff_4_0_r = ch10_coeff_4_0;
			coeff_4_1_r = ch10_coeff_4_1;
			coeff_4_2_r = ch10_coeff_4_2;
			coeff_4_3_r = ch10_coeff_4_3;
			coeff_4_4_r = ch10_coeff_4_4;
			coeff_4_5_r = ch10_coeff_4_5;
			coeff_4_6_r = ch10_coeff_4_6;
			coeff_4_7_r = ch10_coeff_4_7;
			coeff_4_8_r = ch10_coeff_4_8;
			coeff_4_9_r = ch10_coeff_4_9;
			coeff_4_10_r = ch10_coeff_4_10;
			mean4_r = ch10_mean4;
			std4_r = ch10_std4;
		end

		5'd11:
		begin
			x_adc_r = x_adc_ch11;
			section_limit_r = section_limit_ch11;
			coeff_1_0_r = ch11_coeff_1_0;
			coeff_1_1_r = ch11_coeff_1_1;
			coeff_1_2_r = ch11_coeff_1_2;
			coeff_1_3_r = ch11_coeff_1_3;
			coeff_1_4_r = ch11_coeff_1_4;
			coeff_1_5_r = ch11_coeff_1_5;
			coeff_1_6_r = ch11_coeff_1_6;
			coeff_1_7_r = ch11_coeff_1_7;
			coeff_1_8_r = ch11_coeff_1_8;
			coeff_1_9_r = ch11_coeff_1_9;
			coeff_1_10_r = ch11_coeff_1_10;
			mean1_r = ch11_mean1;
			std1_r = ch11_std1;
			coeff_2_0_r = ch11_coeff_2_0;
			coeff_2_1_r = ch11_coeff_2_1;
			coeff_2_2_r = ch11_coeff_2_2;
			coeff_2_3_r = ch11_coeff_2_3;
			coeff_2_4_r = ch11_coeff_2_4;
			coeff_2_5_r = ch11_coeff_2_5;
			coeff_2_6_r = ch11_coeff_2_6;
			coeff_2_7_r = ch11_coeff_2_7;
			coeff_2_8_r = ch11_coeff_2_8;
			coeff_2_9_r = ch11_coeff_2_9;
			coeff_2_10_r = ch11_coeff_2_10;
			mean2_r = ch11_mean2;
			std2_r = ch11_std2;
			coeff_3_0_r = ch11_coeff_3_0;
			coeff_3_1_r = ch11_coeff_3_1;
			coeff_3_2_r = ch11_coeff_3_2;
			coeff_3_3_r = ch11_coeff_3_3;
			coeff_3_4_r = ch11_coeff_3_4;
			coeff_3_5_r = ch11_coeff_3_5;
			coeff_3_6_r = ch11_coeff_3_6;
			coeff_3_7_r = ch11_coeff_3_7;
			coeff_3_8_r = ch11_coeff_3_8;
			coeff_3_9_r = ch11_coeff_3_9;
			coeff_3_10_r = ch11_coeff_3_10;
			mean3_r = ch11_mean3;
			std3_r = ch11_std3;
			coeff_4_0_r = ch11_coeff_4_0;
			coeff_4_1_r = ch11_coeff_4_1;
			coeff_4_2_r = ch11_coeff_4_2;
			coeff_4_3_r = ch11_coeff_4_3;
			coeff_4_4_r = ch11_coeff_4_4;
			coeff_4_5_r = ch11_coeff_4_5;
			coeff_4_6_r = ch11_coeff_4_6;
			coeff_4_7_r = ch11_coeff_4_7;
			coeff_4_8_r = ch11_coeff_4_8;
			coeff_4_9_r = ch11_coeff_4_9;
			coeff_4_10_r = ch11_coeff_4_10;
			mean4_r = ch11_mean4;
			std4_r = ch11_std4;
		end

		5'd12:
		begin
			x_adc_r = x_adc_ch12;
			section_limit_r = section_limit_ch12;
			coeff_1_0_r = ch12_coeff_1_0;
			coeff_1_1_r = ch12_coeff_1_1;
			coeff_1_2_r = ch12_coeff_1_2;
			coeff_1_3_r = ch12_coeff_1_3;
			coeff_1_4_r = ch12_coeff_1_4;
			coeff_1_5_r = ch12_coeff_1_5;
			coeff_1_6_r = ch12_coeff_1_6;
			coeff_1_7_r = ch12_coeff_1_7;
			coeff_1_8_r = ch12_coeff_1_8;
			coeff_1_9_r = ch12_coeff_1_9;
			coeff_1_10_r = ch12_coeff_1_10;
			mean1_r = ch12_mean1;
			std1_r = ch12_std1;
			coeff_2_0_r = ch12_coeff_2_0;
			coeff_2_1_r = ch12_coeff_2_1;
			coeff_2_2_r = ch12_coeff_2_2;
			coeff_2_3_r = ch12_coeff_2_3;
			coeff_2_4_r = ch12_coeff_2_4;
			coeff_2_5_r = ch12_coeff_2_5;
			coeff_2_6_r = ch12_coeff_2_6;
			coeff_2_7_r = ch12_coeff_2_7;
			coeff_2_8_r = ch12_coeff_2_8;
			coeff_2_9_r = ch12_coeff_2_9;
			coeff_2_10_r = ch12_coeff_2_10;
			mean2_r = ch12_mean2;
			std2_r = ch12_std2;
			coeff_3_0_r = ch12_coeff_3_0;
			coeff_3_1_r = ch12_coeff_3_1;
			coeff_3_2_r = ch12_coeff_3_2;
			coeff_3_3_r = ch12_coeff_3_3;
			coeff_3_4_r = ch12_coeff_3_4;
			coeff_3_5_r = ch12_coeff_3_5;
			coeff_3_6_r = ch12_coeff_3_6;
			coeff_3_7_r = ch12_coeff_3_7;
			coeff_3_8_r = ch12_coeff_3_8;
			coeff_3_9_r = ch12_coeff_3_9;
			coeff_3_10_r = ch12_coeff_3_10;
			mean3_r = ch12_mean3;
			std3_r = ch12_std3;
			coeff_4_0_r = ch12_coeff_4_0;
			coeff_4_1_r = ch12_coeff_4_1;
			coeff_4_2_r = ch12_coeff_4_2;
			coeff_4_3_r = ch12_coeff_4_3;
			coeff_4_4_r = ch12_coeff_4_4;
			coeff_4_5_r = ch12_coeff_4_5;
			coeff_4_6_r = ch12_coeff_4_6;
			coeff_4_7_r = ch12_coeff_4_7;
			coeff_4_8_r = ch12_coeff_4_8;
			coeff_4_9_r = ch12_coeff_4_9;
			coeff_4_10_r = ch12_coeff_4_10;
			mean4_r = ch12_mean4;
			std4_r = ch12_std4;
		end

		5'd13:
		begin
			x_adc_r = x_adc_ch13;
			section_limit_r = section_limit_ch13;
			coeff_1_0_r = ch13_coeff_1_0;
			coeff_1_1_r = ch13_coeff_1_1;
			coeff_1_2_r = ch13_coeff_1_2;
			coeff_1_3_r = ch13_coeff_1_3;
			coeff_1_4_r = ch13_coeff_1_4;
			coeff_1_5_r = ch13_coeff_1_5;
			coeff_1_6_r = ch13_coeff_1_6;
			coeff_1_7_r = ch13_coeff_1_7;
			coeff_1_8_r = ch13_coeff_1_8;
			coeff_1_9_r = ch13_coeff_1_9;
			coeff_1_10_r = ch13_coeff_1_10;
			mean1_r = ch13_mean1;
			std1_r = ch13_std1;
			coeff_2_0_r = ch13_coeff_2_0;
			coeff_2_1_r = ch13_coeff_2_1;
			coeff_2_2_r = ch13_coeff_2_2;
			coeff_2_3_r = ch13_coeff_2_3;
			coeff_2_4_r = ch13_coeff_2_4;
			coeff_2_5_r = ch13_coeff_2_5;
			coeff_2_6_r = ch13_coeff_2_6;
			coeff_2_7_r = ch13_coeff_2_7;
			coeff_2_8_r = ch13_coeff_2_8;
			coeff_2_9_r = ch13_coeff_2_9;
			coeff_2_10_r = ch13_coeff_2_10;
			mean2_r = ch13_mean2;
			std2_r = ch13_std2;
			coeff_3_0_r = ch13_coeff_3_0;
			coeff_3_1_r = ch13_coeff_3_1;
			coeff_3_2_r = ch13_coeff_3_2;
			coeff_3_3_r = ch13_coeff_3_3;
			coeff_3_4_r = ch13_coeff_3_4;
			coeff_3_5_r = ch13_coeff_3_5;
			coeff_3_6_r = ch13_coeff_3_6;
			coeff_3_7_r = ch13_coeff_3_7;
			coeff_3_8_r = ch13_coeff_3_8;
			coeff_3_9_r = ch13_coeff_3_9;
			coeff_3_10_r = ch13_coeff_3_10;
			mean3_r = ch13_mean3;
			std3_r = ch13_std3;
			coeff_4_0_r = ch13_coeff_4_0;
			coeff_4_1_r = ch13_coeff_4_1;
			coeff_4_2_r = ch13_coeff_4_2;
			coeff_4_3_r = ch13_coeff_4_3;
			coeff_4_4_r = ch13_coeff_4_4;
			coeff_4_5_r = ch13_coeff_4_5;
			coeff_4_6_r = ch13_coeff_4_6;
			coeff_4_7_r = ch13_coeff_4_7;
			coeff_4_8_r = ch13_coeff_4_8;
			coeff_4_9_r = ch13_coeff_4_9;
			coeff_4_10_r = ch13_coeff_4_10;
			mean4_r = ch13_mean4;
			std4_r = ch13_std4;
		end

		5'd14:
		begin
			x_adc_r = x_adc_ch14;
			section_limit_r = section_limit_ch14;
			coeff_1_0_r = ch14_coeff_1_0;
			coeff_1_1_r = ch14_coeff_1_1;
			coeff_1_2_r = ch14_coeff_1_2;
			coeff_1_3_r = ch14_coeff_1_3;
			coeff_1_4_r = ch14_coeff_1_4;
			coeff_1_5_r = ch14_coeff_1_5;
			coeff_1_6_r = ch14_coeff_1_6;
			coeff_1_7_r = ch14_coeff_1_7;
			coeff_1_8_r = ch14_coeff_1_8;
			coeff_1_9_r = ch14_coeff_1_9;
			coeff_1_10_r = ch14_coeff_1_10;
			mean1_r = ch14_mean1;
			std1_r = ch14_std1;
			coeff_2_0_r = ch14_coeff_2_0;
			coeff_2_1_r = ch14_coeff_2_1;
			coeff_2_2_r = ch14_coeff_2_2;
			coeff_2_3_r = ch14_coeff_2_3;
			coeff_2_4_r = ch14_coeff_2_4;
			coeff_2_5_r = ch14_coeff_2_5;
			coeff_2_6_r = ch14_coeff_2_6;
			coeff_2_7_r = ch14_coeff_2_7;
			coeff_2_8_r = ch14_coeff_2_8;
			coeff_2_9_r = ch14_coeff_2_9;
			coeff_2_10_r = ch14_coeff_2_10;
			mean2_r = ch14_mean2;
			std2_r = ch14_std2;
			coeff_3_0_r = ch14_coeff_3_0;
			coeff_3_1_r = ch14_coeff_3_1;
			coeff_3_2_r = ch14_coeff_3_2;
			coeff_3_3_r = ch14_coeff_3_3;
			coeff_3_4_r = ch14_coeff_3_4;
			coeff_3_5_r = ch14_coeff_3_5;
			coeff_3_6_r = ch14_coeff_3_6;
			coeff_3_7_r = ch14_coeff_3_7;
			coeff_3_8_r = ch14_coeff_3_8;
			coeff_3_9_r = ch14_coeff_3_9;
			coeff_3_10_r = ch14_coeff_3_10;
			mean3_r = ch14_mean3;
			std3_r = ch14_std3;
			coeff_4_0_r = ch14_coeff_4_0;
			coeff_4_1_r = ch14_coeff_4_1;
			coeff_4_2_r = ch14_coeff_4_2;
			coeff_4_3_r = ch14_coeff_4_3;
			coeff_4_4_r = ch14_coeff_4_4;
			coeff_4_5_r = ch14_coeff_4_5;
			coeff_4_6_r = ch14_coeff_4_6;
			coeff_4_7_r = ch14_coeff_4_7;
			coeff_4_8_r = ch14_coeff_4_8;
			coeff_4_9_r = ch14_coeff_4_9;
			coeff_4_10_r = ch14_coeff_4_10;
			mean4_r = ch14_mean4;
			std4_r = ch14_std4;
		end

		5'd15:
		begin
			x_adc_r = x_adc_ch15;
			section_limit_r = section_limit_ch15;
			coeff_1_0_r = ch15_coeff_1_0;
			coeff_1_1_r = ch15_coeff_1_1;
			coeff_1_2_r = ch15_coeff_1_2;
			coeff_1_3_r = ch15_coeff_1_3;
			coeff_1_4_r = ch15_coeff_1_4;
			coeff_1_5_r = ch15_coeff_1_5;
			coeff_1_6_r = ch15_coeff_1_6;
			coeff_1_7_r = ch15_coeff_1_7;
			coeff_1_8_r = ch15_coeff_1_8;
			coeff_1_9_r = ch15_coeff_1_9;
			coeff_1_10_r = ch15_coeff_1_10;
			mean1_r = ch15_mean1;
			std1_r = ch15_std1;
			coeff_2_0_r = ch15_coeff_2_0;
			coeff_2_1_r = ch15_coeff_2_1;
			coeff_2_2_r = ch15_coeff_2_2;
			coeff_2_3_r = ch15_coeff_2_3;
			coeff_2_4_r = ch15_coeff_2_4;
			coeff_2_5_r = ch15_coeff_2_5;
			coeff_2_6_r = ch15_coeff_2_6;
			coeff_2_7_r = ch15_coeff_2_7;
			coeff_2_8_r = ch15_coeff_2_8;
			coeff_2_9_r = ch15_coeff_2_9;
			coeff_2_10_r = ch15_coeff_2_10;
			mean2_r = ch15_mean2;
			std2_r = ch15_std2;
			coeff_3_0_r = ch15_coeff_3_0;
			coeff_3_1_r = ch15_coeff_3_1;
			coeff_3_2_r = ch15_coeff_3_2;
			coeff_3_3_r = ch15_coeff_3_3;
			coeff_3_4_r = ch15_coeff_3_4;
			coeff_3_5_r = ch15_coeff_3_5;
			coeff_3_6_r = ch15_coeff_3_6;
			coeff_3_7_r = ch15_coeff_3_7;
			coeff_3_8_r = ch15_coeff_3_8;
			coeff_3_9_r = ch15_coeff_3_9;
			coeff_3_10_r = ch15_coeff_3_10;
			mean3_r = ch15_mean3;
			std3_r = ch15_std3;
			coeff_4_0_r = ch15_coeff_4_0;
			coeff_4_1_r = ch15_coeff_4_1;
			coeff_4_2_r = ch15_coeff_4_2;
			coeff_4_3_r = ch15_coeff_4_3;
			coeff_4_4_r = ch15_coeff_4_4;
			coeff_4_5_r = ch15_coeff_4_5;
			coeff_4_6_r = ch15_coeff_4_6;
			coeff_4_7_r = ch15_coeff_4_7;
			coeff_4_8_r = ch15_coeff_4_8;
			coeff_4_9_r = ch15_coeff_4_9;
			coeff_4_10_r = ch15_coeff_4_10;
			mean4_r = ch15_mean4;
			std4_r = ch15_std4;
		end

		5'd16:
		begin
			x_adc_r = x_adc_ch16;
			section_limit_r = section_limit_ch16;
			coeff_1_0_r = ch16_coeff_1_0;
			coeff_1_1_r = ch16_coeff_1_1;
			coeff_1_2_r = ch16_coeff_1_2;
			coeff_1_3_r = ch16_coeff_1_3;
			coeff_1_4_r = ch16_coeff_1_4;
			coeff_1_5_r = ch16_coeff_1_5;
			coeff_1_6_r = ch16_coeff_1_6;
			coeff_1_7_r = ch16_coeff_1_7;
			coeff_1_8_r = ch16_coeff_1_8;
			coeff_1_9_r = ch16_coeff_1_9;
			coeff_1_10_r = ch16_coeff_1_10;
			mean1_r = ch16_mean1;
			std1_r = ch16_std1;
			coeff_2_0_r = ch16_coeff_2_0;
			coeff_2_1_r = ch16_coeff_2_1;
			coeff_2_2_r = ch16_coeff_2_2;
			coeff_2_3_r = ch16_coeff_2_3;
			coeff_2_4_r = ch16_coeff_2_4;
			coeff_2_5_r = ch16_coeff_2_5;
			coeff_2_6_r = ch16_coeff_2_6;
			coeff_2_7_r = ch16_coeff_2_7;
			coeff_2_8_r = ch16_coeff_2_8;
			coeff_2_9_r = ch16_coeff_2_9;
			coeff_2_10_r = ch16_coeff_2_10;
			mean2_r = ch16_mean2;
			std2_r = ch16_std2;
			coeff_3_0_r = ch16_coeff_3_0;
			coeff_3_1_r = ch16_coeff_3_1;
			coeff_3_2_r = ch16_coeff_3_2;
			coeff_3_3_r = ch16_coeff_3_3;
			coeff_3_4_r = ch16_coeff_3_4;
			coeff_3_5_r = ch16_coeff_3_5;
			coeff_3_6_r = ch16_coeff_3_6;
			coeff_3_7_r = ch16_coeff_3_7;
			coeff_3_8_r = ch16_coeff_3_8;
			coeff_3_9_r = ch16_coeff_3_9;
			coeff_3_10_r = ch16_coeff_3_10;
			mean3_r = ch16_mean3;
			std3_r = ch16_std3;
			coeff_4_0_r = ch16_coeff_4_0;
			coeff_4_1_r = ch16_coeff_4_1;
			coeff_4_2_r = ch16_coeff_4_2;
			coeff_4_3_r = ch16_coeff_4_3;
			coeff_4_4_r = ch16_coeff_4_4;
			coeff_4_5_r = ch16_coeff_4_5;
			coeff_4_6_r = ch16_coeff_4_6;
			coeff_4_7_r = ch16_coeff_4_7;
			coeff_4_8_r = ch16_coeff_4_8;
			coeff_4_9_r = ch16_coeff_4_9;
			coeff_4_10_r = ch16_coeff_4_10;
			mean4_r = ch16_mean4;
			std4_r = ch16_std4;
		end

		5'd17:
		begin
			x_adc_r = x_adc_ch17;
			section_limit_r = section_limit_ch17;
			coeff_1_0_r = ch17_coeff_1_0;
			coeff_1_1_r = ch17_coeff_1_1;
			coeff_1_2_r = ch17_coeff_1_2;
			coeff_1_3_r = ch17_coeff_1_3;
			coeff_1_4_r = ch17_coeff_1_4;
			coeff_1_5_r = ch17_coeff_1_5;
			coeff_1_6_r = ch17_coeff_1_6;
			coeff_1_7_r = ch17_coeff_1_7;
			coeff_1_8_r = ch17_coeff_1_8;
			coeff_1_9_r = ch17_coeff_1_9;
			coeff_1_10_r = ch17_coeff_1_10;
			mean1_r = ch17_mean1;
			std1_r = ch17_std1;
			coeff_2_0_r = ch17_coeff_2_0;
			coeff_2_1_r = ch17_coeff_2_1;
			coeff_2_2_r = ch17_coeff_2_2;
			coeff_2_3_r = ch17_coeff_2_3;
			coeff_2_4_r = ch17_coeff_2_4;
			coeff_2_5_r = ch17_coeff_2_5;
			coeff_2_6_r = ch17_coeff_2_6;
			coeff_2_7_r = ch17_coeff_2_7;
			coeff_2_8_r = ch17_coeff_2_8;
			coeff_2_9_r = ch17_coeff_2_9;
			coeff_2_10_r = ch17_coeff_2_10;
			mean2_r = ch17_mean2;
			std2_r = ch17_std2;
			coeff_3_0_r = ch17_coeff_3_0;
			coeff_3_1_r = ch17_coeff_3_1;
			coeff_3_2_r = ch17_coeff_3_2;
			coeff_3_3_r = ch17_coeff_3_3;
			coeff_3_4_r = ch17_coeff_3_4;
			coeff_3_5_r = ch17_coeff_3_5;
			coeff_3_6_r = ch17_coeff_3_6;
			coeff_3_7_r = ch17_coeff_3_7;
			coeff_3_8_r = ch17_coeff_3_8;
			coeff_3_9_r = ch17_coeff_3_9;
			coeff_3_10_r = ch17_coeff_3_10;
			mean3_r = ch17_mean3;
			std3_r = ch17_std3;
			coeff_4_0_r = ch17_coeff_4_0;
			coeff_4_1_r = ch17_coeff_4_1;
			coeff_4_2_r = ch17_coeff_4_2;
			coeff_4_3_r = ch17_coeff_4_3;
			coeff_4_4_r = ch17_coeff_4_4;
			coeff_4_5_r = ch17_coeff_4_5;
			coeff_4_6_r = ch17_coeff_4_6;
			coeff_4_7_r = ch17_coeff_4_7;
			coeff_4_8_r = ch17_coeff_4_8;
			coeff_4_9_r = ch17_coeff_4_9;
			coeff_4_10_r = ch17_coeff_4_10;
			mean4_r = ch17_mean4;
			std4_r = ch17_std4;
		end

		5'd18:
		begin
			x_adc_r = x_adc_ch18;
			section_limit_r = section_limit_ch18;
			coeff_1_0_r = ch18_coeff_1_0;
			coeff_1_1_r = ch18_coeff_1_1;
			coeff_1_2_r = ch18_coeff_1_2;
			coeff_1_3_r = ch18_coeff_1_3;
			coeff_1_4_r = ch18_coeff_1_4;
			coeff_1_5_r = ch18_coeff_1_5;
			coeff_1_6_r = ch18_coeff_1_6;
			coeff_1_7_r = ch18_coeff_1_7;
			coeff_1_8_r = ch18_coeff_1_8;
			coeff_1_9_r = ch18_coeff_1_9;
			coeff_1_10_r = ch18_coeff_1_10;
			mean1_r = ch18_mean1;
			std1_r = ch18_std1;
			coeff_2_0_r = ch18_coeff_2_0;
			coeff_2_1_r = ch18_coeff_2_1;
			coeff_2_2_r = ch18_coeff_2_2;
			coeff_2_3_r = ch18_coeff_2_3;
			coeff_2_4_r = ch18_coeff_2_4;
			coeff_2_5_r = ch18_coeff_2_5;
			coeff_2_6_r = ch18_coeff_2_6;
			coeff_2_7_r = ch18_coeff_2_7;
			coeff_2_8_r = ch18_coeff_2_8;
			coeff_2_9_r = ch18_coeff_2_9;
			coeff_2_10_r = ch18_coeff_2_10;
			mean2_r = ch18_mean2;
			std2_r = ch18_std2;
			coeff_3_0_r = ch18_coeff_3_0;
			coeff_3_1_r = ch18_coeff_3_1;
			coeff_3_2_r = ch18_coeff_3_2;
			coeff_3_3_r = ch18_coeff_3_3;
			coeff_3_4_r = ch18_coeff_3_4;
			coeff_3_5_r = ch18_coeff_3_5;
			coeff_3_6_r = ch18_coeff_3_6;
			coeff_3_7_r = ch18_coeff_3_7;
			coeff_3_8_r = ch18_coeff_3_8;
			coeff_3_9_r = ch18_coeff_3_9;
			coeff_3_10_r = ch18_coeff_3_10;
			mean3_r = ch18_mean3;
			std3_r = ch18_std3;
			coeff_4_0_r = ch18_coeff_4_0;
			coeff_4_1_r = ch18_coeff_4_1;
			coeff_4_2_r = ch18_coeff_4_2;
			coeff_4_3_r = ch18_coeff_4_3;
			coeff_4_4_r = ch18_coeff_4_4;
			coeff_4_5_r = ch18_coeff_4_5;
			coeff_4_6_r = ch18_coeff_4_6;
			coeff_4_7_r = ch18_coeff_4_7;
			coeff_4_8_r = ch18_coeff_4_8;
			coeff_4_9_r = ch18_coeff_4_9;
			coeff_4_10_r = ch18_coeff_4_10;
			mean4_r = ch18_mean4;
			std4_r = ch18_std4;
		end

		5'd19:
		begin
			x_adc_r = x_adc_ch19;
			section_limit_r = section_limit_ch19;
			coeff_1_0_r = ch19_coeff_1_0;
			coeff_1_1_r = ch19_coeff_1_1;
			coeff_1_2_r = ch19_coeff_1_2;
			coeff_1_3_r = ch19_coeff_1_3;
			coeff_1_4_r = ch19_coeff_1_4;
			coeff_1_5_r = ch19_coeff_1_5;
			coeff_1_6_r = ch19_coeff_1_6;
			coeff_1_7_r = ch19_coeff_1_7;
			coeff_1_8_r = ch19_coeff_1_8;
			coeff_1_9_r = ch19_coeff_1_9;
			coeff_1_10_r = ch19_coeff_1_10;
			mean1_r = ch19_mean1;
			std1_r = ch19_std1;
			coeff_2_0_r = ch19_coeff_2_0;
			coeff_2_1_r = ch19_coeff_2_1;
			coeff_2_2_r = ch19_coeff_2_2;
			coeff_2_3_r = ch19_coeff_2_3;
			coeff_2_4_r = ch19_coeff_2_4;
			coeff_2_5_r = ch19_coeff_2_5;
			coeff_2_6_r = ch19_coeff_2_6;
			coeff_2_7_r = ch19_coeff_2_7;
			coeff_2_8_r = ch19_coeff_2_8;
			coeff_2_9_r = ch19_coeff_2_9;
			coeff_2_10_r = ch19_coeff_2_10;
			mean2_r = ch19_mean2;
			std2_r = ch19_std2;
			coeff_3_0_r = ch19_coeff_3_0;
			coeff_3_1_r = ch19_coeff_3_1;
			coeff_3_2_r = ch19_coeff_3_2;
			coeff_3_3_r = ch19_coeff_3_3;
			coeff_3_4_r = ch19_coeff_3_4;
			coeff_3_5_r = ch19_coeff_3_5;
			coeff_3_6_r = ch19_coeff_3_6;
			coeff_3_7_r = ch19_coeff_3_7;
			coeff_3_8_r = ch19_coeff_3_8;
			coeff_3_9_r = ch19_coeff_3_9;
			coeff_3_10_r = ch19_coeff_3_10;
			mean3_r = ch19_mean3;
			std3_r = ch19_std3;
			coeff_4_0_r = ch19_coeff_4_0;
			coeff_4_1_r = ch19_coeff_4_1;
			coeff_4_2_r = ch19_coeff_4_2;
			coeff_4_3_r = ch19_coeff_4_3;
			coeff_4_4_r = ch19_coeff_4_4;
			coeff_4_5_r = ch19_coeff_4_5;
			coeff_4_6_r = ch19_coeff_4_6;
			coeff_4_7_r = ch19_coeff_4_7;
			coeff_4_8_r = ch19_coeff_4_8;
			coeff_4_9_r = ch19_coeff_4_9;
			coeff_4_10_r = ch19_coeff_4_10;
			mean4_r = ch19_mean4;
			std4_r = ch19_std4;
		end

		5'd20:
		begin
			x_adc_r = x_adc_ch20;
			section_limit_r = section_limit_ch20;
			coeff_1_0_r = ch20_coeff_1_0;
			coeff_1_1_r = ch20_coeff_1_1;
			coeff_1_2_r = ch20_coeff_1_2;
			coeff_1_3_r = ch20_coeff_1_3;
			coeff_1_4_r = ch20_coeff_1_4;
			coeff_1_5_r = ch20_coeff_1_5;
			coeff_1_6_r = ch20_coeff_1_6;
			coeff_1_7_r = ch20_coeff_1_7;
			coeff_1_8_r = ch20_coeff_1_8;
			coeff_1_9_r = ch20_coeff_1_9;
			coeff_1_10_r = ch20_coeff_1_10;
			mean1_r = ch20_mean1;
			std1_r = ch20_std1;
			coeff_2_0_r = ch20_coeff_2_0;
			coeff_2_1_r = ch20_coeff_2_1;
			coeff_2_2_r = ch20_coeff_2_2;
			coeff_2_3_r = ch20_coeff_2_3;
			coeff_2_4_r = ch20_coeff_2_4;
			coeff_2_5_r = ch20_coeff_2_5;
			coeff_2_6_r = ch20_coeff_2_6;
			coeff_2_7_r = ch20_coeff_2_7;
			coeff_2_8_r = ch20_coeff_2_8;
			coeff_2_9_r = ch20_coeff_2_9;
			coeff_2_10_r = ch20_coeff_2_10;
			mean2_r = ch20_mean2;
			std2_r = ch20_std2;
			coeff_3_0_r = ch20_coeff_3_0;
			coeff_3_1_r = ch20_coeff_3_1;
			coeff_3_2_r = ch20_coeff_3_2;
			coeff_3_3_r = ch20_coeff_3_3;
			coeff_3_4_r = ch20_coeff_3_4;
			coeff_3_5_r = ch20_coeff_3_5;
			coeff_3_6_r = ch20_coeff_3_6;
			coeff_3_7_r = ch20_coeff_3_7;
			coeff_3_8_r = ch20_coeff_3_8;
			coeff_3_9_r = ch20_coeff_3_9;
			coeff_3_10_r = ch20_coeff_3_10;
			mean3_r = ch20_mean3;
			std3_r = ch20_std3;
			coeff_4_0_r = ch20_coeff_4_0;
			coeff_4_1_r = ch20_coeff_4_1;
			coeff_4_2_r = ch20_coeff_4_2;
			coeff_4_3_r = ch20_coeff_4_3;
			coeff_4_4_r = ch20_coeff_4_4;
			coeff_4_5_r = ch20_coeff_4_5;
			coeff_4_6_r = ch20_coeff_4_6;
			coeff_4_7_r = ch20_coeff_4_7;
			coeff_4_8_r = ch20_coeff_4_8;
			coeff_4_9_r = ch20_coeff_4_9;
			coeff_4_10_r = ch20_coeff_4_10;
			mean4_r = ch20_mean4;
			std4_r = ch20_std4;
		end

		5'd21:
		begin
			x_adc_r = x_adc_ch21;
			section_limit_r = section_limit_ch21;
			coeff_1_0_r = ch21_coeff_1_0;
			coeff_1_1_r = ch21_coeff_1_1;
			coeff_1_2_r = ch21_coeff_1_2;
			coeff_1_3_r = ch21_coeff_1_3;
			coeff_1_4_r = ch21_coeff_1_4;
			coeff_1_5_r = ch21_coeff_1_5;
			coeff_1_6_r = ch21_coeff_1_6;
			coeff_1_7_r = ch21_coeff_1_7;
			coeff_1_8_r = ch21_coeff_1_8;
			coeff_1_9_r = ch21_coeff_1_9;
			coeff_1_10_r = ch21_coeff_1_10;
			mean1_r = ch21_mean1;
			std1_r = ch21_std1;
			coeff_2_0_r = ch21_coeff_2_0;
			coeff_2_1_r = ch21_coeff_2_1;
			coeff_2_2_r = ch21_coeff_2_2;
			coeff_2_3_r = ch21_coeff_2_3;
			coeff_2_4_r = ch21_coeff_2_4;
			coeff_2_5_r = ch21_coeff_2_5;
			coeff_2_6_r = ch21_coeff_2_6;
			coeff_2_7_r = ch21_coeff_2_7;
			coeff_2_8_r = ch21_coeff_2_8;
			coeff_2_9_r = ch21_coeff_2_9;
			coeff_2_10_r = ch21_coeff_2_10;
			mean2_r = ch21_mean2;
			std2_r = ch21_std2;
			coeff_3_0_r = ch21_coeff_3_0;
			coeff_3_1_r = ch21_coeff_3_1;
			coeff_3_2_r = ch21_coeff_3_2;
			coeff_3_3_r = ch21_coeff_3_3;
			coeff_3_4_r = ch21_coeff_3_4;
			coeff_3_5_r = ch21_coeff_3_5;
			coeff_3_6_r = ch21_coeff_3_6;
			coeff_3_7_r = ch21_coeff_3_7;
			coeff_3_8_r = ch21_coeff_3_8;
			coeff_3_9_r = ch21_coeff_3_9;
			coeff_3_10_r = ch21_coeff_3_10;
			mean3_r = ch21_mean3;
			std3_r = ch21_std3;
			coeff_4_0_r = ch21_coeff_4_0;
			coeff_4_1_r = ch21_coeff_4_1;
			coeff_4_2_r = ch21_coeff_4_2;
			coeff_4_3_r = ch21_coeff_4_3;
			coeff_4_4_r = ch21_coeff_4_4;
			coeff_4_5_r = ch21_coeff_4_5;
			coeff_4_6_r = ch21_coeff_4_6;
			coeff_4_7_r = ch21_coeff_4_7;
			coeff_4_8_r = ch21_coeff_4_8;
			coeff_4_9_r = ch21_coeff_4_9;
			coeff_4_10_r = ch21_coeff_4_10;
			mean4_r = ch21_mean4;
			std4_r = ch21_std4;
		end

		5'd22:
		begin
			x_adc_r = x_adc_ch22;
			section_limit_r = section_limit_ch22;
			coeff_1_0_r = ch22_coeff_1_0;
			coeff_1_1_r = ch22_coeff_1_1;
			coeff_1_2_r = ch22_coeff_1_2;
			coeff_1_3_r = ch22_coeff_1_3;
			coeff_1_4_r = ch22_coeff_1_4;
			coeff_1_5_r = ch22_coeff_1_5;
			coeff_1_6_r = ch22_coeff_1_6;
			coeff_1_7_r = ch22_coeff_1_7;
			coeff_1_8_r = ch22_coeff_1_8;
			coeff_1_9_r = ch22_coeff_1_9;
			coeff_1_10_r = ch22_coeff_1_10;
			mean1_r = ch22_mean1;
			std1_r = ch22_std1;
			coeff_2_0_r = ch22_coeff_2_0;
			coeff_2_1_r = ch22_coeff_2_1;
			coeff_2_2_r = ch22_coeff_2_2;
			coeff_2_3_r = ch22_coeff_2_3;
			coeff_2_4_r = ch22_coeff_2_4;
			coeff_2_5_r = ch22_coeff_2_5;
			coeff_2_6_r = ch22_coeff_2_6;
			coeff_2_7_r = ch22_coeff_2_7;
			coeff_2_8_r = ch22_coeff_2_8;
			coeff_2_9_r = ch22_coeff_2_9;
			coeff_2_10_r = ch22_coeff_2_10;
			mean2_r = ch22_mean2;
			std2_r = ch22_std2;
			coeff_3_0_r = ch22_coeff_3_0;
			coeff_3_1_r = ch22_coeff_3_1;
			coeff_3_2_r = ch22_coeff_3_2;
			coeff_3_3_r = ch22_coeff_3_3;
			coeff_3_4_r = ch22_coeff_3_4;
			coeff_3_5_r = ch22_coeff_3_5;
			coeff_3_6_r = ch22_coeff_3_6;
			coeff_3_7_r = ch22_coeff_3_7;
			coeff_3_8_r = ch22_coeff_3_8;
			coeff_3_9_r = ch22_coeff_3_9;
			coeff_3_10_r = ch22_coeff_3_10;
			mean3_r = ch22_mean3;
			std3_r = ch22_std3;
			coeff_4_0_r = ch22_coeff_4_0;
			coeff_4_1_r = ch22_coeff_4_1;
			coeff_4_2_r = ch22_coeff_4_2;
			coeff_4_3_r = ch22_coeff_4_3;
			coeff_4_4_r = ch22_coeff_4_4;
			coeff_4_5_r = ch22_coeff_4_5;
			coeff_4_6_r = ch22_coeff_4_6;
			coeff_4_7_r = ch22_coeff_4_7;
			coeff_4_8_r = ch22_coeff_4_8;
			coeff_4_9_r = ch22_coeff_4_9;
			coeff_4_10_r = ch22_coeff_4_10;
			mean4_r = ch22_mean4;
			std4_r = ch22_std4;
		end

		5'd23:
		begin
			x_adc_r = x_adc_ch23;
			section_limit_r = section_limit_ch23;
			coeff_1_0_r = ch23_coeff_1_0;
			coeff_1_1_r = ch23_coeff_1_1;
			coeff_1_2_r = ch23_coeff_1_2;
			coeff_1_3_r = ch23_coeff_1_3;
			coeff_1_4_r = ch23_coeff_1_4;
			coeff_1_5_r = ch23_coeff_1_5;
			coeff_1_6_r = ch23_coeff_1_6;
			coeff_1_7_r = ch23_coeff_1_7;
			coeff_1_8_r = ch23_coeff_1_8;
			coeff_1_9_r = ch23_coeff_1_9;
			coeff_1_10_r = ch23_coeff_1_10;
			mean1_r = ch23_mean1;
			std1_r = ch23_std1;
			coeff_2_0_r = ch23_coeff_2_0;
			coeff_2_1_r = ch23_coeff_2_1;
			coeff_2_2_r = ch23_coeff_2_2;
			coeff_2_3_r = ch23_coeff_2_3;
			coeff_2_4_r = ch23_coeff_2_4;
			coeff_2_5_r = ch23_coeff_2_5;
			coeff_2_6_r = ch23_coeff_2_6;
			coeff_2_7_r = ch23_coeff_2_7;
			coeff_2_8_r = ch23_coeff_2_8;
			coeff_2_9_r = ch23_coeff_2_9;
			coeff_2_10_r = ch23_coeff_2_10;
			mean2_r = ch23_mean2;
			std2_r = ch23_std2;
			coeff_3_0_r = ch23_coeff_3_0;
			coeff_3_1_r = ch23_coeff_3_1;
			coeff_3_2_r = ch23_coeff_3_2;
			coeff_3_3_r = ch23_coeff_3_3;
			coeff_3_4_r = ch23_coeff_3_4;
			coeff_3_5_r = ch23_coeff_3_5;
			coeff_3_6_r = ch23_coeff_3_6;
			coeff_3_7_r = ch23_coeff_3_7;
			coeff_3_8_r = ch23_coeff_3_8;
			coeff_3_9_r = ch23_coeff_3_9;
			coeff_3_10_r = ch23_coeff_3_10;
			mean3_r = ch23_mean3;
			std3_r = ch23_std3;
			coeff_4_0_r = ch23_coeff_4_0;
			coeff_4_1_r = ch23_coeff_4_1;
			coeff_4_2_r = ch23_coeff_4_2;
			coeff_4_3_r = ch23_coeff_4_3;
			coeff_4_4_r = ch23_coeff_4_4;
			coeff_4_5_r = ch23_coeff_4_5;
			coeff_4_6_r = ch23_coeff_4_6;
			coeff_4_7_r = ch23_coeff_4_7;
			coeff_4_8_r = ch23_coeff_4_8;
			coeff_4_9_r = ch23_coeff_4_9;
			coeff_4_10_r = ch23_coeff_4_10;
			mean4_r = ch23_mean4;
			std4_r = ch23_std4;
		end

		5'd24:
		begin
			x_adc_r = x_adc_ch24;
			section_limit_r = section_limit_ch24;
			coeff_1_0_r = ch24_coeff_1_0;
			coeff_1_1_r = ch24_coeff_1_1;
			coeff_1_2_r = ch24_coeff_1_2;
			coeff_1_3_r = ch24_coeff_1_3;
			coeff_1_4_r = ch24_coeff_1_4;
			coeff_1_5_r = ch24_coeff_1_5;
			coeff_1_6_r = ch24_coeff_1_6;
			coeff_1_7_r = ch24_coeff_1_7;
			coeff_1_8_r = ch24_coeff_1_8;
			coeff_1_9_r = ch24_coeff_1_9;
			coeff_1_10_r = ch24_coeff_1_10;
			mean1_r = ch24_mean1;
			std1_r = ch24_std1;
			coeff_2_0_r = ch24_coeff_2_0;
			coeff_2_1_r = ch24_coeff_2_1;
			coeff_2_2_r = ch24_coeff_2_2;
			coeff_2_3_r = ch24_coeff_2_3;
			coeff_2_4_r = ch24_coeff_2_4;
			coeff_2_5_r = ch24_coeff_2_5;
			coeff_2_6_r = ch24_coeff_2_6;
			coeff_2_7_r = ch24_coeff_2_7;
			coeff_2_8_r = ch24_coeff_2_8;
			coeff_2_9_r = ch24_coeff_2_9;
			coeff_2_10_r = ch24_coeff_2_10;
			mean2_r = ch24_mean2;
			std2_r = ch24_std2;
			coeff_3_0_r = ch24_coeff_3_0;
			coeff_3_1_r = ch24_coeff_3_1;
			coeff_3_2_r = ch24_coeff_3_2;
			coeff_3_3_r = ch24_coeff_3_3;
			coeff_3_4_r = ch24_coeff_3_4;
			coeff_3_5_r = ch24_coeff_3_5;
			coeff_3_6_r = ch24_coeff_3_6;
			coeff_3_7_r = ch24_coeff_3_7;
			coeff_3_8_r = ch24_coeff_3_8;
			coeff_3_9_r = ch24_coeff_3_9;
			coeff_3_10_r = ch24_coeff_3_10;
			mean3_r = ch24_mean3;
			std3_r = ch24_std3;
			coeff_4_0_r = ch24_coeff_4_0;
			coeff_4_1_r = ch24_coeff_4_1;
			coeff_4_2_r = ch24_coeff_4_2;
			coeff_4_3_r = ch24_coeff_4_3;
			coeff_4_4_r = ch24_coeff_4_4;
			coeff_4_5_r = ch24_coeff_4_5;
			coeff_4_6_r = ch24_coeff_4_6;
			coeff_4_7_r = ch24_coeff_4_7;
			coeff_4_8_r = ch24_coeff_4_8;
			coeff_4_9_r = ch24_coeff_4_9;
			coeff_4_10_r = ch24_coeff_4_10;
			mean4_r = ch24_mean4;
			std4_r = ch24_std4;
		end

		5'd25:
		begin
			x_adc_r = x_adc_ch25;
			section_limit_r = section_limit_ch25;
			coeff_1_0_r = ch25_coeff_1_0;
			coeff_1_1_r = ch25_coeff_1_1;
			coeff_1_2_r = ch25_coeff_1_2;
			coeff_1_3_r = ch25_coeff_1_3;
			coeff_1_4_r = ch25_coeff_1_4;
			coeff_1_5_r = ch25_coeff_1_5;
			coeff_1_6_r = ch25_coeff_1_6;
			coeff_1_7_r = ch25_coeff_1_7;
			coeff_1_8_r = ch25_coeff_1_8;
			coeff_1_9_r = ch25_coeff_1_9;
			coeff_1_10_r = ch25_coeff_1_10;
			mean1_r = ch25_mean1;
			std1_r = ch25_std1;
			coeff_2_0_r = ch25_coeff_2_0;
			coeff_2_1_r = ch25_coeff_2_1;
			coeff_2_2_r = ch25_coeff_2_2;
			coeff_2_3_r = ch25_coeff_2_3;
			coeff_2_4_r = ch25_coeff_2_4;
			coeff_2_5_r = ch25_coeff_2_5;
			coeff_2_6_r = ch25_coeff_2_6;
			coeff_2_7_r = ch25_coeff_2_7;
			coeff_2_8_r = ch25_coeff_2_8;
			coeff_2_9_r = ch25_coeff_2_9;
			coeff_2_10_r = ch25_coeff_2_10;
			mean2_r = ch25_mean2;
			std2_r = ch25_std2;
			coeff_3_0_r = ch25_coeff_3_0;
			coeff_3_1_r = ch25_coeff_3_1;
			coeff_3_2_r = ch25_coeff_3_2;
			coeff_3_3_r = ch25_coeff_3_3;
			coeff_3_4_r = ch25_coeff_3_4;
			coeff_3_5_r = ch25_coeff_3_5;
			coeff_3_6_r = ch25_coeff_3_6;
			coeff_3_7_r = ch25_coeff_3_7;
			coeff_3_8_r = ch25_coeff_3_8;
			coeff_3_9_r = ch25_coeff_3_9;
			coeff_3_10_r = ch25_coeff_3_10;
			mean3_r = ch25_mean3;
			std3_r = ch25_std3;
			coeff_4_0_r = ch25_coeff_4_0;
			coeff_4_1_r = ch25_coeff_4_1;
			coeff_4_2_r = ch25_coeff_4_2;
			coeff_4_3_r = ch25_coeff_4_3;
			coeff_4_4_r = ch25_coeff_4_4;
			coeff_4_5_r = ch25_coeff_4_5;
			coeff_4_6_r = ch25_coeff_4_6;
			coeff_4_7_r = ch25_coeff_4_7;
			coeff_4_8_r = ch25_coeff_4_8;
			coeff_4_9_r = ch25_coeff_4_9;
			coeff_4_10_r = ch25_coeff_4_10;
			mean4_r = ch25_mean4;
			std4_r = ch25_std4;
		end

		5'd26:
		begin
			x_adc_r = x_adc_ch26;
			section_limit_r = section_limit_ch26;
			coeff_1_0_r = ch26_coeff_1_0;
			coeff_1_1_r = ch26_coeff_1_1;
			coeff_1_2_r = ch26_coeff_1_2;
			coeff_1_3_r = ch26_coeff_1_3;
			coeff_1_4_r = ch26_coeff_1_4;
			coeff_1_5_r = ch26_coeff_1_5;
			coeff_1_6_r = ch26_coeff_1_6;
			coeff_1_7_r = ch26_coeff_1_7;
			coeff_1_8_r = ch26_coeff_1_8;
			coeff_1_9_r = ch26_coeff_1_9;
			coeff_1_10_r = ch26_coeff_1_10;
			mean1_r = ch26_mean1;
			std1_r = ch26_std1;
			coeff_2_0_r = ch26_coeff_2_0;
			coeff_2_1_r = ch26_coeff_2_1;
			coeff_2_2_r = ch26_coeff_2_2;
			coeff_2_3_r = ch26_coeff_2_3;
			coeff_2_4_r = ch26_coeff_2_4;
			coeff_2_5_r = ch26_coeff_2_5;
			coeff_2_6_r = ch26_coeff_2_6;
			coeff_2_7_r = ch26_coeff_2_7;
			coeff_2_8_r = ch26_coeff_2_8;
			coeff_2_9_r = ch26_coeff_2_9;
			coeff_2_10_r = ch26_coeff_2_10;
			mean2_r = ch26_mean2;
			std2_r = ch26_std2;
			coeff_3_0_r = ch26_coeff_3_0;
			coeff_3_1_r = ch26_coeff_3_1;
			coeff_3_2_r = ch26_coeff_3_2;
			coeff_3_3_r = ch26_coeff_3_3;
			coeff_3_4_r = ch26_coeff_3_4;
			coeff_3_5_r = ch26_coeff_3_5;
			coeff_3_6_r = ch26_coeff_3_6;
			coeff_3_7_r = ch26_coeff_3_7;
			coeff_3_8_r = ch26_coeff_3_8;
			coeff_3_9_r = ch26_coeff_3_9;
			coeff_3_10_r = ch26_coeff_3_10;
			mean3_r = ch26_mean3;
			std3_r = ch26_std3;
			coeff_4_0_r = ch26_coeff_4_0;
			coeff_4_1_r = ch26_coeff_4_1;
			coeff_4_2_r = ch26_coeff_4_2;
			coeff_4_3_r = ch26_coeff_4_3;
			coeff_4_4_r = ch26_coeff_4_4;
			coeff_4_5_r = ch26_coeff_4_5;
			coeff_4_6_r = ch26_coeff_4_6;
			coeff_4_7_r = ch26_coeff_4_7;
			coeff_4_8_r = ch26_coeff_4_8;
			coeff_4_9_r = ch26_coeff_4_9;
			coeff_4_10_r = ch26_coeff_4_10;
			mean4_r = ch26_mean4;
			std4_r = ch26_std4;
		end

		5'd27:
		begin
			x_adc_r = x_adc_ch27;
			section_limit_r = section_limit_ch27;
			coeff_1_0_r = ch27_coeff_1_0;
			coeff_1_1_r = ch27_coeff_1_1;
			coeff_1_2_r = ch27_coeff_1_2;
			coeff_1_3_r = ch27_coeff_1_3;
			coeff_1_4_r = ch27_coeff_1_4;
			coeff_1_5_r = ch27_coeff_1_5;
			coeff_1_6_r = ch27_coeff_1_6;
			coeff_1_7_r = ch27_coeff_1_7;
			coeff_1_8_r = ch27_coeff_1_8;
			coeff_1_9_r = ch27_coeff_1_9;
			coeff_1_10_r = ch27_coeff_1_10;
			mean1_r = ch27_mean1;
			std1_r = ch27_std1;
			coeff_2_0_r = ch27_coeff_2_0;
			coeff_2_1_r = ch27_coeff_2_1;
			coeff_2_2_r = ch27_coeff_2_2;
			coeff_2_3_r = ch27_coeff_2_3;
			coeff_2_4_r = ch27_coeff_2_4;
			coeff_2_5_r = ch27_coeff_2_5;
			coeff_2_6_r = ch27_coeff_2_6;
			coeff_2_7_r = ch27_coeff_2_7;
			coeff_2_8_r = ch27_coeff_2_8;
			coeff_2_9_r = ch27_coeff_2_9;
			coeff_2_10_r = ch27_coeff_2_10;
			mean2_r = ch27_mean2;
			std2_r = ch27_std2;
			coeff_3_0_r = ch27_coeff_3_0;
			coeff_3_1_r = ch27_coeff_3_1;
			coeff_3_2_r = ch27_coeff_3_2;
			coeff_3_3_r = ch27_coeff_3_3;
			coeff_3_4_r = ch27_coeff_3_4;
			coeff_3_5_r = ch27_coeff_3_5;
			coeff_3_6_r = ch27_coeff_3_6;
			coeff_3_7_r = ch27_coeff_3_7;
			coeff_3_8_r = ch27_coeff_3_8;
			coeff_3_9_r = ch27_coeff_3_9;
			coeff_3_10_r = ch27_coeff_3_10;
			mean3_r = ch27_mean3;
			std3_r = ch27_std3;
			coeff_4_0_r = ch27_coeff_4_0;
			coeff_4_1_r = ch27_coeff_4_1;
			coeff_4_2_r = ch27_coeff_4_2;
			coeff_4_3_r = ch27_coeff_4_3;
			coeff_4_4_r = ch27_coeff_4_4;
			coeff_4_5_r = ch27_coeff_4_5;
			coeff_4_6_r = ch27_coeff_4_6;
			coeff_4_7_r = ch27_coeff_4_7;
			coeff_4_8_r = ch27_coeff_4_8;
			coeff_4_9_r = ch27_coeff_4_9;
			coeff_4_10_r = ch27_coeff_4_10;
			mean4_r = ch27_mean4;
			std4_r = ch27_std4;
		end

		5'd28:
		begin
			x_adc_r = x_adc_ch28;
			section_limit_r = section_limit_ch28;
			coeff_1_0_r = ch28_coeff_1_0;
			coeff_1_1_r = ch28_coeff_1_1;
			coeff_1_2_r = ch28_coeff_1_2;
			coeff_1_3_r = ch28_coeff_1_3;
			coeff_1_4_r = ch28_coeff_1_4;
			coeff_1_5_r = ch28_coeff_1_5;
			coeff_1_6_r = ch28_coeff_1_6;
			coeff_1_7_r = ch28_coeff_1_7;
			coeff_1_8_r = ch28_coeff_1_8;
			coeff_1_9_r = ch28_coeff_1_9;
			coeff_1_10_r = ch28_coeff_1_10;
			mean1_r = ch28_mean1;
			std1_r = ch28_std1;
			coeff_2_0_r = ch28_coeff_2_0;
			coeff_2_1_r = ch28_coeff_2_1;
			coeff_2_2_r = ch28_coeff_2_2;
			coeff_2_3_r = ch28_coeff_2_3;
			coeff_2_4_r = ch28_coeff_2_4;
			coeff_2_5_r = ch28_coeff_2_5;
			coeff_2_6_r = ch28_coeff_2_6;
			coeff_2_7_r = ch28_coeff_2_7;
			coeff_2_8_r = ch28_coeff_2_8;
			coeff_2_9_r = ch28_coeff_2_9;
			coeff_2_10_r = ch28_coeff_2_10;
			mean2_r = ch28_mean2;
			std2_r = ch28_std2;
			coeff_3_0_r = ch28_coeff_3_0;
			coeff_3_1_r = ch28_coeff_3_1;
			coeff_3_2_r = ch28_coeff_3_2;
			coeff_3_3_r = ch28_coeff_3_3;
			coeff_3_4_r = ch28_coeff_3_4;
			coeff_3_5_r = ch28_coeff_3_5;
			coeff_3_6_r = ch28_coeff_3_6;
			coeff_3_7_r = ch28_coeff_3_7;
			coeff_3_8_r = ch28_coeff_3_8;
			coeff_3_9_r = ch28_coeff_3_9;
			coeff_3_10_r = ch28_coeff_3_10;
			mean3_r = ch28_mean3;
			std3_r = ch28_std3;
			coeff_4_0_r = ch28_coeff_4_0;
			coeff_4_1_r = ch28_coeff_4_1;
			coeff_4_2_r = ch28_coeff_4_2;
			coeff_4_3_r = ch28_coeff_4_3;
			coeff_4_4_r = ch28_coeff_4_4;
			coeff_4_5_r = ch28_coeff_4_5;
			coeff_4_6_r = ch28_coeff_4_6;
			coeff_4_7_r = ch28_coeff_4_7;
			coeff_4_8_r = ch28_coeff_4_8;
			coeff_4_9_r = ch28_coeff_4_9;
			coeff_4_10_r = ch28_coeff_4_10;
			mean4_r = ch28_mean4;
			std4_r = ch28_std4;
		end

		5'd29:
		begin
			x_adc_r = x_adc_ch29;
			section_limit_r = section_limit_ch29;
			coeff_1_0_r = ch29_coeff_1_0;
			coeff_1_1_r = ch29_coeff_1_1;
			coeff_1_2_r = ch29_coeff_1_2;
			coeff_1_3_r = ch29_coeff_1_3;
			coeff_1_4_r = ch29_coeff_1_4;
			coeff_1_5_r = ch29_coeff_1_5;
			coeff_1_6_r = ch29_coeff_1_6;
			coeff_1_7_r = ch29_coeff_1_7;
			coeff_1_8_r = ch29_coeff_1_8;
			coeff_1_9_r = ch29_coeff_1_9;
			coeff_1_10_r = ch29_coeff_1_10;
			mean1_r = ch29_mean1;
			std1_r = ch29_std1;
			coeff_2_0_r = ch29_coeff_2_0;
			coeff_2_1_r = ch29_coeff_2_1;
			coeff_2_2_r = ch29_coeff_2_2;
			coeff_2_3_r = ch29_coeff_2_3;
			coeff_2_4_r = ch29_coeff_2_4;
			coeff_2_5_r = ch29_coeff_2_5;
			coeff_2_6_r = ch29_coeff_2_6;
			coeff_2_7_r = ch29_coeff_2_7;
			coeff_2_8_r = ch29_coeff_2_8;
			coeff_2_9_r = ch29_coeff_2_9;
			coeff_2_10_r = ch29_coeff_2_10;
			mean2_r = ch29_mean2;
			std2_r = ch29_std2;
			coeff_3_0_r = ch29_coeff_3_0;
			coeff_3_1_r = ch29_coeff_3_1;
			coeff_3_2_r = ch29_coeff_3_2;
			coeff_3_3_r = ch29_coeff_3_3;
			coeff_3_4_r = ch29_coeff_3_4;
			coeff_3_5_r = ch29_coeff_3_5;
			coeff_3_6_r = ch29_coeff_3_6;
			coeff_3_7_r = ch29_coeff_3_7;
			coeff_3_8_r = ch29_coeff_3_8;
			coeff_3_9_r = ch29_coeff_3_9;
			coeff_3_10_r = ch29_coeff_3_10;
			mean3_r = ch29_mean3;
			std3_r = ch29_std3;
			coeff_4_0_r = ch29_coeff_4_0;
			coeff_4_1_r = ch29_coeff_4_1;
			coeff_4_2_r = ch29_coeff_4_2;
			coeff_4_3_r = ch29_coeff_4_3;
			coeff_4_4_r = ch29_coeff_4_4;
			coeff_4_5_r = ch29_coeff_4_5;
			coeff_4_6_r = ch29_coeff_4_6;
			coeff_4_7_r = ch29_coeff_4_7;
			coeff_4_8_r = ch29_coeff_4_8;
			coeff_4_9_r = ch29_coeff_4_9;
			coeff_4_10_r = ch29_coeff_4_10;
			mean4_r = ch29_mean4;
			std4_r = ch29_std4;
		end

		5'd30:
		begin
			x_adc_r = x_adc_ch30;
			section_limit_r = section_limit_ch30;
			coeff_1_0_r = ch30_coeff_1_0;
			coeff_1_1_r = ch30_coeff_1_1;
			coeff_1_2_r = ch30_coeff_1_2;
			coeff_1_3_r = ch30_coeff_1_3;
			coeff_1_4_r = ch30_coeff_1_4;
			coeff_1_5_r = ch30_coeff_1_5;
			coeff_1_6_r = ch30_coeff_1_6;
			coeff_1_7_r = ch30_coeff_1_7;
			coeff_1_8_r = ch30_coeff_1_8;
			coeff_1_9_r = ch30_coeff_1_9;
			coeff_1_10_r = ch30_coeff_1_10;
			mean1_r = ch30_mean1;
			std1_r = ch30_std1;
			coeff_2_0_r = ch30_coeff_2_0;
			coeff_2_1_r = ch30_coeff_2_1;
			coeff_2_2_r = ch30_coeff_2_2;
			coeff_2_3_r = ch30_coeff_2_3;
			coeff_2_4_r = ch30_coeff_2_4;
			coeff_2_5_r = ch30_coeff_2_5;
			coeff_2_6_r = ch30_coeff_2_6;
			coeff_2_7_r = ch30_coeff_2_7;
			coeff_2_8_r = ch30_coeff_2_8;
			coeff_2_9_r = ch30_coeff_2_9;
			coeff_2_10_r = ch30_coeff_2_10;
			mean2_r = ch30_mean2;
			std2_r = ch30_std2;
			coeff_3_0_r = ch30_coeff_3_0;
			coeff_3_1_r = ch30_coeff_3_1;
			coeff_3_2_r = ch30_coeff_3_2;
			coeff_3_3_r = ch30_coeff_3_3;
			coeff_3_4_r = ch30_coeff_3_4;
			coeff_3_5_r = ch30_coeff_3_5;
			coeff_3_6_r = ch30_coeff_3_6;
			coeff_3_7_r = ch30_coeff_3_7;
			coeff_3_8_r = ch30_coeff_3_8;
			coeff_3_9_r = ch30_coeff_3_9;
			coeff_3_10_r = ch30_coeff_3_10;
			mean3_r = ch30_mean3;
			std3_r = ch30_std3;
			coeff_4_0_r = ch30_coeff_4_0;
			coeff_4_1_r = ch30_coeff_4_1;
			coeff_4_2_r = ch30_coeff_4_2;
			coeff_4_3_r = ch30_coeff_4_3;
			coeff_4_4_r = ch30_coeff_4_4;
			coeff_4_5_r = ch30_coeff_4_5;
			coeff_4_6_r = ch30_coeff_4_6;
			coeff_4_7_r = ch30_coeff_4_7;
			coeff_4_8_r = ch30_coeff_4_8;
			coeff_4_9_r = ch30_coeff_4_9;
			coeff_4_10_r = ch30_coeff_4_10;
			mean4_r = ch30_mean4;
			std4_r = ch30_std4;
		end

		5'd31:
		begin
			x_adc_r = x_adc_ch31;
			section_limit_r = section_limit_ch31;
			coeff_1_0_r = ch31_coeff_1_0;
			coeff_1_1_r = ch31_coeff_1_1;
			coeff_1_2_r = ch31_coeff_1_2;
			coeff_1_3_r = ch31_coeff_1_3;
			coeff_1_4_r = ch31_coeff_1_4;
			coeff_1_5_r = ch31_coeff_1_5;
			coeff_1_6_r = ch31_coeff_1_6;
			coeff_1_7_r = ch31_coeff_1_7;
			coeff_1_8_r = ch31_coeff_1_8;
			coeff_1_9_r = ch31_coeff_1_9;
			coeff_1_10_r = ch31_coeff_1_10;
			mean1_r = ch31_mean1;
			std1_r = ch31_std1;
			coeff_2_0_r = ch31_coeff_2_0;
			coeff_2_1_r = ch31_coeff_2_1;
			coeff_2_2_r = ch31_coeff_2_2;
			coeff_2_3_r = ch31_coeff_2_3;
			coeff_2_4_r = ch31_coeff_2_4;
			coeff_2_5_r = ch31_coeff_2_5;
			coeff_2_6_r = ch31_coeff_2_6;
			coeff_2_7_r = ch31_coeff_2_7;
			coeff_2_8_r = ch31_coeff_2_8;
			coeff_2_9_r = ch31_coeff_2_9;
			coeff_2_10_r = ch31_coeff_2_10;
			mean2_r = ch31_mean2;
			std2_r = ch31_std2;
			coeff_3_0_r = ch31_coeff_3_0;
			coeff_3_1_r = ch31_coeff_3_1;
			coeff_3_2_r = ch31_coeff_3_2;
			coeff_3_3_r = ch31_coeff_3_3;
			coeff_3_4_r = ch31_coeff_3_4;
			coeff_3_5_r = ch31_coeff_3_5;
			coeff_3_6_r = ch31_coeff_3_6;
			coeff_3_7_r = ch31_coeff_3_7;
			coeff_3_8_r = ch31_coeff_3_8;
			coeff_3_9_r = ch31_coeff_3_9;
			coeff_3_10_r = ch31_coeff_3_10;
			mean3_r = ch31_mean3;
			std3_r = ch31_std3;
			coeff_4_0_r = ch31_coeff_4_0;
			coeff_4_1_r = ch31_coeff_4_1;
			coeff_4_2_r = ch31_coeff_4_2;
			coeff_4_3_r = ch31_coeff_4_3;
			coeff_4_4_r = ch31_coeff_4_4;
			coeff_4_5_r = ch31_coeff_4_5;
			coeff_4_6_r = ch31_coeff_4_6;
			coeff_4_7_r = ch31_coeff_4_7;
			coeff_4_8_r = ch31_coeff_4_8;
			coeff_4_9_r = ch31_coeff_4_9;
			coeff_4_10_r = ch31_coeff_4_10;
			mean4_r = ch31_mean4;
			std4_r = ch31_std4;
		end

		default:
		begin
			x_adc_r = x_adc_ch0;
			section_limit_r = section_limit_ch0;
			coeff_1_0_r = ch0_coeff_1_0;
			coeff_1_1_r = ch0_coeff_1_1;
			coeff_1_2_r = ch0_coeff_1_2;
			coeff_1_3_r = ch0_coeff_1_3;
			coeff_1_4_r = ch0_coeff_1_4;
			coeff_1_5_r = ch0_coeff_1_5;
			coeff_1_6_r = ch0_coeff_1_6;
			coeff_1_7_r = ch0_coeff_1_7;
			coeff_1_8_r = ch0_coeff_1_8;
			coeff_1_9_r = ch0_coeff_1_9;
			coeff_1_10_r = ch0_coeff_1_10;
			mean1_r = ch0_mean1;
			std1_r = ch0_std1;
			coeff_2_0_r = ch0_coeff_2_0;
			coeff_2_1_r = ch0_coeff_2_1;
			coeff_2_2_r = ch0_coeff_2_2;
			coeff_2_3_r = ch0_coeff_2_3;
			coeff_2_4_r = ch0_coeff_2_4;
			coeff_2_5_r = ch0_coeff_2_5;
			coeff_2_6_r = ch0_coeff_2_6;
			coeff_2_7_r = ch0_coeff_2_7;
			coeff_2_8_r = ch0_coeff_2_8;
			coeff_2_9_r = ch0_coeff_2_9;
			coeff_2_10_r = ch0_coeff_2_10;
			mean2_r = ch0_mean2;
			std2_r = ch0_std2;
			coeff_3_0_r = ch0_coeff_3_0;
			coeff_3_1_r = ch0_coeff_3_1;
			coeff_3_2_r = ch0_coeff_3_2;
			coeff_3_3_r = ch0_coeff_3_3;
			coeff_3_4_r = ch0_coeff_3_4;
			coeff_3_5_r = ch0_coeff_3_5;
			coeff_3_6_r = ch0_coeff_3_6;
			coeff_3_7_r = ch0_coeff_3_7;
			coeff_3_8_r = ch0_coeff_3_8;
			coeff_3_9_r = ch0_coeff_3_9;
			coeff_3_10_r = ch0_coeff_3_10;
			mean3_r = ch0_mean3;
			std3_r = ch0_std3;
			coeff_4_0_r = ch0_coeff_4_0;
			coeff_4_1_r = ch0_coeff_4_1;
			coeff_4_2_r = ch0_coeff_4_2;
			coeff_4_3_r = ch0_coeff_4_3;
			coeff_4_4_r = ch0_coeff_4_4;
			coeff_4_5_r = ch0_coeff_4_5;
			coeff_4_6_r = ch0_coeff_4_6;
			coeff_4_7_r = ch0_coeff_4_7;
			coeff_4_8_r = ch0_coeff_4_8;
			coeff_4_9_r = ch0_coeff_4_9;
			coeff_4_10_r = ch0_coeff_4_10;
			mean4_r = ch0_mean4;
			std4_r = ch0_std4;
		end
	endcase
end

always @(posedge clk) begin
	if (GlobalReset == 1'b1) begin
		x_adc <= x_adc_ch0;

		section_limit <= section_limit_ch0;
		coeff_1_0 <= ch0_coeff_1_0;
		coeff_1_1 <= ch0_coeff_1_1;
		coeff_1_2 <= ch0_coeff_1_2;
		coeff_1_3 <= ch0_coeff_1_3;
		coeff_1_4 <= ch0_coeff_1_4;
		coeff_1_5 <= ch0_coeff_1_5;
		coeff_1_6 <= ch0_coeff_1_6;
		coeff_1_7 <= ch0_coeff_1_7;
		coeff_1_8 <= ch0_coeff_1_8;
		coeff_1_9 <= ch0_coeff_1_9;
		coeff_1_10 <= ch0_coeff_1_10;

		mean1 <= ch0_mean1;
		std1 <= ch0_std1;

		coeff_2_0 <= ch0_coeff_2_0;
		coeff_2_1 <= ch0_coeff_2_1;
		coeff_2_2 <= ch0_coeff_2_2;
		coeff_2_3 <= ch0_coeff_2_3;
		coeff_2_4 <= ch0_coeff_2_4;
		coeff_2_5 <= ch0_coeff_2_5;
		coeff_2_6 <= ch0_coeff_2_6;
		coeff_2_7 <= ch0_coeff_2_7;
		coeff_2_8 <= ch0_coeff_2_8;
		coeff_2_9 <= ch0_coeff_2_9;
		coeff_2_10 <= ch0_coeff_2_10;

		mean2 <= ch0_mean2;
		std2 <= ch0_std2;

		coeff_3_0 <= ch0_coeff_3_0;
		coeff_3_1 <= ch0_coeff_3_1;
		coeff_3_2 <= ch0_coeff_3_2;
		coeff_3_3 <= ch0_coeff_3_3;
		coeff_3_4 <= ch0_coeff_3_4;
		coeff_3_5 <= ch0_coeff_3_5;
		coeff_3_6 <= ch0_coeff_3_6;
		coeff_3_7 <= ch0_coeff_3_7;
		coeff_3_8 <= ch0_coeff_3_8;
		coeff_3_9 <= ch0_coeff_3_9;
		coeff_3_10 <= ch0_coeff_3_10;

		mean3 <= ch0_mean3;
		std3 <= ch0_std3;

		coeff_4_0 <= ch0_coeff_4_0;
		coeff_4_1 <= ch0_coeff_4_1;
		coeff_4_2 <= ch0_coeff_4_2;
		coeff_4_3 <= ch0_coeff_4_3;
		coeff_4_4 <= ch0_coeff_4_4;
		coeff_4_5 <= ch0_coeff_4_5;
		coeff_4_6 <= ch0_coeff_4_6;
		coeff_4_7 <= ch0_coeff_4_7;
		coeff_4_8 <= ch0_coeff_4_8;
		coeff_4_9 <= ch0_coeff_4_9;
		coeff_4_10 <= ch0_coeff_4_10;

		mean4 <= ch0_mean4;
		std4 <= ch0_std4;


	end
	else begin
		x_adc <= x_adc_r;

		section_limit <= section_limit_r;
		coeff_1_0 <= coeff_1_0_r;
		coeff_1_1 <= coeff_1_1_r;
		coeff_1_2 <= coeff_1_2_r;
		coeff_1_3 <= coeff_1_3_r;
		coeff_1_4 <= coeff_1_4_r;
		coeff_1_5 <= coeff_1_5_r;
		coeff_1_6 <= coeff_1_6_r;
		coeff_1_7 <= coeff_1_7_r;
		coeff_1_8 <= coeff_1_8_r;
		coeff_1_9 <= coeff_1_9_r;
		coeff_1_10 <= coeff_1_10_r;

		mean1 <= mean1_r;
		std1 <= std1_r;

		coeff_2_0 <= coeff_2_0_r;
		coeff_2_1 <= coeff_2_1_r;
		coeff_2_2 <= coeff_2_2_r;
		coeff_2_3 <= coeff_2_3_r;
		coeff_2_4 <= coeff_2_4_r;
		coeff_2_5 <= coeff_2_5_r;
		coeff_2_6 <= coeff_2_6_r;
		coeff_2_7 <= coeff_2_7_r;
		coeff_2_8 <= coeff_2_8_r;
		coeff_2_9 <= coeff_2_9_r;
		coeff_2_10 <= coeff_2_10_r;

		mean2 <= mean2_r;
		std2 <= std2_r;

		coeff_3_0 <= coeff_3_0_r;
		coeff_3_1 <= coeff_3_1_r;
		coeff_3_2 <= coeff_3_2_r;
		coeff_3_3 <= coeff_3_3_r;
		coeff_3_4 <= coeff_3_4_r;
		coeff_3_5 <= coeff_3_5_r;
		coeff_3_6 <= coeff_3_6_r;
		coeff_3_7 <= coeff_3_7_r;
		coeff_3_8 <= coeff_3_8_r;
		coeff_3_9 <= coeff_3_9_r;
		coeff_3_10 <= coeff_3_10_r;

		mean3 <= mean3_r;
		std3 <= std3_r;

		coeff_4_0 <= coeff_4_0_r;
		coeff_4_1 <= coeff_4_1_r;
		coeff_4_2 <= coeff_4_2_r;
		coeff_4_3 <= coeff_4_3_r;
		coeff_4_4 <= coeff_4_4_r;
		coeff_4_5 <= coeff_4_5_r;
		coeff_4_6 <= coeff_4_6_r;
		coeff_4_7 <= coeff_4_7_r;
		coeff_4_8 <= coeff_4_8_r;
		coeff_4_9 <= coeff_4_9_r;
		coeff_4_10 <= coeff_4_10_r;

		mean4 <= mean4_r;
		std4 <= std4_r;

	end
end

endmodule
