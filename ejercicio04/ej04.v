

module Buffer_4(input wire enable, input wire [3:0]A, output wire [3:0] Y);

  assign Y = enable ? A : 4'bz;
  
endmodule
