module imem_tb #(parameter N=32)();
	logic [5:0]addr;
	logic [N-1:0]q;
	logic [31:0] errors, test;
	
	logic [N-1:0] rom [0:63] = '{default:0};
	initial begin 
	
					rom =	 '{32'hcb1e03de, 32'h8b040000, 32'h00000000, 32'h00000000, 
										32'h8b040001, 32'h00000000, 32'h00000000, 32'h8b040022, 
										32'h00000000, 32'h00000000, 32'h8b040043, 32'hf80003c0, 
										32'hf80083c1, 32'hf80103c2, 32'hf80183c3, 32'hb400001e, 
										32'h00000000, 32'h00000000, 32'h00000000, 32'h00000000, 
										32'h00000000, 32'h00000000, 32'h00000000, 32'h00000000, 
										32'h00000000, 32'h00000000, 32'h00000000, 32'h00000000, 
										32'h00000000, 32'h00000000, 32'h00000000, 32'h00000000,
										32'h00000000, 32'h00000000, 32'h00000000, 32'h00000000,
										32'h00000000, 32'h00000000, 32'h00000000, 32'h00000000,
										32'h00000000, 32'h00000000, 32'h00000000, 32'h00000000,
										32'h00000000, 32'h00000000, 32'h00000000, 32'h00000000,
										32'h00000000, 32'h00000000, 32'h00000000, 32'h00000000,
										32'h00000000, 32'h00000000, 32'h00000000, 32'h00000000,
										32'h00000000, 32'h00000000, 32'h00000000, 32'h00000000,
										32'h00000000, 32'h00000000, 32'h00000000, 32'h00000000};
	end
	
	imem dut(addr,q);
	initial begin
		addr = 6'b0; #10;
		
		while (addr < 6'b110010 ) begin
			test = test + 1;
			if (q !== rom[addr]) begin $display("failed q= %h and rom[addr]= %h.",q,rom[addr]); #10;errors = errors + 1; end
			else if (q === rom[addr]) begin $display("Ok q= %h and rom[addr]= %h.",q,rom[addr]); #10; end
			addr++; #10;
		end
		$display("%d/%d tests finished succesfully", test-errors, test);
		$stop;
	end
	
	initial begin
		test = 0; errors = 0;
	end
		
		
endmodule 
