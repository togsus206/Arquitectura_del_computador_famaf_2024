// CONTROLLER


module controller(input logic [10:0] instr,
                  input logic ExtIRQ,  // Input for external interrupt
                  input logic ExtAck,  // Input for external ACK
                  input logic reset,   // Agregado el reset
                  output logic [3:0] AluControl,
                  output logic reg2loc, regWrite, [1:0] AluSrc, Branch,
                                  memtoReg, memRead, memWrite,
                  output logic Exc,   // Agregado
                  output logic [3:0] EStatus, // Agregado
                  output logic ERet,
                  output logic ExtIAck); // Agregado
                  
    logic [1:0] AluOp_s;
    logic NotAnInstr;

    maindec decPpal (.Op(instr),
                     .reset(reset),  // Pasando el reset
                     .Reg2Loc(reg2loc),
                     .ALUSrc(AluSrc),
                     .MemtoReg(memtoReg),
                     .RegWrite(regWrite),
                     .MemRead(memRead),
                     .MemWrite(memWrite),
                     .Branch(Branch),
                     .ALUOp(AluOp_s),
                     .NotAnInstr(NotAnInstr));
                     
    aludec decAlu (.funct(instr), 
                   .aluop(AluOp_s), 
                   .alucontrol(AluControl));
                   
    // Un solo bloque always_comb para manejar el reset y las señales
    always_comb begin
        if (reset) begin
            // Todas las salidas se ponen a 0 si reset está activo
            AluControl = 4'b0000;
            reg2loc = 0;
            regWrite = 0;
            AluSrc = 2'b00;
            Branch = 2'b00;
            memtoReg = 0;
            memRead = 0;
            memWrite = 0;
            EStatus = 4'b0000;
            Exc = 0;
            ExtIAck = 0;
        end else begin
            // Asignar EStatus basado en la instrucción
            case (instr)
                11'b1??_0101_?000: // R-type
                    EStatus = 4'b0000;
                11'b111_1100_0010: // LDUR
                    EStatus = 4'b0000;
                11'b111_1100_0000: // STUR
                    EStatus = 4'b0000;
                11'b101_1010_0???: // CBZ
                    EStatus = 4'b0000;
                11'b11010110100:  // ERET
                    EStatus = 4'b0000;
                11'b11010101001:  // MRS
                    EStatus = 4'b0000;
                11'b11010110000:  // BR
                    EStatus = 4'b0000;
                11'b???00000??0:  // Invalid OpCode
                    EStatus = 4'b0010;
                default: 
                    EStatus = 4'b0000;
            endcase
            
			// External IRQ
			if(ExtIRQ) EStatus <= 4'b0001;
				
            // Exc es el resultado de OR entre ExtIRQ y NotAnInstr
            Exc = ExtIRQ | NotAnInstr;

            // ExtIAck es '1' cuando Exc es '1' y ExtIRQ es '1'
            ExtIAck = (Exc && ExtIRQ) ? 1'b1 : 1'b0;
        end
    end
endmodule
