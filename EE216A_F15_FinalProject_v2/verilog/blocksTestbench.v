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
	
	wire [31:0] y_o_portx;
	reg [20:0] x_i;
	wire srdyo_o;
	reg srdyi_i;
	
	integer numErrors, cnt;
	reg [20:0]		testcase;
	
	
	//----------------------------------------------------------------
	//		Model
	//----------------------------------------------------------------
	fp_to_smc_float UUT(
	  Clock,
	  GlobalReset,
	  y_o_portx,
	  x_i,
	  srdyo_o,
	  srdyi_i
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
		x_i = 21'b010001000100010001000;
		srdyi_i = 1;
		
		#(Cycle);
		$display ("*************");
		$display ("z_o: %b\nsrdyo_o: %b", y_o_portx, srdyo_o);
		
		GlobalReset = 0;
		cnt = 0;
		repeat(2) begin
			#(Cycle);
			cnt = cnt + 1;
			$display ("*************\n%d cycles transpired", cnt);
			$display ("z_o: %b\nsrdyo_o: %b", y_o_portx, srdyo_o);
		end
		#(100*Cycle);
		cnt = cnt + 1;
		$display ("*************\n%d cycles transpired", cnt);
		$display ("z_o: %b\nsrdyo_o: %b", y_o_portx, srdyo_o);
		
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
