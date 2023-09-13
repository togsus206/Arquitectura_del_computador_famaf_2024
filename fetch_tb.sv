
module fetch_tb();
	logic clk, reset, PCSrc_F;
	logic [63:0] PCBranch_F, imem_addr_F;
	always begin
		clk=1; #5ns; clk =0; #5ns;
	end

	fetch dut (PCSrc_F, clk, reset, PCBranch_F, imem_addr_F);

initial begin
    // Inicializa la señal de reset en alto
    reset = 1;

    // Inicializa valores de PCBranch_F
    PCBranch_F = 64'd10;

    // Espera 50ns antes de bajar la señal de reset
    #50ns

    // Activa la señal PCSrc_F después de 20ns
    PCSrc_F = 1;

    // Realiza pruebas adicionales aquí

    // Espera 100ns adicionales antes de finalizar
    #100ns

    // Finaliza la simulación
	 $stop;
	end

endmodule