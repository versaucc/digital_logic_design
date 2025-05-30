

module SyncCount (
	input logic clk, // Takes input from ClockDivider
	input logic reset, 
	output logic HSync, 
	output logic VSync, 
	output logic HDisplay,
	output logic VDisplay,
	output logic [9:0] col,  // 0–639 for horizontal pixel index
	output logic [9:0] row   // 0–479 for vertical pixel index
	); 
	
	logic [9:0] hcount; // log2(800) ~ 10
	logic [9:0] vcount; // Up to 525
	
	// HSync sequential logic (Horizontal) 
	always_ff @(posedge clk or posedge reset) begin
		if (reset) begin
			hcount <= 10'b0;
		end else if(hcount == 799) begin 
			hcount <= 0; 
		end else begin 
			hcount <= hcount + 1; 
		end 
	end
	
	always_ff @(posedge clk or posedge reset) begin 
		if (reset) begin 
			vcount <= 0; 
		end else if (hcount == 799) begin 
			if(vcount == 524) begin 
				vcount <= 0; 
			end else begin 
				vcount <= vcount + 1;
			end 
		end 
	end 
	
	always_comb begin 
		// 
		HSync = (hcount < 96) ? 0 : 1; 
		VSync = (vcount < 2) ? 0 : 1; 
		
		HDisplay = (hcount >= 144 && hcount < 784); 
		VDisplay = (vcount >= 35 && vcount < 515);  
	end
	
	assign col = hcount;
	assign row = vcount;

endmodule
		   
			
			