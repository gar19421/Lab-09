module FF_D(input wire clk, reset, enable, D, output reg Y) ;
  always @(posedge clk or posedge enable or posedge reset) begin
    if (reset)  Y <= 1'b0;
    else if(enable) Y <= D;
  end
endmodule

module FF_JK(input wire clock, reset, enable, J, K, output wire Q);
  wire c1, c2;

  FF_D G1(clock, reset, enable, QF, Q);

  and U1(c1, ~Q, J);
  and U2(c2, Q, ~K);
  or U3(QF, w1, w2);

endmodule
