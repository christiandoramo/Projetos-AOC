# grupo: 
# ALEXANDRE VITOR ROCHA DE SOUZA , CHRISTIAN OLIVEIRA DO RAMO, JOAO LUCAS PINTO DE SANTANA, VINICIUS NARIO VASCONCELOS
# data: 08/08/2023
# atividade: projeto
# disciplina: Arquitetura e Organização de Computadores
# semestre letivo: 2022.2
# descrição: restaurante FIFO

.data
	item_1: .ascii "01" # codigo
		.space 30 # 5 para o preco e 25 para descricao
	item_2: .ascii "02" # codigo
		.space 30 # 5 para o preco e 25 para descricao
	item_3: .ascii "03" # codigo
		.space 30 # 5 para o preco e 25 para descricao
	item_4: .ascii "04" # codigo
		.space 30 # 5 para o preco e 25 para descricao
	item_5: .ascii "05" # codigo
		.space 30 # 5 para o preco e 25 para descricao
	item_6: .ascii "06" # codigo
		.space 30 # 5 para o preco e 25 para descricao
	item_7: .ascii "07" # codigo
		.space 30 # 5 para o preco e 25 para descricao
	item_8: .ascii "08" # codigo
		.space 30 # 5 para o preco e 25 para descricao
	item_9: .ascii "09" # codigo
		.space 30 # 5 para o preco e 25 para descricao
	item_10: .ascii "10" # codigo
		.space 30 # 5 para o preco e 25 para descricao
	item_11: .ascii "11" # codigo
		.space 30 # 5 para o preco e 25 para descricao
	item_12: .ascii "12" # codigo
		.space 30 # 5 para o preco e 25 para descricao
	item_13: .ascii "13" # codigo
		.space 30 # 5 para o preco e 25 para descricao
	item_14: .ascii "14" # codigo
		.space 30 # 5 para o preco e 25 para descricao
	item_15: .ascii "15" # codigo
		.space 30 # 5 para o preco e 25 para descricao
	item_16: .ascii "16" # codigo
		.space 30 # 5 para o preco e 25 para descricao
	item_17: .ascii "17" # codigo
		.space 30 # 5 para o preco e 25 para descricao
	item_18: .ascii "18" # codigo
		.space 30 # 5 para o preco e 25 para descricao
	item_19: .ascii "19" # codigo
		.space 30 # 5 para o preco e 25 para descricao
	item_20: .ascii "20" # codigo
		.space 30 # 5 para o preco e 25 para descricao
	mesa_1: .space 1
    	.ascii "01"
    	.space 29
    	mesa_1_relatorio: .space 32
    	mesa_2: .space 1
    	.ascii "02"# codigo
    	.space 29  # 1 status, 2 codigo, 11 telefone,  18 cliente,
	mesa_2_relatorio: .space 32
    	mesa_3: .space 1
    	.ascii "03" # codigo
    	.space 29   # 1 status, 2 codigo, 11 telefone,  18 cliente,
    	mesa_3_relatorio: .space 32
    	mesa_4: .space 1
    	.ascii "04" # codigo
    	.space 29   # 1 status, 2 codigo, 11 telefone,  18 cliente,
    	mesa_4_relatorio: .space 32
    	mesa_5: .space 1
    	.ascii "05" # codigo
    	.space 29   # 1 status, 2 codigo, 11 telefone,  18 cliente,
    	mesa_5_relatorio: .space 32
    	mesa_6: .space 1
    	.ascii "06" # codigo
    	.space 29   # 1 status, 2 codigo, 11 telefone,  18 cliente,
    	mesa_6_relatorio: .space 32
    	mesa_7: .space 1
    	.ascii "07" # codigo
    	.space 29   # 1 status, 2 codigo, 11 telefone,  18 cliente, 
    	mesa_7_relatorio: .space 32 # 4(ITEM-MESA)*20 itens, 6 saldo total, 6 saldo pago
    	mesa_8:.space 1
    	.ascii "08" # codigo
    	.space 29   # 1 status, 2 codigo, 11 telefone,  18 cliente, 
    	mesa_8_relatorio: .space 32 # 4(ITEM-MESA)*20 itens, 6 saldo total, 6 saldo pago
    	mesa_9: .space 1
    	.ascii "09" # codigo
    	.space 29   # 1 status, 2 codigo, 11 telefone,  18 cliente, 
    	mesa_9_relatorio: .space 32  #4(ITEM-MESA)*20 itens, 6 saldo total, 6 saldo pago
    	mesa_10:.space 1
    	.ascii "10" # codigo
    	.space 29   # 1 status, 2 codigo, 11 telefone,  18 cliente, 
    	mesa_10_relatorio: .space 32  #4(ITEM-MESA)*20 itens, 6 saldo total, 6 saldo pago
    	mesa_11:.space 1
    	.ascii "11" # codigo
    	.space 29   # 1 status, 2 codigo, 11 telefone,  18 cliente, 
    	mesa_11_relatorio:.space 32  #4(ITEM-MESA)*20 itens, 6 saldo total, 6 saldo pago
    	mesa_12:.space 1
    	.ascii "12"# codigo
    	.space 29  # 1 status, 2 codigo, 11 telefone,  18 cliente, 
    	mesa_12_relatorio: .space 32  #4(ITEM-MESA)*20 itens, 6 saldo total, 6 saldo pago
    	mesa_13: .space 1
    	.ascii "13"# codigo
    	.space 29  # 1 status, 2 codigo, 11 telefone,  18 cliente, 
    	mesa_13_relatorio: .space 32  #4(ITEM-MESA)*20 itens, 6 saldo total, 6 saldo pago
    	mesa_14:.space 1
    	.ascii "14"# codigo
    	.space 29  # 1 status, 2 codigo, 11 telefone,  18 cliente, 
    	mesa_14_relatorio: .space 32  #4(ITEM-MESA)*20 itens, 6 saldo total, 6 saldo pago
    	mesa_15:.space 1
    	.ascii "15"# codigo
    	.space 29  # 1 status, 2 codigo, 11 telefone,  18 cliente, 
    	mesa_15_relatorio: .space 32 # 20 itens, 6 saldo total, 6 saldo pago
    	
	cmd: .space 50
	cmd1: .asciiz "cardapio_ad"
	cmd2: .asciiz "cardapio_rm"
	cmd3: .asciiz "cardapio_list"
	cmd4: .asciiz "cardapio_format"
	cmd5: .asciiz "mesa_iniciar"
	cmd6: .asciiz "mesa_ad_item"
	cmd7: .asciiz "mesa_rm_item"
	cmd8: .asciiz "mesa_format"
	cmd9: .asciiz "mesa_parcial"
	cmd10: .asciiz "mesa_pagar"
	cmd11: .asciiz "mesa_fechar"
	cmd12: .asciiz "salvar"
	cmd13: .asciiz "recarregar"
	cmd14: .asciiz "formatar"
	cmd15: .asciiz "exit"
	
	mesa_fechada: .asciiz "Mesa fechada com sucesso"
	mesa_ja_fechada: .asciiz "A mesa não estava ocupada"
	saldo_nao_quitado: .asciiz "Falha: saldo devedor ainda não quitado. Valor restante: R$ "
	espaco_convercao: .space 4 
	.ascii "," 
	.space 2
	mesa_pagamento: .asciiz "Pagamento realizado com sucesso"
	mesa_iniciada: .asciiz "Atendimento iniciado com sucesso"
    	mesa_ocupada: .asciiz "Falha: mesa ocupada"
	mesa_inexistente: .asciiz "Falha: mesa inexistente"
	mesa_desocupada: .asciiz "Falha: mesa nao iniciou atendimento"
	mesa_limitada: .asciiz "Falha: mesa atingiu limite de pedidos"
	pedido_adicionado: .asciiz "Pedido adicionado com sucesso"
	item_nao_cadastrado: .asciiz "Falha: item nao cadastrado no cardápio"
	item_nao_consta: .asciiz "Falha: item nao consta na conta"
	mesas_formatadas: .asciiz "As mesas foram limpas"
	arquivo_salvo: .asciiz "O arquivo foi salvo"
	arquivo_lido:.asciiz "O arquivo foi lido"
	cmd_invalido: .asciiz "Comando invalido"
	str_break_line: .asciiz "\n"
	item_adicionado: .asciiz "Item adicionado com sucesso"
	item_ja_cadastrado: .asciiz "Falha: numero de item ja cadastrado"
	item_invalido: .asciiz "Falha: codigo de item invalido"
	item_removido: .asciiz "Item removido com sucesso"
	item_sem_cadastro: .asciiz "Codigo informado não possui item cadastrado no cardapio"
	cardapio_formatado: .asciiz "O cardapio foi apagado para dar lugar a novas criacoes"
	item: .ascii "item_"
	.space 2 # espaco para o codigo
	.ascii "-"
	.space 5  # espaco para o preco
	.ascii "-"
	.space 26 # espaco para a descricao
	nome_restaurante: .asciiz "FIFO-shell>> "
	pede_diretorio: .asciiz "Digite o nome do diretorio, iniciando e terminando com /: "
	pede_nome_arquivo: .asciiz "Digite o nome do arquivo com extensao: "
	arquivo: .space 260 # espaco para o diretorio e depois para o diretorio + nome_arquivo
	nome_arquivo: .space 100 #nome do arquivo com extensao
	#item_pedido: .ascii "item_" .space 2 "-qte-" .space 2
	_mesa: .ascii "mesa_" # total 48 posicoes
	.space 2 # espaco para o codigo
	.ascii "-"
	.space 11 # espaco para o telefone
	.ascii "-"
	.space 18 # nome
	mesa_relatorio:
	.ascii "conta total-" # pago + devendo (saldo total e devedor)
	.space 6 #
	.ascii "-"
	.ascii "saldo pago-"
	.space 6 #
	.ascii "-"
	.ascii "saldo devedor-"
	.space 6 #
	item_pedido: 
	.ascii "_item_"
	.space 1
	quantidade_pedido: 
	.ascii "-qte-"
	.space 1
