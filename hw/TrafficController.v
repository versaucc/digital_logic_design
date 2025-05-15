/*
Revised traffic light controller from HW 6 excercise 3.24
Assuming 1Hz clock cycle 
*/ 

module TrafficController (
    input logic clk,
    input logic reset,
    input logic A,
    input logic B,
    output logic La0,
    output logic La1,
    output logic Lb0,
    output logic Lb1
);

    typedef enum logic [2:0] {
        S0, S1, S2_wait1, S3, S4, S2_wait2
    } state_t;

    state_t state, next_state;

    logic [2:0] delay_counter;

    // State register
    always_ff @(posedge clk or posedge reset) begin
        if (reset)
            state <= S0;
        else
            state <= next_state;
    end

    // Delay counter logic
    always_ff @(posedge clk or posedge reset) begin
        if (reset)
            delay_counter <= 0;
        else if ((state == S2_wait1 || state == S2_wait2) && delay_counter < 5)
            delay_counter <= delay_counter + 1;
        else
            delay_counter <= 0; // reset when entering/exiting or idle
    end

    // Next state logic
    always_comb begin
        next_state = state;
        case (state)
            S0: begin
                if (A == 0)
                    next_state = S1;
            end
            S1: next_state = S2_wait1;

            S2_wait1: begin
                if (delay_counter == 5)
                    next_state = S3;
            end

            S3: begin
                if (B == 0)
                    next_state = S4;
            end

            S4: next_state = S2_wait2;

            S2_wait2: begin
                if (delay_counter == 5)
                    next_state = S0;
            end
        endcase
    end

    // Output logic based on state
    always_comb begin
        // Default all outputs to 0
        La0 = 0;
        La1 = 0;
        Lb0 = 0;
        Lb1 = 0;

        case (state)
            S0: La0 = 1;
            S1: La1 = 1;
            S3: Lb0 = 1;
            S4: Lb1 = 1;
            default: ; // S2_wait1 and S2_wait2 keep all outputs at 0
        endcase
    end

endmodule