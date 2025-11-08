`timescale 1ns / 1ps

module tb_FIFO;

    reg clk, reset;
    reg wr_en, rd_en;
    reg [7:0] data_in;
    wire [7:0] data_out;
    wire full, empty;

    FIFO dut (
        .clk(clk),
        .reset(reset),
        .wr_en(wr_en),
        .rd_en(rd_en),
        .data_in(data_in),
        .data_out(data_out),
        .full(full),
        .empty(empty)
    );

    initial clk = 0;
    always #5 clk = ~clk;
    task reset_fifo;
    begin
        reset = 1;
        wr_en = 0;
        rd_en = 0;
        data_in = 0;
        #20;               
        reset = 0;
        #10;
    end
    endtask
    task write_fifo(input [7:0] num_writes);
        integer i;
        begin
            for (i = 0; i < num_writes; i = i + 1) begin
                @(negedge clk);
                if (!full) begin
                    data_in = i + 8'hA0; 
                    wr_en = 1;
                end
                @(negedge clk);
                wr_en = 0;
            end
        end
    endtask    
    task read_fifo(input [7:0] num_reads);
        integer j;
        begin
            for (j = 0; j < num_reads; j = j + 1) begin
                @(negedge clk);
                if (!empty) begin
                    rd_en = 1;
                end
                @(negedge clk);
                rd_en = 0;
            end
        end
    endtask
    initial begin
        reset_fifo();
        // 1. Fill FIFO partially
        write_fifo(8);
        #20;
        // 2. Read few data
        read_fifo(4);
        #20;
        // 3. Fill FIFO completely to test 'full' flag
        write_fifo(12);
        #20;
        // 4. Read all data until empty
        read_fifo(16);
        #20;
        // 5. Check pointer wrap-around
        write_fifo(6);
        read_fifo(6);
        $finish;
    end
endmodule
