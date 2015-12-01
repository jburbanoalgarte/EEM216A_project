module mux_coeff_11_1 (
	clk,
	GlobalReset,
	coeff_0,
	coeff_1,
	coeff_2,
	coeff_3,
	coeff_4,
	coeff_5,
	coeff_6,
	coeff_7,
	coeff_8,
	coeff_9,
	coeff_10,
	coeff_sel,
	coeff_out
	);

input clk;
input GlobalReset;

input [31:0] coeff_0;
input [31:0] coeff_1;
input [31:0] coeff_2;
input [31:0] coeff_3;
input [31:0] coeff_4;
input [31:0] coeff_5;
input [31:0] coeff_6;
input [31:0] coeff_7;
input [31:0] coeff_8;
input [31:0] coeff_9;
input [31:0] coeff_10;
input coeff_sel;

output reg [31:0] coeff_out;


reg [31:0] coeff_out_r;

always @( * ) begin
	case (coeff_sel)
		1'd0:
		begin
			coeff_out_r = coeff_0;
		end
		1'd1:
		begin
			coeff_out_r = coeff_1;
		end
		1'd2:
		begin
			coeff_out_r = coeff_2;
		end
		1'd3:
		begin
			coeff_out_r = coeff_3;
		end
		1'd4:
		begin
			coeff_out_r = coeff_4;
		end
		1'd5:
		begin
			coeff_out_r = coeff_5;
		end
		1'd6:
		begin
			coeff_out_r = coeff_6;
		end
		1'd7:
		begin
			coeff_out_r = coeff_7;
		end
		1'd8:
		begin
			coeff_out_r = coeff_8;
		end
		1'd9:
		begin
			coeff_out_r = coeff_9;
		end
		1'd10:
		begin
			coeff_out_r = coeff_10;
		end
		default:
		begin
			coeff_out_r = coeff_0;
		end
	endcase
end

always @(posedge clk) begin
	if (GlobalReset == 1'b1) begin
		coeff_out <= coeff_0;
	end
	else begin
		coeff_out <= coeff_out_r;
	end
end

endmodule
