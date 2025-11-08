`timescale 1ns / 1ps

module FIFO(
    input clk, reset,
    input wr_en, rd_en,
    input [7:0] data_in,
    output reg [7:0] data_out,
    output full,empty
    );
    
    reg [7:0] mem [0:15];
    reg [3:0] rd_ptr, wr_ptr;
    reg [4:0] count;
    
    always @(posedge clk)
    begin
    if (reset)
        wr_ptr <= 4'd0;
    else if (wr_en && !full) begin
        mem[wr_ptr] <= data_in;
        wr_ptr <= (wr_ptr == 15)? 4'd0 : wr_ptr + 1; 
    end
    else
        wr_ptr <= wr_ptr;
    end
    
    always @(posedge clk)
    begin
    if (reset)
        rd_ptr <= 4'd0;
    else if (rd_en && !empty) begin
        data_out <= mem[rd_ptr];
        rd_ptr <= (rd_ptr == 15)? 4'd0 : rd_ptr + 1;
        end        
    else
        rd_ptr <= rd_ptr;
    end
    
    always @(posedge clk)
    begin
    if (reset)
        count <= 5'd0;
    else begin
    case ({wr_en && !full, rd_en && !empty})
        2'b10: count <= count + 1;
        2'b01: count <= count - 1;
        default: count <= count;
    endcase
    end
    end
    
    assign full = (count == 15)? 1'b1 : 1'b0;
    assign empty = (count == 0)? 1'b1 : 1'b0;
    
endmodule
