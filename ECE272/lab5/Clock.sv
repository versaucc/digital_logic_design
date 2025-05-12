 /*
 50 MHz corresponds to 50 million clock ticks per seconds
 20ns per cycle
 */
 
module Clock (
	input logic clock, 
	input logic reset_n, 
	/*
	input logic clock_m, // User input clock for adj time
	input logic seconds_m, // Manually add seconds using SW
	input logic minutes_m, 
	input logic hours_m, 
	*/
	output logic [4:0] tick, // log2(50000000) ~ 26
	output logic [5:0] seconds, // log2(59) ~ 6 
	output logic [5:0] minutes, // log2(59) ~ 6 
	output logic [4:0] hours // log2(24) ~ 5
	);
	
	logic enable_n = 0; 
	
	logic carrys; 

	logic carrym; 
	
	logic carryh;

	logic carryd; 
	
	
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


    DynCounter #(.N(5), .LIM(10)) nanoSeconds_reg (
        .clock(clock),
        .reset_n(reset_n),
        .enable_n(enable_n),
        .addBy(1),
        .count(tick),
        .sum(carrys)
    );

    DynCounter #(.N(6), .LIM(60)) seconds_reg (
        .clock(clock),
        .reset_n(reset_n),
        .enable_n(enable_n),
        .addBy(carrys),
        .count(seconds),
        .sum(carrym)
    );

    DynCounter #(.N(6), .LIM(60)) minutes_reg (
        .clock(clock),
        .reset_n(reset_n),
        .enable_n(enable_n),
        .addBy(carrym),
        .count(minutes),
        .sum(carryh)
    );

    DynCounter #(.N(5), .LIM(24)) hours_reg (
        .clock(clock),
        .reset_n(reset_n),
        .enable_n(enable_n),
        .addBy(carryh),
        .count(hours),
        .sum(carryd)
    );
endmodule