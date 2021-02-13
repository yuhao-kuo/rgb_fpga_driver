`timescale 1ms/1ns
`include "rgb_data.v"

module test_rgb_data;

	reg  flag;
	reg  reset;
	reg  [7:0]datas[16:0];
	wire [7:0]data;
	reg  endevent;
	wire endline;
	wire outstat;
	reg  [7:0]count;

	rgb_data rgb_data(
		.reset(reset),
		.nextflag(flag),
		.data(data),
		.endevent(endline),
		.outstat(outstat)
	);

	always@ (posedge reset)
	begin
		   datas[0] = 8'h05;
		   datas[1] = 8'h02;
		   datas[2] = 8'h03;
		   datas[3] = 8'h04;
		   datas[4] = 8'h05;
		   datas[5] = 8'h06;
		   datas[6] = 8'h07;
		   datas[7] = 8'h08;
		   count = 0;
		   flag = 0;
		   endevent <= 0;
	end

	always@ (posedge endline)
	begin
		endevent <= endline;
		if (count >= 47)
			count <= 0;
		else
			count <= count + 1;
	end

	always@ (negedge endline)
	begin
		endevent <= endline;
	end

	assign data = datas[count];

	initial begin
		$dumpfile("data.vcd");
		$dumpvars;
		#0 flag = 0;
		   reset = 1;
		   $display("time, [flag, out, endevnet], [count] = data");
		   $display("%dus [%d, %d, %d], [%d] = %d", $stime, flag, outstat, endevent, count, data);
		#1 flag = ~flag;
		   $display("%dus [%d, %d, %d], [%d] = %d", $stime, flag, outstat, endevent, count, data);
		#1 flag = ~flag;
		   $display("%dus [%d, %d, %d], [%d] = %d", $stime, flag, outstat, endevent, count, data);
		#1 flag = ~flag;
		   $display("%dus [%d, %d, %d], [%d] = %d", $stime, flag, outstat, endevent, count, data);
		#1 flag = ~flag;
		   $display("%dus [%d, %d, %d], [%d] = %d", $stime, flag, outstat, endevent, count, data);
		#1 flag = ~flag;
		   $display("%dus [%d, %d, %d], [%d] = %d", $stime, flag, outstat, endevent, count, data);
		#1 flag = ~flag;
		   $display("%dus [%d, %d, %d], [%d] = %d", $stime, flag, outstat, endevent, count, data);
		#1 flag = ~flag;
		   $display("%dus [%d, %d, %d], [%d] = %d", $stime, flag, outstat, endevent, count, data);
		#1 flag = ~flag;
		   $display("%dus [%d, %d, %d], [%d] = %d", $stime, flag, outstat, endevent, count, data);
		#1 flag = ~flag;
		   $display("%dus [%d, %d, %d], [%d] = %d", $stime, flag, outstat, endevent, count, data);
		#1 flag = ~flag;
		   $display("%dus [%d, %d, %d], [%d] = %d", $stime, flag, outstat, endevent, count, data);
		#1 flag = ~flag;
		   $display("%dus [%d, %d, %d], [%d] = %d", $stime, flag, outstat, endevent, count, data);
		#1 flag = ~flag;
		   $display("%dus [%d, %d, %d], [%d] = %d", $stime, flag, outstat, endevent, count, data);
		#1 flag = ~flag;
		   $display("%dus [%d, %d, %d], [%d] = %d", $stime, flag, outstat, endevent, count, data);
		#1 flag = ~flag;
		   $display("%dus [%d, %d, %d], [%d] = %d", $stime, flag, outstat, endevent, count, data);
		#1 flag = ~flag;
		   $display("%dus [%d, %d, %d], [%d] = %d", $stime, flag, outstat, endevent, count, data);
		#1 flag = ~flag;
		   $display("%dus [%d, %d, %d], [%d] = %d", $stime, flag, outstat, endevent, count, data);
		#1 flag = ~flag;
		   $display("%dus [%d, %d, %d], [%d] = %d", $stime, flag, outstat, endevent, count, data);
		#1 flag = ~flag;
		   $display("%dus [%d, %d, %d], [%d] = %d", $stime, flag, outstat, endevent, count, data);
		#1 flag = ~flag;
		   $display("%dus [%d, %d, %d], [%d] = %d", $stime, flag, outstat, endevent, count, data);
		#1 flag = ~flag;
		   $display("%dus [%d, %d, %d], [%d] = %d", $stime, flag, outstat, endevent, count, data);
		#1 flag = ~flag;
		   $display("%dus [%d, %d, %d], [%d] = %d", $stime, flag, outstat, endevent, count, data);
		#1 flag = ~flag;
		   $display("%dus [%d, %d, %d], [%d] = %d", $stime, flag, outstat, endevent, count, data);
		#1 flag = ~flag;
		   $display("%dus [%d, %d, %d], [%d] = %d", $stime, flag, outstat, endevent, count, data);
		#1 flag = ~flag;
		   $display("%dus [%d, %d, %d], [%d] = %d", $stime, flag, outstat, endevent, count, data);
		#1 flag = ~flag;
		   $display("%dus [%d, %d, %d], [%d] = %d", $stime, flag, outstat, endevent, count, data);
		#1 flag = ~flag;
		   $display("%dus [%d, %d, %d], [%d] = %d", $stime, flag, outstat, endevent, count, data);
		#1 flag = ~flag;
		   $display("%dus [%d, %d, %d], [%d] = %d", $stime, flag, outstat, endevent, count, data);
		#1 flag = ~flag;
		   $display("%dus [%d, %d, %d], [%d] = %d", $stime, flag, outstat, endevent, count, data);
		#1 flag = ~flag;
		   $display("%dus [%d, %d, %d], [%d] = %d", $stime, flag, outstat, endevent, count, data);
		#1 flag = ~flag;
		   $display("%dus [%d, %d, %d], [%d] = %d", $stime, flag, outstat, endevent, count, data);
		#1 flag = ~flag;
		   $display("%dus [%d, %d, %d], [%d] = %d", $stime, flag, outstat, endevent, count, data);
		#1 flag = ~flag;
		   $display("%dus [%d, %d, %d], [%d] = %d", $stime, flag, outstat, endevent, count, data);
		#1 flag = ~flag;
		   $display("%dus [%d, %d, %d], [%d] = %d", $stime, flag, outstat, endevent, count, data);
		#1 flag = ~flag;
		   $display("%dus [%d, %d, %d], [%d] = %d", $stime, flag, outstat, endevent, count, data);
		#1 flag = ~flag;
		   $display("%dus [%d, %d, %d], [%d] = %d", $stime, flag, outstat, endevent, count, data);
		#1 flag = ~flag;
		   $display("%dus [%d, %d, %d], [%d] = %d", $stime, flag, outstat, endevent, count, data);
		#1 flag = ~flag;
		   $display("%dus [%d, %d, %d], [%d] = %d", $stime, flag, outstat, endevent, count, data);
		#1 flag = ~flag;
		   $display("%dus [%d, %d, %d], [%d] = %d", $stime, flag, outstat, endevent, count, data);
		#1 flag = ~flag;
		   $display("%dus [%d, %d, %d], [%d] = %d", $stime, flag, outstat, endevent, count, data);
		#1 flag = ~flag;
		   $display("%dus [%d, %d, %d], [%d] = %d", $stime, flag, outstat, endevent, count, data);
		#1 flag = ~flag;
		   $display("%dus [%d, %d, %d], [%d] = %d", $stime, flag, outstat, endevent, count, data);
		#1 flag = ~flag;
		   $display("%dus [%d, %d, %d], [%d] = %d", $stime, flag, outstat, endevent, count, data);
		#1 flag = ~flag;
		   $display("%dus [%d, %d, %d], [%d] = %d", $stime, flag, outstat, endevent, count, data);
		#1 flag = ~flag;
		   $display("%dus [%d, %d, %d], [%d] = %d", $stime, flag, outstat, endevent, count, data);
		#1 flag = ~flag;
		   $display("%dus [%d, %d, %d], [%d] = %d", $stime, flag, outstat, endevent, count, data);
		#1 flag = ~flag;
		   $display("%dus [%d, %d, %d], [%d] = %d", $stime, flag, outstat, endevent, count, data);
		#1 flag = ~flag;
		   $display("%dus [%d, %d, %d], [%d] = %d", $stime, flag, outstat, endevent, count, data);
		#1 flag = ~flag;
		   $display("%dus [%d, %d, %d], [%d] = %d", $stime, flag, outstat, endevent, count, data);
		#1 flag = ~flag;
		   $display("%dus [%d, %d, %d], [%d] = %d", $stime, flag, outstat, endevent, count, data);
		#1 flag = ~flag;
		   $display("%dus [%d, %d, %d], [%d] = %d", $stime, flag, outstat, endevent, count, data);
		#1 $finish;
	end

endmodule

