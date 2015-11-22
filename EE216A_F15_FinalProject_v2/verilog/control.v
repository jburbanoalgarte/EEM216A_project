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
	srdyo,
	cnt //used only for testbench
    );

////////////////////////////////////////////////////////////////
//  Inputs & Outputs
input	GlobalReset;
input	clk;

input srdyi;

output reg [3:0] coeff_sel;
output reg sum_rst;
output reg sum_en;
output reg srdyo;

output reg cnt;//used only for testbench
	
////////////////////////////////////////////////////////////////
//  reg & wire declarations
reg [7:0] cnt;

wire [3:0] coeff_sel_w;

////////////////////////////////////////////////////////////////
//  Modules

////////////////////////////////////////////////////////////////
//  Combinational Logic
assign coeff_sel_w = coeff_sel;

always @(*) begin
	case(cnt)
	
		8'd18: begin
			coeff_sel = 4'd10;
		end
		
		8'd34: begin
			coeff_sel = 4'd9;
		end
		
		8'd50: begin
			coeff_sel = 4'd8;
		end
		
		8'd66: begin
			coeff_sel = 4'd7;
		end
		
		8'd82: begin
			coeff_sel = 4'd6;
		end
		
		8'd98: begin
			coeff_sel = 4'd5;
		end
		
		8'd114: begin
			coeff_sel = 4'd4;
		end
		
		8'd130: begin
			coeff_sel = 4'd3;
		end
		
		8'd146: begin
			coeff_sel = 4'd2;
		end
		
		8'd162: begin
			coeff_sel = 4'd1;
		end
		
		8'd178: begin
			coeff_sel = 4'd0;
		end
		
		default: begin
			coeff_sel = coeff_sel_w;
		end
	
	endcase
	
	srdyo = ( (cnt == 8'd197) ? 1'b1 : 1'b0 );
	sum_rst = ( (cnt  == 8'd1) ? 1'b1 : 1'b0 );
	sum_en = ( (cnt >= 8'd18) ? : 1'b1 : 1'b0 );
end

////////////////////////////////////////////////////////////////
//  Registers
always @(posedge clk) begin
    if (GlobalReset == 1'b1) begin
		coeff_sel <= 4'd0;
		sum_rst <= 1'b0;
		sum_en <= 1'b0;
		srdyo <= 1'b0;
		
		cnt <= 8'd0; //used only for testbench
    end
    else begin
		if (srdyi == 1'b1) begin
			cnt <= 8'd1; //denotes # of cycles after srdyi asserted
		end
		else begin
			if ( (cnt >= 8'd1) && (cnt <= 8'd197) ) begin //end-to-end requires 197 cycles
				cnt <= cnt + 1;
			end
			else //done, output no longer valid
				cnt <= 8'd0;
			end
		end
    end
end

endmodule