.macro fim_de_codigo
	addi $v0, $0, 10
	syscall
.end_macro

.macro entrada_string(%label, %num)
	#Recebe a entrada da string
	addi $v0, $0, 8 #serviço read_string
	la $a0,%label #Pega a entrada e salva em string
	la $a1, %num #vai ler %num bytes
	syscall #executa o system call de acordo com o número de v0
.end_macro

.macro imprime_texto(%label)
	addi $v0, $0, 4 #serviço print_string
	la $a0,%label #Passa a string de .data como argumento
	syscall #executa o system call de acordo com o número de v0
.end_macro

.macro break_line
	la $a0, str_break_line
	addi $v0, $0, 4
	syscall
.end_macro

.macro compara_cmd(%inicio, %address, %inicio2, %num)
	la $a0, cmd #string1
	addi $a0, $a0, %inicio #possibilita iniciar a string de um ponto sem ser o começo
	
	add $a1, $0, %address #string2
	addi $a1, $a1, %inicio2 #possibilita iniciar a string de um ponto sem ser o começo
	
	addi $a3, $0, %num #numero de caracteres a ser comparado
	jal strncmp
.end_macro

.macro cmd_com_cmd(%cmd, %inicio, %inicio2, %num, %label)
	la $t0, %cmd #coloca o comando que quer comparar no t0
	compara_cmd(%inicio, $t0, %inicio2, %num) #compara o comando de entrada com o comando da lista
	beq $v0,$0, %label #se eh um comando da lista, desvia
.end_macro

.macro start_function(%label, %num)
    	addi $sp, $sp, -4 # abro espaco pra 1 word na pilha
	sw $ra, 0($sp) #salvo RA
  	la $s0, %label #carrega label em s0
  	li $s1, %num #contador
.end_macro

.macro loop_function(%label, %num, %loop)
    	subi $s1, $s1, 1 #s1--
	beq $s1, $0, %label #numero é menor que 01
	addi $s0, $s0, %num #pula %num bytes
	j %loop #vai para o loop
.end_macro

.macro close_function
    	lw $ra, 0($sp) #recupero o RA original
	addi $sp, $sp, 4 # coloco minha pilha na posicao inicial.
  	jr $ra #retorna para o endereço armazenado em $ra
.end_macro

.macro copiar_memoria(%label, %reg, %num, %reg2, %num2, %num3)
    	la $t0, %label #carrega address para t0
	addi $a0, %reg, %num #destination = endereco base + %num
	addi $a1, %reg2, %num2 #source = endereco base + %num
	li $a2, %num3 #numero de bytes a ser copiados
	jal memcpy #chama a funcao memcpy
.end_macro

.macro preencher_zero(%num, %num2)
    	addi $a0, $s0, %num #destination = endereco base + %num
	li $a1, %num2 #numero de bytes
	jal fill_zero #chama a funcao fill_zero
.end_macro

.macro verifica_enter(%label, %num)
		la $s0, %label #carrega label em s0
  		li $s1, %num #contador
  	loop_verifica_enter:
  		lb $s2, ($s0) #le o byte e armazena em s2
  		li $t0, 10 #carrega o valor em t0
  		bne $s2, $t0, nao_enter #se s2 nao eh igual a \n desvia
  		preencher_zero(0, 1)
 	 nao_enter:
    		loop_function(fim_verifica_enter, 1, loop_verifica_enter)
  	fim_verifica_enter:
