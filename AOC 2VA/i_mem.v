module i_mem (
    input wire [31:0] address, // Endereço de leitura da memória
    output wire [31:0] i_out   // Dado armazenado (instrução) na posição especificada pelo address
);
    reg [31:0] mem[0:1023]; // Declarando a memória de instrução como uma ROM assíncrona

    initial begin
        $readmemh("instruction.list", mem); // Lê o arquivo de instruções e carrega na memória
    end

    assign i_out = mem[address]; // Saída da instrução lida da memória com base no endereço

endmodule
