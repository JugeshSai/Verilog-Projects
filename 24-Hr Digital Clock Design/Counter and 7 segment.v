module seg_counter (
    input clk_1hz, clk_500hz,
    input rst,
    output reg [3:0] out,
    output reg [7:0] seg
);

    reg [5:0] seconds;     
    reg [5:0] minutes;     
    reg [4:0] hours;       

    reg [1:0] mux_counter;
    reg [3:0] digit;
    
    always @(posedge clk_1hz or posedge rst) begin
        if (rst) begin
            seconds <= 0;
            minutes <= 0;
            hours   <= 0;
        end else begin
            if (seconds < 59)
                seconds <= seconds + 1;
            else begin
                seconds <= 0;
                if (minutes < 59)
                    minutes <= minutes + 1;
                else begin
                    minutes <= 0;
                    if (hours < 23)
                        hours <= hours + 1;
                    else
                        hours <= 0;
                end
            end
        end
    end

    always @(posedge clk_500hz or posedge rst) begin
        if (rst)
            mux_counter <= 0;
        else
            mux_counter <= mux_counter + 1;
    end

     always @(*) begin
        case (mux_counter)
            2'b00: begin
                out = 4'b0001;
                digit = hours / 10;       
            end
            2'b01: begin
                out = 4'b0010;
                digit = hours % 10;       
            end
            2'b10: begin
                out = 4'b0100;
                digit = minutes / 10;    
            end
            2'b11: begin
                out = 4'b1000;
                digit = minutes % 10;    
            end
        endcase
    end

    always @(*) begin
        case (digit)
            4'd0: seg = 8'b00000011;
            4'd1: seg = 8'b10011111;
            4'd2: seg = 8'b00100101;
            4'd3: seg = 8'b00001101;
            4'd4: seg = 8'b10011001;
            4'd5: seg = 8'b01001001;
            4'd6: seg = 8'b01000001;
            4'd7: seg = 8'b00011111;
            4'd8: seg = 8'b00000001;
            4'd9: seg = 8'b00001001;
            default: seg = 8'b11111111;
        endcase
    end

endmodule
