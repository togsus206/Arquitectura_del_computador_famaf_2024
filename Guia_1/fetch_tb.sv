
`timescale 1ns / 1ps

module fetch_tb();
    logic clk, reset, PCSrc_F;
    logic [63:0] PCBranch_F, imem_addr_F;
    logic [63:0] expected_imem_addr_F;

    // Generador de reloj
    always begin
        clk = 1; #5; clk = 0; #5;
    end

    // Instancia del módulo bajo prueba
    fetch dut (
        .PCSrc_F(PCSrc_F), 
        .clk(clk), 
        .reset(reset), 
        .PCBranch_F(PCBranch_F), 
        .imem_addr_F(imem_addr_F)
    );

    initial begin
        // Inicializa señales
        reset = 1;
        PCSrc_F = 0;
        PCBranch_F = 64'd0;

        // Espera y desactiva el reset
        #50;
        reset = 0;

        // Primer caso de prueba
        PCBranch_F = 64'd10;
        PCSrc_F = 0;
        expected_imem_addr_F = 64'd4; // 10 + 4 = 14
        #10;
        check_results(expected_imem_addr_F);

        // Segundo caso de prueba
        PCBranch_F = 64'd20;
        PCSrc_F = 1;
        expected_imem_addr_F = 64'd20; // La dirección de PCBranch_F es usada directamente
		   #10;  // Espera para permitir que las señales se propagen
        check_results(expected_imem_addr_F);

        // Tercer caso de prueba con diferentes valores
        PCBranch_F = 64'd20;
        PCSrc_F = 0;
        expected_imem_addr_F = 64'd24; // 30 + 4 = 34
        #10;  // Espera para permitir que las señales se propagen
		  check_results(expected_imem_addr_F);

        // Espera adicional antes de finalizar
        #50;

        // Finaliza la simulación
        $stop;
    end

    // Tarea para verificar resultados
    task check_results(input [63:0] expected);
        if (imem_addr_F !== expected) begin
            $display("Error: imem_addr_F = %d (expected %d)", imem_addr_F, expected);
        end else begin
            $display("Success: imem_addr_F = %d", imem_addr_F);
        end
    endtask

endmodule
