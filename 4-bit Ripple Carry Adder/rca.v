module rca(x, y, s, co);
input [3:0] x, y; //two 4-bit inputs
output[3:0] s;
output co;
wire w1, w2, w3;
//instantiating full_adder module
full_adder u1(x[0],y[0],1'b0,s[0],w1); // cin1=0, co1=w1
full_adder u2(x[1],y[1],w1,s[1],w2);  // cin2=w1, co2=w2
full_adder u3(x[2],y[2],w2,s[2],w3);  // cin3=w2, co3=w3
full_adder u4(x[3],y[3],w3,s[3],co);  // cin4=w3, co4=co
endmodule