/*
 * ECE 272 Lab 4
 * Counter Testbench Skeleton File
 *
 * Author(s): Quinn Yockey
 * Last Modified: 01 May 2025
 */

/* IMPORTANT!  Read the comments carefully.  They are included to help you!  */

/*
 * Instructions:
 *     Tasks are marked with a number in brackets (e.g., [1]). Each has a
 *     corresponding TODO comment to replace with SystemVerilog code.
 */

module CounterTestbench();

/*
 * Declare internal logic signals to connect to the `Counter` module.
 *
 * [1] Declare the following logic signals:
 *     - clock     (1 bit)
 *     - clear_n   (1 bit)
 *     - addBy     (4 bits)
 *     - count     (4 bits)
 *     - expected  (4 bits)
 *
 * Check the lab 3b testbench for a refresher on declaring internal logic.
 */
	logic clock, clear_n; 
	logic [3:0] addBy;
	logic [3:0] count;
	logic [3:0] expected;
	
/* [1] DONE */

	RegisterFourBit reg_dut ( 
			.clock(clock),
			.clear_n(clear_n),
			.d(d),
			.q(q)
	);	
	
/*
 * Toggle `clock` with a period of 10 ps.  This block runs in the background
 * and immediately repeats when completed.  The clock signal should start
 * low and transition high halfway through the period.
 *
 * FIX 01 May 2025: Set clock to start low then go high.
 *
 * [2] Toggle the `clock` signal between 0 and 1.
 */
	
always begin
	 // [2] DONE
    clock = 0;
	 #5;
	 clock = ~clock;
	 #5;
end



/*
 * Create instance of the device under test (DUT): `Counter`.
 *
 * [3] Connect internal signals to DUT instance.  Again, reference lab 3b as
 *     needed.
 */
Counter counter_dut(
    .clock(clock),
	 // [3] DONE
	 .clear_n(clear_n),
	 .addBy(addBy), 
	 .count(count)
);

/* See Note A: Tasks */

/*
 * Define a task `validateClear`.  This task activates the `clear_n` signal for
 * 10 ps, then checks to ensure the `count` has been set to 0 as expected.  If
 * the clear fails, an error message is displayed with a timestamp. 
 *
 * [3] Reset counter for 10 ps by setting the value of the `clear_n` signal.
 *     Remember that `clear_n` is active low, so it should be set low (0) to
 *     trigger a clear and then set high (1) to stop resetting.
 * [4] Check if the `Counter` module did not successfully perform a clear.
 *
 * FIX 01 May 2025: Adjust timing of clear_n activation.
 */
task validateClear();
    /* [3] DONE */
	 clear_n <= 1'b0; 
	 expected <= 4'b0; 
    #10;
    /* [3] DONE */
	 clear_n <= 1'b1; 
	 

    if (count != expected) begin // !== checks bit-exactness
        $display("%0t ps: Clear failed", $time);
    end

endtask

/*
 * Define a task `validateIncrement`. This task sets the `addBy` signal to
 * a given value, then ensures that 5 ticks of the counter all produce the
 * expected sums.
 *
 * Step by step:
 *     1. Set the value of `addBy` to the `incrementValue`.
 *     2. Use a `for` loop to repeat the statements inside 5 times.  This
 *        should look incredibly familiar to `for` loops you have seen
 *        before in languages like C or Python.
 *     3. [5] Set the value of `expected` to be the sum of the counter value
 *        and the increment.
 *     4. Delay for a full clock period to allow for the `count` signal to
 *        update on the clock rising edge. 
 *     5. [6] Check if the updated value of the `count` signal matches the
 *        expected value.  If not, display an error message with the
 *        simulation time and relevant signal values.
 */
task validateIncrement(input logic [3:0] incrementValue);
	 //$display("%0t ps: Validating Increment: incrementValue=%4b, initial count=%4b", $time, incrementValue, count);
    addBy = incrementValue;
    for (int i = 0; i < 5; i++) begin
        expected =  (i + 1)*incrementValue; /* [5] DONE */
        #10;
	$display("Expected: %1h , Count: %1h", expected, count);
        if (count != expected) begin
            /* See Note B: Advanced $display usage */
            $display("%0t ps: Increment failed. addBy=%1h, expected=%1h, count=%1h",
                $time, addBy, expected, count);
        end
    end
	validateClear();
endtask

/* See Note C: Simulation cases */

/*
 * Validate the design by testing clear and increment functionality.
 *
 * Test the clear at the start of simulation.
 *
 * [7] Perform the following tasks:
 *     - Test incrementing by 0, 1, 7, 8, and F for 5 ticks each.
 *     - Test the clear at the end of simulation.
 */
initial begin
    $display("=== Start of Simulation ===");

    /* Set initial values of testbench-controlled signals. */
    clear_n = 1'b1;
	 #10;
    addBy = 4'b0;
    expected = 4'b0;

    validateClear();
	
	 
	 
	 // Test increment by 0 
    validateIncrement(4'b0000);
	 
	 // Test increment by 0 
    validateIncrement(4'b0001);
	 
	 // Test increment by 0 
    validateIncrement(4'b0111);
	 
	 // Test increment by 0 
    validateIncrement(4'b1000);

	 // Test increment by 0 
    validateIncrement(4'b1111);
    /* [7] TODO */

    $display("=== End of Simulation ===");
    $stop();
end

endmodule

