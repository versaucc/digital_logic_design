/*
Vending Machine Top 
*/

// VENDING MACHINE TOP LEVEL
module VendingMachineTop #(
	parameter PRICE = 30,
	parameter N = 6
)(
	input logic clk, 
	input logic reset,
	input logic nickel, // 5c 
	input logic dime, // 10c 
	input logic refund, 
	
	output logic vend,
	output logic nickel_out,
	output logic dime_out
	
	);	
	
	logic [N-1:0] entered;  
	logic [3:0] nickel_ct; 
	logic [3:0] dime_ct; 
	
	logic [3:0] return_nickel; 
	logic [3:0] return_dime; 
	
	logic engage_refund; 
	
	Refund #( .PRICE(PRICE), .N(N)) register(
		.reset(reset), 
		.engage_refund(engage_refund),
		.vend(vend), 
		.count(entered),
		.nickel_out(nickel_ct), 
		.dime_out(dime_ct) 
		);
	
	always_ff @(posedge clk or posedge reset) begin 
		
		if (reset) begin 
			vend <= 0;
			entered <= 0; 
			nickel_out <= 0; 
			dime_out <= 0; 
		end else if (nickel) begin 
			entered <= entered + 5; 
			
		end else if(dime) begin 
			entered <= entered + 10; 
			
		end else if (entered >= PRICE) begin 
			vend <= 1; 
			return_nickel <= nickel_ct; 
			return_dime <= dime_ct; 
		end else if (refund) begin 
			engage_refund <= 1; 
			return_nickel <= nickel_ct;
			return_dime <= dime_ct; 
		end else if (clk) begin
			if (nickel_ct >= 1) begin 
				nickel_out <= 1; 
				return_nickel--; 
			end else if (dime_ct >= 1) begin 
				dime_out <= 1; 
				return_dime--; 
			end else begin 
				dime_out <= 0; 
				nickel_out <= 0;
				engage_refund <= 0;
				vend <= 0; 
			end 
		end	
	end 
		
endmodule

// REFUND MODULE

module Refund #(
	parameter PRICE = 30,
	parameter N = 6
	
)(
	input logic reset, 
	input logic engage_refund,
	input logic vend, 
	input logic [N-1:0] count, 

	
	output logic [3:0] nickel_out,
	output logic [3:0] dime_out
); 
	logic [5:0] entered; 
	logic [4:0] nickel_ct; 
	logic [4:0] dime_ct; 
	
	always_ff @(posedge engage_refund or posedge vend or posedge reset) begin 
		if (reset) begin
			entered <= 0; 
			nickel_ct <= 0; 
			dime_ct <= 0; 

		end else if (vend) begin 
			entered <= count - PRICE; 
			
			dime_ct <= entered/10; 
			nickel_ct <= (entered - (dime_ct*10))/5;
			
			if((dime_ct*10)+(nickel_ct*5) == entered) begin 
				nickel_out <= nickel_ct; 
				dime_out <= dime_ct; 
			end
		
		end else if(engage_refund) begin 
			entered <= count; 
			
			//dime_ct <= entered/10; 
			//nickel_ct <= (entered - (dime_ct*10))/5; 
			
			
			nickel_out <= 1; 
			dime_out <= dime_ct; 
			
		end 
	end
	
endmodule 

	
	