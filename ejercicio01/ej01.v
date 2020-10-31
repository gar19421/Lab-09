module FF_1BIT(input wire clk, reset, enable, D, output reg Y) ;
  always @(posedge clk or posedge enable or posedge reset) begin
    if (reset)  Y <= 1'b0;
    else if(enable) Y <= D;
  end
endmodule


module FF_2BIT(input wire clk, reset, enable, input wire [1:0] D, output wire [1:0] Y) ;
  FF_1BIT FF1(clk, reset, enable, D[1], Y[1]);
  FF_1BIT FF2(clk, reset, enable, D[0], Y[0]);
endmodule

module FF_4BIT(input wire clk, reset, enable, input wire [3:0] D, output wire [3:0] Y) ;
  FF_1BIT FF1(clk, reset, enable, D[3], Y[3]);
  FF_1BIT FF2(clk, reset, enable, D[2], Y[2]);
  FF_1BIT FF3(clk, reset, enable, D[1], Y[1]);
  FF_1BIT FF4(clk, reset, enable, D[0], Y[0]);
endmodule
