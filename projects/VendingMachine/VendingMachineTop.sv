/*
Vending Machine Top with FSM 
*/ 

module VendingMachineTop #(
	parameter PRICE = 30,
	parameter N = 6 
	)(
	input logic clk, 
	input logic reset, 
	input logic nickel, 
	input logic dime, 
	input logic refund, 
	
	output logic vend, 
	output logic nickel_out, 
	output logic dime_out
	); 
	
	
	logic [N-1:0] balance; 
	
	logic [N-1:0] balance_next; 
	
	// Balance register 
	Register #(.N(N), .PRICE(PRICE)) bal (
		.clk(clk), 
		.reset(reset), 
		.balance(balance), 
		.balance_next(balance_next)
		);

	// Get change after transaction
	logic [N-1:0] change; 
	logic [N-1:0] nickel_ct; 
	logic [N-1:0] dime_ct; 
	
	GetChange #(.N(N)) chng (
		.clk(clk),
		.change(change), 
		.nickels(nickel_ct), 
		.dimes(dime_ct)
		); 
		
		
	always_ff @(posedge clk or posedge reset) begin

		 if (reset) begin
			  balance <= 0;
			  vend <= 0; 
			  nickel_out <= 0;
			  dime_out <= 0;
		 end else begin
			  
			  nickel_out <= 0;
			  dime_out <= 0;

			  if (nickel) begin
					balance <= balance + 5;
			  end else if (dime) begin
					balance <= balance + 10;
			  end else if (balance >= PRICE) begin
					vend <= 1; 
					change <= balance - PRICE;
					balance <= 0;  
				end else if(refund) begin
					change <= balance_next;
					balance <= 0; 
			  end else if (change >= 5) begin
					if (nickel_ct >= 1) begin
						 nickel_out <= 1;
						 change <= change - 5; 
					end else if (dime_ct >= 1) begin
						 dime_out <= 1;
						 change <= change - 10; 
					end else begin
						nickel_out <= 0; 
						dime_out <= 0;
					end
			 end else begin 
					vend <= 0; 
			end
		 end
	end
		
			
endmodule 


module Register #(
	parameter PRICE = 30, 
	parameter N = 6
)(
	input logic clk, 
	input logic reset, 
	input logic [N-1:0] balance, 
	output logic [N-1:0] balance_next
);
	
	always_ff @(posedge clk or posedge reset) begin 
		if(reset) begin 
			balance_next <= 0; 
		end else begin 
			balance_next <= balance; 
		end 
	end 
	
	
endmodule

module GetChange #(
	parameter N = 6
)(
	input logic clk, 
	input logic [N-1:0] change,
	
	output logic [N-1:0] nickels, 
	output logic [N-1:0] dimes
);

	always_comb begin 
		dimes = change/10; 
		nickels = (change - (dimes*10))/5;
 
	end 


endmodule 
				
		