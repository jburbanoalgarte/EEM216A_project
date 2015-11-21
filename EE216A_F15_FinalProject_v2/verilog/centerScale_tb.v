`timescale 1ns / 1ps

module centerScale_tb();

	//----------------------------------------------------------------
	//		Parameters
	//----------------------------------------------------------------
	parameter ResetValue	= 2'b01;
	parameter HalfCycle		= 5;			//Half of the Clock Period is 5 ns
	localparam Cycle		= 2*HalfCycle;	//The length of the entire Clock Period
	
	
	//----------------------------------------------------------------
	//		Signal Declarations
	//----------------------------------------------------------------
	reg				Clock;
	reg				GlobalReset;
	reg	[20:0] x_adc;
	reg srdyi;
	reg [31:0] mean;
	reg [31:0] std;
	wire [31:0] x_centScale;
	wire srdyo_o;
	wire [20:0] x_adc_latched;
	
	integer numErrors, cnt;
	reg [20:0]		testcase;
	
	
	//----------------------------------------------------------------
	//		Model
	//----------------------------------------------------------------
	centerScale UUT( 
    .GlobalReset(GlobalReset),
	.clk(Clock),
	.x_adc(x_adc),
	.srdyi(srdyi),
	.mean(mean),
	.std(std),
	.x_centScale(x_centScale),
	.srdyo_o(srdyo_o),
	.x_adc_latched(x_adc_latched)
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
		mean = 32'd512;
		std = 32'd2;
		
		x_adc = 21'h7F;
		srdyi = 1'b1;
		
		#(Cycle);
		if( (x_adc_latched != 21'd0) ) begin
			$display ("*************");
			$display ("z_o: %d\nsrdyo_o: %b\nx_adc_latched", x_centScale, srdyo_o, x_adc_latched);
		end
		
		GlobalReset = 0;
		cnt=1;
		repeat(18) begin
			#(Cycle);
			$display ("*************\ncnt: %d",cnt);
			$display ("z_o: %d\nsrdyo_o: %b\nx_adc_latched: %h", x_centScale, srdyo_o, x_adc_latched);
			cnt = cnt +1;
		end
		
		x_adc = 21'h09;
		srdyi = 1'b0;
		#(100*Cycle);
		$display ("*************");
		$display ("z_o: %d\nsrdyo_o: %b\nx_adc_latched: %h", x_centScale, srdyo_o, x_adc_latched);
		
		srdyi = 1'b1;
		#(Cycle);
		$display ("*************");
		$display ("z_o: %d\nsrdyo_o: %b\nx_adc_latched: %h", x_centScale, srdyo_o, x_adc_latched);
		
		#(16*Cycle);
		$display ("*************");
		$display ("z_o: %d\nsrdyo_o: %b\nx_adc_latched: %h", x_centScale, srdyo_o, x_adc_latched);
		
		#(Cycle);
		$display ("*************");
		$display ("z_o: %d\nsrdyo_o: %b\nx_adc_latched: %h", x_centScale, srdyo_o, x_adc_latched);
		
		#(100*Cycle);
		$display ("*************");
		$display ("z_o: %d\nsrdyo_o: %b\nx_adc_latched: %h", x_centScale, srdyo_o, x_adc_latched);
		
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
