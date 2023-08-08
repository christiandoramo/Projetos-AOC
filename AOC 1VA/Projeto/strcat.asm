# grupo: 
# ALEXANDRE VITOR ROCHA DE SOUZA , CHRISTIAN OLIVEIRA DO RAMO, JOAO LUCAS PINTO DE SANTANA, VINICIUS NARIO VASCONCELOS
# data: 08/08/2023
# atividade: projeto
# disciplina: Arquitetura e Organização de Computadores
# semestre letivo: 2022.2
# descrição: função que concatena strings

# Input: $a0 = destination, $a1 = source
# Output: $v0 = string concatenada
.globl strcat
.text
strcat:
    move $v0, $a0 # coloca o valor de retorno original no destination address
loop_concat:
    lb $t1, 0($a0)      # Load byte do destination string
    beqz $t1, end_concat  # se vazio, exit loop

    addi $a0, $a0, 1    # move para o proximo charactere no destination
    j loop_concat       # Repete loop

end_concat:
    # concatena o source no destination
    lb $t1, 0($a1)      # Load byte do source string

    # copia cada caractere ate o fim da string
    beqz $t1, exit_concat # se vazio, exit loop

    sb $t1, 0($a0)      # salva o caractere do source no destination

    addi $a0, $a0, 1    # Move para o o proximo caractere do destination
    addi $a1, $a1, 1    # Move para o o proximo caractere do source
    j end_concat        # Repete loop

exit_concat:
    #Fim do concat
    li $t1, 0           # carrega null character (0) no $t1
    sb $t1, 0($a0)      # salva o caractere nulo no fim da string de destino

    jr $ra              # retorna a funcao que chamou
