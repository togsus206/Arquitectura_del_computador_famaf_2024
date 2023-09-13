//Dibujar el circuito resultante de la síntesis del siguiente código en SystemVerilog:
module ej1 (input logic A, B, C, clk,
				output logic Z);
	logic P;
	always_ff @ (posedge clk)
	begin
		P <= A & B;
		Z <= P | C;
	end
endmodule