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
	input logic din, 
	output logic qout
	);
	
	always_ff @(posedge clock) begin
	//If clear_n is 0, set bit to zero. 
		if (!clear_n) begin
			qout <= 0;
		end else begin 
			qout <= din; 
		end
	end
endmodule
