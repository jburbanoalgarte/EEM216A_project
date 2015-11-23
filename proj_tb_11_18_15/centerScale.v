////////////////////////////////////////////////////////////////
//


/******************************************
THIS BLOCK IS DEPRECATED
USE centerScale2.v INSTEAD
**********************************************/


// Module: centerScale.v
// Author: Jordi Burbano
//         jburbanoalgarte@gmail.com
//
// Description:
//      Incoming x_adc[20:0] is stored through register, converted to SMC, scaled, centered
//		latency 18 cycles
//
// Parameters:
//      
//
// Inputs [bit width]:
//	GlobalReset [0]
//	clk [0]

//	x_adc [20:0]: incoming IEEE floating point adc sample
//	srdyi [0]
//	
// Outputs [bit width]:
//	x_centScale [31:0]
//	srdyo_o [0]
//	x_adc_latched [20:0]
////////////////////////////////////////////////////////////////

module centerScale ( 
    GlobalReset,
	clk,
	x_adc,
	srdyi,
	mean,
	std,
	x_centScale,
	srdyo_o,
	x_adc_latched
    );

////////////////////////////////////////////////////////////////
//  Inputs & Outputs
input	GlobalReset;
input	clk;
input [20:0] x_adc;
input srdyi;
input [31:0] mean;
input [31:0] std;
output	[31:0] x_centScale;
output	srdyo_o;
output reg [20:0] x_adc_latched;
	
////////////////////////////////////////////////////////////////
//  reg & wire declarations

//reg
wire [20:0]	theReg_x_adc;

//ieee to smc
wire [31:0] ieee2smc_x_smc;
wire ieee2smc_srdyo_o;

// add
wire [31:0] add_o;
wire add_srdyo_o;

////////////////////////////////////////////////////////////////
//  Modules
fp_to_smc_float ieee2smc(
  .clk( clk ),
  .GlobalReset( GlobalReset),
  .y_o_portx( ieee2smc_x_smc ),
  .x_i( theReg_x_adc ),
  .srdyo_o( ieee2smc_srdyo_o ),
  .srdyi_i( srdyi )
);

smc_float_adder theAdder(
  .clk( clk ),
  .GlobalReset( GlobalReset),
  .x_i_porty( ieee2smc_x_smc),
  .y_i_porty( mean ),
  .z_o_portx( add_o),
  .srdyo_o( add_srdyo_o),
  .srdyi_i( ieee2smc_srdyo_o)
);

smc_float_multiplier theMult(
  .clk( clk),
  .GlobalReset( GlobalReset),
  .x_i_porty( add_o),
  .y_i_porty( std),
  .z_o_portx( x_centScale),
  .srdyo_o( srdyo_o),
  .srdyi_i( add_srdyo_o)
);

////////////////////////////////////////////////////////////////
//  Combinational Logic

assign theReg_x_adc = x_adc_latched;

////////////////////////////////////////////////////////////////
//  Registers
always @(posedge clk) begin
    if (GlobalReset == 1'b1) begin
		x_adc_latched		<= 21'd0;
    end
    else begin
		if (srdyi == 1'b1) begin
			x_adc_latched		<= x_adc;
		end
    end
end

endmodule
