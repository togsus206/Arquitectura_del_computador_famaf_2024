/*
module fetch (input logic PCSrc_F, clk, reset,
					input logic [63:0] PCBranch_F,
					output logic [63:0] imem_addr_F);
					
			logic [63:0] d,y;
			
			flopr flopr(clk, reset, d, imem_addr_F);
			adder adder(imem_addr_F, N'('d4), y);
			mux2 mux2(y,PCBranch_F, PCSrc_F, d);
endmodule
*/

module fetch #(parameter N = 64) (input logic  PCSrc_F, clk, reset,
											 input logic  [N-1:0] PCBranch_F,
											 output logic [N-1:0] imem_addr_F);
				  
	logic [N-1:0] muxdder, flopmux, imem_addr, badder;
	
	assign badder = 64'b0100;
	
	mux2 fetchMux(muxdder, PCBranch_F, PCSrc_F, flopmux);
	flopr fetchFlopr(clk, reset, flopmux, imem_addr);
	adder fetchAdder(imem_addr, badder, muxdder);

	assign imem_addr_F = imem_addr;
	
endmodule
