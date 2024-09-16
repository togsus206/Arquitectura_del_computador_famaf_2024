module maindec (input logic [10:0] Op,
					input logic reset, //Agregado Reset
					output logic Reg2Loc,
					output logic [1:0] ALUSrc,
					output logic MemtoReg,
									RegWrite,
									MemRead,
									MemWrite,
									Branch,
					output logic [1:0] ALUOp,
					output logic NotAnInstr);
					
		
	always_comb begin
		if (reset) begin
					Reg2Loc = 0;
					ALUSrc = 2'b00;
					MemtoReg = 0;
					RegWrite = 0;
					MemRead = 0;
					MemWrite = 0;
					Branch = 0;
					ALUOp = 2'b00;
					NotAnInstr = 0;
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
					NotAnInstr = 0;
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
					ALUOp = 2'b00;
					NotAnInstr = 0;
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
					ALUOp = 2'b00;
					NotAnInstr = 0;
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
					ALUOp = 2'b01;
					NotAnInstr = 0;
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
					ALUOp = 2'b01;
					NotAnInstr = 0;
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
					ALUOp = 2'b00;
					NotAnInstr = 0;
				end
				11'b????_????_????: begin
					Reg2Loc = x;
					ALUSrc = 2'bxx;
					MemtoReg = 0;
					RegWrite = 0;
					MemRead = 0;
					MemWrite = 0;
					Branch = 0;
					ALUOp = 2'bxx;
					NotAnInstr = 1;
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
					NotAnInstr = 0;
				end
			endcase
		 end
		end
endmodule
