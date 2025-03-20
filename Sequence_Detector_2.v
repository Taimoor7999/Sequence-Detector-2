// Design and implement a sequence detector that meets the following specifications: 

//      The detector contains single input 'w' and output 'z'.  
//      All changes in the circuit occur on the positive edge of a clock signal. 
//      The output 'z' is equal to '1' only if input 'w' receives ‘’1’’ in 2 consecutive clock cycles. 
//      If the input remains 1 then output will remain 1

module Sequence_Detector_2(w, clk, z);

input w, clk;
output reg z;

reg [1:0] CS, NS;

initial begin
  CS = 2'b00;
  NS = 2'b00;
end

always @(posedge clk) begin
  CS <= NS;
end

always @(*) begin

  case (CS) 

    2'b00:begin
      if(w === 1) begin
        NS = 2'b01;
        z = 0;
      end
      else begin
        NS = 2'b00;
        z = 0;       
      end
    end

    2'b01:begin
      if(w === 1) begin
        NS = 2'b10;
        z = 0;
      end
      else begin
        NS = 2'b00;
        z = 0;       
      end      
    end

    2'b10:begin
      if(w === 1) begin
        NS = 2'b10;
        z = 1;
      end
      else begin
        NS = 2'b00;
        z = 0;       
      end      
    end
      
  endcase
end

endmodule