

module PacketBasedDisplayDecoder (
    input logic clock,
    input logic clear_n,
    input logic [3:0] target,
    input logic [3:0] addBy,
    input logic [23:0] packet_in [5:0],
    output logic [6:0] Seg0,
    output logic [6:0] Seg1,
    output logic [6:0] Seg2,
    output logic [6:0] Seg3,
    output logic [6:0] Seg4,
    output logic [6:0] Seg5
);

    logic [23:0] packet_out;
    logic [3:0] digit [5:0];

    // Route selected packet
    RoutingTable route_inst (
        .clock(clock),
        .clear_n(clear_n),
        .target(target),
        .addBy(addBy),
        .packet_in(packet_in),
        .packet_out(packet_out)
    );

    // Split 24-bit packet_out into 6 hex digits
    always_comb begin
        digit[0] = packet_out[3:0];
        digit[1] = packet_out[7:4];
        digit[2] = packet_out[11:8];
        digit[3] = packet_out[15:12];
        digit[4] = packet_out[19:16];
        digit[5] = packet_out[23:20];
    end

    // Decode each nibble to its display
    SevenSegmentDecode S0 (.binary_in(digit[0]), .seg_out(Seg0));
    SevenSegmentDecode S1 (.binary_in(digit[1]), .seg_out(Seg1));
    SevenSegmentDecode S2 (.binary_in(digit[2]), .seg_out(Seg2));
    SevenSegmentDecode S3 (.binary_in(digit[3]), .seg_out(Seg3));
    SevenSegmentDecode S4 (.binary_in(digit[4]), .seg_out(Seg4));
    SevenSegmentDecode S5 (.binary_in(digit[5]), .seg_out(Seg5));

endmodule