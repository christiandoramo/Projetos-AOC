.data
banner: .asciiz "restaurante-shell>> "
successmsg: .asciiz "Atendimento iniciado com sucesso\n"
occupiedmsg: .asciiz "Falha: mesa ocupada\n"
invalidmsg: .asciiz "Comando inválido\n"
inexistentmsg: .asciiz "Falha: mesa inexistente\n"

.text
main:
                                                                                            # Imprime o banner do restaurante
    li      $v0,                    4
    la      $a0,                    banner
    syscall 

# Leitura do comando do usuário
    li      $v0,                    8
    la      $a0,                    0($t0)                                                  # Assuma que o buffer está em $t0
    li      $a1,                    100                                                     # Tamanho máximo da entrada (ajuste se necessário)
    syscall 

# Encontrar a quebra de linha no comando
    li      $t1,                    0                                                       # Índice para percorrer a string
    li      $t2,                    100                                                     # Tamanho máximo da entrada (ajuste se necessário)

findnewline:
    lb      $t3,                    0($t0)                                                  # Carrega o caractere atual
    beqz    $t3,                    endfindnewline                                          # Verifica se é o fim da string
    beq     $t3,                    '\n',                           endfindnewline          # Verifica se é uma quebra de linha
    addi    $t0,                    $t0,                            1                       # Avança para o próximo caractere
    addi    $t1,                    $t1,                            1                       # Incrementa o índice
    b       findnewline

endfindnewline:
                                                                                            # Agora a string até $t1 contém o comando digitado (excluindo a quebra de linha)

# Interpretar o comando
    li      $t4,                    0                                                       # Opção 1 - Código da mesa
    li      $t5,                    0                                                       # Opção 2 - Telefone de contato
    la      $t6,                    0($t0)                                                  # Opção 3 - Nome do responsável
    li      $t7,                    0                                                       # Variável para guardar o tamanho da string de opção 3

# Loop para obter as opções do comando
    li      $t8,                    0                                                       # Índice para percorrer as opções
    li      $t9,                    0                                                       # Variável para identificar qual opção está sendo lida (1, 2 ou 3)

getoptionsloop:
    lb      $t3,                    0($t0)                                                  # Carrega o caractere atual
    beqz    $t3,                    endgetoptionsloop                                       # Verifica se é o fim da string
    beq     $t3,                    '-',                            optiondetected          # Verifica se é o início de uma opção
    addi    $t0,                    $t0,                            1                       # Avança para o próximo caractere
    b       getoptionsloop

optiondetected:
    addi    $t0,                    $t0,                            1                       # Avança para o próximo caractere após o '-'
    addi    $t9,                    $t9,                            1                       # Incrementa a variável de opção detectada

# Loop para ler a opção atual até o próximo '-' ou fim da string
readoptionloop:
    lb      $t3,                    0($t0)                                                  # Carrega o caractere atual
    beqz    $t3,                    endreadoptionloop                                       # Verifica se é o fim da string
    beq     $t3,                    '-',                            endreadoptionloop       # Verifica se é o próximo '-'

# Verificar qual opção está sendo lida e armazenar nas variáveis apropriadas
    beq     $t9,                    1,                              readoption1
    beq     $t9,                    2,                              readoption2
    beq     $t9,                    3,                              readoption3

# Opção 1 - Código da mesa
readoption1:
                                                                                            # Transforma o caractere ASCII numérico em inteiro
    sub     $t3,                    $t3,                            '0'
    mul     $t4,                    $t4,                            10
    add     $t4,                    $t4,                            $t3

    addi    $t0,                    $t0,                            1                       # Avança para o próximo caractere
    b       readoptionloop

# Opção 2 - Telefone de contato
readoption2:
                                                                                            # Armazena os números do DDD
    sub     $t3,                    $t3,                            '0'
    mul     $t5,                    $t5,                            10
    add     $t5,                    $t5,                            $t3

    addi    $t0,                    $t0,                            1                       # Avança para o próximo caractere

# Loop para obter os números do telefone após o DDD
    li      $t8,                    0                                                       # Reinicia o índice para percorrer os números
readphonenumbersloop:
    lb      $t3,                    0($t0)                                                  # Carrega o caractere atual
    beqz    $t3,                    endreadoptionloop                                       # Verifica se é o fim da string

# Verifica se chegou ao final dos números do telefone
# Se sim, sai do loop e avança para o próximo caractere
    sub     $t6,                    $t3,                            '0'
    bgez    $t6,                    continuereadphonenumbersloop

# Se não, armazena o número do telefone
    mul     $t5,                    $t5,                            10
    add     $t5,                    $t5,                            $t6

continuereadphonenumbersloop:
    addi    $t0,                    $t0,                            1                       # Avança para o próximo caractere
    addi    $t8,                    $t8,                            1                       # Incrementa o índice
    b       readphonenumbersloop

# Opção 3 - Nome do responsável
readoption3:
    beq     $t7,                    0,                              initresponsiblename     # Se for o primeiro caractere, inicializa o nome
    lb      $t3,                    0($t0)                                                  # Carrega o caractere atual
    beqz    $t3,                    endreadoptionloop                                       # Verifica se é o fim da string
    sb      $t3,                    0($t6)                                                  # Armazena o caractere na posição do nome
    addi    $t0,                    $t0,                            1                       # Avança para o próximo caractere
    addi    $t6,                    $t6,                            1                       # Avança para a próxima posição do nome
    j       readoption3

initresponsiblename:
    addi    $t6,                    $t6,                            1                       # Pula a posição 0 para não armazenar o '-'
    addi    $t7,                    $t7,                            1                       # Incrementa o tamanho do nome
    j       readoption3

endreadoptionloop:
                                                                                            # Fim da leitura das opções
                                                                                            # Agora as variáveis $t4 (código da mesa), $t5 (telefone) e $t6 (nome) estão preenchidas.

# Verificar se o comando é válido e executar a ação correspondente
# (Adicione aqui a lógica para verificar se a mesa existe, está ocupada, etc.)
# Exemplo: verificação de código de mesa válido
    li      $t3,                    1                                                       # Valor mínimo de código de mesa (01)
    li      $t8,                    15                                                      # Valor máximo de código de mesa (15)
    blt     $t4,                    $t3,                            invalidcommand
    bgt     $t4,                    $t8,                            invalidcommand

# Se chegou até aqui, o comando é válido
# Adicione a lógica para verificar se a mesa está ocupada, etc., e execute a ação apropriada
# Exemplo:
# Aqui você pode ter uma rotina de busca ou acesso a uma estrutura de dados para verificar o estado da mesa
# Se a mesa estiver ocupada, você pode imprimir a mensagem "Falha: mesa ocupada" e sair do programa.
# Se a mesa estiver livre, você pode iniciar o atendimento e imprimir a mensagem "Atendimento iniciado com sucesso".

# Após a execução do comando, imprimir a mensagem de sucesso
    li      $v0,                    4
    la      $a0,                    successmsg
    syscall 

# Encerrar o programa
    li      $v0,                    10
    syscall 

invalidcommand:
                                                                                            # Comando inválido
                                                                                            # Imprimir a mensagem de comando inválido
    li      $v0,                    4
    la      $a0,                    invalidmsg
    syscall 

# Encerrar o programa
    li      $v0,                    10
    syscall 
