module ClockDivider (
  input logic clk,
  input logic rst,
  input logic [15:0] divisor,
  output logic clk_out
);

  
  logic [15:0] counter;

  always_ff @(posedge clk or posedge rst) begin
    if (rst) begin
      counter <= 16'b0;
    end else begin
      if (counter == divisor - 1) begin
        counter <= 16'b0;
        clk_out <= ~clk_out; 
      end else begin
        counter <= counter + 1'b1;
      end
    end
  end

  
  initial begin
    clk_out <= 1'b0;
  end

endmodule