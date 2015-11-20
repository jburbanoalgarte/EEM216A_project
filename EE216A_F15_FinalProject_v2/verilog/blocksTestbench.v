`timescale 1ns / 1ps

module blocksTestbench();

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
	.srdyo_o(srdyo_o)
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
		x_adc = 21'b010001000100010001000;
		srdyi = 1'b1;
		mean = 32'b01000100010001000100010001000100;
		std = 32'b01000100010001000100010001000100;
		
		#(Cycle);
		$display ("*************");
		$display ("z_o: %d\nsrdyo_o: %b", x_centScale, srdyo_o);
		
		GlobalReset = 0;
		cnt = 0;
		repeat(20) begin
			#(Cycle);
			cnt = cnt + 1;
			$display ("*************\n%d cycles transpired", cnt);
			$display ("z_o: %d\nsrdyo_o: %b", x_centScale, srdyo_o);
		end
			#(100*Cycle);
			cnt = cnt + 1;
			$display ("*************\n%d cycles transpired", cnt);
			$display ("z_o: %d\nsrdyo_o: %b", x_centScale, srdyo_o);
		
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
