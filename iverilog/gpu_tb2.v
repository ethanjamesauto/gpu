//Test bench for gpu without built-in ram and rom
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
	wire [7:0] data;
	wire [15:0] addr_ram;
	wire [15:0] addr_rom;
	wire en_rom, load, store;

	wire [7:0] ram_out;

	gpu_nomem gpu(
		.clk(clk),
		.addr_in(16'b0),
		.start(start),
		.data(data),
		.addr_ram(addr_ram),
		.addr_rom(addr_rom),
		.load_rom(en_rom),
		.store_ram(store),
		.load_ram(load)
	);

	rom rom1(addr_rom, en_rom, data);
	ram ram1(addr_ram, data, store, clk, load, ram_out);

	initial begin
		#300000
		start = 1;
	end
	
endmodule