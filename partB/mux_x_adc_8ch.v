////////////////////////////////////////////////////////////////
//
// Module: mux_x_adc_8ch.v
// Author: Jordi Burbano, Hyunseok Park
//         jburbanoalgarte@gmail.com
//		   hnskpark@gmail.com
//		 
//
// Description:
//      mux for selecting x_adc for x8 interleaving
//		latency 1 cycle
//
// Parameters:
//      
//
// Inputs [bit width]:
//	clk
//	GlobalReset
//	x_adc_0 [31:0]
//	x_adc_1 [31:0]
//  x_adc_2 [31:0]
//  x_adc_3 [31:0]
//  x_adc_4 [31:0]
//  x_adc_5 [31:0]
//  x_adc_6 [31:0]
//  x_adc_7 [31:0]
//	x_adc_select [2:0]
//
// Outputs [bit width]:
//	x_adc_out [31:0]
////////////////////////////////////////////////////////////////

module mux ( 
	clk,
	GlobalReset,
    x_adc_0,
	x_adc_1,
	x_adc_2,
	x_adc_3,
	x_adc_4,
	x_adc_5,
	x_adc_6,
	x_adc_7,
	x_adc_select,
	x_adc
    );

////////////////////////////////////////////////////////////////
//  Inputs & Outputs
input clk;
input GlobalReset;

input [31:0] x_adc_0;
input [31:0] x_adc_1;
input [31:0] x_adc_2;
input [31:0] x_adc_3;
input [31:0] x_adc_4;
input [31:0] x_adc_5;
input [31:0] x_adc_6;
input [31:0] x_adc_7;


input [2:0] x_adc_select;

output reg [31:0] x_adc;
	
////////////////////////////////////////////////////////////////
//  reg & wire declarations
reg [31:0] x_adc_r;

////////////////////////////////////////////////////////////////
//  Modules


////////////////////////////////////////////////////////////////
//  Combinational Logic

always @( * ) begin
	case (x_adc_select)
		3'd0:
		begin
			x_adc_r = x_adc_0;
		end
		3'd1:
		begin
			x_adc_r = x_adc_1;
		end
		
		3'd2:
		begin
			x_adc_r = x_adc_2;
		end
		
		3'd3:
		begin
			x_adc_r = x_adc_3;
		end
		
		3'd4:
		begin
			x_adc_r = x_adc_4;
		end
		
		3'd5:
		begin
			x_adc_r = x_adc_5;
		end
		
		3'd6:
		begin
			x_adc_r = x_adc_6;
		end
		
		3'd7:
		begin
			x_adc_r = x_adc_7;
		end
		
		default:
		begin
			x_adc_r = x_adc_0;
		end
	endcase
end

////////////////////////////////////////////////////////////////
//  Registers
always @(posedge clk) begin
    if (GlobalReset == 1'b1) begin
		x_adc <= x_adc_0;
    end
	else begin
		x_adc <= x_adc_r;
	end
end

endmodule
