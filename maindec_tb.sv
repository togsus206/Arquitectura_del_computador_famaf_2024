module maindec_tb();

    logic [10:0] Op;
    logic Reg2Loc, ALUSrc, MemtoReg, RegWrite, MemRead, MemWrite, Branch;
    logic [1:0] ALUOp;

    // Instancia del módulo maindec
    maindec dut (
        .Op(Op),
        .Reg2Loc(Reg2Loc),
        .ALUSrc(ALUSrc),
        .MemtoReg(MemtoReg),
        .RegWrite(RegWrite),
        .MemRead(MemRead),
        .MemWrite(MemWrite),
        .Branch(Branch),
        .ALUOp(ALUOp)
    );

    // Simulación de las instrucciones
    initial begin
        // Instrucción LDUR
        Op = 11'b111_1100_0010;
        #10;
        check_signals("LDUR");

        // Instrucción STUR
        Op = 11'b111_1100_0000;
        #10;
        check_signals("STUR");

        // Instrucción CBZ
        Op = 11'b101_1010_0000; // Ten en cuenta que he reemplazado los bits de don't care (???) con 0000
        #10;
        check_signals("CBZ");

        // Otras instrucciones para verificar el comportamiento predeterminado
        Op = 11'b100_0101_1000;
        #10;
        check_signals("ADD");

        Op = 11'b110_0101_1000;
        #10;
        check_signals("SUB");

        Op = 11'b100_0101_0000;
        #10;
        check_signals("AND");

        Op = 11'b101_0101_0000;
        #10;
        check_signals("ORR");

        // Finalizar la simulación
        $finish;
    end

    // Función para verificar las señales de control
    function void check_signals(string instruction);
        $display("%s:", instruction);
        $display("Reg2Loc = %b", Reg2Loc);
        $display("ALUSrc = %b", ALUSrc);
        $display("MemtoReg = %b", MemtoReg);
        $display("RegWrite = %b", RegWrite);
        $display("MemRead = %b", MemRead);
        $display("MemWrite = %b", MemWrite);
        $display("Branch = %b", Branch);
        $display("ALUOp = %b", ALUOp);
        $display(""); // Espacio en blanco para separar las salidas
    endfunction

endmodule
