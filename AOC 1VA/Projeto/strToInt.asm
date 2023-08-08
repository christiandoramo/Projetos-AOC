# grupo: 
# ALEXANDRE VITOR ROCHA DE SOUZA , CHRISTIAN OLIVEIRA DO RAMO, JOAO LUCAS PINTO DE SANTANA, VINICIUS NARIO VASCONCELOS
# data: 08/08/2023
# atividade: projeto
# disciplina: Arquitetura e Organização de Computadores
# semestre letivo: 2022.2
# descrição: função que converte string em inteiro

# Função para converter a string em um número inteiro
.text

.globl str_Para_int
    # a1 - bytes a ser percorridos
    # a0 endereço
    #v0 retorno
str_Para_int:
	addi $v1,$0,0 #inicializando com 0 o retorno
	addi $t1, $0, 10 #atribui o valor 10 para t1
	# quando a1 for 0, encerrou a conversao
	addi $t2, $0, 48 # caractere '0' em ascii
  str_para_uint_loop:
  	beqz $a1, str_para_uint_fim #se o char é 0 vai para str_para_uint_fim
	subi $a1, $a1, 1 # contador de vezes(bytes andados) -1
	lbu $t0, ($a0) #lê o byte do número do endereço que está em a0 e armazena em t0
	beq $t0, $0, str_para_uint_loop
	beq $t0, $t2, char_atual_0 # byte é char '0'
	j nao_e_char_0
	char_atual_0:
       	 	multu $v1, $t1 #multiplica por 10 para ir passando de algarismo
        	mflo $v1 #pega o valor que está no registrador lo e coloca em v1
        	addiu $a0, $a0, 1
        	j str_para_uint_loop
	nao_e_char_0:
	# Converte o caractere para um dígito e acumula o resultado
	addi $t0, $t0, -48 #subtrai o valor do inteiro em ascii pelo o valor de 0
        multu $v1, $t1 #multiplica por 10 para ir passando de algarismo
        mflo $v1 #pega o valor que está no registrador lo e coloca em v0
        

        addu $v1, $v1, $t0 #soma o resultado anterior com o novo, caso exista resultado anterior
        
        addiu $a0, $a0, 1 # Avança para o próximo caractere da string
        j str_para_uint_loop #faz o loop

  str_para_uint_fim:
  	add $v0, $0, $v1
  	jr $ra #retorna para uma linha após da chamada da função str_para_uint
