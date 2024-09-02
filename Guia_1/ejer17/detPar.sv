// Calcula la paridad de un vector de entrada (número de unos).
// La salida es 1 si la cantidad de unos es impar, 0 si es par.

module detPar #(parameter N=4) (
  input logic [N-1:0] in,
  output logic out
);

  assign out = ^in; // Operador XOR para calcular la paridad

endmodule
