`include "rgb_data.v"
`include "rgb_pwm.v"

module rgb_driver(
	input  reset,
	input  clk,
	input  en,
	input  [7:0]clkdiv,
	input  [15:0]clkmax,
	input  [7:0]data,
	input  [15:0]hi_in_1,
	input  [15:0]hi_in_0,
	output nopulse,
	output outpin
);

	wire [15:0]pwm_hi_range;
	wire data_bit_out;
	wire data_transmit_complete_event;
	
	reg  [7:0]count;
	
	rgb_data rgb_data(
		.reset(reset),
		.nextflag(outpin),
		.data(data),
		.endevent(data_transmit_complete_event),
		.outstat(data_bit_out)
	);

	rgb_pwm rgb_pwm(
		.reset(reset),
		.clk(clk),
		.countmax(clkmax),
		.hivalue(pwm_hi_range),
		.nopulse(nopulse),
		.outpulse(outpin)
	);

	/* pwm count line */
	
	/* pwm clock */

	/* data next pulse */
	assign pwm_hi_range = (data_bit_out == 1) ? hi_in_1 : hi_in_0;

endmodule

