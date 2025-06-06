/*
 * Disclaimer: This file is entirely property of OSU EECS and the Digital Logic Design Labratory.
 * One bit register (DFF).  On the rising edge of the `clock`
 * signal, the value of `d` is copied to `q` if `clear_n` is
 * high (inactive).  If `clear_n` is low (active), set the value
 * of `q` to 0.
 */
 
 module RegisterOneBit(
	input logic clock,
	input logic clear_n, 
	input logic d, 
	input logic q
	);
	
	always_ff @(posedge clock) begin
		if (clear_n == 1'b0) begin
			q <= 1'b0;
		end else begin 
			q <= d; 
		end
	end
endmodule
		