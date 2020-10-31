module testbench();

  reg clk, rst, enable, J, K;
  wire Q;

  FF_JK G1(clk, rst, enable, J, K, Q);

  always
    begin
      clk <= 1;
      #1 clk <= ~clk;
      #1;
  end

  initial begin
  $display("\n");
    $display("Flip Flop Tipo JK");
    $display("\n");
    $display(" Clk RST | EN  J  K |  Q    ");
    $display(" -------------------------- ");
    $monitor(" %b    %b  |  %b  %b  %b |   %b ", clk, rst, enable, J, K, Q);

    #1 rst = 1; //Reset inicial
    #1 rst = 0; enable = 1; J = 1; K = 0; //Reset inicial
    #2  J = 0; K = 1;
    #4 enable = 0;  J = 1; K = 0;
    #2  J = 0; K = 1;
    #2 enable = 1; J = 1; K = 1;
    #6  J = 0; K = 0;
    #2  J = 0; K = 1;
    #2  J = 0; K = 0;
    #3 $finish;

    end

  initial begin
        $dumpfile("ej03_tb.vcd");
        $dumpvars(0, testbench);
      end
endmodule
