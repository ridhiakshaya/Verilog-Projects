module mux_41(
    input a, b, c, d,
    input s1, s0,
    output y
);

assign y = s1 ? (s0 ? d:c) : (s0 ? b:a);

endmodule