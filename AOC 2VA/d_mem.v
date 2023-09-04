// criando a Memória de dados
module d_mem (Address, WriteData, ReadData, MemWrite, MemRead);
// descrevendo minhas portas

input  wire [31:0] Address;//Address (entrada) Endereço de acesso (leitura ou escrita). Deve ser fornecido pela ULA. 32 bits
input  wire [31:0] WriteData;//Dado a ser escrito na memória na posição especificada por Address. Deve ser fornecido pelo regfile.32 bits

output wire [31:0] ReadData;//Dado lido na memória na posição especificada por Address. 32 bit

input  wire MemWrite;//MemWrite (entrada) Sinal de controle. Quando TRUE, indica que a memória deve escrever o WriteData na posição especificada por Address. Quando FALSE, nada deve ser escrito na memória. Sinal deve ser fornecido pela unidade de controle. 1 bit
input  wire MemRead;//Sinal de controle. Quando TRUE, indica que a memória deve ler o conteúdo da memória na posição especificada por Address e colocar o resultado na saída ReadData . Quando FALSE, ReadData deve ficar em alta impedância. Sinal deve ser fornecido pela unidade de controle. 1 bit

//descrevendo funcionamento do circuito]
parameter MEM_SIZE = 1024; // Tamanho da memória (altere conforme necessário)
reg [31:0] memory [0:MEM_SIZE-1]; // Definição da memória

//Escrita assíncrona na memória
always @ (posedge MemWrite)
begin
   if (MemWrite)
      memory[Address] <= WriteData;// Armazena o WriteData no endereço especificado
   end

// Leitura assíncrona da memória
assign ReadData = (MemRead) ? memory[Address] : 32'bzzzz_zzzz_zzzz_zzzz_zzzz_zzzz_zzzz_zzzz; //para evitar conflitos.
// Se MemRead for verdadeiro, atribui o dado na memória no endereço especificado para ReadData.
// Caso contrário, coloca ReadData em um estado de alta impedância (z) para evitar conflitos.

endmodule