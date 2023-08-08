# grupo: 
# ALEXANDRE VITOR ROCHA DE SOUZA , CHRISTIAN OLIVEIRA DO RAMO, JOAO LUCAS PINTO DE SANTANA, VINICIUS NARIO VASCONCELOS
# data: 08/08/2023
# atividade: questao 1-a
# disciplina: Arquitetura e Organização de Computadores
# semestre letivo: 2022.2
# descrição: função strcpy

.data
    source: .asciiz "teste copia"  # String de origem
    destination: .space 20              # Espa�o para a string de destino (20 bytes)

.text
.globl strcpy

strcpy:
    # Carrega o endere�o da string de origem em $t0
    la $t0, source #origem

    # Carrega o endere�o da string de destino em $t1
    la $t1, destination #destino

	move $a1, $t0	# colocando em a1, endere�o da origem
	move $a0, $t1 	# colocando em a0, endere�o do destino
	
loop_copy:
    lb $t2, 0($t0)  # Carrega o pr�ximo caractere da origem em $t2
    sb $t2, 0($t1)  # Armazena o caractere copiado no destino
    beq $t2, $zero, end_copy  # Verifica se chegou ao fim da string (caractere NULL)
    addi $t0, $t0, 1  # Incrementa o endere�o da origem para o pr�ximo caractere
    addi $t1, $t1, 1  # Incrementa o endere�o do destino para o pr�ximo caractere
    j loop_copy      # Repete o loop para copiar o pr�ximo caractere

end_copy:
    # Termina a string de destino com o caractere NULL ('\0')
    sb $zero, 0($t1)

	# Retornando endere�o de copia do destination para o registrador $v0
	move $v0, $a0
	jr $ra
