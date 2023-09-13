module ejer9 (input logic A, B, C, clk,
				  output logic Z);
		logic P;
		always_ff @ (posedge clk)
		begin
			P <= A & B;
			Z <= P | C;
		end
endmodule

/*
Compilar el codigo del ejercicio
luego ir a Tools-> Netlist Viewer -> RTL viewer
para ver el dibujo
*/