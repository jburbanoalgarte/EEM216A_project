module delay_Z1(
	clk,
	GlobalReset,
	in,
	out
	);

input clk;
input GlobalReset;
input [31:0] in;
output reg [31:0] out;

reg [31:0] out_r;

always @( * ) begin
	out_r = in;
end

always @(posedge clk) begin
    if (GlobalReset == 1'b1) begin
		out <= 32'd0;
    end
	else begin
		out <= out_r;
	end
end

endmodule
