/* 
Register to prevent overcounting of a manual signal 
being pushed during 50MHz clock cycles. 
*/

module OneShot ( 
	input logic clock, 
	input logic clock_m, 
	input logic d, 
	output logic q
	); 
	
	logic shot;
	logic sent; 
	
	always_ff @(posedge clock) begin  
	
		if (!clock_m) begin 
			if (!shot && !sent) begin 			
				q <= d; 
				sent <= 1;
				shot <= 1; 
			end else if (shot) begin 
				q <= 0;  
				shot <= 0;
			end 
		end else if (clock_m && sent) begin 
			sent <= 0; 
		end
			
	end
	
			
endmodule