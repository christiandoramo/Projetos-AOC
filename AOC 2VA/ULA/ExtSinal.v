/*
Módulo de Extensão de Sinal:
Para operações que envolvem valores imediatos (instruções I), 
você pode criar um módulo para estender ou ajustar o sinal imediato para a largura correta antes de executar a operação.
*/

module ExtSinal(out, in,ExtendSign);

    /* A 32-Bit output word */
    output  [31:0] out;
    
    /* A 16-Bit input word */
    input   [15:0] in;
	 input ExtendSign;
	 reg [31:0] out;

    /* Fill in the implementation here... */ 
    always@(in,ExtendSign)
	 begin
		if (ExtendSign == 0) begin
			out <= {16'h0000 , in};
		end else begin
			if (in[15]==1)
			begin
			  out <= {16'hffff , in};
			end
			else 
			begin
			  out <= in;
			end
		end

	 end
endmodule