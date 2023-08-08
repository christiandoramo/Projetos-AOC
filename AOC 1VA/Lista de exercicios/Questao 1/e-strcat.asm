# grupo: 
# ALEXANDRE VITOR ROCHA DE SOUZA , CHRISTIAN OLIVEIRA DO RAMO, JOAO LUCAS PINTO DE SANTANA, VINICIUS NARIO VASCONCELOS
# data: 08/08/2023
# atividade: questao 1-e
# disciplina: Arquitetura e Organização de Computadores
# semestre letivo: 2022.2
# descrição: função strcat

.data
    # Strings
    source_str: .asciiz "String source"
    dest_str:   .asciiz "String Destination: "

.text
main:
    # Carregue o endere�o das strings de destino e fonte nos registradores
    la $a0, dest_str    # Destination string address
    la $a1, source_str  # Source string address

    # chama a fun��o strcat
    jal strcat

    # printa a string concatenada
    move $a0, $v0        # Move o valor de $v0 para $a0
    li $v0, 4           # printa nova string
    syscall

    # fim do programa
    li $v0, 10
    syscall

##Fun��o--------------------------------------------------------------------------------------
strcat:
    # Input: $a0 = destination, $a1 = source
    # Output: $v0 = string concatenada

    # salva o destination em $t0
    move $t0, $a0

loop_concat:
    lb $t1, 0($a0)      # Load byte do destination string
    beqz $t1, end_concat  # se vazio, exit loop

    addi $a0, $a0, 1    # move para o proximo charactere no destination
    j loop_concat       # Repete loop

end_concat:
    # concatena o source no destination
    lb $t1, 0($a1)      # Load byte do source string

    # copia cada caractere at� o fim da string
    beqz $t1, exit_concat # se vazio, exit loop

    sb $t1, 0($a0)      # salva o caractere do source no destination

    addi $a0, $a0, 1    # Move para o o proximo caractere do destination
    addi $a1, $a1, 1    # Move para o o proximo caractere do source
    j end_concat        # Repete loop

exit_concat:
    #Fim do concat
    li $t1, 0           # carrega null character (0) no $t1
    sb $t1, 0($a0)      # salva o caractere nulo no fiim da string de destino

    move $v0, $t0       # coloca o valor de retorno original nodestination address
    jr $ra              # retorna a fun��o que chamou
