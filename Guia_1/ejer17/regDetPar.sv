// El módulo regDetPar instancia el detector de paridad y el flip-flop.
// La salida del detector de paridad se conecta a la entrada D del flip-flop.
// La salida del flip-flop es la salida final del módulo.
/*
module regDetPar #(parameter N=4)(
  input logic [N-1:0] input1, clk, reset,
  output logic output1
);

  logic out;
  detPar #(N) parity (
    .in(input1),
    .out(out)
  );
  flipFlop ff (
    .clk(clk),
    .reset(reset),
    .d(out),
    .q(output1)
  );

endmodule
*/

module regDetPar #(parameter N=4)(
  input logic [N-1:0] input1, clk, reset,
  output logic output1
);

  logic out;
  
  detPar parity(input1, out);
  
  flipFlop ff (clk, reset, out, output1);

endmodule
