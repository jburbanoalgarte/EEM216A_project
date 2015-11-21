////////////////////////////////////////////////////////////////
//
// Module: hornerLoop.v
// Author: Jordi Burbano
//         jburbanoalgarte@gmail.com
//
// Description:
//      Taking 32-bit SMC x_adc and a coefficient as inputs,
//		as well as sum register control signals, implements
//		Horner loop to compute 10th order polynomial
//		latency 3+1+15=19? cycles
//
// Parameters:
//      
//
// Inputs [bit width]:
//	GlobalReset [0]
//	clk [0]

//	x_adc_smc [31:0]: adc sample to be NLC'd
//	srdyi_i [0]: input to first mult, but is irrelevant
//	coeff [31:0]: some coefficient

//	sum_en [0]: makes output sum register transparent
//	sum_rst [1]: when asserted, sum register outputs 32'b0
//	
// Outputs [bit width]:
//	x_lin [20:0]: NLC'd output for the channel
////////////////////////////////////////////////////////////////

module hornerLoop ( 
    GlobalReset,
	clk,
	x_adc_smc,
	srdyi_i,
	coeff,
	sum_en,
	sum_rst,
	x_lin
    );

////////////////////////////////////////////////////////////////
//  Inputs & Outputs
input	GlobalReset;
input	clk;
input [31:0] x_adc_smc;
input srdyi_i;
input [31:0] coeff;
input sum_en;
input sum_rst;
output [20:0] x_lin;
	
////////////////////////////////////////////////////////////////
//  reg & wire declarations
// theMult
wire [31:0] mult_o;
wire mult_srdyo_o;

// theAdder
wire [31:0] add_o;
wire add_srdyo_o;

// theReg
reg [31:0] theReg;
wire [31:0] theReg_w;

// smc2ieee
wire smc2ieee_srdyo_o;

////////////////////////////////////////////////////////////////
//  Modules

smc_float_multiplier theMult(
  .clk( clk),
  .GlobalReset( GlobalReset),
  .x_i_porty( x_adc_smc),
  .y_i_porty( theReg),
  .z_o_portx( mult_o),
  .srdyo_o( mult_srdyo_o),
  .srdyi_i( srdyi_i)
);

smc_float_adder theAdder(
  .clk( clk ),
  .GlobalReset( GlobalReset),
  .x_i_porty( mult_o),
  .y_i_porty( coeff ),
  .z_o_portx( add_o),
  .srdyo_o( add_srdyo_o),
  .srdyi_i( mult_srdyo_o)
);

smc_float_to_fp smc2ieee(
  .clk( clk ),
  .GlobalReset( GlobalReset ),
  .x_i_porty( theReg_w ),
  .y_o( x_lin ),
  .srdyo_o( smc2ieee_srdyo_o ),
  .srdyi_i( add_srdyo_o )
);

////////////////////////////////////////////////////////////////
//  Combinational Logic
assign theReg_w = theReg;

////////////////////////////////////////////////////////////////
//  Registers
always @(posedge clk) begin
    if (GlobalReset == 1'b1) begin
		theReg		<= 32'd0;
    end
    else begin
		if (sum_rst == 1'b1) begin
			theReg		<= 32'd0;
		end
		else begin
			if (sum_en == 1'b1) begin
				theReg	<= add_o;
			end
			else begin
				theReg	<= theReg_w;
			end
		end
    end
end

endmodule
