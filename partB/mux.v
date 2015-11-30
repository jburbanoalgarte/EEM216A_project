////////////////////////////////////////////////////////////////
//
// Module: mux.v
// Author: Jordi Burbano
//         jburbanoalgarte@gmail.com
//
// Description:
//      mux for 11 poly coefficients
//		latency 1 cycle
//
// Parameters:
//      
//
// Inputs [bit width]:
//	clk
//	GlobalReset
//	coeff0 [31:0]
//	coeff1 [31:0]
//	... coeff10[31:0]
//	coeff_select [3:0]
//
// Outputs [bit width]:
//	coeff [31:0]
////////////////////////////////////////////////////////////////

module mux ( 
	clk,
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

////////////////////////////////////////////////////////////////
//  Inputs & Outputs
input clk;
input GlobalReset;

input [31:0] coeff0;
input [31:0] coeff1;
input [31:0] coeff2;
input [31:0] coeff3;
input [31:0] coeff4;
input [31:0] coeff5;
input [31:0] coeff6;
input [31:0] coeff7;
input [31:0] coeff8;
input [31:0] coeff9;
input [31:0] coeff10;

input [3:0] coeff_select;

output reg [31:0] coeff;
	
////////////////////////////////////////////////////////////////
//  reg & wire declarations
reg [31:0] coeff_r;

////////////////////////////////////////////////////////////////
//  Modules


////////////////////////////////////////////////////////////////
//  Combinational Logic

always @( * ) begin
	case (coeff_select)
		4'd0:
		begin
			coeff_r = coeff0;
		end
		4'd1:
		begin
			coeff_r = coeff1;
		end
		4'd2:
		begin
			coeff_r = coeff2;
		end
		4'd3:
		begin
			coeff_r = coeff3;
		end
		4'd4:
		begin
			coeff_r = coeff4;
		end
		4'd5:
		begin
			coeff_r = coeff5;
		end
		4'd6:
		begin
			coeff_r = coeff6;
		end
		4'd7:
		begin
			coeff_r = coeff7;
		end
		4'd8:
		begin
			coeff_r = coeff8;
		end
		4'd9:
		begin
			coeff_r = coeff9;
		end
		4'd10:
		begin
			coeff_r = coeff10;
		end
		default:
		begin
			coeff_r = coeff0;
		end
	endcase
end

////////////////////////////////////////////////////////////////
//  Registers
always @(posedge clk) begin
    if (GlobalReset == 1'b1) begin
		coeff <= coeff0;
    end
	else begin
		coeff <= coeff_r;
	end
end

endmodule
