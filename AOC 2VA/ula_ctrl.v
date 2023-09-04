/*
	ula-ctrl
*/


module ula_ctrl(funct,aluOp,aluControl);
	 input wire [5:0] funct;      // Bits [05-00] da instrução de 32 bits (funct para tipo R)
    input wire [2:0] aluOp;       // Entrada para o código de controle da ULA
    output reg [3:0] aluControl; //[5:0] aluControl;  // Saída do código de controle da ULA	 
	 
    always @(*) begin
         case(aluOp)
				3'b000: aluControl = 4'b0111; // add
				3'b001: aluControl = 4'b1000;// sub
				3'b010: aluControl = 4'b1001; // and
				3'b011: aluControl = 4'b1010; // or
				3'b100: aluControl = 4'b1011; // xor
				3'b101: aluControl = 4'b1101; // slt
				3'b11x: begin
            case (funct)
					 6'b000000: aluControl = 4'b0000;// sll
					 6'b000010: aluControl = 4'b0001; // srl
                6'b000011: aluControl = 4'b0010;// sra
					 6'b000100: aluControl = 4'b0011;// sllv
					 6'b000110: aluControl = 4'b0100; // srlv
					 6'b000111: aluControl = 4'b0101;// srav
					 6'b001000: aluControl = 4'b0110;// jr
					 6'b100000: aluControl = 4'b0111;// add
				    6'b100010: aluControl = 4'b1000;// sub
				    6'b100100: aluControl = 4'b1001; // and
				    6'b100101: aluControl = 4'b1010; // or
					 6'b100110: aluControl = 4'b1011;// xor
					 6'b100111: aluControl = 4'b1100; // nor
					 6'b101010: aluControl = 4'b1101; // slt
					 6'b101011: aluControl = 4'b1110; // sltu
					 default: aluControl = 4'b1111;
				endcase
				end
				default: aluControl = 4'b1111;
			endcase
		end
endmodule