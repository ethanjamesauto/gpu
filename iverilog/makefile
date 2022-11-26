all:
	iverilog -o gpu.vpp gpu_tb2.v gpu_nomem.v rom.v
#	iverilog -o gpu.vpp gpu_tb.v gpu.v
	vvp gpu.vpp > out.txt

view: all
	gtkwave gpu_tb.vcd