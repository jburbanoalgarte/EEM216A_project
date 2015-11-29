////////////////////////////////////////////////////////////////
//
// Module: comparator.v
// Author: Jordi Burbano, Hyunseok Park
//         jburbanoalgarte@gmail.com
//		   hnskpark@gmail.com
//		 
//
// Description:
//      mux for selecting x_adc for x16 interleaving
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
//  x_adc_8 [31:0]
//  x_adc_9 [31:0]
//  x_adc_10 [31:0]
//  x_adc_11 [31:0]
//  x_adc_12 [31:0]
//  x_adc_13 [31:0]
//  x_adc_14 [31:0]
//  x_adc_15 [31:0]
//  ...
//  x_adc_31 [31:0]
//	x_adc_select [4:0]
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
	x_adc_8,
	x_adc_9,
	x_adc_10,
	x_adc_11,
	x_adc_12,
	x_adc_13,
	x_adc_14,
	x_adc_15,
	x_adc_16,
	x_adc_17,
	x_adc_18,
	x_adc_19,
	x_adc_20,
	x_adc_21,
	x_adc_22,
	x_adc_23,
	x_adc_24,
	x_adc_25,
	x_adc_26,
	x_adc_27,
	x_adc_28,
	x_adc_29,
	x_adc_30,
	x_adc_31,

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
input [31:0] x_adc_8;
input [31:0] x_adc_9;
input [31:0] x_adc_10;
input [31:0] x_adc_11;
input [31:0] x_adc_12;
input [31:0] x_adc_13;
input [31:0] x_adc_14;
input [31:0] x_adc_15;
input [31:0] x_adc_16;
input [31:0] x_adc_17;
input [31:0] x_adc_18;
input [31:0] x_adc_19;
input [31:0] x_adc_20;
input [31:0] x_adc_21;
input [31:0] x_adc_22;
input [31:0] x_adc_23;
input [31:0] x_adc_24;
input [31:0] x_adc_25;
input [31:0] x_adc_26;
input [31:0] x_adc_27;
input [31:0] x_adc_28;
input [31:0] x_adc_29;
input [31:0] x_adc_30;
input [31:0] x_adc_31;


input [4:0] x_adc_select;

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
		5'd0:
		begin
			x_adc_r = x_adc_0;
		end
		5'd1:
		begin
			x_adc_r = x_adc_1;
		end
		
		5'd2:
		begin
			x_adc_r = x_adc_2;
		end
		
		5'd3:
		begin
			x_adc_r = x_adc_3;
		end
		
		5'd4:
		begin
			x_adc_r = x_adc_4;
		end
		
		5'd5:
		begin
			x_adc_r = x_adc_5;
		end
		
		5'd6:
		begin
			x_adc_r = x_adc_6;
		end
		
		5'd7:
		begin
			x_adc_r = x_adc_7;
		end
		
		5'd8:
		begin
			x_adc_r = x_adc_8;
		end
		
		5'd9:
		begin
			x_adc_r = x_adc_9;
		end

		5'd10:
		begin
			x_adc_r = x_adc_10;
		end

		5'd11:
		begin
			x_adc_r = x_adc_11;
		end

		5'd12:
		begin
			x_adc_r = x_adc_12;
		end

		5'd13:
		begin
			x_adc_r = x_adc_13;
		end

		5'd14:
		begin
			x_adc_r = x_adc_14;
		end

		5'd15:
		begin
			x_adc_r = x_adc_15;
		end
		
		5'd16:
		begin
			x_adc_r = x_adc_16;
		end
		5'd17:
		begin
			x_adc_r = x_adc_17;
		end
		
		5'd18:
		begin
			x_adc_r = x_adc_18;
		end
		
		5'd19:
		begin
			x_adc_r = x_adc_19;
		end
		
		5'd20:
		begin
			x_adc_r = x_adc_20;
		end
		
		5'd21:
		begin
			x_adc_r = x_adc_21;
		end
		
		5'd22:
		begin
			x_adc_r = x_adc_22;
		end
		
		5'd23:
		begin
			x_adc_r = x_adc_23;
		end
		
		5'd24:
		begin
			x_adc_r = x_adc_24;
		end
		
		5'd25:
		begin
			x_adc_r = x_adc_25;
		end

		5'd26:
		begin
			x_adc_r = x_adc_26;
		end

		5'd27:
		begin
			x_adc_r = x_adc_27;
		end

		5'd28:
		begin
			x_adc_r = x_adc_28;
		end

		5'd29:
		begin
			x_adc_r = x_adc_29;
		end

		5'd30:
		begin
			x_adc_r = x_adc_30;
		end

		5'd31:
		begin
			x_adc_r = x_adc_31;
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
