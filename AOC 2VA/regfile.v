
// criando o banco de registradores
module regfile (ReadAddr1,ReadAddr2,ReadData1,ReadData2,Clock,WriteAddr,WriteData,RegWrite,Reset);
// descrevendo minhas portas

input  wire [4:0] ReadAddr1;//ReadAddr1 (entrada) Número (endereço) de um dos registradores a ser lido (Read data 1). Valor fornecido pela instrução. 5 bits
input  wire [4:0] ReadAddr2;//ReadAddr2 (entrada) Número (endereço) do outro 5 bits

output wire [31:0] ReadData1;//ReadData1 (saída) Dado lido assincronamente na posição especificada por ReadAddr1 32 bits
output wire [31:0] ReadData2;//ReadData2 (saída) Dado lido assincronamente na posição especificada por ReadAddr2 32 bits

input  wire Clock;//Clock (entrada) Sinal de clock (vai sincronizar as escritas). Sinal externo (fornecido pela interface do top-level). 1 bit
input  wire [4:0] WriteAddr;//WriteAddr (entrada) Número (endereço) do registrador a ser escrito. Valor fornecido pela instrução. 5 bits
input  wire [31:0] WriteData;//WriteData (entrada) Dado a ser escrito no registrador especificado por WriteAddr. Valor fornecido pela ULA ou memória de dados. 32 bits
input  wire RegWrite;//RegWrite (entrada) Sinal de controle que habilita a escrita nos registradores. Caso RegWrite = 1, o dado especificado por WriteData deve ser escrito no registrador especificado por WriteAddr na borda positiva do clock. Caso RegWrite = 0, nada é escrito. Valor fornecido pela unidade de controle. 1 bit
input  wire Reset;//Reset (entrada) Reseta o regfile, isto é, sobrescreve todos os 32 registradores com 0x00000000. Sinal externo (fornecido pela interface do top-level). 1 bit 

//descrevendo funcionamento do circuito
 reg [31:0] registers [0:31]; // criando registradores, array de 32 espaços, cada um com 32bits.
 
 //inicio do circuito
 // Inicializa os registradores durante o reset
 always @(posedge Clock or posedge Reset) begin
     if (Reset) begin
         registers[0]  <= 32'h00000000; // Registrador $0 é sempre 0
         registers[1]  <= 32'h00000000; // Inicializa registrador 1 com 0 durante o reset
         registers[2]  <= 32'h00000000; // Inicializa registrador 2 com 0 durante o reset
			registers[3]  <= 32'h00000000; // Inicializa registrador 3 com 0 durante o reset
			registers[4]  <= 32'h00000000; // Inicializa registrador 4 com 0 durante o reset
			registers[5]  <= 32'h00000000; // Inicializa registrador 5 com 0 durante o reset
			registers[6]  <= 32'h00000000; // Inicializa registrador 6 com 0 durante o reset
			registers[7]  <= 32'h00000000; // Inicializa registrador 7 com 0 durante o reset
			registers[8]  <= 32'h00000000; // Inicializa registrador 8 com 0 durante o reset
		   registers[9]  <= 32'h00000000; // Inicializa registrador 9 com 0 durante o reset
			registers[10] <= 32'h00000000; // Inicializa registrador 10 com 0 durante o reset
			registers[11] <= 32'h00000000; // Inicializa registrador 11 com 0 durante o reset
         registers[12] <= 32'h00000000; // Inicializa registrador 12 com 0 durante o reset
			registers[13] <= 32'h00000000; // Inicializa registrador 13 com 0 durante o reset
			registers[14] <= 32'h00000000; // Inicializa registrador 14 com 0 durante o reset
			registers[15] <= 32'h00000000; // Inicializa registrador 15 com 0 durante o reset
			registers[16] <= 32'h00000000; // Inicializa registrador 16 com 0 durante o reset
			registers[17] <= 32'h00000000; // Inicializa registrador 17 com 0 durante o reset
			registers[18] <= 32'h00000000; // Inicializa registrador 18 com 0 durante o reset
			registers[19] <= 32'h00000000; // Inicializa registrador 19 com 0 durante o reset
			registers[20] <= 32'h00000000; // Inicializa registrador 20 com 0 durante o reset
			registers[21] <= 32'h00000000; // Inicializa registrador 21 com 0 durante o reset
         registers[22] <= 32'h00000000; // Inicializa registrador 22 com 0 durante o reset
			registers[23] <= 32'h00000000; // Inicializa registrador 23 com 0 durante o reset
			registers[24] <= 32'h00000000; // Inicializa registrador 24 com 0 durante o reset
			registers[25] <= 32'h00000000; // Inicializa registrador 25 com 0 durante o reset
			registers[26] <= 32'h00000000; // Inicializa registrador 26 com 0 durante o reset
			registers[27] <= 32'h00000000; // Inicializa registrador 27 com 0 durante o reset
			registers[28] <= 32'h00000000; // Inicializa registrador 28 com 0 durante o reset
			registers[29] <= 32'h00000000; // Inicializa registrador 29 com 0 durante o reset
			registers[30] <= 32'h00000000; // Inicializa registrador 30 com 0 durante o reset
         registers[31] <= 32'h00000000; // Inicializa registrador 31 com 0 durante o reset
        end else begin
            if (RegWrite) begin
                registers[WriteAddr] <= WriteData; // Escreve no registrador especificado na borda positiva do clock
            end
        end
    end
    
    // Leitura assíncrona dos registradores
    assign ReadData1 = (ReadAddr1 == 0) ? 32'h00000000 : registers[ReadAddr1]; // Se ReadAddr1 for 0, lê 0, caso contrário lê o valor do registrador
    assign ReadData2 = (ReadAddr2 == 0) ? 32'h00000000 : registers[ReadAddr2]; // Se ReadAddr2 for 0, lê 0, caso contrário lê o valor do registrador

endmodule