module clock_divider(clock50M, reset, slow_clock, count_div);
input clock50M, reset;
output reg slow_clock;
output reg [25:0] count_div;

parameter DIV_COUNT = 26'd24_999_999;

always @(posedge clock50M or negedge reset) begin
    if (!reset) begin
        count_div <= 0;
        slow_clock <= 0;
    end
    else begin
        if (count_div == DIV_COUNT) begin
            count_div <= 0;
            slow_clock <= ~slow_clock;
        end
        else begin
            count_div <= count_div + 1;
        end
    end
end

endmodule


