`timescale 1ns / 1ps

module tb_Pipelined_ALU;

reg clk;
reg rst;
reg c_in;
reg [15:0] a_in;
reg [15:0] b_in;
reg [3:0] op_code;
wire [15:0] result;
wire carry;
wire zero;

Pipelined_ALU dut (
    .clk(clk),
    .rst(rst),
    .c_in(c_in),
    .a_in(a_in),
    .b_in(b_in),
    .op_code(op_code),
    .result(result),
    .carry(carry),
    .zero(zero)
);

always #5 clk = ~clk;
initial begin
    clk = 0;
    rst = 1;
    c_in = 0;
    a_in = 0;
    b_in = 0;
    op_code = 0;

    #20 rst = 0;

    // PASS A
    #10 a_in = 16'h0005; op_code = 0;

    // PASS B
    #10 b_in = 16'h000A; op_code = 1;

    // ADD
    #10 a_in = 16'hFFFF; b_in = 16'h0003; op_code = 2;

    // ADD WITH CARRY
    #10 a_in = 16'h0004; b_in = 16'h0003; c_in = 1; op_code = 3;

    // SUB
    #10 a_in = 16'h0009; b_in = 16'h0003; c_in = 0; op_code = 4;

    // AND
    #10 a_in = 16'h00F0; b_in = 16'h0F0F; op_code = 8;

    // OR
    #10 op_code = 9;

    // SHIFT RIGHT
    #10 a_in = 16'h0010; op_code = 12;

    // SHIFT LEFT
    #10 b_in = 16'h0008; op_code = 13;

    // ROTATE RIGHT
    #10 a_in = 16'h0001; op_code = 14;

    // ROTATE LEFT
    #10 b_in = 16'h8000; op_code = 15;

    #100 $finish;

end

endmodule
