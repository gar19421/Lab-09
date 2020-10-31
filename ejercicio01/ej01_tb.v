module testbench();
reg clock, reset, enable, D1;//variables para el contador
reg [1:0] D2;
reg [3:0] D3;
wire Y1;
wire [1:0] Y2;
wire [3:0] Y3;


always//instanciacion del clock
  begin
    clock <= 1;
    #1 clock <= ~clock;// se realiza el cambio del reloj
    #1;
end


FF_1BIT FF1(clock, reset, enable, D1, Y1);
FF_2BIT FF2(clock, reset, enable, D2, Y2);
FF_4BIT FF3(clock, reset, enable, D3, Y3);


initial begin// test de FF1
  $display("FLIP-FLOP DE 1 BIT \n");
  $display("CLK Reset | Enable D |  Y");
  $display("----------|----------|------ ");
  $monitor("%b     %b   |    %b   %b |  %b", clock,reset,enable,D1,Y1);
  #2 reset = 1;
  #2 reset = 0; enable = 0; D1 = 0;
  #2 D1 = 1;
  #2 enable = 1; D1 = 0;
  #2 D1 = 1;
  #2 D1 = 0 ;
end

initial begin// test de FF2
  #16
  $display("FLIP-FLOP DE 2 BITS\n");
  $display("CLK Reset | Enable D  |  Y");
  $display("----------|-----------|------ ");
  $monitor("%b     %b   |    %b   %b |  %b", clock,reset,enable,D2,Y2);
  #2 reset = 1;
  #2 enable = 0; D2[0] = 1; D2[1] = 1; reset = 0;
  #2 D2[0] = 0; D2[1] = 1;
  #2 D2[0] = 1; D2[1] = 0;
  #2 enable = 1; D2[0] = 0; D2[1] = 1;
  #2 D2[0] = 1; D2[1] = 1;
  #2 D2[0] = 0; D2[1] = 0;
  #2 D2[0] = 0; D2[1] = 1;
end


initial begin// test de FF3
  #32
  $display("FLIP-FLOP DE 4   BITS\n");
  $display("CLK Reset | Enable  D   |   Y");
  $display("----------|-------------|-------");
  $monitor("%b     %b   |    %b   %b |  %b", clock,reset,enable,D3,Y3);
  #2 reset = 1;
  #2 enable = 0; D3[0] = 1; D3[1] = 1; D3[2] = 1; D3[3] = 1; reset = 0;
  #2 D3[0] = 1; D3[1] = 1; D3[2] = 0; D3[3] = 1;
  #2 D3[0] = 0; D3[1] = 1; D3[2] = 1; D3[3] = 1;
  #2 enable = 1; D3[0] = 1; D3[1] = 1; D3[2] = 1; D3[3] = 1;
  #2 D3[0] = 0; D3[1] = 1; D3[2] = 0; D3[3] = 1;
  #2 D3[0] = 0; D3[1] = 1; D3[2] = 1; D3[3] = 0;
  #2 D3[0] = 0; D3[1] = 1; D3[2] = 0; D3[3] = 1;
  #2 D3[0] = 0; D3[1] = 0; D3[2] = 0; D3[3] = 1;
  $finish;
end


initial begin//ejecutar GTKWave para diagramas de timing.
  $dumpfile("ej01_tb.vcd");
  $dumpvars(0, testbench);
end

endmodule
