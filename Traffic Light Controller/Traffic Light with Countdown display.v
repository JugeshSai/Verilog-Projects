module traffic_light_controller(
    input clk1,
    input reset,
    output reg red_led,
    output reg yellow_led,
    output reg green_led,
    output reg [3:0] an,
    output reg [7:0] seg
);

    wire clk_1hz, clk_500hz;

    clk_divider clkdiv_inst (
        .clk1(clk1),
        .reset(reset),
        .clk_1hz(clk_1hz),
        .clk_500hz(clk_500hz));

    reg [1:0] state;
    reg [5:0] countdown;     
    reg [3:0] digit;
    reg [1:0] refresh_digit;    
    
    parameter GREEN  = 2'b00, YELLOW = 2'b01,RED    = 2'b10;

    integer GREEN_TIME  = 15;
    integer YELLOW_TIME = 5;
    integer RED_TIME    = 15;
 
    always @(posedge clk_1hz or posedge reset) begin
        if (reset) begin
            state <= GREEN;
            countdown <= GREEN_TIME;
        end else begin
            if (countdown > 0)
                countdown <= countdown - 1;
            else begin
                case (state)
                    GREEN:  begin state <= YELLOW; countdown <= YELLOW_TIME; end
                    YELLOW: begin state <= RED;    countdown <= RED_TIME;    end
                    RED:    begin state <= GREEN;  countdown <= GREEN_TIME;  end
                endcase
            end
        end
    end

    always @(*) begin
        red_led = 0; yellow_led = 0; green_led = 0;
        case (state)
            GREEN: green_led = 1;
            YELLOW: yellow_led = 1;
            RED: red_led = 1;
        endcase
    end

    always @(posedge clk_500hz) begin
        refresh_digit <= refresh_digit + 1;
    end

    always @(*) begin
        case (refresh_digit)
            2'b00: begin an = 4'b1000; digit = countdown % 10; end
            2'b01: begin an = 4'b0100; digit  = countdown / 10;  end
            default: begin an = 4'b0000; end
        endcase
        
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

