`timescale 1ms/1ns
`include "rgb_data.v"
`define TICK	0.5

module test_rgb_data;

	reg  flag;
	reg  reset;
	reg  [7:0]data;
	reg  endevent;
	wire endline;
	wire outstat;

	reg clk = 1;	// test clk

	rgb_data rgb_data(
		.reset(reset),
		.nextflag(flag),
		.data(data),
		.endevent(endline),
		.outstat(outstat)
	);

	always #(`TICK)	clk = ~clk;

	always@ (posedge clk)
	begin
		flag <= ~flag;		
	end

	always@ (posedge endline)
	begin
		endevent <= endline;
		data <= data + 1;
	end

	always@ (negedge endline)
	begin
		endevent <= endline;
	end

	initial begin
		data <= ~0;
		flag <= 0;
		endevent <= 0;
		reset <= 1;
		$dumpfile("data.vcd");
		$dumpvars;
		#10000 $finish;
	end

endmodule

