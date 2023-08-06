# params -> destination: a0, num: a1.
# retorna destination em v0.
.globl fill_zero_string
.text	
  fill_zero_string:
  	# a1 contem o numero de bytes a ser percorrido
  	# a0 contem endereço
  fill_zero_Loop:
	li $t0, 48 #garante que tem char '0' 
	lb $t1, ($a0)
	beqz $t1, grava_char_0 # se char em t1 é nulo bota '0'
	j pula_gravacao
	grava_char_0:
	sb $t0, 0($a0)
	pula_gravacao:
	addi $a0, $a0, 1 # destino = proximo byte(posição)
	addi $a1, $a1, -1 # o numero de bytes a ser copiado diminui em 1 a cada loop
	beq $a1, $0, retorne
	j fill_zero_Loop
  retorne:
	jr $ra
