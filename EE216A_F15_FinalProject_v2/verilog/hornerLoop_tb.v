`timescale 1ns / 1ps

module hornerLoop_tb();

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

	reg [31:0] x_adc_smc;
	reg srdyi_i;
	reg [31:0] coeff;
	reg sum_en;
	reg sum_rst;
	
	wire [20:0] x_lin;
	
	integer cnt, testcase;
	
	//----------------------------------------------------------------
	//		Model
	//----------------------------------------------------------------
	
	hornerLoop UUT( 
    GlobalReset,
	Clock,
	x_adc_smc,
	srdyi_i,
	coeff,
	sum_en,
	sum_rst,
	x_lin
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
		GlobalReset = 1;
		x_adc_smc = 32'b01001001100010001000100010000000;
		srdyi_i = 1;
		coeff = 32'b01001001100010001000100010000000;
		sum_en = 1;
		sum_rst = 0;
		
		#(Cycle);
		$display ("*************");
		$display ("x_lin: %d", x_lin);
		
		#(100*Cycle);
		$display ("*************");
		$display ("x_lin: %d", x_lin);
				
		GlobalReset = 0;
		sum_en = 1;
		sum_rst = 1;
		#(Cycle);
		$display ("*************");
		$display ("x_lin: %d", x_lin);
		
		#(100*Cycle);
		$display ("*************");
		$display ("x_lin: %d", x_lin);
		
		sum_en = 0;
		sum_rst = 0;
		#(Cycle);
		$display ("*************");
		$display ("x_lin: %d", x_lin);
		
		#(100*Cycle);
		$display ("*************");
		$display ("x_lin: %d", x_lin);
		
		sum_en = 1;
		sum_rst = 0;
		cnt = 0;
		repeat(22) begin
			#(Cycle);
			cnt = cnt + 1;
		$display ("*************\ncnt: %d",cnt);
		$display ("x_lin: %d", x_lin);
		end
		#(10*Cycle);
		$display ("x_lin: %d", x_lin);
		
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
