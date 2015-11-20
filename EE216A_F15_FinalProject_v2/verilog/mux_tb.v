`timescale 1ns / 1ps

module mux_tb();

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

	reg [31:0] coeff0;
    reg [31:0] coeff1;
    reg [31:0] coeff2;
    reg [31:0] coeff3;
    reg [31:0] coeff4;
    reg [31:0] coeff5;
    reg [31:0] coeff6;
    reg [31:0] coeff7;
    reg [31:0] coeff8;
    reg [31:0] coeff9;
    reg [31:0] coeff10;
	reg [3:0] coeff_select;
	
	wire [31:0] coeff;
	
	integer cnt, testcase;
	
	//----------------------------------------------------------------
	//		Model
	//----------------------------------------------------------------
	
	mux UUT( 
	Clock,
	GlobalReset,
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
	coeff_select,
	coeff
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
		coeff0 = 32'd0;
		coeff1 = 32'd1;
		coeff2 = 32'd2;
		coeff3 = 32'd3;
		coeff4 = 32'd4;
		coeff5 = 32'd5;
		coeff6 = 32'd6;
		coeff7 = 32'd7;
		coeff8 = 32'd8;
		coeff9 = 32'd09;
		coeff10 = 32'd10;
		coeff_select = 4'd4;
		
		#(Cycle);
		$display ("*************");
		$display ("coeff: %d", coeff);
		
		GlobalReset = 0;
		cnt = 0;
		repeat(12) begin
			#(Cycle);
			cnt = cnt + 1;
			coeff_select = (cnt-1);
		$display ("*************\ncnt: %d",cnt);
		$display ("coeff: %d", coeff);
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
