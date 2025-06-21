module Simple_ALU(
    input clk1,
    input rst, c_in,
    input [3:0] a_in, b_in,
    input [3:0] op_code,
    output reg carry, zero,
    output reg [3:0] an,
    output reg [7:0] seg
    );
    
    wire clk_1hz, clk_500hz;
    reg [3:0] result;
    reg [3:0] digit;
    reg [1:0] refresh_digit;
    
    clock_divider task_141(
    .clk1(clk1),
    .rst(rst),
    .clk_1hz(clk_1hz),
    .clk_500hz(clk_500hz)
  );
    
    
    always @(posedge clk_1hz or posedge rst) 
    begin
    if (rst)begin
        result <= 4'd0;
        carry  <= 1'd0;
        zero   <= 1'd1;
    end
    
    else begin
        
        case (op_code)
        // MSB of op_code is assigned as ALU
        //Here I have assigned Arithmetic unit for MSB=0
        
        4'd0:   {carry , result} <= {1'b0, a_in};
        4'd1:   {carry , result} <= {1'b0, b_in};
        4'd2:   {carry , result} <= a_in + b_in;
        4'd3:   {carry , result} <= a_in + b_in + c_in;
        4'd4:   {carry , result} <= a_in - b_in;
        4'd5:   {carry , result} <= a_in - b_in - c_in;//////////////////////////////////////////////////////////////////////////////////////////////////////////////
        4'd6:   {carry , result} <= a_in + 1'b1;
        4'd7:   {carry , result} <= b_in - 1'b1;
        
        //Here I have assigned Logical unit for MSB=1
        
        4'd8:   begin result <= a_in & b_in; carry <= 1'b0; end //AND
        4'd9:   begin result <= a_in | b_in; carry <= 1'b0; end //OR
        4'd10:  begin result <= ~(a_in & b_in); carry <= 1'b0; end //NAND
        4'd11:  begin result <= ~(a_in | b_in); carry <= 1'b0; end //NOR
        4'd12:  begin result <= a_in >> 1; carry <= 1'b0; end //Shift Right
        4'd13:  begin result <= b_in << 1; carry <= 1'b0; end //Shift Left
        4'd14:  begin result <= {a_in[0], a_in[3:1]}; carry <= 1'b0; end // Right Rotate of A
        4'd15:  begin result <= {b_in[2:0], b_in[3]}; carry <= 1'b0; end //Left Rotate of B
        default: begin result <= 4'd0; carry <= 1'b0; end
        endcase
        
        zero <= (result==4'b0000);
        end
     end
     
     always @(posedge clk_500hz or posedge rst)
     begin
        if(rst)
            refresh_digit <= 2'd0;
        else
            refresh_digit <= refresh_digit + 1;
     end
     always @(*) begin
        case (refresh_digit)
            2'd0: begin an = 4'b1000; digit = result % 10 ; end
            2'd1: begin an = 4'b0100; digit = result / 10; end
            2'd2: begin an = 4'b0010; digit = b_in;        end
            2'd3: begin an = 4'b0001; digit = a_in;        end
            default: an = 4'b0000;
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
