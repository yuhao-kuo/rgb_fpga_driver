`timescale 1us/1ns
`include "rgb_pwm.v"
`define CYCLE	8
`define HI_1	6
`define HI_0	3

module test_rgb_pwm;

	reg  reset = 0;
	reg  clk = 0;
	reg  [15:0]countmax = `CYCLE;
	reg  [15:0]hivalue = `HI_1;
	wire pwmoutput;
	wire nopulse;

	reg  [15:0]test_hivalue[1:0];
	reg  test_hivalue_cnt = 0;

	rgb_pwm rgb_pwm(
		.reset(reset),
		.clk(clk),
		.countmax(countmax),
		.hivalue(hivalue),
		.nopulse(nopulse),
		.outpulse(pwmoutput)
	);

	always #0.5
	begin
		test_hivalue[0] <= `HI_0;
		test_hivalue[1] <= `HI_1;
		if (reset == 1)
			clk <= ~clk;
		else
			clk <= 0;
	end

	always@ (posedge pwmoutput)
	begin
		if (reset == 1)
		begin
			hivalue <= test_hivalue[test_hivalue_cnt];
			test_hivalue_cnt <= ~test_hivalue_cnt;
		end
		else
		begin
			hivalue <= 0;
			test_hivalue_cnt <= 0;
		end
	end

	initial begin
		$dumpfile("pwm.vcd");
		$dumpvars;
		/* Test nopulse bit */
		/*#0 countmax = 8; hivalue = 6;
		   test_hivalue[0] = 3;
		   test_hivalue[1] = 6;
		   test_hivalue_cnt = 0;*/
		/* Test PWM output */
		   $display("Test PWM Output.\noutput = %d", pwmoutput);
		   reset = 0;
		#1 reset = 1;
		#10000 $finish;
	end

endmodule

