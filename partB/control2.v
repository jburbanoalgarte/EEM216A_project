////////////////////////////////////////////////////////////////
//
// Module: control2.v
// Author: Jordi Burbano
//         jburbanoalgarte@gmail.com
//
// Description:
//	Only uses srdyi as input; this, with
//	timing, determines all control2 outputs
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
//	channel_select [4:0]
//	enableRegControl [32:0]
//	srdyo [0]
//	cnt [8:0], used only for testbench
////////////////////////////////////////////////////////////////

module control2 ( 
    GlobalReset,
	clk,
	srdyi,
	coeff_sel,
	sum_rst,
	sum_en,
	channel_select,
	enableRegControl,
	srdyo/*,
	cnt*/ //used only for testbench
    );

parameter hornerLoopSingleIterationDelay = 9'd16;

parameter select_ch0_1 = 9'd1;
parameter select_ch0_11 = select_ch0_1 + 10*hornerLoopSingleIterationDelay;
parameter select_ch15_11 = select_ch0_11 + 9'd15;
parameter select_ch16_1 = select_ch15_11 + 9'd17;

parameter mux_a10 = 9'd3; //delayToCoeffMux
parameter mux_a9 = mux_a10 + hornerLoopSingleIterationDelay;
parameter mux_a8 = mux_a10 + 2*hornerLoopSingleIterationDelay;
parameter mux_a7 = mux_a10 + 3*hornerLoopSingleIterationDelay;
parameter mux_a6 = mux_a10 + 4*hornerLoopSingleIterationDelay;
parameter mux_a5 = mux_a10 + 5*hornerLoopSingleIterationDelay;
parameter mux_a4 = mux_a10 + 6*hornerLoopSingleIterationDelay;
parameter mux_a3 = mux_a10 + 7*hornerLoopSingleIterationDelay;
parameter mux_a2 = mux_a10 + 8*hornerLoopSingleIterationDelay;
parameter mux_a1 = mux_a10 + 9*hornerLoopSingleIterationDelay;
parameter mux_a0 = mux_a10 + 10*hornerLoopSingleIterationDelay;

parameter mux_b10 = mux_a0 + hornerLoopSingleIterationDelay + 9'd16;
parameter mux_b9 = mux_b10 + hornerLoopSingleIterationDelay;
parameter mux_b8 = mux_b10 + 2*hornerLoopSingleIterationDelay;
parameter mux_b7 = mux_b10 + 3*hornerLoopSingleIterationDelay;
parameter mux_b6 = mux_b10 + 4*hornerLoopSingleIterationDelay;
parameter mux_b5 = mux_b10 + 5*hornerLoopSingleIterationDelay;
parameter mux_b4 = mux_b10 + 6*hornerLoopSingleIterationDelay;
parameter mux_b3 = mux_b10 + 7*hornerLoopSingleIterationDelay;
parameter mux_b2 = mux_b10 + 8*hornerLoopSingleIterationDelay;
parameter mux_b1 = mux_b10 + 9*hornerLoopSingleIterationDelay;
parameter mux_b0 = mux_b10 + 10*hornerLoopSingleIterationDelay;

parameter enableReg0 = select_ch0_11 + 9'd37;
parameter enableReg1 = enableReg0 + 9'd1;
parameter enableReg2 = enableReg1 + 9'd1;
parameter enableReg3 = enableReg2 + 9'd1;
parameter enableReg4 = enableReg3 + 9'd1;
parameter enableReg5 = enableReg4 + 9'd1;
parameter enableReg6 = enableReg5 + 9'd1;
parameter enableReg7 = enableReg6 + 9'd1;
parameter enableReg8 = enableReg7 + 9'd1;
parameter enableReg9 = enableReg8 + 9'd1;
parameter enableReg10 = enableReg9 + 9'd1;
parameter enableReg11 = enableReg10 + 9'd1;
parameter enableReg12 = enableReg11 + 9'd1;
parameter enableReg13 = enableReg12 + 9'd1;
parameter enableReg14 = enableReg13 + 9'd1;
parameter enableReg15 = enableReg14 + 9'd1;

parameter enableReg16 = select_ch16_1 + 10*hornerLoopSingleIterationDelay + 9'd37;
parameter enableReg17 = enableReg16 + 9'd1;
parameter enableReg18 = enableReg17 + 9'd1;
parameter enableReg19 = enableReg18 + 9'd1;
parameter enableReg20 = enableReg19 + 9'd1;
parameter enableReg21 = enableReg20 + 9'd1;
parameter enableReg22 = enableReg21 + 9'd1;
parameter enableReg23 = enableReg22 + 9'd1;
parameter enableReg24 = enableReg23 + 9'd1;
parameter enableReg25 = enableReg24 + 9'd1;
parameter enableReg26 = enableReg25 + 9'd1;
parameter enableReg27 = enableReg26 + 9'd1;
parameter enableReg28 = enableReg27 + 9'd1;
parameter enableReg29 = enableReg28 + 9'd1;
parameter enableReg30 = enableReg29 + 9'd1;
parameter enableReg31 = enableReg30 + 9'd1;

parameter assertSrdyo = enableReg31 + 9'd1;

parameter sumEn1 = select_ch0_1 + 9'd33;
parameter sumEn2 = enableReg11;
parameter sumEn3 = select_ch16_1 + 9'd33;
	
////////////////////////////////////////////////////////////////
//  Inputs & Outputs
input	GlobalReset;
input	clk;

input srdyi;

