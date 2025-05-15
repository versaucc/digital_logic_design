/*
Revised traffic light controller from HW 6 excercise 3.24
Assuming 1Hz clock cycle 
*/ 

module TrafficController (
    input logic clk,
    input logic reset,
    input logic A,
    input logic B,
    output logic La0, // Light A - High = green, low = red
    output logic La1, // Light A - High = yellow, low = off
    output logic Lb0, // Light B - High = green, low = red 
    output logic Lb1 // Light b - High = yellow, low = off
);

    typedef enum logic [2:0] {
        S0, S1, S22, S3, S4, S24 
    } state_t;

    state_t state, next_state;

    logic [2:0] delay_counter;

    // register each cycle 
    always_ff @(posedge clk or posedge reset) begin
        if (reset)
            state <= S0;
        else
            state <= next_state;
    end

    /* add 5 cycle delay
		At least one additional state is required for both lights to be red
	 */
    always_ff @(posedge clk or posedge reset) begin
        if (reset)
            delay_counter <= 0;
        else if ((state == S22 || state == S24) && delay_counter < 5) // Wait
            delay_counter <= delay_counter + 1;
        else
            delay_counter <= 0;
    end

	//FSM logic
    always_comb begin
        next_state = state;
        case (state)
            S0: begin
                if (A == 0) // Remain in S0 until we want to change light A
                    next_state = S1; 
            end
            S1: next_state = S22;

            S22: begin
                if (delay_counter == 5)
                    next_state = S3;
            end

            S3: begin
                if (B == 0) // Remain in s3 until we want to change light B 
                    next_state = S4;
            end

            S4: next_state = S24;

            S24: begin
                if (delay_counter == 5)
                    next_state = S0;
            end
        endcase
    end


    always_comb begin
        La0 = 0;
        La1 = 0;
        Lb0 = 0;
        Lb1 = 0;

        case (state)
            S0: La0 = 1;
            S1: La1 = 1;
            S3: Lb0 = 1;
            S4: Lb1 = 1;
            default: La0 = 1; 
        endcase
    end

endmodule