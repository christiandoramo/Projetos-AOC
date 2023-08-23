/*
Módulo de Controle:
Este módulo irá interpretar os códigos de operação (opcode) e sinais de controle para determinar qual operação
deve ser realizada e quais operandos devem ser usados.
*/

module ula_ctrl(ALUOp,func,ALUControl);
    input wire [2:0] ALUOp,    // Sinal de controle da unidade de controle
    input wire [5:0] func,     // 6 bits menos significativos da instrução
    output wire [2:0] ALUControl // Saída do código de controle da ULA

    always @* begin
        case (ALUOp)
            3'b000: ALUControl = 3'b000; // Add
            3'b001: ALUControl = 3'b001; // Sub
            3'b010: ALUControl = 3'b010; // And
            3'b011: ALUControl = 3'b011; // Or
            3'b100: ALUControl = 3'b100; // Xor
            3'b101: ALUControl = 3'b101; // Slt
            3'b110: begin // Look at funct field
                case (func)
                    6'b100000: ALUControl = 3'b010; // R-Type: Add
                    6'b100010: ALUControl = 3'b110; // R-Type: Sub
                    // ... Adicione mais casos para outras funções R-Type
                    default: ALUControl = 3'b000; // N/a
                endcase
            end
            3'b111: ALUControl = 3'b000; // N/a
            default: ALUControl = 3'b000; // N/a
        endcase
    end

endmodule
