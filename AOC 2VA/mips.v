module mips (
	input clk,
	input reset,
	output wire [31:0] pc,
	output wire [31:0] alu_out,
	output wire [31:0] ReadData
);

reg [31:0] next_pc;

wire [31:0] instruction;
wire [5:0] opcode = instruction[31:26];
wire [4:0] rs = instruction[25:21];
wire [4:0] rt = instruction[20:16];
wire [4:0] rd = instruction[15:11];
wire [4:0] shamt = instruction[10:6];
wire [5:0] funct = instruction[5:0];
wire [15:0] imm = instruction[15:0];
wire [25:0] addr = instruction[25:0];

wire [31:0] write_data;
wire [4:0] write_addr;
wire [31:0] read_data_1, read_data_2;

wire reg_dst, alu_src, reg_write, mem_read; 
wire mem_write, branch, branch_ne, jump;
wire [1:0] mem_to_reg;
wire [2:0] alu_op;

wire [31:0] imm_ext;
wire [3:0] alu_control;
wire alu_zero;
wire [31:0] alu_in1, alu_in2;

assign write_addr = jump ? 5'd31 : (reg_dst ? rd : rt);

assign alu_in1 = read_data_1;

assign alu_in2 = alu_src ? imm_ext : read_data_2;

assign write_data = (mem_to_reg == 2'b00) ? alu_out:
						  (mem_to_reg == 2'b01) ? ReadData: pc + 4;

always @(*) begin
    if (jump) begin
        next_pc = {instruction[31:28], addr, 2'b00};
    end else if ((branch_ne ^ alu_zero) && branch) begin
        next_pc = pc + 4 + (imm_ext << 2);
    end else begin
        next_pc = pc + 4;
    end
end

pc pc_module (
    .clock(clk),
    .nextPC(next_pc),
    .PC(pc)
);

i_mem i_mem (
    .address(pc),
    .i_out(instruction)
);

ctrl ctrl(
    .opcode(opcode),
    .RegDst(reg_dst),
    .ALUSrc(alu_src),
    .MemtoReg(mem_to_reg),
    .RegWrite(reg_write),
    .MemRead(mem_read),
    .MemWrite(mem_write),
    .Branch(branch),
    .BranchNe(branch_ne),
    .ALUOp(alu_op),
    .Jump(jump)
);

regfile regfile (
    .ReadAddr1(rs),
    .ReadAddr2(rt),
    .ReadData1(read_data_1),
    .ReadData2(read_data_2),
    .Clock(clk),
    .WriteAddr(write_addr),
    .WriteData(write_data),
    .RegWrite(reg_write),
    .Reset(reset)
);

sign_extender sign_extender (
    .imm(imm),
    .imm_ext(imm_ext)
);

ula_ctrl ula_ctrl (
    .funct(funct),
    .aluOp(alu_op),
    .aluControl(alu_control)
);

ula ula (
    .In1(alu_in1),
    .In2(alu_in2),
    .OP(alu_control),
    .result(alu_out),
    .Zero_flag(alu_zero)
);

d_mem d_mem (
    .Address(alu_out), 
    .WriteData(read_data_2), 
    .ReadData(ReadData), 
    .MemWrite(mem_write), 
    .MemRead(mem_read)
);

endmodule
