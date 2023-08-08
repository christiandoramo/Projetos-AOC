# grupo: 
# ALEXANDRE VITOR ROCHA DE SOUZA , CHRISTIAN OLIVEIRA DO RAMO, JOAO LUCAS PINTO DE SANTANA, VINICIUS NARIO VASCONCELOS
# data: 08/08/2023
# atividade: projeto
# disciplina: Arquitetura e Organização de Computadores
# semestre letivo: 2022.2
# descrição: função que converte inteiro para string

.text

.globl intToStr
# a0 inteiro
# a1 endereço
# a2 contador
intToStr:    
  li   $t0, 10          # Carregar o valor 10 no registrador $t0 (usado para divisões por 10)
  add   $t1, $0, $a1      # Carregar o endereço do buffer na qual a string será armazenada
  add $t1, $t1, $a2    # Ajustar o endereço para apontar para o último caractere (antes do terminador nulo)
  #sb   $zero, -1($t1)   # Colocar o terminador nulo no final da string

convert_loop:
  div   $a0, $t0        # Dividir o valor do inteiro por 10
  mflo  $a0             # Armazenar o resultado inteiro da divisão no registrador $a0
  mfhi  $t2             # Armazenar o resto da divisão no registrador $t2
  addi  $t2, $t2, 48    # Converter o resto em um caractere ASCII (adicionando 48)
  sb    $t2, -1($t1)    # Armazenar o caractere na string
  addi  $t1, $t1, -1    # Mover o ponteiro da string para o próximo caractere
  subi $a2, $a2, 1 # contador de bytes arbitraios ate 0, meu limite é 6 para saldo total
  beqz $a2, finalize
  bnez  $t1, convert_loop  # Repetir o loop se o quociente ainda for diferente de zero
  finalize:
  jr    $ra             # Retornar da função, restaurando o endereço de retorno







