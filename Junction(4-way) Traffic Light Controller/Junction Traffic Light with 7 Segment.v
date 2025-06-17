
module Junction_Traffic_Light(
    input clk1,
    input reset,
    output reg Red_S, Yellow_S, Green_S, Red_W ,Yellow_W ,Green_W,
    Red_N ,Yellow_N ,Green_N, Red_E ,Yellow_E ,Green_E,
    output reg [3:0] an,
    output reg [7:0] seg
);

    wire clk_1hz, clk_500hz;

    clk_divider clk_inst (
        .clk1(clk1),
        .reset(reset),
        .clk_1hz(clk_1hz),
        .clk_500hz(clk_500hz));

    reg [2:0] state;
    reg [2:0] countdown;     
    reg [3:0] digit;
    reg [1:0] refresh_digit;    
    
    parameter GREEN_S = 3'b000, YELLOW_S = 3'b001, GREEN_W = 3'b010, YELLOW_W = 3'b011, 
    GREEN_N = 3'b100, YELLOW_N = 3'b101, GREEN_E = 3'b110, YELLOW_E = 3'b111;

    integer GREEN_TIME  = 5;
    integer YELLOW_TIME = 2;
    
        
     
    always @(posedge clk_1hz or posedge reset) begin
        if (reset) begin
            state <= GREEN_S;
            countdown <= GREEN_TIME;
        end else begin
            if (countdown > 0)
                countdown <= countdown - 1;
            else begin
                case (state)
                    GREEN_S :  begin state <= YELLOW_S ; countdown <= YELLOW_TIME; end
                    YELLOW_S : begin state <= GREEN_W ;  countdown <= GREEN_TIME; end
                    GREEN_W :  begin state <= YELLOW_W ; countdown <= YELLOW_TIME; end
                    YELLOW_W : begin state <= GREEN_N ;  countdown <= GREEN_TIME; end
                    GREEN_N :  begin state <= YELLOW_N ; countdown <= YELLOW_TIME; end
                    YELLOW_N : begin state <= GREEN_E ;  countdown <= GREEN_TIME; end
                    GREEN_E :  begin state <= YELLOW_E ; countdown <= YELLOW_TIME; end
                    YELLOW_E : begin state <= GREEN_S ;  countdown <= GREEN_TIME; end
                endcase
            end
        end
    end

    always @(*) begin
        Red_S = 1; Yellow_S = 0; Green_S = 0;
        Red_W = 1; Yellow_W = 0; Green_W = 0;
        Red_N = 1; Yellow_N = 0; Green_N = 0;
        Red_E = 1; Yellow_E = 0; Green_E = 0;
        case (state)
            GREEN_S :  begin Green_S = 1;  Red_S = 0; end
            YELLOW_S : begin Yellow_S = 1; Red_S = 0; end
            GREEN_W :  begin Green_W = 1;  Red_W = 0; end
            YELLOW_W : begin Yellow_W = 1; Red_W = 0; end
            GREEN_N :  begin Green_N = 1;  Red_N = 0; end
            YELLOW_N : begin Yellow_N = 1; Red_N = 0; end
            GREEN_E :  begin Green_E = 1;  Red_E = 0; end
            YELLOW_E : begin Yellow_E = 1; Red_E = 0; end
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
