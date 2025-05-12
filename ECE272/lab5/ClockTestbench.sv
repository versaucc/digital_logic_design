/*
 * ECE 272 Lab 5 Testbench
 *
 * Author(s): Quinn Yockey
 * Last Modified: 01 May 2025
 */

`define TICKS_PER_SECOND   5
`define SECONDS_PER_MINUTE 60
`define MINUTES_PER_HOUR   60
`define HOURS_PER_DAY      24

`define MAX_ERRORS 30

/*
 * NOTE: To use a constant in code, prefix it with a backtick (`).
 *
 * Example: if (tickMeasured != `TICKS_PER_SECOND) ...
 */

module ClockTestbench();

/* Declare internal logic */

// Module inputs
logic clk;
logic reset_n;


// Module outputs
logic [4:0] tickMeasured;
logic [5:0] secondMeasured;
logic [5:0] minuteMeasured;
logic [4:0] hourMeasured;

// Expected outputs
logic [4:0] tickExpected;
logic [5:0] secondExpected;
logic [5:0] minuteExpected;
logic [4:0] hourExpected;

// Number of comparision errors since start of simulation
int numErrors;

/*
 * Define the system clock.
 *
 * NOTE: We pretend this is a 50 MHz signal for convenience.
 */
always begin
    clk = 1'b0;
    #1;
    clk = 1'b1;
    #1;
end

/*
 * Instantiate Clock device under test.
 *
 * TODO Change signal names as needed to match your Clock module.  Use Ctrl+H
 *      to search and replace in Quartus.
 */
Clock dut (
    .clock(clk),
    .reset_n(reset_n),
    .tick(tickMeasured), //
    .seconds(secondMeasured),
    .minutes(minuteMeasured),
    .hours(hourMeasured)
);

/* Perform a reset of the clock module */
task reset();
    reset_n = 1'b0;
    #10;
    reset_n = 1'b1;

endtask

/*
 * Validate that all mesured outputs match the expected values.  Print an
 * error message if the outputs are incorrect.  Stop simulation if too many
 * errors occur.
 */
task validateState();
    if (tickExpected !== tickMeasured || (secondExpected) !== secondMeasured ||
            (minuteExpected) !== minuteMeasured || (hourExpected) !== hourMeasured)
    begin

        numErrors++;
        if (`MAX_ERRORS < numErrors) begin
            $display("Too many errors.  Halting simulation.");
            $stop;
        end

        // Print current time, measured & expected quantities
        // Format hour:minute:second.tick
        $display("%0tps: measured %2d:%2d:%2d.%1d expected %2d:%2d:%2d.%1d",
            $time,
            hourMeasured, minuteMeasured, secondMeasured, tickMeasured,
            hourExpected, minuteExpected, secondExpected, tickExpected,
        );

    end
endtask

/*
 * Validate 24 consecutive hours.
 */
task validateDay();

    /* TODO */
    
    /*
     * Idea 1: Use nested loops for expected values.
     * Idea 2: Create separate functions for validateHour, validateMinute,
     *         validateSecond, and validateTick.
     * Idea 3: Your choice.
     */
	  
	   for (int h = 0; h < 24; h++) begin
        for (int m = 0; m < 60; m++) begin
            for (int s = 0; s < 60; s++) begin
                for (int t = 0; t < 10; t++) begin
                    
                    hourExpected   = h;
                    minuteExpected = m;
                    secondExpected = s;
                    tickExpected   = t;

						  
                    // Wait for next rising clock edge
						 @(posedge clk);
						  
						  
						  
						  

						  

                end
					 validateState();
					 
            end
				validateState();
        end
		  validateState();
    end

endtask

/* Reset the system, then validate two consecutive days. */
initial begin
    reset_n = 1'b1;
    numErrors = 0;
    hourExpected = 0;
    minuteExpected = 0;
    secondExpected = 0;
    tickExpected = 0;

    reset();


    validateDay();
    validateDay();

    if (0 == numErrors) begin
        $display("Clock module validated successfully!");
    end
    $stop;
end

endmodule

