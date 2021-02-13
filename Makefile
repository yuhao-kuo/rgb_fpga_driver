
COMPILER=ncverilog

all: rgb_data.v rgb_driver.v rgb_pwm.v
	ncverilog rgb_driver.v

clean:
	@rm -rf *.log
	@rm -rf *.history
