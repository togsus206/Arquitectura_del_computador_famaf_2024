//El flip-flop se activa en el flanco de subida del reloj o en un reset activo a bajo.
//Si hay un reset, la salida se fuerza a 0.
//En caso contrario, la salida toma el valor de la entrada D.


module flipFlop (
  input logic clk, reset, d,
  output logic q
);

  always_ff @(posedge clk or negedge reset) begin
    if (!reset)
      q <= 0;
    else
      q <= d;
  end

endmodule
