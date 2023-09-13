module execute #(parameter N = 64) (input logic  AluSrc,
												 input logic  [3:0] AluControl,
												 input logic  [N-1:0] PC_E, signImm_E, readData1_E, readData2_E,
												 output logic [N-1:0] PCBranch_E, aluResult_E, writeData_E,
												 output logic zero_E);
	
	// salida del mux y salida del shift
	logic [63:0] muxOut, shiftOut;
	
	// instanciacion del mux
	mux2 execMux(readData2_E, signImm_E, AluSrc, muxOut);
	
	// instanciacion de la alu
	alu execAlu(readData1_E, muxOut, AluControl, aluResult_E, zero_E);
	
	// instanciacion del shift
	sl2 execShift(signImm_E, shiftOut);
	
	// instanciacion del sumador
	adder execAdder(PC_E, shiftOut, PCBranch_E);
	
	// asigna la readData2_E a la salida del modulo writeData_E
	assign writeData_E = readData2_E;
	
endmodule