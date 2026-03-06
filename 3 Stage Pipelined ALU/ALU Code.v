`timescale 1ns / 1ps

module Pipelined_ALU(
    input clk,
    input rst,
    input c_in,
    input  [15:0] a_in,
    input  [15:0] b_in,
    input  [3:0]  op_code,
    output reg [15:0] result,
    output reg carry,
    output reg zero 
);
    // Stage 1 Registers
    reg [15:0] A_s1, B_s1;
    reg [3:0]  opcode_s1;
    reg        cin_s1;

    always @(posedge clk or posedge rst) begin
        if (rst) begin
            A_s1 <= 16'd0;
            B_s1 <= 16'd0;
            opcode_s1 <= 4'd0;
            cin_s1 <= 1'b0;
        end else begin
            A_s1 <= a_in;
            B_s1 <= b_in;
            opcode_s1 <= op_code;
            cin_s1 <= c_in;
        end
    end

    // Stage 2 - Execution Logic
    reg [15:0] alu_result_s2;
    reg carry_s2;
    
    always @(posedge clk or posedge rst) begin
    if (rst) begin
        alu_result_s2 <= 0;
        carry_s2 <= 0;
     end
     else begin  
        case (opcode_s1)
            // Arithmetic Operations
            4'd0: {carry_s2,alu_result_s2} <= {1'b0,A_s1};
            4'd1: {carry_s2,alu_result_s2} <= {1'b0,B_s1};
            4'd2: {carry_s2,alu_result_s2} <= A_s1 + B_s1; // ADD
            4'd3: {carry_s2,alu_result_s2} <= A_s1 + B_s1 + cin_s1;  // ADD WITH CARRY
            4'd4: {carry_s2,alu_result_s2} <= A_s1 - B_s1; // SUB
            4'd5: {carry_s2,alu_result_s2} <= A_s1 - B_s1 - cin_s1;  // SUB WITH BORROW
            4'd6: {carry_s2,alu_result_s2} <= A_s1 + 1'b1; // INCREMENT A             
            4'd7: {carry_s2,alu_result_s2} <= B_s1 - 1'b1; // Decrement B

            // Logical Operations
            4'd8:   begin alu_result_s2 <= A_s1 & B_s1; carry_s2 <= 1'b0; end //AND
            4'd9:   begin alu_result_s2 <= A_s1 | B_s1; carry_s2 <= 1'b0; end //OR
            4'd10:  begin alu_result_s2 <= ~(A_s1 & B_s1); carry_s2 <= 1'b0; end //NAND
            4'd11:  begin alu_result_s2 <= ~(A_s1 | B_s1); carry_s2 <= 1'b0; end //NOR
            4'd12:  begin alu_result_s2 <= A_s1 >> 1; carry_s2 <= 1'b0; end //Shift Right
            4'd13:  begin alu_result_s2 <= B_s1 << 1; carry_s2 <= 1'b0; end //Shift Left
            4'd14:  begin alu_result_s2 <= {A_s1[0], A_s1[15:1]}; carry_s2 <= 1'b0; end // Right Rotate of A
            4'd15:  begin alu_result_s2 <= {B_s1[14:0], B_s1[15]}; carry_s2 <= 1'b0; end //Left Rotate of B
            default: begin alu_result_s2 <= 16'd0; carry_s2 <= 1'b0; end
        endcase
        end
    end

   // Stage 3 - Final Output + Flags in 3rd Clock Cycle
     always @(posedge clk or posedge rst) begin
        if (rst) begin
            result <= 16'd0;
            carry <= 1'd0; 
            zero <= 1'd1;           
        end else begin
            result <= alu_result_s2;
            carry <= carry_s2;
            zero <= (alu_result_s2==16'd0);
        end
    end

endmodule
