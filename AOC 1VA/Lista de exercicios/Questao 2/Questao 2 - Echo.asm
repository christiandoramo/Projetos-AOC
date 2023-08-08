# grupo: 
# ALEXANDRE VITOR ROCHA DE SOUZA , CHRISTIAN OLIVEIRA DO RAMO, JOAO LUCAS PINTO DE SANTANA, VINICIUS NARIO VASCONCELOS
# data: 08/08/2023
# atividade: questao 2
# disciplina: Arquitetura e Organização de Computadores
# semestre letivo: 2022.2
# descrição: o programa usa o keyboard and display MMIO simulator para reescrever o que é escrito pelo usuario
# no display. *Obs: Aperte enter para encerrar o programa

.data
KEYBOARD_ADDR: .word 0xffff0000    # Endereço do registrador de entrada do teclado (KEYBOARD MMIO)
DISPLAY_ADDR: .word 0xffff000c     # Endereço do registrador de saída do display (DISPLAY MMIO)

.text
main:
   	 # Carrega o endereço do registrador de entrada do teclado em $t0
    	lw $t0, KEYBOARD_ADDR
    
    	# Carrega o endereço do registrador de saída do display em $t1
    	lw $t1, DISPLAY_ADDR

	# Inicia o t3 com 10, para comparar se o caracatere lido é "Enter" (código ASCII 10)
    	li $t3, 10

lendo_keyboard:
    # Tentativa de leitura do teclado usando a instrução lbu
	lbu $t2, 0($t0)			#Coloca em t2 o valor do byte que ta na posição 0(t0)
	andi $t2, $t2, 0x0001		#Faz a checagem se está ativo em t2
	beq $t2, $zero, lendo_keyboard	#Se estiver em 0, significa que não digito nada e volta ao loop	
	lbu $v0, 4($t0)		#Armazena em v0 o que está na proxima posição de t0, no caso o valor, pois na primeira opção fica 0 ou 1
	move $a0, $v0		#Coloca em a0 o valor de v0, pois pra imprimir tem que estar em a0
	
    
    # Se chegou aqui, o caractere não é "Enter", então imprime-o no display
    colocando_DISPLAY:
    	lw $t4, 8($t0)
    	addi $t4, $t4, 0x0001
    	beq $t4, $zero, colocando_DISPLAY
    	sb $a0, 0($t1)
	
	bne $v0, 10, lendo_keyboard  # Repete se valor lido for diferente de 10 ( "Enter")

exit:
    # Termina o programa
    li $v0, 10
    syscall
