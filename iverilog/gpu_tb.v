//Test bench for gpu with built-in ram and rom
module gpu_tb;
	reg clk = 0;
	initial begin
		repeat(4096*128) begin
			#1 clk = !clk;
		end
	end
	
	initial begin
		$dumpfile("gpu_tb.vcd");
		$dumpvars;
	end
	reg start = 0;
	gpu gpu(
		.clk(clk),
		.start(start),
		.addr_in(16'b0)
	);

	initial begin
		#300000
		start = 1;
	end
	
endmodule