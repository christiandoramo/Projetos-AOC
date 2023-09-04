/*
	ula
*/
module ula(In1, In2, OP, result, Zero_flag);
	 input wire [31:0] In1, In2;      // Operando 1 e 2
    input wire [3:0] OP;// Operação a ser realizada. fornecido por ula_ctrl
    output reg [31:0] result;  // Saída do código de controle da ULA
	 output reg Zero_flag; // caso resultado seja zero é alto
	 reg signed [31:0] signed_rs, signed_rt; 
	 //reg signed [31:0] temp;

	 always @(*) begin
	 	signed_rs = In1; // rs em signed
		signed_rt = In2; // rt em signed
	 
	 
		case(OP)
		//as 3 primeiras instruções abaixo precisam do shamt//
			/*4'b0000:begin // sll
			result <= In1 << (In2);
			end
			4'b0001: begin // srl Unsigned right shift
			y = In1;
				for (i = In2[4:0];i > 0; i = i - 1) begin
					if (In2[5] == 1)
						y = {y[0],y[31:1]};
					else
						y = {1'b0,y[31:1]};
				end
				result <= y;
			end
			4'b0010: begin // sra Signed right shift				
				temp = In2;
				for(i = 0; i < shamt; i = i + 1) begin
					temp = {temp[31],temp[31:1]}; //add the lsb for msb
				end
				result = temp;
			end*/ 
			//as 3 primeiras instruções anteriores precisam do shamt//
			4'b0011: result <= In2 << In1; // sllv Unsigned left shift
			4'b0100: result <= In2 >> In1; // srlv Unsigned right shift
			4'b0101: result <= In1 >>> In2; // srav Signed right shift
			//4'b0110: // jr nao faz nada na ula, PC = In1
			4'b0111: result <= signed_rs + signed_rt; // add
			4'b1000: result <= signed_rs - signed_rt; // sub
			4'b1001: result <= In1 & In2; // and
			4'b1010: result <= In1 | In2; // or
			4'b1011: result <= In1 ^ In2; // xor
			4'b1100: result <= ~(In1 | In2); // nor
			
			4'b1101: begin // slt
				if(signed_rs < signed_rt) begin
					result <= 1;  // se começar com 1 é negativo logo é menor
				end else begin
					result <= 0;
				end
			end
			4'b1110: result <= (In1 < In2) ? 1:0;// sltu
			default: result <= 0;
		endcase
		Zero_flag <= (result == 0) ? 1 : 0;
	 end
endmodule