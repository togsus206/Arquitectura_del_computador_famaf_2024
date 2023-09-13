module ejer10 (input logic A, B, C, clk,
				output logic Z);
		logic P;
		assign P = A & B;
		always_ff @ (posedge clk)
		begin
			Z <= P | C;
		end
endmodule

/*
Usar el RTL simulation con el TB del ejer10 para ver en el tiempo
como cambian los valores de las señales
*/