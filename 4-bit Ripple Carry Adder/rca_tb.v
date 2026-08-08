`timescale 1ns/1ps

module rca_tb;
//inputs to rca
reg[3:0] x;
reg[3:0] y;
//outputs of rca
wire[3:0] s;
wire co;

rca uut(
    .x(x),
    .y(y),
    .s(s),
    .co(co)
);

initial begin
    $dumpfile("rca_waveform.vcd");
    $dumpvars(0, rca_tb);
end

initial begin
    
    //Test 1: 3 + 2 = 5
    x = 4'b0011;
    y = 4'b0010;
    #10;

    //Test 2: 5 + 4 = 9
    x = 4'b0101;
    y = 4'b0100;
    #10;

    //Test 3: 7 + 8 = 15
    x = 4'b0111;
    y = 4'b1000;
    #10;

    //Test 4: 15 + 1 = 16
    x = 4'b1111;
    y = 4'b0001;
    #10;

    //Test 5: 10 + 6 = 16
    x = 4'b1010;
    y = 4'b0110;
    #10;

    $finish;
end

// Display inputs and outputs
initial begin
    $monitor("Time=%0t | x=%b | y=%b | co=%b | s=%b", 
              $time, x, y, co, s);
end

endmodule