    Função  memcpy,     (link):
    Copia   um,         total,      de,         bytes,dado,por,num,do,local,apontado,pela,source,diretamente,para,o,bloco,de,memória
    apontadopelodestination.EssafunçãonãoprecisaprocurarporumcaractereNULL(‘\0’)
    ela     apenas,     copia,      a,          quantidade,de,bytes,especificada.,Também,não,importa,o,tipo,de,dado,que,está,sendo,copiado.
    Implementeestafunçãodemodoqueoparâmetrodestinationdeveserpassadoem,         $a0,        source,     em,$a1,e,num,em,$a2.
    Após    a,          cópia,      o,          parâmetro,destination,deve,retornar,em,$v0.

# params -> destination: a0, source: a1, num: a2.
# retorna destination em v0.
memcpy:
    addi    $v0,        $a0,        0           # v0 vai retorna destination a0
    #addi   $sp,        $sp,        -4          # Aloca espaço na pilha
    #sw     $a0,        ($sp)                   # Salva o valor de destination na pilha
memcpyLoop:
    lb      $t0,        (a1)
    sb      $t0,        (a0)

    addi    $a0,        $a0,        1           # destino = proximo byte(posição)
    addi    $a1,        $a1,        1           # fonte = proximo byte

    addi    $a2,        $a2,        -1          # o numero de bytes a ser copiado diminui em 1 a cada loop

    beq     $a2,        $0,         retorne
    j       memcpyLoop

retorne:
    #lw     $v0,        ($sp)                   # Carrega o valor de retorno (destination) da pilha
    #addi   $sp,        $sp,        4           # Libera o espaço da pilha
    jr      $ra