.end_macro

.text
  main:
  	imprime_texto(nome_restaurante)
	entrada_string(cmd, 50) #codigo
	
	verifica_enter(cmd, 50) #coloca 0 no lugar de \n 
	
	#compara os primeiros caracteres e desvia se for igual ao de cardapio
	cmd_com_cmd(cmd1, 0, 0, 1, cardapio) 
	
	#compara os primeiros caracteres e desvia se for igual ao de mesa
	cmd_com_cmd(cmd5, 0, 0, 1, mesa) 
	
	#Se nao eh um comando de cardapio e nem de mesa
	#entao eh exit ou um de arquivo ou invalido
	
	#compara os caracteres e desvia se for igual ao de exit
	cmd_com_cmd(cmd15, 0, 0, 1, exit)
	
	#compara os caracteres e desvia se for igual ao de salvar
	cmd_com_cmd(cmd12, 0, 0, 1, salvar) 
	
	#compara os caracteres e desvia se for igual ao de recarregar
	cmd_com_cmd(cmd13, 0, 0, 1, recarregar) 
	
	#compara os caracteres e desvia se for igual ao de formatar
	cmd_com_cmd(cmd14, 0, 0, 1, formatar) 
	
	imprime_texto(item_invalido)
	break_line
	
   	j main #para não acabar o programa
	
  cardapio:
  	#mesa_ad_item-09-10
  	# cardapio_ad-00-00555-dasdads
	#compara os caracteres e desvia se for igual ao de cardapio_ad
	cmd_com_cmd(cmd1, 9, 9, 1, cardapio_ad) 
	
	#compara os caracteres e desvia se for igual ao de cardapio_rm
	cmd_com_cmd(cmd2, 9, 9, 1, cardapio_rm) 
	
	#compara os caracteres e desvia se for igual ao de cardapio_list
	cmd_com_cmd(cmd3, 9, 9, 1, cardapio_list)
	
	#compara os caracteres e desvia se for igual ao de cardapio_format
	cmd_com_cmd(cmd4, 9, 9, 1, cardapio_format) 
	
	imprime_texto(item_invalido)
	break_line
	j main #voltar a main
	
  cardapio_ad:
  	jal adiciona_cardapio
  	j main #voltar a main
  cardapio_rm:
  	jal remove_cardapio
  	j main #voltar a main
  cardapio_list:
  	jal listar_cardapio
  	j main #voltar a main
  cardapio_format:
  	jal formatar_cardapio
  	j main #voltar a main
  	
  mesa:	
  	#compara os caracteres e desvia se for igual ao de mesa_iniciar
  	#mesa_ad_item-09-10
	cmd_com_cmd(cmd5, 5, 5,1, mesa_iniciar) 
	
	#compara os caracteres e desvia se for igual ao de 
	cmd_com_cmd(cmd6, 5,5,1, mesa_ad_item) 
	
  	#compara os caracteres e desvia se for igual ao de
	cmd_com_cmd(cmd7, 5,5,1, mesa_rm_item) 
	
	#compara os caracteres e desvia se for igual ao de
	cmd_com_cmd(cmd8, 5,5,2, mesa_format) 
	
	#compara os caracteres e desvia se for igual ao de 
	cmd_com_cmd(cmd9, 5,5,3, mesa_parcial)
	
	#compara os caracteres e desvia se for igual ao de
	cmd_com_cmd(cmd10, 5,5,3, mesa_pagar)
	
	#compara os caracteres e desvia se for igual ao de 
	cmd_com_cmd(cmd11, 5,5,2, mesa_fechar) 
	
	imprime_texto(cmd_invalido)
	break_line

  	j main #voltar a main
  	mesa_iniciar:
  	jal mesa_iniciar_iniciar
  	j main #voltar a main
	mesa_ad_item:
	jal mesa_ad_item_ad_item
	j main #voltar a main
	mesa_rm_item:
	jal mesa_rm_item_rm_item
	j main #voltar a main
	mesa_format:
	jal mesa_format_format
	j main #voltar a main
	mesa_parcial:
	jal mesa_parcial_parcial
	j main #voltar a main
	mesa_pagar:
	jal mesa_pagar_pagar
	j main #voltar a main
	mesa_fechar:
	jal verifica_mesa_fechada
	j main #voltar a main
  	
  salvar:
  	jal escrever_arquivo #escreve os dados no arquivo FIFO.txt
  	j main #voltar a main
  	
  recarregar:
  	jal ler_arquivo
    	j main #voltar a main
    	
  formatar:
  	jal formatar_cardapio
  	jal mesa_format_format
    	j main #voltar a main
  
  exit:
  	fim_de_codigo #desliga o programa
    	
  adiciona_cardapio:
    	start_function(item_1, 20) #Abre espaco no sp, carrega a label para s0 e num para s1
  loop_ad_cardapio:
  	compara_cmd(12, $s0, 0, 2)
  	beq $v0, $0, adicionar_item #verifica se as strings sao iguais e desvia se for
	li $t0, -1 #coloca o valor 1 em t0
	beq $v0, $t0, numero_incorreto #numero é maior que 20
	loop_function(numero_incorreto, 32, loop_ad_cardapio)
  adicionar_item:
  	li $t0, 0 #garante que tem 0 em t0
	addi $t1, $s0, 2 #carrega a partir do preco do item
	lb $t1, ($t1) #lê o byte do número do endereço que está em t1 e armazena em t1
	sub $v0, $t1, $t0 #v0 = t1 - t0
  	bne $v0, $0, ja_cadastrado #se v0 nao deu 0 eh porque ja esta cadastrado
  	
  	
  	#adiciona o preco
    	copiar_memoria(cmd, $s0, 2, $t0, 15, 5)
  	
	#adiciona a descricao
    	copiar_memoria(cmd, $s0, 7, $t0, 21, 25)

  	imprime_texto(item_adicionado)
  	break_line
  	close_function
  	
  numero_incorreto:
  	imprime_texto(item_invalido)
  	break_line
  	close_function
  	
  ja_cadastrado:
  	imprime_texto(item_ja_cadastrado)
  	break_line
  	close_function	


  remove_cardapio:
    	start_function(item_1, 20) #Abre espaco no sp, carrega a label para s0 e num para s1
  loop_rm_cardapio:
  	compara_cmd(12, $s0, 0, 2)
  	beq $v0, $0, remover_item #verifica se as strings sao iguais e desvia se for
	li $t0, -1 #coloca o valor -1 em t0
	beq $v0, $t0, numero_incorreto #numero é maior que 20
	loop_function(numero_incorreto, 32, loop_rm_cardapio)
  remover_item:
  	li $t0, 0 #garante que tem 0 em t0
	addi $t1, $s0, 2 #carrega a partir do preco do item
	lb $t1, ($t1) #lê o byte do número do endereço que está em t1 e armazena em t1
	sub $v0, $t1, $t0 #v0 = t1 - t0
  	beq $v0, $0, sem_cadastro #se v0 nao deu 0 eh porque ja esta cadastrado
  	
  	#remove o preco
    	preencher_zero(2, 5)
	
	#remove a descricao
    	preencher_zero(7, 25)
	
  	imprime_texto(item_removido)
  	break_line
  	close_function
  	
  sem_cadastro:
  	imprime_texto(item_sem_cadastro)
  	break_line
  	close_function


  listar_cardapio:
    	start_function(item_1, 20)
  loop_listar_cardapio:
	#carrega o codigo
    	copiar_memoria(item, $t0, 5, $s0, 0, 2) 
  
  	#carrega o preco
    	copiar_memoria(item, $t0, 8, $s0, 2, 5)
	
	#carrega a descricao
    	copiar_memoria(item, $t0, 14, $s0, 7, 25)
	
	imprime_texto(item) #imprime item
	break_line
    	loop_function(fim_listar, 32, loop_listar_cardapio)
  fim_listar:
  	close_function
  	
  formatar_cardapio:
    	start_function(item_1, 20) #Abre espaco no sp, carrega a label para s0 e num para s1
  loop_format_cardapio:
    	preencher_zero(2, 30)
	loop_function(formatado, 32, loop_format_cardapio)
  formatado:
  	imprime_texto(cardapio_formatado)
  	break_line
  	close_function

  nao_cadastrado:
  	imprime_texto(item_nao_cadastrado)
  	break_line
  	lw $ra, 0($sp) #recupero o RA original
	addi $sp, $sp, 4 # coloco minha pilha na posicao inicial.
  	jr $ra	
  	 
  	 
  ######################## comandos para mesa ####################################
  	############################# mesa_fechar_fechar ############################## mesa_fechar_fechar  ############################# mesa_fechar_fechar ############################## 
 
