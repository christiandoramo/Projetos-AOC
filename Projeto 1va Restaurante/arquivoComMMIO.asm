# Criando função de leitura e escrita de string no MMIO Sim. e a cada linha deve ser impresso uma string
# <nome_restaurante>-shell>>


.data
labelComando: .asciiz "Restaurante-shell>> "

.text
comando:
                                                                # detectação dos comandos
novaLinha:
    la      $a0,                    labelComando                # carrega adress do label da linha de comando como source/fonte
    addi    $a1,                    $0,             20          # numero de caracteres do labelComando 20 chars para ser copiados
    jal     imprimeStringMMIO                                   # params -> destination: a0, source: a1, numBytes: a2. retorna destination em v0
                                                                # pseudo memcpy/strcpy
eco:
    jal     getc                                                # Chama a função getc para ler um caractere da entrada padrão
    ori     $a0,                    $v0,            0           # Coloca o valor lido em $a0 (param a0 = retorno de getc)
    jal     putc                                                # Chama a função putc para escrever o caractere lido na saída padrão
    beq     $v0,                    10,             comando     # se Enter pula linha, e em comando-novaLinha imprime label do restaurante
    j       eco                                                 # loop para cada caractere

exit:                                                           # nunca está encerrando por enquanto
    li      $v0,                    10                          # Carrega o valor 10 em $v0 (código de syscall para sair do programa)
    syscall                                                     # Realiza uma chamada de sistema para encerrar o programa

getc:
    lui     $t0,                    0xffff                      # Carrega a constante 0xffff no registrador $t0 (endereço de memória do dispositivo de entrada)
getcloop:
    lw      $t1,                    0($t0)                      # Lê o registrador de controle do dispositivo de entrada
    andi    $t1,                    $t1,            0x0001      # Extrai o bit 'ready' do registrador de controle
    beq     $t1,                    $0,             getcloop    # Faz um loop até que o dispositivo esteja pronto para transmitir (leitura)
    lw      $v0,                    4($t0)                      # Lê o dado recebido e armazena em $v0 (retorno da função getc)
    jr      $ra                                                 # Retorna para a função chamadora (ra = return address)

putc:
                                                                # a0 = recebe (caractere a ser escrito)
    lui     $t0,                    0xffff                      # Carrega a constante 0xffff no registrador $t0 (endereço de memória do dispositivo de saída)
putcloop:
    lw      $t1,                    8($t0)                      # Lê o registrador de controle do dispositivo de saída
    andi    $t1,                    $t1,            0x0001      # Extrai o bit 'ready' do registrador de controle
    beq     $t1,                    $0,             putcloop    # Faz um loop até que o dispositivo esteja pronto para receber (escrita)
    sw      $a0,                    0xc($t0)                    # Escreve o caractere (valor de a0) no registrador de dados do dispositivo de saída
    jr      $ra                                                 # Retorna para a função chamadora (ra = return address)


imprimeStringMMIO:
                                                                # a1 - endereço da string
                                                                # a2 - tamanho da string a ser impressa (no labelComando é 20 quando 0 termina o loop)
    lui     $t0,                    0xffff                      # Carrega a constante 0xffff no registrador $t0 (endereço de memória do dispositivo de saída)
    #addiu  $t0,                    $t0,            0xc         # posicao de saida do MMIO
imprimeStringMMIOLoop:
    lb      $t1,                    ($a0)                       # carrega byte a byte
    sb      $t1,                    ($t0)                       # guarda
    addiu   $a0,                    $a0,            1           # anda um byte
    addi    $a1,                    $a1,            -1          # menus um de tamanho da string
    ble     $a1,                    $0,             retornar
    j       imprimeStringMMIOLoop
retornar:
    jr      $ra



