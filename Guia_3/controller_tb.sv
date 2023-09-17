module tb_controller();

    // Declare signals to connect to the controller module
    logic [10:0] instr;
    logic ExtIRQ;
    logic [3:0] AluControl;
    logic reg2loc, regWrite, AluSrc, Branch, memtoReg, memRead, memWrite;
    logic Exc;
    logic [1:0] EStatus;
    logic ExtIAck;

    // Instantiate the controller module
    controller ctrl_inst (
        .instr(instr),
        .ExtIRQ(ExtIRQ),
        .AluControl(AluControl),
        .reg2loc(reg2loc),
        .regWrite(regWrite),
        .AluSrc(AluSrc),
        .Branch(Branch),
        .memtoReg(memtoReg),
        .memRead(memRead),
        .memWrite(memWrite),
        .Exc(Exc),
        .EStatus(EStatus),
        .ExtIAck(ExtIAck)
    );

    // Apply stimulus
    initial begin
        // Set inputs
        instr = 11'b1??_0101_?000; // R-type instruction
        ExtIRQ = 1'b0;

        // Wait for a while to let signals propagate
        #10;

        // Print the outputs
        $display("AluControl: %b", AluControl);
        $display("reg2loc: %b", reg2loc);
        $display("regWrite: %b", regWrite);
        $display("AluSrc: %b", AluSrc);
        $display("Branch: %b", Branch);
        $display("memtoReg: %b", memtoReg);
        $display("memRead: %b", memRead);
        $display("memWrite: %b", memWrite);
        $display("Exc: %b", Exc);
        $display("EStatus: %b", EStatus);
        $display("ExtIAck: %b", ExtIAck);

        // Add more tests as needed
        // ...

        // Finish simulation
        $finish;
    end

endmodule
