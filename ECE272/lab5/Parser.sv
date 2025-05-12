// Parser

module Parser #(
	parameter N = 6
)(
	input logic [N-1:0] digits,
	input logic clock,
	output logic [3:0] ones,
	output logic [3:0] tens 
);
	
	always_ff @(posedge clock) begin 
	
		ones <= digits % 10; 
		tens <= digits / 10; 
	end



endmodule