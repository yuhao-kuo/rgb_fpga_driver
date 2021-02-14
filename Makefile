
COMPILER=ncverilog

all: rgb_data.v rgb_driver.v rgb_pwm.v
	ncverilog rgb_driver.v

ut-data: rgb_data.v test_rgb_data.v
	ncverilog test_rgb_data.v -debug

ut-pwm: rgb_pwm.v test_rgb_pwm.v
	ncverilog test_rgb_pwm.v -debug

ut-driver: rgb_driver.v rgb_data.v rgb_pwm.v test_rgb_driver.v
	ncverilog test_rgb_driver.v -debug

clean:
	@rm -rf *.log
	@rm -rf *.history
	@rm -rf INCA_libs/
	@rm -rf nWaveLog/
	@rm -rf *.vcd
	@rm -rf *.vcd.fsdb
	@rm -rf *.rc
	@rm -rf *.conf	
	@rm -rf vfastLog/