verifica_mesa_fechada:
  	addi $sp, $sp, -4 	# abro espaco pra 1 words na pilha
	sw $ra, 0($sp) 		#salvo RA
  	la $s0, mesa_15 	#carrega address para s0
  	addi $s1, $0, 15 	#vezes que vai decrementar
  	
  loop_achar_mesa_para_fechar:
  # posição 12 em mesa_fechar-10 é o caractere "1"
  	compara_cmd(12, $s0, 1, 2) 		# compara 2 posições na string gravada em $s0 com a posição 12 do comando
  	beq $v0, $0, fechar_mesa 		# verifica se as strings sao iguais e desvia se for
	
	addi $t0, $0, 1 			#coloca o valor 1 em t0
	beq $v0, $t0, codigo_mesa_incorreto 	#numero é maior que 15
	subi $s1, $s1, 1 			#s1--
	beq $s1, $0, codigo_mesa_incorreto 	#numero é menor que 01
	subi $s0, $s0, 64 			#numero menor, vamos indo de 15 a 1 tentando achar ele, subtraindo
	j loop_achar_mesa_para_fechar		
	
	
	#Achou a mesa entra abaixo
	#onde s0, está a posição inicial da mesa	
  
  
  fechar_mesa:
        lb $t0, 0($s0) 				# posição do status se 0 está desocupado
        addi $t1, $0, 0 			# valor 1 no byte  nao precisa ser ascii, para poder fazer comparação se esta desocupado ou ocupado
  	beq $t0, $t1, mesa_ja_fechada_print 	# se status for 1, mesa ocupada, se for zero, mesa ja esta fechada
  	
  	# Iniciar verificação de saldo devedor
  	addi $t3, $s0, 52			# Adicionamos a t3 o valor da posição inicial de s0 + 52, onde inicia o SALDO DEVEDOR
  	la $a0, 52($s0)				# Armazena em a0 o valor inicial do SALDO DEVEDOR, do mesa relatorio
  	addi $a1, $0, 7				# Adicionei em a1, o valor de bytes a ser percorrido. valor base (6) + 1 = 7
  	jal str_Para_int			# a1 - bytes a ser percorridos
    						# a0 endereço
    						# v0 retorno

						# Nesse momento v0, esta com o valor convertido para inteiro da string anterior
  	beq $v0, $0, liberado_fechar		# se o retorno for igual a 0, logo esta permitido fechar a mesa
  	
  	
  	la $a1, 52($s0)				# Endereco SALDO DEVEDOR
  	la $a0, espaco_convercao		# Endereco espaco convercao
  						# a1, endereco origem
  						# a0, endereco destino
  	jal strcpyb
  	
  	move $t4, $a0				# Armazena em t4 para uso futuro o valor em inteiro que estava em a0
  	imprime_texto(saldo_nao_quitado)	# Nesse momento v0 ta valendo 4 do syscall
  	imprime_texto(espaco_convercao)
  	
  	break_line
  	close_function
  	
  	
  	liberado_fechar:
  	# muda status
	sb $0, 0($s0) 		# coloca 0 no status a posição 0 da string s0
	# a1 contem o numero de bytes a ser percorrido
  	# a0 contem endereço
	# params -> destination: a0, num: a1.
	# retorna destination em v0.
	
	addi $a1, $0, 61	# 61 bytes para deletar, depois do codigo da mesa 
	addi $a0, $s0, 3	# endereço base + 2, para começar com o endereço depois do código
	jal fill_zero	
	
	
 	imprime_texto(mesa_fechada)
  	break_line
  	close_function
  	
  	mesa_ja_fechada_print:
 	imprime_texto(mesa_ja_fechada)
  	break_line
  	close_function
  
  mesa_parcial_parcial:############################ mesa_parcial ##################### mesa_parcial# CCCCCC
      	addi $sp, $sp, -4 # abro espaco pra 1 words na pilha
	sw $ra, 0($sp) #salvo RA
        # buscando_mesa:
  	la $s0, mesa_15 #carrega address para t0
  	addi $s1, $0, 15 #vezes que vai decrementar
  	loop_busca_mesa_parcial:	 
  	# mesa_ad_item-01-01" codigo mesa pos 13, codigo item posição 16 mesa - X(ocupação) - XX(code) - DDDXXXXXXXX -phone - Xs resto nome 
  	compara_cmd(13, $s0, 1, 2) # compara 2 posições na string gravada em $s0 com a posição 13 do comando
  	beq $v0, $0,   busca_mesa_relatorio_parcial #verifica se as strings sao iguais e desvia se for
	addi $t0, $0, 1 #coloca o valor 1 em t0
	beq $v0, $t0, codigo_mesa_incorreto #numero é maior que 15
	subi $s1, $s1, 1 #s1--
	beq $s1, $0, codigo_mesa_incorreto #numero é menor que 01
	subiu $s0, $s0, 64 # numero menor, vamos indo de 15 a 1 tentando achar ele, subtraindo
	j loop_busca_mesa_parcial
	
	busca_mesa_relatorio_parcial:
        # ainda verificando a mesa e nao mesa relatorio
        lb $t0, 0($s0) # posição do status se 0 está desocupado
        addi $t1, $0, 1 # nao precisa ser 1 em ascii - 1 esta  ocupado
  	bne $t0, $t1, mesa_nao_ocupada # se status for 1, mesa ainda nao ocupada
  	
        # $s0 está endereço da mesa
  	add $s1, $s0, 32 # s4 está com o endereço da mesa relatorio da mesa atual
  
  	la $t7, _mesa #carrega address para t0
  	addi $a0, $t7, 5 #destination a partir do digito de codigo
	addi $a1, $s0, 1 #memoria a partir do codigo como source
	li $a2, 2 #numero de digitos
	jal memcpy 
    	addi $a0, $t7, 8 #destination a partir do digito de telefone
	addi $a1, $s0, 3 #memoria a partir do telefone como source
	li $a2, 11 #numero de digitos
	jal memcpy
  	addi $a0, $t7, 20 #destination a partir do digito de nome
	addi $a1, $s0, 14 #memoria a partir do nome como source
	li $a2, 18 #numero de digitos
	jal memcpy 
  	imprime_texto(_mesa) #imprime item
	break_line
	
	########## mostrando mesa_relatorio######################################
	# $s2 está com s0 + 32 - mesa relatorio atual
	la $t7, mesa_relatorio #carrega address para t0
	
	add $a0, $s1, 20 # vai ate os saldos
	addi $a1, $0, 12 # vai rpeencher todos os valores com char '0'
	jal fill_zero_string # params -> destination: a0, num: a1.
	
	# $s1 esta com mesa_relatorio atual
	addi $a0, $t7, 51 #destination a partir do digito de codigo
	addi $a1, $s1, 20 #m saldo a pagar/devedor
	li $a2, 6 #numero de digitos
	jal memcpy
	

	# a1 - bytes a ser percorridos, a0 endereço ,v0 retorno
	addi $a1, $0, 6 # bytes
	addi $a0, $s1, 20 # endereço
	jal str_Para_int
	
	add $t6, $0, $v0 # saldo devedor
	
  	addi $a0, $t7, 30 #destination a partir do digito de codigo
	addi $a1, $s1, 26 #m saldo pago
	li $a2, 6 #numero de digitos
	jal memcpy
	
	# a1 - bytes a ser percorridos, a0 endereço ,v0 retorno
	addi $a1, $0, 6 # bytes
	addi $a0, $s1, 26 # endereço
	jal str_Para_int
	
	add $t6, $t6, $v0 # saldo devedor + saldo pago
	
	# a0 inteiro, a1 endereço, a2 contador
	add $a0, $t6, $0
	add $a1, $t7, 12 # posicao conta total:
	addi $a2, $0, 6 # 6 bytes de memoria 
	jal intToStr
  	
  	imprime_texto(mesa_relatorio) #imprime item
	break_line
  	
  	# s1 ainda está com endereço da mesa relatorio atual buscada
  	la $s0, item_pedido
  	add $t1, $0,20 # posicoes
  	add $t2, $0, 0 # posicoes
  	loop_relatorio_pedidos:
  		 # faz isso 20 vezes - 20 itens possiveis de se pedir
  		imprime_texto(item_pedido) #imprime item 
  		
  	  	addi $t2, $t2, 1 # num do item
		add $a0, $t2, $0
		li $v0, 1
		syscall
		imprime_texto(quantidade_pedido)
  		lb $a0, ($s1)
		li $v0, 1
		syscall
  		break_line
		subi $t1, $t1, 1
  		beqz $t1, fim_lista_parcial
  		addi $s1, $s1, 1 # proxima posição, vai fazer isso 20 vezes ate a pos(19)
  		j loop_relatorio_pedidos
  	fim_lista_parcial:
  	lw $ra, 0($sp) #recupero o RA original
	addi $sp, $sp, 4 # coloco minha pilha na posicao inicial.
  	jr $ra

  mesa_pagar_pagar: ############################ mesa_pagar ##################### mesa_pagar# CCCCCC
  	# mesa_pagar-XX-XXXXXX
  	addi $sp, $sp, -4 # abro espaco pra 1 word na pilha
	sw $ra, 0($sp) #salvo RA
        # buscando_mesa:
  	la $s0, mesa_15 #carrega address para t0
  	addi $s1, $0, 15 #vezes que vai decrementar
  	loop_busca_mesa_pagar:
  # mesa_ad_item-01-01" codigo mesa pos 13, codigo item posição 16 mesa - X(ocupação) - XX(code) - DDDXXXXXXXX -phone - Xs resto nome 
  	compara_cmd(11, $s0, 1, 2) # compara 2 posições na string gravada em $s0 com a posição 13 do comando
  	beq $v0, $0,   busca_mesa_pagar #verifica se as strings sao iguais e desvia se for
	addi $t0, $0, 1 #coloca o valor 1 em t0
	beq $v0, $t0, codigo_mesa_incorreto #numero é maior que 15
	subi $s1, $s1, 1 #s1--
	beq $s1, $0, codigo_mesa_incorreto #numero é menor que 01
	subiu $s0, $s0, 64 # numero menor, vamos indo de 15 a 1 tentando achar ele, subtraindo
	j loop_busca_mesa_pagar
	
  busca_mesa_pagar:
        # ainda verificando a mesa e nao mesa relatorio
        lb $t0, 0($s0) # posição do status se 0 está desocupado
        addi $t1, $0, 1 # nao precisa ser 1 em ascii - 1 esta  ocupado
  	bne $t0, $t1, mesa_nao_ocupada # se status for 1, mesa ainda nao ocupada
	
	# string valor pago na posicao 14 do comando
	add $s3, $0, $s0 # $s3 está endereço da mesa
  	add $s4, $s3, 32 # s4 está com o endereço da mesa relatorio da mesa atual
  	
  	# convertendo string em int e somando para novo saldo total
  	addiu $a0, $s4, 20 # posição 20 é o endereço do saldo total da mesa_relatorio
  	addi $a1, $0, 6 # num de bytes da prox string
  	addu $s7, $0, $a0 ################################################# guardando posição do saldo total para gravar no final
  	jal str_Para_int
	
  	move $t5, $v0 # valor convertido em t5
        la  $a0, cmd # endereço do valor do item em s2 # XX - codigo - XXXXX - preço
        add $a0, $a0, 14  # POSICAO DO DO PAGAMENTO no comando
        addi $a1, $0, 6 # num de bytes da prox string
        jal str_Para_int
        
        add $t6, $0, $v0 # t6 esta com o valor pago atual
        
        ########################################################## gravando saldo total
        sub $a0, $t5,$v0  # saldo total - pagamento sera saldo total
        # convertendo para string novamente # a0 contem o valor novo do saldo total - abaixo params int to string
	# a0 inteiro a1 endereço a2 contador
        add $a1, $0, $s7 # endereco do saldo total
        addi $a2, $0, 6 # index final da string de 6b
        jal intToStr # logo abaixo ira ser salvo valor da nova string no saldo total
        add $a0, $0, $s7 # endreço saldo total mesa relatorio
        add $a1, $0, 6 # bytes percoriddos
        jal fill_zero_string # preenche /0 com 0
        
        addiu $a0, $s4, 26 # posição 20 é o endereço do saldo PAGO da mesa_relatorio 26 - devedor
  	addi $a1, $0, 6 # num de bytes da prox string
  	jal str_Para_int
  	
  	add $a0, $v0, $t6 # saldo pago anterior + pagamento atual
        
        # agora gravado saldo pago em saldo devedor posição 26 no mesa relatorio
	addi $a1, $s7, 6 # endereco do saldo pago
        add $a2, $0, 6 # index final da string de 6b
        jal intToStr # logo abaixo ira ser salvo valor da nova string no saldo total
        
        addi $a0, $s7, 6 # endereço
        add $a1, $0, 6 # bytes percoriddos
        jal fill_zero_string # preenche /0 com 0
	
	jal mesa_recebeu_pagamento
  	close_function
  	 
  mesa_format_format: ############################ mesa_format ##################### mesa_format # CCCCCC
  	addi $sp, $sp, -4 # abro espaco pra 1 word na pilha
	sw $ra, 0($sp) #salvo RA
  	la $s0, mesa_15 #carrega address para t0
  	addi $s1, $0, 15 #vezes que vai decrementar
  	loop_formatar_mesas:
  		addi $a0, $s0, 0 # endereco do status ocupado ou desocupado
		li $a1, 1 # apenas uma vez
  		jal fill_zero
  		addi $a0, $s0, 3 #endereco a partir do preco como destination
		li $a1, 61 #num
		jal fill_zero
		subi $s1, $s1, 1 #s1--
		beq $s1, $0, finalizar_format_mesas #numero é menor que 01
		subi $s0, $s0, 64 #numero menor, vamos indo de 20 a 1 tentando achar ele, subtraindo
		j loop_formatar_mesas
   	finalizar_format_mesas:
		imprime_texto(mesas_formatadas)
  		break_line
  		close_function
  ############################ mesa_rm ##################### mesa_rm ######################### CCCCCC
  mesa_rm_item_rm_item:
  	addi $sp, $sp, -4 # abro espaco pra 1 words na pilha
	sw $ra, 0($sp) #salvo RA
  	la $s0, item_20 #carrega address para t0
  	addi $s1, $0, 20 #vezes que vai decrementar
  loop_verifica_item_rm_item:
  	compara_cmd(16, $s0, 0, 2) # compara 2 posições na string gravada em $s0 com a posição 16 do comando
  	beq $v0, $0, verifica_item_cadastrado_rm_item #verifica se as strings sao iguais e desvia se for
	addi $t0, $0, 1 #coloca o valor 1 em t0
	beq $v0, $t0, numero_incorreto #numero é maior que 15
	subi $s1, $s1, 1 #s1--
	beq $s1, $0, numero_incorreto #numero é menor que 01
	subiu $s0, $s0, 32 #numero menor, vamos indo de 15 a 1 tentando achar ele, subtraindo
	j loop_verifica_item_rm_item
  verifica_item_cadastrado_rm_item:
    	compara_cmd(16, $s0, 7, 1) #verifica se ja tem item cadastrado - com descrição
  	beq $v0, $0, nao_cadastrado # se a descrição for = nula n cadastrado
  	
  	add $s2, $0, $s0 ####################################### $s2 esta com o endereço do item atual
  	addi $s6, $s1, -1 # agora s1 é o index do item atual para ser decrementado (posicao s1 anterior -1)
   # buscando_mesa:
  	la $s0, mesa_15 #carrega address para t0
  	addi $s1, $0, 15 #vezes que vai decrementar
  	loop_busca_mesa_rm_item:
  # mesa_ad_item-01-01" codigo mesa pos 13, codigo item posição 16 mesa - X(ocupação) - XX(code) - DDDXXXXXXXX -phone - Xs resto nome 
  	compara_cmd(13, $s0, 1, 2) # compara 2 posições na string gravada em $s0 com a posição 13 do comando
  	beq $v0, $0,   busca_mesa_relatorio_rm_item #verifica se as strings sao iguais e desvia se for
	addi $t0, $0, 1 #coloca o valor 1 em t0
	beq $v0, $t0, codigo_mesa_incorreto #numero é maior que 15
	subi $s1, $s1, 1 #s1--
	beq $s1, $0, codigo_mesa_incorreto #numero é menor que 01
	subiu $s0, $s0, 64 # numero menor, vamos indo de 15 a 1 tentando achar ele, subtraindo
	j loop_busca_mesa_rm_item
	
  busca_mesa_relatorio_rm_item:
        # ainda verificando a mesa e nao mesa relatorio
        lb $t0, 0($s0) # posição do status se 0 está desocupado
        addi $t1, $0, 1 # nao precisa ser 1 em ascii - 1 esta  ocupado
  	bne $t0, $t1, mesa_nao_ocupada # se status for 1, mesa ainda nao ocupada
  	
  	add $s3, $0, $s0 # $s3 está endereço da mesa
  	add $s4, $s3, 32 # s4 está com o endereço da mesa relatorio da mesa atual
  	add $s1, $s4, $s6 ## agora s1 endereço mesa relatorio + index do item-1
  	# s1 - posicao do item no relatorio,  s2 - endereço item , s3 - endereço mesa, s4 - endereço mesa_relatorio
  	# decrementando num de pedidos do item
  	lb $t1 , 0($s1) # carrega o num em bytes de pedidos ja feitos desse item
  	subi $t0, $t1, 1 # num anterior -=1 num de pedido
  	bltz $t0, item_nao_consta_na_mesa
  	sb $t0, 0($s1) # atualizando num de pedidos do item
  	
  	# convertendo string em int e somando para novo saldo total
  	addiu $a0, $s4, 20 # posição 20 é o endereço do saldo total da mesa_relatorio
  	addi $a1, $0, 6 # num de bytes da prox string
  	addu $s7, $0, $a0 ################################################# guardando posição do saldo para gravar no final
  	
  	jal str_Para_int
  	move $t5, $v0 # valor convertido em t2
        addiu $a0, $s2, 2 # endereço do valor do item em s2 # XX - codigo - XXXXX - preço
        addi $a1, $0, 5 # num de bytes da prox string
        jal str_Para_int
        
        sub $a0, $t5,$v0  # saldo total = preço item
        # convertendo para string novamente # a0 contem o valor novo do saldo total - abaixo params int to string
	# a0 inteiro a1 endereço a2 contador
        add $a1, $0, $s7 # num de bytes da prox string
        add $a2, $0, 6 # index final da string de 6b
        jal intToStr # logo abaixo ira ser salvo valor da nova string no saldo total
        
        add $a0, $0, $s7 # endreço
        add $a1, $0, 6 # bytes percoriddos
        jal fill_zero_string # preenche /0 com 0
  	imprime_texto(item_removido)
  	break_line
  	close_function

   mesa_ad_item_ad_item:   ############################ mesa_ad_item ################## CCCCCC
    	# chamar pilha na proxima função para n perder o $ra dessa função
  	addi $sp, $sp, -4 # abro espaco pra 1 words na pilha
	sw $ra, 0($sp) #salvo RA
  	la $s0, item_20 #carrega address para t0
  	addi $s1, $0, 20 #vezes que vai decrementar
   loop_verifica_item_ad_item:
  	compara_cmd(16, $s0, 0, 2) # compara 2 posições na string gravada em $s0 com a posição 16 do comando
  	beq $v0, $0, verifica_item_cadastrado_ad_item #verifica se as strings sao iguais e desvia se for
	addi $t0, $0, 1 #coloca o valor 1 em t0
	beq $v0, $t0, numero_incorreto #numero é maior que 15
	subi $s1, $s1, 1 #s1--
	beq $s1, $0, numero_incorreto #numero é menor que 01
	subiu $s0, $s0, 32 #numero menor, vamos indo de 15 a 1 tentando achar ele, subtraindo
	j loop_verifica_item_ad_item
  verifica_item_cadastrado_ad_item:
    	compara_cmd(16, $s0, 7, 1) #verifica se ja tem item cadastrado - com descrição
  	beq $v0, $0, nao_cadastrado # se a descrição for = nula n cadastrado
  	add $s2, $0, $s0 # $s2 esta com o endereço do item atual
  	addi $s6, $s1, -1 # agora s1 é o index do item atual para ser decrementado (posicao s1 anterior -1)
   	# buscando_mesa:
  	la $s0, mesa_15 #carrega address para t0
  	addi $s1, $0, 15 #vezes que vai decrementar
  	loop_busca_mesa_ad_item:
  	# mesa_ad_item-01-01" codigo mesa pos 13, codigo item posição 16 mesa - X(ocupação) - XX(code) - DDDXXXXXXXX -phone - Xs resto nome 
  	compara_cmd(13, $s0, 1, 2) # compara 2 posições na string gravada em $s0 com a posição 13 do comando
  	beq $v0, $0,   busca_mesa_relatorio_ad_item #verifica se as strings sao iguais e desvia se for
	addi $t0, $0, 1 #coloca o valor 1 em t0
	beq $v0, $t0, codigo_mesa_incorreto #numero é maior que 15
	subi $s1, $s1, 1 #s1--
	beq $s1, $0, codigo_mesa_incorreto #numero é menor que 01
	subiu $s0, $s0, 64 # numero menor, vamos indo de 15 a 1 tentando achar ele, subtraindo
	j loop_busca_mesa_ad_item
	
    busca_mesa_relatorio_ad_item:
        # ainda verificando a mesa e nao mesa relatorio
        lb $t0, 0($s0) # posição do status se 0 está desocupado
        addi $t1, $0, 1 # nao precisa ser 1 em ascii - 1 esta  ocupado
  	bne $t0, $t1, mesa_nao_ocupada # se status for 1, mesa ainda nao ocupada
  	
  	add $s3, $0, $s0 # $s3 está endereço da mesa
  	add $s4, $s3, 32 # s4 está com o endereço da mesa relatorio da mesa atual
  	add $s1, $s4, $s6 ## agora s1 endereço mesa relatorio + index do item-1
	# verofocando se mesa ja possui 20 pedidos
  	addiu $t0, $s4, 0 # endereço da mesa relatorio copiado
  	li $t1, 20 # t1=20 sera o limite de pedidos contado para cada tipo de item da mesa
  	li $t2, 0 # valor total de pedidos feitos na mesa
  	li $t4, 20 # numero de posicoes percorridas
  	
  	loop_conta_pedidos_da_mesa_ad_item:
 	beq $t1,$t2, limite_de_pedidos_alcancado  # t1 for <= 0 limite de itens na mesa alcançado
 	blez, $t4, registrar_pedido_ad_item  # t3 for <= 0 limite de espaço de itens na mesa alcançado - registrar item
 	lb $t3, ($t0) # carrega o byte em t0
 	add $t2, $t2, $t3 # valor total antigo + atual
 	addi $t0, $t0 , 1 # fara isso 20 vezes ate posição 19 em mesa relatorio
 	subi $t4, $t4, 1 # 20 -1 19-1, ... ate 0 - contou todos os espaços possiveis de memoria
	j loop_conta_pedidos_da_mesa_ad_item
  	
  	registrar_pedido_ad_item:
  	# s1 - posicao do item no relatorio,  s2 - endereço item , s3 - endereço mesa, s4 - endereço mesa_relatorio ################################
  	# incrementando num de pedidos do item
  	lb $t1 , 0($s1) # carrega o num em bytes de pedidos ja feitos desse item
  	addi $t0, $t1, 1 # num anterior +=1 num de pedido
  	sb $t0, 0($s1) # atualizando num de pedidos do item
  	
  	# convertendo string em int e somando para novo saldo total
  	addiu $a0, $s4, 20 # posição 20 é o endereço do saldo total da mesa_relatorio  	
  	addi $a1, $0, 6 # num de bytes da prox string
  	addu $s7, $0, $a0 ############# guardando posição do saldo para gravar no final
  	
  	add $a0, $0, $s7 # endereço 
        add $a2, $0, 6 # bytes percoriddos
  	jal str_Para_int # converte string para int
  	
  	move $t5, $v0 # valor convertido em t2
  	
        addiu $a0, $s2, 2 # endereço do valor do item em s2 # XX - codigo - XXXXX - preço
        addi $a1, $0, 5 # num de bytes da prox string
        jal str_Para_int

        add $a0, $v0, $t5 # valor atual
        # convertendo para string novamente # a0 contem o valor novo do saldo total
	# a0 inteiro na1 endereço a2 contador
        add $a1, $0, $s7 # num de bytes da prox string
        add $a2, $0, 6 # index final da string de 6b
        jal intToStr # logo abaixo ira ser salvo valor da nova string no saldo total
        #v0 está com a o endereço da nova string 
        add $a0, $0, $s7 # num de bytes preencher '0'
        add $a1, $0, 6 # bytes percoriddos
        jal fill_zero_string
  	imprime_texto(pedido_adicionado)
  	break_line
  	close_function

  mesa_iniciar_iniciar: ############################ mesa_iniciar #################### CCCCCC
  	addi $sp, $sp, -4 # abro espaco pra 1 words na pilha
	sw $ra, 0($sp) #salvo RA
  	la $s0, mesa_15 #carrega address para t0
  	addi $s1, $0, 15 #vezes que vai decrementar
  loop_mesa:
  # posição 13 em mesa_iniciar-12-81983678188-jose da silva é o caractere "1"
  	compara_cmd(13, $s0, 1, 2) # compara 2 posições na string gravada em $s0 com a posição 13 do comando
  	beq $v0, $0, iniciar_mesa #verifica se as strings sao iguais e desvia se for
	addi $t0, $0, 1 #coloca o valor 1 em t0
	beq $v0, $t0, codigo_mesa_incorreto #numero é maior que 15
	subi $s1, $s1, 1 #s1--
	beq $s1, $0, codigo_mesa_incorreto #numero é menor que 01
	subi $s0, $s0, 64 #numero menor, vamos indo de 15 a 1 tentando achar ele, subtraindo
	j loop_mesa
  iniciar_mesa:
        lb $t0, 0($s0) # posição do status se 0 está desocupado
        addi $t1, $0, 1 # valor 1 no byte  nao precisa ser ascii
  	beq $t0, $t1, mesa_ja_ocupada # se status for 1, mesa ocupada
  	
  	# muda status
	sb $t1, ($s0) # coloca 1 no status a posição 0 da string s0
  	
  	#adiciona o telefone
  	la $t0, cmd #carrega address para t0
	addi $a0, $s0, 3 #endereco a partir do telefone como destination
	addi $a1, $t0, 16 #source a partir do digito que o option 2 vai aparecer
	li $a2, 11 # num
	jal memcpy
	
	#adiciona a nome responsavel
  	la $t0, cmd #carrega address para t0
	addi $a0, $s0, 14 # endereco + 16 posições a partir de codigo mesa, responsavel como destination
	addi $a1, $t0, 28 #source a partir do digito que o option 3 vai aparecer
	li $a2, 18 # num de bytes reservado para o nome do responsavel
	jal memcpy
	
  	imprime_texto(mesa_iniciada)
  	break_line
  	close_function
  	
  codigo_mesa_incorreto:
  	imprime_texto(mesa_inexistente)
  	break_line
  	close_function
  	
  mesa_ja_ocupada:
  	imprime_texto(mesa_ocupada)
  	break_line
  	close_function
  	
  mesa_nao_ocupada:
  	imprime_texto(mesa_desocupada)
  	break_line
  	close_function
  limite_de_pedidos_alcancado:
	 imprime_texto(mesa_limitada)
  	break_line
  	close_function
 
  item_nao_consta_na_mesa:
	imprime_texto(item_nao_consta)
  	break_line
  	close_function

  escrever_arquivo:
  	addi $sp, $sp, -4 # abro espaco pra 1 word na pilha
	sw $ra, 0($sp) #salvo RA
	
  	imprime_texto(pede_diretorio) #imprime pedindo o diretorio
  	entrada_string(arquivo, 160) #entrada diretorio
  	verifica_enter(arquivo, 160) #coloca 0 no lugar do \n
  	imprime_texto(pede_nome_arquivo) #imprime pedindo o nome.extensao
  	entrada_string(nome_arquivo, 100) #entrada nome.extensao
  	verifica_enter(nome_arquivo, 100) #coloca 0 no lugar do \n
  	la $a0, arquivo    # Destination string address
    	la $a1, nome_arquivo  # Source string address
    	jal strcat # chama a funcao strcat
    	
	# Abre o arquivo para escrita
    	li $v0, 13          # codigo de servico para abrir arquivo
    	la $a0, arquivo     # nome do arquivo
    	li $a1, 1           # modo de abertura (1 = escrita)
    	syscall             # chama o sistema operacional
    	move $s0, $v0       # salva o descritor do arquivo

    	# Escreve o preco no arquivo
    	li $v0, 15          # codigo de servico para escrever no arquivo
    	move $a0, $s0       # descritor do arquivo
    	la $a1, item_1 #carrega endereco de item_1 para a1
    	li $a2, 1599        # tamanho do preco (em bytes)
    	syscall             # chama o sistema operacional

    	# Fecha o arquivo
    	li $v0, 16          # codigo de servico para fechar arquivo
    	move $a0, $s0       # descritor do arquivo
    	syscall             # chama o sistema operacional
    	
    	imprime_texto(arquivo_salvo)
    	break_line
    	close_function
    	
    ler_arquivo:
   	 addi $sp, $sp, -4 # abro espaco pra 1 word na pilha
	sw $ra, 0($sp) #salvo RA
	
  	imprime_texto(pede_diretorio) #imprime pedindo o diretorio
  	entrada_string(arquivo, 160) #entrada diretorio
  	verifica_enter(arquivo, 160) #coloca 0 no lugar do \n
  	imprime_texto(pede_nome_arquivo) #imprime pedindo o nome.extensao
  	entrada_string(nome_arquivo, 100) #entrada nome.extensao
  	verifica_enter(nome_arquivo, 100) #coloca 0 no lugar do \n
  	la $a0, arquivo    # Destination string address
    	la $a1, nome_arquivo  # Source string address
    	jal strcat # chama a funcao strcat
    	
	# Abre o arquivo para escrita
    	li $v0, 13          # codigo de servico para abrir arquivo
    	la $a0, arquivo     # nome do arquivo
    	li $a1, 0           # modo de abertura (0 = leitura)
    	syscall             # chama o sistema operacional
    	move $s0, $v0       # salva o descritor do arquivo

    	# Escreve o preco no arquivo
    	li $v0, 14          # codigo de servico para escrever no arquivo
    	move $a0, $s0       # descritor do arquivo
    	la $a1, item_1 #buffer que armazena conteudo
    	li $a2, 1599        # tamanho do preco (em bytes)
    	syscall             # chama o sistema operacional

    	# Fecha o arquivo
    	li $v0, 16          # codigo de servico para fechar arquivo
    	move $a0, $s0       # descritor do arquivo
    	syscall             # chama o sistema operacional
    	
    	imprime_texto(arquivo_lido)
    	break_line
    	close_function
    	
    mesa_recebeu_pagamento:
        imprime_texto(mesa_pagamento)
    	break_line
    	jr $ra #retorna para o endereço armazenado em $ra
