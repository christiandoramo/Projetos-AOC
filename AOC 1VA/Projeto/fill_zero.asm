# grupo: 
# ALEXANDRE VITOR ROCHA DE SOUZA , CHRISTIAN OLIVEIRA DO RAMO, JOAO LUCAS PINTO DE SANTANA, VINICIUS NARIO VASCONCELOS
# data: 08/08/2023
# atividade: projeto
# disciplina: Arquitetura e Organização de Computadores
# semestre letivo: 2022.2
# descrição: função que preenche string com valor nulo

# params -> destination: a0, num: a1.
# retorna destination em v0.
.globl fill_zero
.text	
  fill_zero:
	addi $v0, $a0, 0 # v0 vai retorna destination a0
  fill_zero_Loop:
	li $t0, 0 #garante que tem 0 em t0
	sb $t0, 0($a0)

	addi $a0, $a0, 1 # destino = proximo byte(posição)
	addi $a1, $a1, -1 # o numero de bytes a ser copiado diminui em 1 a cada loop

	beq $a1, $0, retorne
	j fill_zero_Loop
  retorne:
	jr $ra
