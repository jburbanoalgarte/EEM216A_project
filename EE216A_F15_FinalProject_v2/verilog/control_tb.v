`timescale 1ns / 1ps

module control_tb();

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

	reg srdyi;
	
	wire [3:0] coeff_sel;
	wire sum_rst;
	wire sum_en;
	wire srdyo;
	
	wire [7:0] count; //used only for testing
	
	integer cnt, testcase;
	
	//----------------------------------------------------------------
	//		Model
	//----------------------------------------------------------------
	
	control UUT( 
    GlobalReset,
	Clock,
	srdyi,
	coeff_sel,
	sum_rst,
	sum_en,
	srdyo/*,
	count*/ //used only for testbench
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
		srdyi = 1;
		
		#(Cycle);
		$display ("*************");
		$display ("coeff_sel: %d, sum_rst: %b, sum_en: %b, srdyo: %b, count: %d", coeff_sel, sum_rst, sum_en, srdyo, count);
		
		#(100*Cycle);
		$display ("*************");
		$display ("coeff_sel: %d, sum_rst: %b, sum_en: %b, srdyo: %b, count: %d", coeff_sel, sum_rst, sum_en, srdyo, count);
				
		GlobalReset = 0;
		srdyi = 0;
		
		#(Cycle);
		$display ("*************");
		$display ("coeff_sel: %d, sum_rst: %b, sum_en: %b, srdyo: %b, count: %d", coeff_sel, sum_rst, sum_en, srdyo, count);
		
		#(100*Cycle);
		$display ("*************");
		$display ("coeff_sel: %d, sum_rst: %b, sum_en: %b, srdyo: %b, count: %d", coeff_sel, sum_rst, sum_en, srdyo, count);

		//$stop;
		
		srdyi = 1;
		cnt = 0;
		repeat(200) begin
			#(Cycle); srdyi = 0;
			cnt = cnt + 1;
			$display ("*************\ncnt: %d", cnt);
			$display ("coeff_sel: %d, sum_rst: %b, sum_en: %b, srdyo: %b, count: %d", coeff_sel, sum_rst, sum_en, srdyo, count);

		end
		
		$stop;
	end
endmodule
