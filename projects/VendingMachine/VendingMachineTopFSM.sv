/*
Vending Machine Top with FSM 
*/ 

module VendingMachineTopFSM #(
	parameter PRICE = 30,
	parameter N = 6 
	)(
	input logic clk, 
	input logic reset, 
	input logic nickel, 
	input logic dime, 
	input logic refund, 
	
	output logic vend, 
	output logic nickel, 
	output logic dime 
	); 
	
	typedef enum logic [1:0] {
		IDLE, 
		VEND, 
		REFUND 
	} state_t; 
	
	state_t state, next_state; 
	
	logic [N-1:0] balance; 
	
	logic [N-1:0] balance_next; 
	
	// Balance register 
	Register #(.N(N), .PRICE(PRICE)) bal (
		.clk(clk), 
		.reset(reset), 
		.balance(balance), 
		.balance_next(balance_next)
		);
		
		
	always_ff @(posedge dime or posedge nickel or posedge reset or posedge clk) begin
		if(reset) begin 
			balance <= 0;
		end else if (nickle) begin 
			balance <= balance_next + 5;  
		end else if (dime) begin 
				balance <= balance + 10; 
		end else begin 
			if (nickel_ct >= 1) begin 
				nickle_out <= 1; 
				balance <= balance - 5;
			end else if (dime_ct >= 1) begin 
				dime_out <= 1; 
				balance <= balance - 10; 
			end else begin 
				dime_out <= 0; 
				nickel_out <= 0; 
			end
		end			
	end 
	
	GetChange #(.N(N)) chng (
		.reset(reset), 
		.balance(balance), 
		.nickels(nickel_ct), 
		.dimes(dime_ct)
		); 
	
	// FSM 
	always_comb begin 
		next_state = state; 
		case(state)
			IDLE: begin
				change = 0; 
				if(refund) 
					next_state = REFUND; 
				else if (balance_next >= PRICE)
					balance = balance - PRICE; 
					next_state = VEND; 
			end 
		
			VEND: begin 
				vend = 1; 
				next_state = REFUND; 
			end 
			
			REFUND: begin 
				change = balance_next; 
				next_state = IDLE; 
			end
		endcase
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
	input logic [N-1:0] change,
	
	output logic [N-1:0] nickels, 
	output logic [N-1:0] dimes
);

	always_comb begin 
		dimes = change/10; 
		nickels = (change - (dimes*10))/5; 
	end 


endmodule 
				
		