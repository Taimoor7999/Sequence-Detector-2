module Sequence_Detector_2_tb();

reg w, clk;
wire z;

Sequence_Detector_2 abc (
  .w(w), 
  .clk(clk), 
  .z(z)
);

initial begin
  $dumpfile("any name.vcd");
  $dumpvars(0);
end

initial begin
  clk = 0;
  w = 0;
  #20 w = 1;
  #10 w = 0;
  #20 w = 1;
  #10 w = 1;
  #10 w = 0;
  #10 w = 1;
  #10 w = 1;
  #10 w = 1;
  #10 w = 0;
  #1000 $finish();
end

always #5 clk = ~clk;


endmodule