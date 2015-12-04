////////////////////////////////////////////////////////////////
//
// Module: enable_reg.v
// Author: Jordi Burbano
//         jburbanoalgarte@gmail.com
//
// Description:
//      enable-controlled register
//		latency 1 cycle
//
// Parameters:
//      
//
// Inputs [bit width]:
//	clk
//	GlobalReset

//	enable
//	in	[20:0]
//
// Outputs [bit width]:
//	out [20:0]
////////////////////////////////////////////////////////////////

module enable_reg ( 
	clk,
	GlobalReset,
	enable,
	in,
	out
    );

////////////////////////////////////////////////////////////////
//  Inputs & Outputs
input clk;
input GlobalReset;
input enable;

input [20:0] in;

output reg [20:0] out;
	
////////////////////////////////////////////////////////////////
//  reg & wire declarations

////////////////////////////////////////////////////////////////
//  Modules

////////////////////////////////////////////////////////////////
//  Combinational Logic

////////////////////////////////////////////////////////////////
//  Registers
always @(posedge clk) begin
    if (GlobalReset == 1'b1) begin
		out     <= 21'd0;
    end
    else begin
		if (enable == 1'b1) begin
			out <= in;
		end
    end
end

endmodule