output reg [3:0] coeff_sel;
output reg sum_rst;
output reg sum_en;
output reg [4:0] channel_select;
output reg [31:0] enableRegControl;
output reg srdyo;

//output reg [8:0] cnt;//used only for testbench

////////////////////////////////////////////////////////////////
//  reg & wire declarations
reg [8:0] cnt;

reg [3:0] chSelState;

wire [3:0] coeff_sel_w;

////////////////////////////////////////////////////////////////
//  Modules

////////////////////////////////////////////////////////////////
//  Combinational Logic
assign coeff_sel_w = coeff_sel;

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
	
		(mux_b10): begin
			coeff_sel = 4'd10;
		end
		
		(mux_b9): begin
			coeff_sel = 4'd9;
		end
		
		(mux_b8): begin
			coeff_sel = 4'd8;
		end
		
		(mux_b7): begin
			coeff_sel = 4'd7;
		end
		
		(mux_b6): begin
			coeff_sel = 4'd6;
		end
		
		(mux_b5): begin
			coeff_sel = 4'd5;
		end
		
		(mux_b4): begin
			coeff_sel = 4'd4;
		end
		
		(mux_b3): begin
			coeff_sel = 4'd3;
		end
		
		(mux_b2): begin
			coeff_sel = 4'd2;
		end
		
		(mux_b1): begin
			coeff_sel = 4'd1;
		end
		
		(mux_b0): begin
			coeff_sel = 4'd0;
		end
		
		(enableReg0): begin
			enableRegControl = 32'd1;
		end

		(enableReg1): begin
			enableRegControl = 32'd2;
		end

		(enableReg2): begin
			enableRegControl = 32'd4;
		end

		(enableReg3): begin
			enableRegControl = 32'd8;
		end

		(enableReg4): begin
			enableRegControl = 32'd16;
		end

		(enableReg5): begin
			enableRegControl = 32'd32;
		end

		(enableReg6): begin
			enableRegControl = 32'd64;
		end

		(enableReg7): begin
			enableRegControl = 32'd128;
		end

		(enableReg8): begin
			enableRegControl = 32'd256;
		end

		(enableReg9): begin
			enableRegControl = 32'd512;
		end

		(enableReg10): begin
			enableRegControl = 32'd1024;
		end

		(enableReg11): begin
			enableRegControl = 32'd2048;
		end

		(enableReg12): begin
			enableRegControl = 32'd4096;
		end

		(enableReg13): begin
			enableRegControl = 32'd8192;
		end

		(enableReg14): begin
			enableRegControl = 32'd16384;
		end

		(enableReg15): begin
			enableRegControl = 32'd32768;
		end

		(enableReg16): begin
			enableRegControl = 32'd65536;
		end

		(enableReg17): begin
			enableRegControl = 32'd131072;
		end

		(enableReg18): begin
			enableRegControl = 32'd262144;
		end

		(enableReg19): begin
			enableRegControl = 32'd524288;
		end

		(enableReg20): begin
			enableRegControl = 32'd1048576;
		end

		(enableReg21): begin
			enableRegControl = 32'd2097152;
		end

		(enableReg22): begin
			enableRegControl = 32'd4194304;
		end

		(enableReg23): begin
			enableRegControl = 32'd8388608;
		end

		(enableReg24): begin
			enableRegControl = 32'd16777216;
		end

		(enableReg25): begin
			enableRegControl = 32'd33554432;
		end

		(enableReg26): begin
			enableRegControl = 32'd67108864;
		end

		(enableReg27): begin
			enableRegControl = 32'd134217728;
		end

		(enableReg28): begin
			enableRegControl = 32'd268435456;
		end

		(enableReg29): begin
			enableRegControl = 32'd536870912;
		end

		(enableReg30): begin
			enableRegControl = 32'd1073741824;
		end

		(enableReg31): begin
			enableRegControl = 32'hFFFFFFFF;
		end
		
		default: begin
			coeff_sel = coeff_sel_w;
			enableRegControl = 32'd0;
		end
	
	endcase
	
	channel_select[3:0] = chSelState;
	channel_select[4] = ( cnt >= select_ch16_1) ? 1'b1 : 1'b0;
	
	srdyo = ( (cnt == (assertSrdyo)) ? 1'b1 : 1'b0 );
	sum_rst = ( ( (cnt  == 9'd1) || (cnt == enableReg13) ) ? 1'b1 : 1'b0 );
	sum_en = ( ( ( (cnt >= sumEn1) && (cnt <= sumEn2) ) || ( cnt >= sumEn3 ) ) ? 1'b1 : 1'b0 );
end

////////////////////////////////////////////////////////////////
//  Registers
always @(posedge clk) begin
    if (GlobalReset == 1'b1) begin		
		cnt <= 9'd0;
		chSelState <= 4'd0;
    end
    else begin
		if (srdyi == 1'b1) begin
			cnt <= 9'd1; //denotes # of cycles after srdyi asserted
			chSelState <= 4'd0;
		end
		else begin
			if ( cnt == ( select_ch16_1 - 1 ) ) begin
				cnt <= cnt + 1;
				chSelState <= 4'd0;
			end
			else if ( (cnt >= 9'd1) && (cnt <= (assertSrdyo)) ) begin //end-to-end requires 197 cycles
				cnt <= cnt + 1;
				chSelState <= chSelState + 1;
			end
			else begin //done, output no longer valid
				cnt <= 9'd0;
				chSelState <= 4'd0;
			end
		end
    end
end

endmodule
