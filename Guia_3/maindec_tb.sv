module tb_maindec();

    // Inputs
    logic [10:0] Op;
    logic reset;
    
    // Outputs
    logic Reg2Loc;
    logic [1:0] ALUSrc;
    logic MemtoReg, RegWrite, MemRead, MemWrite, Branch;
    logic [1:0] ALUOp;
    logic NotAnInstr;
    logic [4:0] Rn;

    // Instantiate the maindec module
    maindec uut (
        .Op(Op),
        .reset(reset),
        .Reg2Loc(Reg2Loc),
        .ALUSrc(ALUSrc),
        .MemtoReg(MemtoReg),
        .RegWrite(RegWrite),
        .MemRead(MemRead),
        .MemWrite(MemWrite),
        .Branch(Branch),
        .ALUOp(ALUOp),
        .NotAnInstr(NotAnInstr),
        .Rn(Rn)
    );

    // Stimulus
    initial begin
        
        // Case 1: R-format instruction
        Op = 11'b10010101000; // Replace with the desired R-format opcode
        reset = 0;
        // Wait for some time to observe the outputs
        #10;
        
        // Case 2: LDUR instruction
        Op = 11'b11111000010; // Replace with the desired LDUR opcode
        reset = 0;
        // Wait for some time to observe the outputs
        #10;
        
        // Case 3: CBZ instruction
        Op = 11'b10110100010; // Replace with the desired CBZ opcode
        reset = 0;
        // Wait for some time to observe the outputs
        #10;
        
        // Case 4: Invalid instruction
        Op = 11'b11001011001; // An invalid opcode, should set NotAnInstr
        reset = 0;
        // Wait for some time to observe the outputs
        #10;

        // Stop the simulation
        $stop;
    end

endmodule
