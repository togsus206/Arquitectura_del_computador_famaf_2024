// ALU CONTROL DECODER
/*
module aludec (input  logic [10:0] funct,  
					input  logic [1:0]  aluop,  
					output logic [3:0] alucontrol);  				
						
	always_comb
		if (aluop == 2'b00) alucontrol = 4'b0010;			// LDUR or STUR		
		else if (aluop == 2'b01) alucontrol = 4'b0111; 	//CBZ
		else if((aluop == 2'b10)  & (funct == 11'b10001011000)) alucontrol = 4'b0010;	//ADD
		else if((aluop == 2'b10)  & (funct == 11'b11001011000)) alucontrol = 4'b0110;	//SUB
		else if((aluop == 2'b10)  & (funct == 11'b10001010000)) alucontrol = 4'b0000;	//AND
		else if((aluop == 2'b10)  & (funct == 11'b10101010000)) alucontrol = 4'b0001;	//OR
		//Agregar funcion MOVZ
		else if((aluop == 2'b10)  & (funct[10:2] == 9'b110100101)) alucontrol = 4'b1000; 	//MOVZ
		//    
		else alucontrol = 4'b0000;
endmodule
*/

module aludec (input  logic [10:0] funct,  
					input  logic [1:0]  aluop,  
					output logic [3:0] alucontrol);  
 	// Nueva señal de control para la instrucción MOVZ
	logic movz;

	// Nuevo bloque de mux para seleccionar el valor inmediato de la instrucción MOVZ
	mux2 #(32) muxImm (.d0(signImm_D), .d1(readData2_D), .s(reg2loc_D), .y(imm_D));

	assign movz = (aluop == 2'b10) & (funct[10:2] == 9'b110100101); // Señal de control para la instrucción MOVZ

	always_comb
		if (movz) begin
			alucontrol = 4'b1000; // Lógica para la instrucción MOVZ
		end else if (aluop == 2'b00) begin
			alucontrol = 4'b0010; // LDUR or STUR
		end else if (aluop == 2'b01) begin
			alucontrol = 4'b0111; // CBZ
		end else if (aluop == 2'b10) begin
			if (funct == 11'b10001011000) begin
				alucontrol = 4'b0010; // ADD
			end else if (funct == 11'b11001011000) begin
				alucontrol = 4'b0110; // SUB
			end else if (funct == 11'b10001010000) begin
				alucontrol = 4'b0000; // AND
			end else if (funct == 11'b10101010000) begin
				alucontrol = 4'b0001; // OR
			end else begin
				alucontrol = 4'b0000;
			end
		end else begin
			alucontrol = 4'b0000;
		end

endmodule
