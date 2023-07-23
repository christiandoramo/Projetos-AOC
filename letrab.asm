# params -> destination: a0, source: a1, num: a2.
# retorna destination em v0.
memcpy:
    addi    $v0,        $a0,        0           # v0 vai retorna destination a0
memcpyLoop:
    lb      $t0,        (a1)                    # carrega byte da fonte em t0
    sb      $t0,        (a0)                    # guarda byte atual da fonte em destino atual

    addi    $a0,        $a0,        1           # destino = proximo byte(posição)
    addi    $a1,        $a1,        1           # fonte = proximo byte

    addi    $a2,        $a2,        -1          # o numero de bytes a ser copiado diminui em 1 a cada loop

    beq     $a2,        $0,         retorne     # se a2 for 0, terminou a copia 
    j       memcpyLoop

retorne:
    jr      $ra
