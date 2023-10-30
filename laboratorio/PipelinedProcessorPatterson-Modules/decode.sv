// Etapa: DECODE

module decode #(parameter N = 64)
					(input logic regWrite_D, reg2loc_D, clk,
					input logic [N-1:0] writeData3_D,
					input logic [31:0] instr_D,
					output logic [N-1:0] signImm_D, readData1_D, readData2_D, 
					input logic [4:0] wa3_D); // Eliminar para single cycle processor
					
	logic [4:0] ra2;			
	
	mux2 	#(5) 	ra2mux	(.d0(instr_D[20:16]), .d1(instr_D[4:0]), .s(reg2loc_D), .y(ra2));
	
	regfile 		registers(.clk(clk), .we3(regWrite_D), .ra1(instr_D[9:5]), .ra2(ra2), .wa3(wa3_D), 
								 .wd3(writeData3_D), .rd1(readData1_D), .rd2(readData2_D));
								
	// En single cycle processor:						
	//regfile registers (.clk(clk), .we3(regWrite_D), .ra1(instr_D[9:5]), .ra2(ra2), .wa3(instr_D[4:0]), 
	//							 .wd3(writeData3_D), .rd1(readData1_D), .rd2(readData2_D));
	
									
	signext 		ext		(.a(instr_D), .y(signImm_D));	
	
endmodule


/*
module decode #(parameter N = 64)
    (
     input logic regWrite_D, reg2loc_D, clk,
     input logic [N-1:0] writeData3_D,
     input logic [31:0] instr_D,
     output logic [N-1:0] signImm_D, readData1_D, readData2_D,
     input logic [4:0] wa3_D // Eliminar para single cycle processor,
     //se agrega un campo de salida para LSL
     output logic [1:0] lsl_D; // Campo LSL de la instrucción MOVZ
    );

    logic [4:0] ra2;
    
    mux2 #(5) ra2mux (.d0(instr_D[20:16]), .d1(instr_D[4:0]), .s(reg2loc_D), .y(ra2));
    
    regfile registers (.clk(clk), .we3(regWrite_D), .ra1(instr_D[9:5]), .ra2(ra2), .wa3(wa3_D),
                      .wd3(writeData3_D), .rd1(readData1_D), .rd2(readData2_D));
                      
    // En single cycle processor:						
    //regfile registers (.clk(clk), .we3(regWrite_D), .ra1(instr_D[9:5]), .ra2(ra2), .wa3(instr_D[4:0]), 
    //							 .wd3(writeData3_D), .rd1(readData1_D), .rd2(readData2_D));

    always @(posedge clk) begin
        // Si regWrite_D está habilitado (1) y el registro leído en readData1_D es igual al registro de escritura
        // se actualiza el valor leído.
        if (regWrite_D && (registers.ra1 == wa3_D))
            readData1_D <= writeData3_D;

        // Hacer lo mismo para readData2_D y registers.ra2
        if (regWrite_D && (registers.ra2 == wa3_D))
            readData2_D <= writeData3_D;

        // Es una instrucción MOVZ
        if (instr_D[31:22] == 9'b110100101) begin
            // Extraer los campos Rd, MOV_immediate y LSL
            wa3_D <= instr_D[4:0];
            signImm_D <= instr_D[20:5];
            lsl_D <= instr_D[22:21];
            // Asignar los valores a las señales correspondientes
            // Asegurarse de que los valores se transmitan al datapath
        end
    end

    // Inicialización de registros X0 a X30
    initial begin
        for (int i = 0; i <= 30; i = i + 1) begin
            registers.wa3 = i;          // Selecciona el registro que deseas inicializar (X0 a X30)
            registers.wd3 = i;          // Establece el valor a asignar (0 a 30)
            registers.we3 = 1'b1;       // Habilita la escritura
            #1;                        // Espera un ciclo de reloj
            registers.we3 = 1'b0;       // Deshabilita la escritura
        end
    end

    signext ext (.a(instr_D), .y(signImm_D));
endmodule

*/