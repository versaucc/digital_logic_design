/*
 * One bit register (DFF).  On the rising edge of the `clock`
 * signal, the value of `d` is copied to `q` if `clear_n` is
 * high (inactive).  If `clear_n` is low (active), set the value
 * of `q` to 0.
 */
 
 module RegisterNBit #(
	parameter int N = 4
	
 )(
	input logic clock,
	input logic clear_n,
	input logic [N - 1:0] din, 
	output logic [N - 1:0] qout
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
