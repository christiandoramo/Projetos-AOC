module pc (clock, nextPC, PC); 

	input wire clock;
	input wire [31:0] nextPC;	//Endereço de entrada
	output reg [31:0] PC;		//Endereço de saida
	
	always @(posedge clock) 
		begin
			PC <= nextPC; // Na subida do clock, transfere o valor de nextPC para PC
		end
		
endmodule