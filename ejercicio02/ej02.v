
//Flip Flop Tipo d de 1 bit
module FF_D1(input wire clk, reset, enable, D, output reg Y) ;
  always @(posedge clk or posedge enable or posedge reset) begin
    if (reset)  Y <= 1'b0;
    else if(enable) Y <= D;
  end
endmodule


//Flip Flop Tipo T de 1 bit
module FF_T(input wire clock, reset, enable, output wire Y);
  wire D;
  assign D = ~Y;
  FF_D1 G1(clock, reset, enable, D, Y);
endmodule
