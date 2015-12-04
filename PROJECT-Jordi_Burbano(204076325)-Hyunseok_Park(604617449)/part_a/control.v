////////////////////////////////////////////////////////////////
//
// Module: control.v
// Author: Jordi Burbano
//         jburbanoalgarte@gmail.com
//
// Description:
//	Only uses srdyi as input; this, with
//	timing, determines all control outputs
//	latency 1?

//
// Parameters:
//      
//
// Inputs [bit width]:
//	GlobalReset [0]
//	clk [0]

//	srdyi [0]
//	
// Outputs [bit width]:
//	coeff_sel [3:0]
//	sum_rst [0]
//	sum_en [0]
//	srdyo [0]
//	cnt [7:0], used only for testbench
////////////////////////////////////////////////////////////////

module control ( 
    GlobalReset,
	clk,
	srdyi,
	coeff_sel,
	sum_rst,
	sum_en,
	srdyo/*,
	cnt*/ //used only for testbench
    );

parameter centerScaleDelay = 8'd18;
parameter hornerLoopSingleIterationDelay = 8'd16;
parameter mux_a10 = centerScaleDelay;
parameter mux_a9 = centerScaleDelay + hornerLoopSingleIterationDelay;
parameter mux_a8 = centerScaleDelay + 2*hornerLoopSingleIterationDelay;
parameter mux_a7 = centerScaleDelay + 3*hornerLoopSingleIterationDelay;
parameter mux_a6 = centerScaleDelay + 4*hornerLoopSingleIterationDelay;
parameter mux_a5 = centerScaleDelay + 5*hornerLoopSingleIterationDelay;
parameter mux_a4 = centerScaleDelay + 6*hornerLoopSingleIterationDelay;
parameter mux_a3 = centerScaleDelay + 7*hornerLoopSingleIterationDelay;
parameter mux_a2 = centerScaleDelay + 8*hornerLoopSingleIterationDelay;
parameter mux_a1 = centerScaleDelay + 9*hornerLoopSingleIterationDelay;
parameter mux_a0 = centerScaleDelay + 10*hornerLoopSingleIterationDelay;
parameter hornerLoopEndToEndDelay = 8'd19;
parameter assertSrdyo = centerScaleDelay + 10*hornerLoopSingleIterationDelay + hornerLoopEndToEndDelay;
	
////////////////////////////////////////////////////////////////
//  Inputs & Outputs
input	GlobalReset;
input	clk;

input srdyi;

output reg [3:0] coeff_sel;
output reg sum_rst;
output reg sum_en;
output reg srdyo;

//output reg [7:0] cnt;//used only for testbench
	
////////////////////////////////////////////////////////////////
//  reg & wire declarations
reg [7:0] cnt;

reg [3:0] coeff_sel_reg;

////////////////////////////////////////////////////////////////
//  Modules

////////////////////////////////////////////////////////////////
//  Combinational Logic

always @(*) begin
	case(cnt)
	
		(mux_a10): begin
			coeff_sel = 4'd10;
		end
		
		(mux_a9): begin
			coeff_sel = 4'd9;
		end
		
		(mux_a8): begin
			coeff_sel = 4'd8;
		end
		
		(mux_a7): begin
			coeff_sel = 4'd7;
		end
		
		(mux_a6): begin
			coeff_sel = 4'd6;
		end
		
		(mux_a5): begin
			coeff_sel = 4'd5;
		end
		
		(mux_a4): begin
			coeff_sel = 4'd4;
		end
		
		(mux_a3): begin
			coeff_sel = 4'd3;
		end
		
		(mux_a2): begin
			coeff_sel = 4'd2;
		end
		
		(mux_a1): begin
			coeff_sel = 4'd1;
		end
		
		(mux_a0): begin
			coeff_sel = 4'd0;
		end
		
		default: begin
			coeff_sel = coeff_sel_reg;
		end
	
	endcase
	
	srdyo = ( (cnt == (assertSrdyo)) ? 1'b1 : 1'b0 );
	sum_rst = ( (cnt  == 8'd1) ? 1'b1 : 1'b0 );
	sum_en = ( (cnt >= (centerScaleDelay)) ? 1'b1 : 1'b0 );
end

////////////////////////////////////////////////////////////////
//  Registers
always @(posedge clk) begin
    if (GlobalReset == 1'b1) begin
		/*
		coeff_sel <= 4'd10;
		sum_rst <= 1'b0;
		sum_en <= 1'b0;
		srdyo <= 1'b0;
		*/
		coeff_sel_reg <= 4'd0;
		cnt <= 8'd0; //used only for testbench
    end
    else begin
		coeff_sel_reg <= coeff_sel;
		if (srdyi == 1'b1) begin
			cnt <= 8'd1; //denotes # of cycles after srdyi asserted
		end
		else begin
			if ( (cnt >= 8'd1) && (cnt <= (assertSrdyo)) ) begin //end-to-end requires 197 cycles
				cnt <= cnt + 1;
			end
			else begin //done, output no longer valid
				cnt <= 8'd0;
			end
		end
    end
end

endmodule
