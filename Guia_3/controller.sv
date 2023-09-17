// CONTROLLER

module controller(input logic [10:0] instr,
                   input logic ExtIRQ,  // Input for external interrupt
                   output logic [3:0] AluControl,
                   output logic reg2loc, regWrite, AluSrc, Branch,
                                  memtoReg, memRead, memWrite,
                   output logic Exc,
                   output logic [1:0] EStatus,
                   output logic ExtIAck);  // Output for ExtIAck

    logic [1:0] AluOp_s;
    logic NotAnInstr;
	 logic [4:0] Rn;  // Added for BR instruction

    // Instantiate maindec and aludec modules
    maindec decPpal (.Op(instr),
                     .reset(1'b0),  // Assuming reset is not included here
                     .Reg2Loc(reg2loc),
                     .ALUSrc(AluSrc),
                     .MemtoReg(memtoReg),
                     .RegWrite(regWrite),
                     .MemRead(memRead),
                     .MemWrite(memWrite),
                     .Branch(Branch),
                     .ALUOp(AluOp_s),
                     .NotAnInstr(NotAnInstr),  // Pass NotAnInstr to maindec
							.Rn(Rn));  // Pass Rn to maindec

    aludec decAlu (.funct(instr),
                   .aluop(AluOp_s),
                   .alucontrol(AluControl));
		
    // Assign EStatus based on the instruction type
    // Assign EStatus based on the instruction type
	always_comb begin
		case (instr)
			11'b1??_0101_?000: // R-type
					EStatus = 2'b0000;
        
			11'b111_1100_0010: // LDUR
					EStatus = 2'b0000;
        
			11'b111_1100_0000: // STUR
					EStatus = 2'b0000;
        
			11'b101_1010_0???: // CBZ
					EStatus = 2'b0000;
        
			11'b11010110100: // ERET
					EStatus = 2'b0000;
        
			11'b11010101001: // MRS
					EStatus = 2'b0000;
			// Add a case for the BR instruction
			11'b11010110000:
					EStatus = 2'b0000;
			//// Invalid OpCode
			11'b???00000??0:
					EStatus = 2'b0010;
        
			default: // External IRQ
					EStatus = 2'b0001;
		endcase
	 end

	 
    // Exc is the result of OR operation between ExtIRQ and NotAnInstr
    assign Exc = ExtIRQ | NotAnInstr;
	 // Logic for Exc
    //always_ff @(posedge ExtIRQ) begin
    //    Exc <= ExtIRQ | NotAnInstr;
    //end

    // ExtIAck is '1' when Exc is '1' and ExtIRQ is '1', else '0'
    assign ExtIAck = (Exc && ExtIRQ) ? 1'b1 : 1'b0;
	 
endmodule


