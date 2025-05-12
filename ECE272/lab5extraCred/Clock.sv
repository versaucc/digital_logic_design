 /*
 50 MHz corresponds to 50 million clock ticks per seconds
 20ns per cycle
 */
 
module Clock (
	input logic clock, 
	input logic clock_m, // User input clock for adj time
	input logic reset_n,  
	input logic seconds_m, // Manually add seconds using SW
	input logic minutes_m, 
	input logic hours_m, 
	output logic [25:0] tick, 
	output logic [5:0] seconds, // up to 59 log2(59) ~ 6 bit width 
	output logic [5:0] minutes, // up to 59
	output logic [4:0] hours // up to 23
	);
	
	logic enable_n = 0; 
	
	logic [25:0] ns; // log2(50mill) ~ 26 
	logic clockns; 
	logic carrys; 
	logic addS;
	
	
	logic [5:0] ss;  // log2(59) ~ 6
	logic clocks; 
	logic carrym; 
	logic addM;
	
	
	logic [5:0] mm; // log2(59) ~ 6
	logic clockm;
	logic carryh;
	logic addH;

	logic [5:0] hh;  // log2(24) ~ 32
	logic clockh;
	logic [1:0] carryd; 
	
	
	/* TODO:
		logic handling increments for each unit
		connect ns -> s -> m -> h 
		Carry out delayed by one clock cycle, should be instant 
	*/
	
	/*	
	always_ff @(posedge clock) begin 
		
		addS <= carrys; // + seconds_m; 
		addM<= carrym ; //  + minutes_m; 
		addH <= carryh;   //  + hours_m;
	end
	*/
	
	// Nanoseconds counter (FPGA clock frequency 50MHz) --- .LIM(50000000)
	// For sim: Changed LIM and N in nanoseconds_reg, clock_m is always high for sim 
	DynCounter #(.N(26), .LIM(50000000)) nanoSeconds_reg ( // Post testbench - need to update these. 
		.clock(clock),
		.clock_m(1),
		.reset_n(reset_n),
		.enable_n(enable_n),
		.addBy(1),
		.addM(0),
		.count(tick),
		.sum(carrys)
	);

	
	// Seconds counter 
	DynCounter #(.N(6), .LIM(60)) seconds_reg (
		.clock(clock),
		.clock_m(clock_m),
		.reset_n(reset_n),
		.enable_n(enable_n),
		.addBy(carrys), // Maybe not one
		.addM(seconds_m), 
		.count(seconds),
		.sum(carrym)
	);
	
	// Minutes counter 
		DynCounter #(.N(6), .LIM(60)) minutes_reg (
		.clock(clock),
		.clock_m(clock_m), 
		.reset_n(reset_n),
		.enable_n(enable_n),
		.addBy(carrym), // Maybe not one
		.addM(minutes_m),
		.count(minutes),
		.sum(carryh)
	);
	
	// Hours counter
		DynCounter #(.N(5), .LIM(24)) hours_reg (
		.clock(clock),
		.clock_m(clock_m),
		.reset_n(reset_n),
		.enable_n(enable_n),
		.addBy(carryh), // Maybe not one
		.addM(hours_m), 
		.count(hours),
		.sum(carryd)
	);
	
	
	endmodule