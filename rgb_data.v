
module rgb_data(
	input reset,
	input nextflag, 
	input [7:0]data,
	output endevent,
	output outstat
);

	reg [3:0]_bitcnt;

	always@ (reset)
	begin
		_bitcnt <= 0;
	end

	always@ (posedge nextflag)
	begin
		if (_bitcnt == 7)
			_bitcnt <= 0;
		else
			_bitcnt <= _bitcnt + 1;
	end

	assign outstat = data[_bitcnt];
	assign endevent = (_bitcnt == 7) ? 1 : 0;

endmodule

