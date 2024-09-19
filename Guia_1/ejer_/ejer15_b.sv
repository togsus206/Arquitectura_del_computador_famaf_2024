module circuito_tb();

	logic clk, reset, enable, s;
	______logic__[3:0]____ L;
	logic [7:0] a, b, q;
	______circuito______ dut (__clk, reset,enable,s,a,b ,q, L____________________);


	always
		begin
			clk = __0____; #100; clk = __1___; #100;
		end

	initial
		begin
			reset = 0; enable = 0; s = 1; ____#250______ ;
			_____reset_____ = 1;
			a = 8'b01010101;
			b = _____8'b1111_1111____ ; ______#200____ ;
			______enable____ = 1; _____#50_____ ;
			s = 0; ____#200______ ;
			$stop;
		____end________


endmodule
