all:
	iverilog -o verilog.vpp *.v
#	iverilog -o gpu.vpp gpu_tb.v gpu.v
	vvp verilog.vpp > out.txt

view: all
	gtkwave verilog_tb.vcd