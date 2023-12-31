# grupo: 
# ALEXANDRE VITOR ROCHA DE SOUZA , CHRISTIAN OLIVEIRA DO RAMO, JOAO LUCAS PINTO DE SANTANA, VINICIUS NARIO VASCONCELOS
# data: 08/08/2023
# atividade: questao 1-b
# disciplina: Arquitetura e Organização de Computadores
# semestre letivo: 2022.2
# descrição: função memcpy

# params -> destination: a0, source: a1, num: a2.
# retorna destination em v0.
.data
	c: .asciiz "casinha"
	b: .asciiz "carrinho"
.text
	
	la $a0, b # destino
	la $a1, c #source
	li $a2, 7 #max de bytes
	
	jal memcpy
	
	li $v0, 10 # fim
	syscall
	
memcpy:
    addi    $v0,        $a0,        0           # v0 vai retorna destination a0
memcpyLoop:
    lb      $t0,        0($a1)
    sb      $t0,        0($a0)

    addi    $a0,        $a0,        1           # destino = proximo byte(posição)
    addi    $a1,        $a1,        1           # fonte = proximo byte

    addi    $a2,        $a2,        -1          # o numero de bytes a ser copiado diminui em 1 a cada loop

    beq     $a2,        $0,         retorne
    j       memcpyLoop
retorne:
    jr      $ra
