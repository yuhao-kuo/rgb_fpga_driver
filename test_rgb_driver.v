`timescale 1us/1ns
`include "rgb_driver.v"
`define CYCLE 0.5

module test_rgb_driver();

	reg reset = 0;
	reg enable = 1;
	reg [7:0]clk_div = 0;
	reg [15:0]clk_max = 20;
	reg [15:0]hi_in_1 = 15;
	reg [15:0]hi_in_0 = 8;
	
	wire no_pulse;
	wire out;
	wire complete_event;

	reg clk = 0;
	reg [2:0]count = 3'h0;
	reg data_next = 0;
	reg [7:0]data = 0;
	
	initial begin
		$dumpfile("/home/yuhao/verilog/driver.vcd");
		$dumpvars;
		# (2 * `CYCLE) reset <= 1;
		#100000 $finish;
	end
	
	always #(2 * `CYCLE) clk = ~clk;

	always @(posedge complete_event) begin
		data <= data + 1;
		/*if (count == 1) begin
			data_next <= 1;
		end else begin
			data_next <= 0;
		end
		count <= count + 1;*/
	end

	/*always @(data_next) begin
		data <= data + 1;
	end*/

	rgb_driver driver(reset, clk, enable, clk_div, clk_max, data, hi_in_1, hi_in_0, no_pulse, out, complete_event);

endmodule

