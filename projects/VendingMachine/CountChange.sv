/* 
Counter Module to count change input 

*/

module CountChange #( 
	parameter MAX_PRICE = 30, 
	parameter N = 7 // Allow at least $1 input 
)(
	input logic clock, 	
	input logic reset, 
	input logic enable,  


	output logic [N-1:0] count, 
	
); 

	always_ff @(posedge clock) begin 
		
	end 



endmodule