module clock_divider(
    input clk1,
    input rst,
    output reg clk_1hz,
    output reg clk_500hz
);

    reg [26:0] cnt_1hz = 0;
    reg [16:0] cnt_500hz = 0;

    always @(posedge clk1 or posedge rst) begin
        if (rst) begin
            cnt_1hz <= 0;
            clk_1hz <= 0;
        end else if (cnt_1hz == 24999999) begin
            cnt_1hz <= 0;
            clk_1hz <= ~clk_1hz;
        end else cnt_1hz <= cnt_1hz + 1;
    end
 
    always @(posedge clk1 or posedge rst) begin
        if (rst) begin
            cnt_500hz <= 0;
            clk_500hz <= 0;
        end else if (cnt_500hz == 49999) begin
            cnt_500hz <= 0;
            clk_500hz <= ~clk_500hz;
        end else cnt_500hz <= cnt_500hz + 1;
    end
endmodule
