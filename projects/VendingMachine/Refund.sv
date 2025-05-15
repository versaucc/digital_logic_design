/* 
Handles refunds
*/ 

module Refund #(
	parameter PRICE = 30,
	parameter N = 6
	
)(
	input logic reset, 
	input logic refund,
	input logic vend, 
	input logic [N-1:0] count, 

	
	output logic [3:0] nickel_out,
	output logic [3:0] dime_out
); 
	logic [5:0] entered; 
	logic [4:0] nickel_ct; 
	logic [4:0] dime_ct; 
	
	always_ff @(posedge refund or posedge vend or posedge reset) begin 
		if (reset) begin
			entered <= 0; 
			nickel_ct <= 0; 
			dime_ct <= 0; 

		end else if (vend) begin 
			entered <= count - PRICE; 
			
			dime_ct <= entered/10; 
			nickle_ct <= (entered - (dime_ct*10))/5;
			
			if((dime_ct*10)+(nickle_ct*5) == entered) begin 
				nickel_out <= nickle_ct; 
				dime_out <= dime_ct; 
			end
		
		end else if(refund && !vend) begin 
			entered <= count; 
			
			dime_ct <= entered/10; 
			nickel_ct <= (entered - (dime_ct*10))/5; 
			if ((dime_ct*10) + (nickel_ct*5) == entered) begin 
				nickel_out <= nickel_ct; 
				dime_out <= dime_ct; 
			end
		end 
	end
	
endmodule 
			
			
			