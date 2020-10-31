module testbench();

  reg clk, rst, enable;
  wire Y;

  FF_T U1(clk, rst, enable, Y);

always // instanciacion del clock
  begin
    clk <= 1;
    #1 clk <= ~clk;
    #1;
end

initial begin
    $display("\nFlip Flop Tipo T\n");
    $display(" Clk RST | EN |   Y    ");
    $display(" --------------------- ");
    $monitor(" %b    %b  |  %b |   %b ", clk, rst, enable, Y);

    #1 rst = 1; //Reset inicial
    #1 rst = 0; enable = 1; //Reset inicial
    #4 enable = 0;
    #2 enable = 1;
    #5 $finish;
end

  initial begin
        $dumpfile("ej02_tb.vcd");
        $dumpvars(0, testbench);
      end
endmodule
