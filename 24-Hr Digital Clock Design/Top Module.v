module top_module(
  input clk1,
  input rst,
  output wire [7:0] seg,
  output wire [3:0] out
);

  wire clk_1hz, clk_500hz;

  clock_divider dut1(
    .clk1(clk1),
    .rst(rst),
    .clk_1hz(clk_1hz),
    .clk_500hz(clk_500hz)
  );

  seg_counter dut2(
    .clk_1hz(clk_1hz),
    .clk_500hz(clk_500hz),
    .rst(rst),
    .out(out),
    .seg(seg)
  );
endmodule

