# grupo: 
# ALEXANDRE VITOR ROCHA DE SOUZA , CHRISTIAN OLIVEIRA DO RAMO, JOAO LUCAS PINTO DE SANTANA, VINICIUS NARIO VASCONCELOS
# data: 08/08/2023
# atividade: questao 1-d
# disciplina: Arquitetura e Organização de Computadores
# semestre letivo: 2022.2
# descrição: função strncmp

.data
	prompt: .asciiz "Digite uma string: "
	prompt1: .asciiz "Informe o número de caracteres a ser comparado: "
	string1: .space 25
	string2: .space 25
	str_break_line: .asciiz "\n"
	
.macro fim_de_codigo
	addi $v0, $0, 10
	syscall
.end_macro

.macro break_line
	la $a0, str_break_line
	addi $v0, $0, 4
	syscall
.end_macro

.macro imprime_texto(%label)
	addi $v0, $0, 4 #serviço print_string
	la $a0,%label #Passa a string de .data como argumento
	syscall #executa o system call de acordo com o número de v0
.end_macro

.macro read_string(%label)
	addi $v0, $0, 8 #serviço read_string
	la $a0,%label #Pega a entrada e salva em string
	la $a1, 25 #vai ler 25 bytes
	syscall #executa o system call de acordo com o número de v0
.end_macro

.text
  main:
 	#Imprime "Digite uma string: "
  	imprime_texto(prompt)
	
	#Recebe a entrada da string
	read_string(string1)
	
	#Imprime "Digite uma string: "
  	imprime_texto(prompt)
	
	#Recebe a entrada da string
	read_string(string2)
	
	#Imprime "Informe o número de caracteres a ser comparado: "
  	imprime_texto(prompt1)
	
	#Recebe a entrada de um int
	addi $v0, $0, 5 #serviço read_int
	syscall #executa o system call de acordo com o número de v0

	la $a0,string1 #coloca a string em $a0
	la $a1,string2 #coloca a string em $a1
	addi $a3, $v0, 0 #numero de caracteres a ser comparado
	
	jal strcmp

	#Imprime o resultado de comparar duas strings:
	# 0 -> as strings são iguais
	# -1 -> a str1 for menor que a str2
	# 1 -> a str1 for maior que a str2
	
	add $a0, $0, $v0 #Passa v0 como argumento
	addi $v0, $0, 1 #serviço print_int
	syscall #executa o system call de acordo com o número de v0
	
	fim_de_codigo
	
  strcmp:
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
	j strcmp #vai para a label strcmp
	
  return:
  	jr $ra
