# grupo: 
# ALEXANDRE VITOR ROCHA DE SOUZA , CHRISTIAN OLIVEIRA DO RAMO, JOAO LUCAS PINTO DE SANTANA, VINICIUS NARIO VASCONCELOS
# data: 08/08/2023
# atividade: projeto
# disciplina: Arquitetura e Organização de Computadores
# semestre letivo: 2022.2
# descrição: função que compara um determinado numero de bytes

#Imprime o resultado de comparar duas strings:
	# 0 -> as strings são iguais
	# -1 -> a str1 for menor que a str2
	# 1 -> a str1 for maior que a str2
.globl strncmp
.text	
  strncmp:
  	beq $a3, $0, return #se o numero de comparações for 0 vai para return
  	lb $t0, ($a0) #lê o byte do número do endereço que está em a0 e armazena em t0
  	lb $t1, ($a1) #lê o byte do número do endereço que está em a1 e armazena em t1
  	
  	beq $t0, $0, return #se o char é 0 vai para return
	beq $t1, $0, return #se o char é 0 vai para return
	beq $t0, $t1, pula_char #se t0 for igual a t1 vai para pula_char
	
	slt $v0, $t1, $t0 #se a string2(t1) é menor que a string1(t0) coloca 1
	bne $v0, $0, return #se v0 não for igual a 0 vai para return
	addi $v0, $0, -1 #coloca -1 em v0
	jr $ra
	
  pula_char:
  	addi $a3, $a3, -1 #decrementa a3
  	addi $v0, $0, 0 #garante que v0 é 0
	addiu $a0,$a0, 1 #soma mais um sem overflow
	addiu $a1,$a1, 1 #soma mais um sem overflow
	j strncmp #vai para a label strcmp
	
  return:
  	jr $ra
