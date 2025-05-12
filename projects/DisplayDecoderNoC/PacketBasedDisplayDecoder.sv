

module PacketBasedDisplayDecoder (
    input logic clock,
    input logic clear_n,
    input logic [3:0] target,
    input logic [3:0] addBy,
    output logic [6:0] Seg0,
    output logic [6:0] Seg1,
    output logic [6:0] Seg2,
    output logic [6:0] Seg3,
    output logic [6:0] Seg4,
    output logic [6:0] Seg5
);

    // Flattened packet input values — can be driven from switches
    logic [23:0] packet_in0 = 24'd0;
    logic [23:0] packet_in1 = 24'd0;
    logic [23:0] packet_in2 = 24'd0;
    logic [23:0] packet_in3 = 24'd0;
    logic [23:0] packet_in4 = 24'd0;
    logic [23:0] packet_in5 = 24'd0;

    logic [23:0] packet_out;
    logic [3:0] digit [5:0];

    // Instantiate the RoutingTable with flattened ports
    RoutingTable dut (
        .clock(clock),
        .clear_n(clear_n),
        .target(target),
        .addBy(addBy),
        .packet_in0(packet_in0),
        .packet_in1(packet_in1),
        .packet_in2(packet_in2),
        .packet_in3(packet_in3),
        .packet_in4(packet_in4),
        .packet_in5(packet_in5),
        .packet_out(packet_out)
    );

    // Break packet_out into hex digits
    always_comb begin
        digit[0] = packet_out[3:0];
        digit[1] = packet_out[7:4];
        digit[2] = packet_out[11:8];
        digit[3] = packet_out[15:12];
        digit[4] = packet_out[19:16];
        digit[5] = packet_out[23:20];
    end

    // Hook up Seven Segment decoders
    SevenSegmentDecode S0 (.digit(digit[0]), .segments(Seg0));
    SevenSegmentDecode S1 (.digit(digit[1]), .segments(Seg1));
    SevenSegmentDecode S2 (.digit(digit[2]), .segments(Seg2));
    SevenSegmentDecode S3 (.digit(digit[3]), .segments(Seg3));
    SevenSegmentDecode S4 (.digit(digit[4]), .segments(Seg4));
    SevenSegmentDecode S5 (.digit(digit[5]), .segments(Seg5));

endmodule