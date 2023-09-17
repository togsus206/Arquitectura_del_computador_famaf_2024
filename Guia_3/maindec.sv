module maindec (input logic [10:0] Op,
					input logic reset,
					output logic Reg2Loc,
					output logic [1:0] ALUSrc,
					output logic MemtoReg,
									RegWrite,
									MemRead,
									MemWrite,
									Branch,
					output logic [1:0] ALUOp,
					output logic NotAnInstr,
					output logic [4:0] Rn);  // Agrega esta línea para definir Rn);
					
	assign NotAnInstr = (Op == 11'b????_????_????) ? 1'b1 : 1'b0;
	
	always_ff @(posedge reset or posedge Op) begin
    if (reset) begin
        Reg2Loc <= 1'b0;
        ALUSrc <= 2'b0;
        MemtoReg <= 1'b0;
        RegWrite <= 1'b0;
        MemRead <= 1'b0;
        MemWrite <= 1'b0;
        Branch <= 1'b0;
        ALUOp <= 2'b0;
	  end else begin
		casez (Op)
			// R-format
			11'b1??_0101_?000: begin
				Reg2Loc = 0;
				ALUSrc = 2'b00;
				MemtoReg = 0;
				RegWrite = 1;
				MemRead = 0;
				MemWrite = 0;
				Branch = 0;
				ALUOp = 2'b10;
			end
			// LDUR
			11'b111_1100_0010: begin
				Reg2Loc = 0;
				ALUSrc = 2'b01;
				MemtoReg = 1;
				RegWrite = 1;
				MemRead = 1;
				MemWrite = 0;
				Branch = 0;
				ALUOp = 0;
			end
			// STUR
			11'b111_1100_0000: begin
				Reg2Loc = 1;
				ALUSrc = 2'b01;
				MemtoReg = 0;
				RegWrite = 0;
				MemRead = 0;
				MemWrite = 1;
				Branch = 0;
				ALUOp = 0;
			end
			// CBZ
			11'b101_1010_0???: begin
				Reg2Loc = 1;
				ALUSrc = 2'b00;
				MemtoReg = 0;
				RegWrite = 0;
				MemRead = 0;
				MemWrite = 0;
				Branch = 1;
				ALUOp = 1;
			end
			// ERET
			11'b11010110100: begin
				Reg2Loc = 0;
				ALUSrc = 2'b00;
				MemtoReg = 0;
				RegWrite = 0;
				MemRead = 0;
				MemWrite = 0;
				Branch = 1;
				ALUOp = 1;
			end
			// MRS
			11'b11010101001: begin
				Reg2Loc = 1;
				ALUSrc = 2'b10;
				MemtoReg = 0;
				RegWrite = 1;
				MemRead = 0;
				MemWrite = 0;
				Branch = 0;
				ALUOp = 1;
			end
			// BR: Instrucción de salto incondicional
			11'b11010110000: begin
            Reg2Loc = 0;  // No necesitas usar un registro para la PC
            ALUSrc = 2'b00;  // Rn proporciona la dirección de salto
            MemtoReg = 0;  // No se necesita cargar un valor desde memoria
            RegWrite = 0;  // No se está escribiendo en un registro
            MemRead = 0;  // No se está leyendo desde memoria
            MemWrite = 0;  // No se está escribiendo en memoria
            Branch = 0;  // No es una instrucción de salto condicional
            ALUOp = 2'b10;  // Indica operación de salto (podrías adaptar esto según tu diseño)

            // Decodificar el número de registro Rn
            Rn = Op[4:0];  // Asumiendo que los bits correspondientes a Rn están en [4:0]
			end
			// others
			default: begin
				Reg2Loc = 0;
				ALUSrc = 0;
				MemtoReg = 0;
				RegWrite = 0;
				MemRead = 0;
				MemWrite = 0;
				Branch = 0;
				ALUOp = 0;
			end
		endcase
	 end
	end
endmodule