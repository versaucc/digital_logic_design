/* 
counter Notes: 
	-Sum refers to the "carry-out" of the operation. 
		- When changing to dnyamic structure this will probably 
			remove the need for a sum, as the packet width is flexible
	- Count: Output, flexible 
	- addBy: Input, could be flexible for tuning clock timing 
	- enable_n: Input, controls writing 
	- clock: Input 
	
	*use a module RegisterNBit to handle N bit, handle enable_n here
*/ 

module DynCounter #(
	parameter int N = 4, // Default bus width (bits)
	parameter LIM = 50000000 // Set the max for each unit ; i.e. Seconds reset after 59s and clock goes high
	)(
	// I/Os - required
	input logic clock, 
	input logic clock_m,
	input logic enable_n, // enable write (active low) 
	input logic reset_n, // Asynchronus reset
	input logic addBy,  //
	input logic addM, 
	output logic [N - 1:0] count,
	output logic sum
	);
	
	logic [N-1:0] count_next;
	logic clear_n; 
	
	logic add;
	
	always_ff @(posedge clock or negedge reset_n) begin
		// If writing is enabled (active low) count normally. If disabled, count is preserved. 
		//sum <= 0; // Initially, we should have no carry out 
		
		if(!reset_n) begin
		// Adder used for all 6 displays
			count_next <= 0; 
			clear_n <= 0;

		end else if (!enable_n) begin
			
			// Add to count normally
			count_next <= count_next + addBy + add;
				
			if (count_next == (LIM) || count_next > LIM) begin
				clear_n <= 0; 
				count_next <= 0; 
				sum <= 1; 
			end else begin 
				clear_n <= 1; 
				sum <= 0; 
			end
			
		end 
	end

	OneShot manual_add ( 
		.clock(clock),
		.clock_m(clock_m), 
		.d(addM), 
		.q(add)
	); 

	RegisterNBit #(.N(N)) bus (
		.clock(clock),
		.clear_n(clear_n),
		.din(count_next), 
		.qout(count) 
		); 
			
endmodule 
	
	