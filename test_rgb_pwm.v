`timescale 1us/1ns
`include "rgb_pwm.v"

module test_rgb_pwm;

	reg  reset;
	reg  clk = 0;
	reg  [15:0]countmax;
	reg  [15:0]hivalue;
	wire pwmoutput;
	wire nopulse;

	reg  [15:0]test_hivalue[1:0];
	reg  test_hivalue_cnt;

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
		if (reset == 1)
			clk <= ~clk;
		else
			clk <= 0;
	end

	always@ (nopulse)
	begin
		$display("%d nopulse edge -> %d", $stime, nopulse);
	end

	always@ (negedge pwmoutput)
	begin
		if (reset == 1)
			$display("%d, %d, neg %d", $stime, hivalue, pwmoutput);
		else
			$display("xxx disable, %d, pwm out = %d", $stime, pwmoutput);
	end

	always@ (posedge pwmoutput)
	begin
		if (reset == 1)
		begin
			$display("%d, %d, pos %d", $stime, hivalue, pwmoutput);
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
		#0 countmax = 8; hivalue = 6;
		   test_hivalue[0] = 3;
		   test_hivalue[1] = 6;
		   test_hivalue_cnt = 0;
		/* Test PWM output */
		   $display("Test PWM Output.\noutput = %d", pwmoutput);
		   reset = 0;
		#1 reset = 1;
		#64
		#1 $finish;
	end

endmodule

