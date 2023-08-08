# Criando função de leitura e escrita de string no MMIO Sim. e a cada linha deve ser impresso uma string
# <nome_restaurante>-shell>>


.data
labelComando: .asciiz "Restaurante-shell>>"
entradaAtual: .space 64                                                 # na função ler string se for lido um espaço em branco é interpretado como 0

.text
comando:
                                                                        # detectação dos comandos, erros de intervalo ou caso a string foi escrita errada

novaLinha:
    la      $a0,                labelComando                            # carrega adress do label da linha de comando como source/fonte
    addi    $a1,                $0,             20                      # numero de caracteres do labelComando 20 chars para ser copiados
    jal     imprimeStringMMIO                                           # params -> destination: a0, source: a1, numBytes: a2. retorna destination em v0
                                                                        # carrega texto na tela ^^^^
    li      $t0,                64                                      # tamanho max da entrada a ser limpo
    la      $a1,                entradaAtual                            # carregando endereço para limpar entradaAtual
limpeEntradaAtual:
    sb      $0,                 ($a1)                                   # cada byte é zerado
    addi    $a1,                $a1,            1                       # proxima posição prox byte +1
    subi    $t0,                $0,             1                       # 32-1, 31-1 , 1-1 = 0 > limpo
    ble     $t0,                $0,             limpo
    j       limpeEntradaAtual
limpo:                                                                  # entrada limpa
    la      $a1,                entradaAtual                            # entradaAtual é feita num espaço na memoria para ser trabalhado la em cima dentro de "comando"
eco:
    jal     getc                                                        # Chama a função getc para ler um caractere da entrada padrão

    ori     $a0,                $v0,            0                       # Coloca o valor lido em $a0 (param a0 = retorno de getc, podia usar add ou li)

    jal     putc                                                        # Chama a função putc para escrever o caractere lido na saída padrão

    beq     $a0,                10,             comando                 # se Enter pula linha, e efetua o comando-novaLinha imprime label do restaurante
                                                                        # a0 é o caractere diferente de enter que será armazenado
    jal     leCharMMIO                                                  # converte a word em $a0 em byte e põe na entrada atual a cada getc
    j       eco                                                         # loop para cada caractere

exit:                                                                   # nunca está encerrando por enquanto
    li      $v0,                10                                      # Carrega o valor 10 em $v0 (código de syscall para sair do programa)
    syscall                                                             # Realiza uma chamada de sistema para encerrar o programa

getc:
    lui     $t0,                0xffff                                  # Carrega a constante 0xffff no registrador $t0 (endereço de memória do dispositivo de entrada)
getcloop:
    lw      $t1,                0($t0)                                  # Lê o registrador de controle do dispositivo de entrada
    andi    $t1,                $t1,            0x0001                  # Extrai o bit 'ready' do registrador de controle
    beq     $t1,                $0,             getcloop                # Faz um loop até que o dispositivo esteja pronto para transmitir (leitura)
    lw      $v0,                4($t0)                                  # Lê o dado recebido e armazena em $v0 (retorno da função getc)
    jr      $ra                                                         # Retorna para a função chamadora (ra = return address)

putc:
                                                                        # a0 = recebe (caractere a ser escrito)
    lui     $t0,                0xffff                                  # Carrega a constante 0xffff no registrador $t0 (endereço de memória do dispositivo de saída)
putcloop:
    lw      $t1,                8($t0)                                  # Lê o registrador de controle do dispositivo de saída
    andi    $t1,                $t1,            0x0001                  # Extrai o bit 'ready' do registrador de controle
    beq     $t1,                $0,             putcloop                # Faz um loop até que o dispositivo esteja pronto para receber (escrita)
    sw      $a0,                0xc($t0)                                # Escreve o caractere (valor de a0) no registrador de dados do dispositivo de saída
    jr      $ra                                                         # Retorna para a função chamadora (ra = return address)


imprimeStringMMIO:
                                                                        # a1 - endereço da string
                                                                        # a2 - tamanho da string a ser impressa (no labelComando é 20 quando 0 termina o loop)
    lui     $t0,                0xffff                                  # posição da saida display MMIO - operando 0xffff000c out of range
    addiu   $t0,                $t0,            0xc                     # posição ffff000c - dados de vizualização do display
imprimeStringMMIOLoop:
    lb      $t1,                ($a0)                                   # carrega byte da string e converte em word

# convertendo byte em word...
    sll     $t1,                $t1,            24                      # Desloca o byte para a posição correta na palavra(3 bytes a esquerda)
    sra     $t1,                $t1,            24                      # Preenche os 24 bits superiores com o sinal do byte original

    sw      $t1,                ($t0)                                   # guarda
    addiu   $a0,                $a0,            1                       # anda um byte na string a ser lida - convertida em word
    addi    $a1,                $a1,            -1                      # menos um de tamanho da string a ser lida
                                                                        # ble $a1, $0, retornar
    bgt     $a1,                $0,             imprimeStringMMIOLoop
                                                                        # retornar:
    jr      $ra

leCharMMIO:                                                             # le string byte a byte a cada get e put
                                                                        # a0 - caractere digitado como word
                                                                        # a1 - contador da posição do byte andado
                                                                        # convertendo word em byte e armazenando...
    andi    $t1,                $a0,            0xff                    # Aplica uma máscara de 8 bits para extrair o byte menos significativo da palavra
    sb      $t1,                ($a1)                                   # guarda char a0 em posicao a1
    addi    $a1,                $a1,            1                       # Posição atual em entradaAtual é recebe + 1 byte. é zerado ao apertar Enter
    jr      $ra
