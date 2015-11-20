`timescale 1ns / 1ps

module comparator_tb();

	//----------------------------------------------------------------
	//		Parameters
	//----------------------------------------------------------------
	parameter ResetValue	= 2'b01;
	parameter HalfCycle		= 5;			//Half of the Clock Period is 5 ns
	localparam Cycle		= 2*HalfCycle;	//The length of the entire Clock Period
	
	
	//----------------------------------------------------------------
	//		Signal Declarations
	//----------------------------------------------------------------
	reg Clock;
	reg GlobalReset;

	reg [20:0] x_adc;
	reg [19:0] section_limit;

	reg [31:0] coeff1_0;
	reg [31:0] coeff1_1;
	reg [31:0] coeff1_2;
	reg [31:0] coeff1_3;
	reg [31:0] coeff1_4;
	reg [31:0] coeff1_5;
	reg [31:0] coeff1_6;
	reg [31:0] coeff1_7;
	reg [31:0] coeff1_8;
	reg [31:0] coeff1_9;
	reg [31:0] coeff1_10;
	reg [31:0] mean1;
	reg [31:0] std1;

	reg [31:0] coeff2_0;
	reg [31:0] coeff2_1;
	reg [31:0] coeff2_2;
	reg [31:0] coeff2_3;
	reg [31:0] coeff2_4;
	reg [31:0] coeff2_5;
	reg [31:0] coeff2_6;
	reg [31:0] coeff2_7;
	reg [31:0] coeff2_8;
	reg [31:0] coeff2_9;
	reg [31:0] coeff2_10;
	reg [31:0] mean2;
	reg [31:0] std2;

	reg [31:0] coeff3_0;
	reg [31:0] coeff3_1;
	reg [31:0] coeff3_2;
	reg [31:0] coeff3_3;
	reg [31:0] coeff3_4;
	reg [31:0] coeff3_5;
	reg [31:0] coeff3_6;
	reg [31:0] coeff3_7;
	reg [31:0] coeff3_8;
	reg [31:0] coeff3_9;
	reg [31:0] coeff3_10;
	reg [31:0] mean3;
	reg [31:0] std3;

	reg [31:0] coeff4_0;
	reg [31:0] coeff4_1;
	reg [31:0] coeff4_2;
	reg [31:0] coeff4_3;
	reg [31:0] coeff4_4;
	reg [31:0] coeff4_5;
	reg [31:0] coeff4_6;
	reg [31:0] coeff4_7;
	reg [31:0] coeff4_8;
	reg [31:0] coeff4_9;
	reg [31:0] coeff4_10;
	reg [31:0] mean4;
	reg [31:0] std4;

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
	
	integer cnt, testcase;
	
	//----------------------------------------------------------------
	//		Model
	//----------------------------------------------------------------
	
	comparator UUT( 
	Clock,
	GlobalReset,
    x_adc,
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
	
	//---------------------------------------------------------------
	//		Clock Source
	//---------------------------------------------------------------
	initial Clock =			1'b0;
	always #(HalfCycle) Clock =	~Clock;
	
	
	//----------------------------------------------------------------
	//		Test Stimulus
	//----------------------------------------------------------------
	initial begin
		// Initial Conditions
		testcase=21'd0;
		GlobalReset = 1;
		x_adc = 21'b000000000001000000000;
		section_limit = 20'd512;
		coeff1_0 = 21'b000000000001000000000;
		coeff1_1 = 21'b000000000001000000000;
		coeff1_2 = 21'b000000000001000000000;
		coeff1_3 = 21'b000000000001000000000;
		coeff1_4 = 21'b000000000001000000000;
		coeff1_5 = 21'b000000000001000000000;
		coeff1_6 = 21'b000000000001000000000;
		coeff1_7 = 21'b000000000001000000000;
		coeff1_8 = 21'b000000000001000000000;
		coeff1_9 = 21'b000000000001000000000;
		coeff1_10 = 21'b000000000001000000000;
		mean1 = 21'b000000000001000000000;
		std1 = 21'b000000000001000000000;
		coeff2_0 = 21'b000000000001000000001;
		coeff2_1 = 21'b000000000001000000001;
		coeff2_2 = 21'b000000000001000000001;
		coeff2_3 = 21'b000000000001000000001;
		coeff2_4 = 21'b000000000001000000001;
		coeff2_5 = 21'b000000000001000000001;
		coeff2_6 = 21'b000000000001000000001;
		coeff2_7 = 21'b000000000001000000001;
		coeff2_8 = 21'b000000000001000000001;
		coeff2_9 = 21'b000000000001000000001;
		coeff2_10 = 21'b000000000001000000001;
		mean2 = 21'b000000000001000000001;
		std2 = 21'b000000000001000000001;
		coeff3_0 = 21'b000000000001000000010;
		coeff3_1 = 21'b000000000001000000010;
		coeff3_2 = 21'b000000000001000000010;
		coeff3_3 = 21'b000000000001000000010;
		coeff3_4 = 21'b000000000001000000010;
		coeff3_5 = 21'b000000000001000000010;
		coeff3_6 = 21'b000000000001000000010;
		coeff3_7 = 21'b000000000001000000010;
		coeff3_8 = 21'b000000000001000000010;
		coeff3_9 = 21'b000000000001000000010;
		coeff3_10 = 21'b000000000001000000010;
		mean3 = 21'b000000000001000000010;
		std3 = 21'b000000000001000000010;
		coeff4_0 = 21'b000000000001000000011;
		coeff4_1 = 21'b000000000001000000011;
		coeff4_2 = 21'b000000000001000000011;
		coeff4_3 = 21'b000000000001000000011;
		coeff4_4 = 21'b000000000001000000011;
		coeff4_5 = 21'b000000000001000000011;
		coeff4_6 = 21'b000000000001000000011;
		coeff4_7 = 21'b000000000001000000011;
		coeff4_8 = 21'b000000000001000000011;
		coeff4_9 = 21'b000000000001000000011;
		coeff4_10 = 21'b000000000001000000011;
		mean4 = 21'b000000000001000000011;
		std4 = 21'b000000000001000000011;
		
		#(Cycle);
		$display ("*************");
		$display ("mean: %d", mean);
		
		GlobalReset = 0;
		cnt = 0;
		repeat(5) begin
			#(Cycle);
			cnt = cnt + 1;
			x_adc = 21'd513 - (cnt-1)*512;
		$display ("*************\ncnt: %d",cnt);
		$display ("mean: %d", mean);
		end
		$stop;/*
		// Test Code
		numErrors = 0;
		repeat (5) begin
			x_i_porty = testcase;
			#(Cycle);
		$display ("*************");
		$display ("y_o: %b\nsrdyo_o: %b", y_o, srdyo_o);
			testcase =	testcase + 1;
		end
		
		$display("numErrors: %d", numErrors);
		$stop;*/
	end
endmodule
