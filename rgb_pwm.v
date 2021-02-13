
module rgb_pwm(
	input reset,
	input clk,
	input [15:0]countmax,
	input [15:0]hivalue,
	output nopulse,
	output outpulse
);
	
	/*
	 * edge table
	 *
	 * reset: 0 is reset, 1 is running
	 * enable: 0 is disable, 1 is enable
	 *
	 */
	
	reg [15:0]_hivalue;
	reg [15:0]_hicount;
	reg [15:0]_count;
	reg _outpulse = 0;

	/* clock */
	always@ (posedge clk)
	begin
		if (reset == 0)
		begin
			_count <= 0;
			_outpulse <= 0;
		end
		else
		begin
			if (_count < countmax - 1)
				_count <= _count + 1;
			else
				_count <= 0;

			if (_count < _hicount)
				_outpulse <= 1;
			else
				_outpulse <= 0;
		end
		
	end

	/* data read */
	always@ (negedge outpulse)
	begin
		_hivalue <= hivalue;
	end

	always@ (posedge outpulse)
	begin
		_hicount <= _hivalue;
	end

	always@ (posedge reset)
	begin
		_hicount <= hivalue;
		_hivalue <= hivalue;
	end

	/* output */
	assign outpulse = (reset == 0) ? 0 : _outpulse;
	assign nopulse = (hivalue >= countmax) ? 1 : 0;

endmodule

