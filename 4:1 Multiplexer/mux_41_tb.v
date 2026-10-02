`timescale 1ns/1ps

module mux_41_tb;

reg a, b, c, d;
reg s1, s0;

wire y;

mux_41 uut (
    .a(a),
    .b(b),
    .c(c),
    .d(d),
    .s1(s1),
    .s0(s0),
    .y(y)
);

initial begin
   //Create waveform file for GTK Wave
   $dumpfile("mux_41.vcd");
   $dumpvars(0, mux_41_tb);

//Input values
//Test case 1: a =0, b=1, c=0, d=1
    a=0;
    b=1;
    c=0;
    d=1;

    s1=0; s0=0; #10;
    s1=0; s0=1; #10;
    s1=1; s0=0; #10;
    s1=1; s0=1; #10;

    //Test Case 2: Reverse Input Waveform
    // a =1, b=0, c=1, d=0
    a=1; 
    b=0; 
    c=1;
    d=0;

    s1=0; s0=0; #10;
    s1=0; s0=1; #10;
    s1=1; s0=0; #10;
    s1=1; s0=1; #10;

    $finish;

end 

endmodule
