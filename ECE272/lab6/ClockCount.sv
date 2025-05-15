

module ClockCount (
	input logic clk, 
	input logic reset, 
	input logic enable_n,
	output logic [9:0] q, // log2(800) ~ 10
	output logic lohi
	); 
	
	
	always_ff @(posedge clk or posedge reset) begin
		if (reset) begin
			q <= 10'b0;
			lohi <= 0;
		end else if(!enable_n && !reset) begin 
			q <= q + 1; 
			if(q == 10'd96) begin
				lohi <= 0; 
			end else if (q == 10'd704) begin 
				lohi <= 1; 
			end else if (q == 10'd799) begin 
				q <= 1'b0; 
			end 
		end 
	end

endmodule
		   
			
			