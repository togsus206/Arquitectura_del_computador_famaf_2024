module signext_tb();
	logic clk;
	logic [31:0] a;
	logic [63:0] y, yexpected;
	logic [31:0] errors, test;
	
	logic [95:0] tests [0:9] = '{
	//		   opcode     DT_Addr  op  Rn    Rt
		{32'b11111000010_000000000_00_00001_00000, 64'h0},   			  // LDUR, x0, [x1, #0x0]
		{32'b11111000000_000000000_00_00001_00000, 64'h0},   			  // STUR, x0, [x1, #0x0]
		{32'b11111000010_001010001_00_00101_01101, 64'h51}, 			  // LDUR, x5, [x13, #0x51]
		{32'b11111000000_001010001_00_00101_01101, 64'h51}, 			  // STUR, x5, [x13, #0x51]
		{32'b11111000010_101010001_00_00101_01101, 64'hffffffffffffff51}, // LDUR, x5, [x13, #0x151]
		{32'b11111000000_101010001_00_00101_01101, 64'hffffffffffffff51}, // STUR, x5, [x13, #0x151]
	//        opcode     COND_BR_Addr      Rt
		{32'b10110100_0000000000000000000_00000, 64'h0}, 				// CBZ x0, #0x0
		{32'b10110100_0000000000000001111_00000, 64'hf}, 				// CBZ x0, #0x78000
		{32'b10110100_1011000101110100001_00000, 64'hfffffffffffd8ba1},	// CBZ x0, #0x58ba1
		
		{32'b10101010101001010101101010110111, 64'h0} // random junk
	};
	
	signext dut(a, y);
	
	always begin
		clk = 0; #5; clk = 1; #5;
	end
		
	always @(negedge clk) begin
		{a, yexpected} = tests[test];
		test = test + 1;
	end
	
	always @(posedge clk) begin
		#1;
		if (y !== yexpected) begin
			$display("error: test finished with unexpected result!");
			$display("y = %h (expected %h) in %dth instance", y, yexpected, test);
			errors = errors + 1;
		end
		
		if (tests[test] === 96'bx) begin
			$display("%d/%d tests finished succesfully", test-errors, test);
			$stop;
		end
	end
	
	initial begin
		test = 0; errors = 0;
	end
endmodule