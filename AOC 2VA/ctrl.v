module ctrl (
	input [5:0] opcode,
	output reg RegDst,
	output reg ALUSrc,
	output reg [1:0] MemtoReg,
	output reg RegWrite,
	output reg MemRead,
	output reg MemWrite,
	output reg Branch,
	output reg BranchNe,
	output reg [2:0] ALUOp,
	output reg Jump
);

	always @* begin
	case (opcode)
		6'b000000: begin //R-type
			RegDst = 1;
			ALUSrc = 0;
			MemtoReg = 2'b00;
			RegWrite = 1;
			MemRead = 0;
			MemWrite = 0;
			Branch = 0;
			BranchNe = 0;
			ALUOp = 3'b11x;
			Jump = 0;
		end
		6'b000010: begin //Jump
			RegDst = 1'bx;
			ALUSrc = 1'bx;
			MemtoReg = 2'bxx;
			RegWrite = 0;
			MemRead = 0;
			MemWrite = 0;
			Branch = 1'bx;
			BranchNe = 1'bx;
			ALUOp = 3'bxxx;
			Jump = 1;
		end
		6'b000011: begin //Jal
			RegDst = 1'bx;
			ALUSrc = 1'bx;
			MemtoReg = 2'b10;
			RegWrite = 1;
			MemRead = 0;
			MemWrite = 0;
			Branch = 1'bx;
			BranchNe = 1'bx;
			ALUOp = 3'bxxx;
			Jump = 1;
		end
		6'b000100, //BEQ
		6'b000101: begin //BNE
			RegDst = 1'bx;
			ALUSrc = 0;
			MemtoReg = 2'bxx;
			RegWrite = 0;
			MemRead = 0;
			MemWrite = 0;
			Branch = 1;
			BranchNe = 0;
			ALUOp = 3'b001;
			Jump = 0;
			case (opcode)
				6'b000101: BranchNe = 1; //BNE
			endcase
		end
		6'b001000, //ADDI
		6'b001010, //SLTI
		6'b001011, //SLTIU
		6'b001100, //ANDI
		6'b001101, //ORI
		6'b001110, //XORI
		6'b001111: begin //LUI
			RegDst = 0;
			ALUSrc = 1;
			MemtoReg = 2'b00;
			RegWrite = 1;
			MemRead = 0;
			MemWrite = 0;
			Branch = 0;
			BranchNe = 0;
			Jump = 0;
			case (opcode)
				6'b001000: ALUOp = 3'b000; //ADDI
				6'b001010: ALUOp = 3'b101; //SLTI
				6'b001011: ALUOp = 3'b101; //SLTIU
				6'b001100: ALUOp = 3'b010; //ANDI
				6'b001101: ALUOp = 3'b011; //ORI
				6'b001110: ALUOp = 3'b100; //XORI
				6'b001111: ALUOp = 3'b000; //LUI
			endcase
		end
		6'b100011: begin //LW
			RegDst = 0;
			ALUSrc = 1;
			MemtoReg = 2'b01;
			RegWrite = 1;
			MemRead = 1;
			MemWrite = 0;
			Branch = 0;
			BranchNe = 0;
			ALUOp = 3'b000;
			Jump = 0;
		end
		6'b101011: begin //SW
			RegDst = 1'bx;
			ALUSrc = 1;
			MemtoReg = 2'bxx;
			RegWrite = 0;
			MemRead = 0;
			MemWrite = 1;
			Branch = 0;
			BranchNe = 0;
			ALUOp = 3'b000;
			Jump = 0;
		end
		default: begin
			RegDst = 0;
			ALUSrc = 0;
			MemtoReg = 2'b00;
			RegWrite = 0;
			MemRead = 0;
			MemWrite = 0;
			Branch = 0;
			BranchNe = 0;
			ALUOp = 3'b000;
			Jump = 0;
		end
	endcase
	end
endmodule
