<div  align="center">
    
 # Projeto Sistema de Restaurante
    
<div  align="left">

### Tópicos

:o: [Contribuidores](#contribuidores)

:o: [Requisitos de Projeto 1](#requisitos-de-projeto-1)

:o: [Dicas de acesso](#dicas-de-acesso-arrow_forward)

</div>

## Contribuidores

| [<img src="https://avatars.githubusercontent.com/u/116025325?v=4" width=115>](https://github.com/christiandoramo)    | [<img src="https://avatars.githubusercontent.com/u/65697819?v=4" width=115>](https://github.com/https://github.com/lukajlp) | [<img src="https://avatars.githubusercontent.com/u/69995288?v=4" width=115>](https://github.com/Viinario) | [<img src="https://avatars.githubusercontent.com/u/0?v=4" width=115>](https://github.com/0) |
| -------------------------------------------------------------------------------------------------------------------- | --------------------------------------------------------------------------------------------------------------------------- | --------------------------------------------------------------------------------------------------------- | --------------------------------------------------------------------------------------------|
| [Christian Oliveira](https://github.com/christiandoramo)                                                             |                               [João Lucas](https://github.com/https://github.com/lukajlp)                                   | [Vinicius Nário](https://github.com/Viinario)                                                             | [Alexandre Vitor](https://github.com/3)    


## Requisitos de Projeto 1

<div  align="left">

:pushpin: **REQ1** - sistema deve ser capaz de registrar itens no cardápio do restaurante. O sistema
permite cardápios com até 20 itens. Cada item deve possuir um código (número de 1 a
20), um preço e uma descrição do item.

:pushpin: **REQ2** - O sistema deve ser capaz de gerenciar até 15 mesas simultaneamente. Cada mesa
deve possuir um código (de 01 a 15), status (ocupada/desocupada), um nome de
responsável, telefone de contato e um registro de pedidos.

:pushpin: **REQ3** - O sistema deve ser capaz de registrar pedidos associados a cada mesa. Cada mesa
pode ter até 20 pedidos. Pedidos repetidos não devem introduzir uma nova entrada no
registro de pedidos. Um contador para pedidos repetidos deve ser considerado.

:pushpin: **REQ4** - O sistema deve possibilitar o pagamento parcial das contas, abatendo o valor pago do
saldo devedor atual.

:pushpin: **REQ5** - O sistema deve fornecer um relatório de consumo total, listando cada pedido e suas
respectivas quantidades, o valor total da conta, o saldo total já pago e o saldo devedor
atual por mesa;

:pushpin: **REQ6** - O sistema deve ser capaz de fechar a conta de uma mesa. Para isso, deve checar se o
saldo total já foi quitado. Ao fechar a mesa, o sistema deve apagar todos os registros de
consumo automaticamente e a mesa deve ficar com status “Desocupada”.

:pushpin: **REQ7** - O sistema deve salvar todos os dados em um arquivo de modo que, caso o sistema seja
reiniciado, os dados salvos anteriormente devem ser resgatados. Para tal, devem ser
utilizados os serviços de arquivos do syscall. Sempre que o programa for inicializado,
os dados salvos devem ser resgatados automaticamente.

:pushpin: **REQ8** - R8.O sistema deve ser operado através através de um terminal que fica constantemente
lendo entradas de texto (strings) e interpretando o que for recebido para executar
comandos. O terminal deve aguardar uma quebra de linha “\n” para tentar interpretar o
comando do usuário.

:pushpin: **REQ9** - A cada nova linha do terminal, uma string padrão deve ser impressa como “banner” na
parte anterior ao campo que o usuário deve escrever um comando (similar a um
terminal linux ou windows). O formato desta string deve ser
“<nome_restaurante>-shell>>“. Criem um nome para o restaurante. Caso o nome seja
grande, considere usar abreviaturas no banner. Por exemplo, a string banner do Arvo
Restaurante poderia ser “arvo-shell>>“. Segue um vídeo com este exemplo em anexo
(link).

:pushpin: **REQ10** - Todos os comandos devem ser interpretados através de uma string digitada pelo
usuário e finalizados com uma quebra de linha (‘\n’). Alguns comandos podem ter
opções e todas as opções devem ser iniciadas com o caractere “-” (sinal de menos).
Sempre que um comando não existente for executado, o terminal deve retornar uma
mensagem “Comando invalido”. Todos os comandos da seguinte lista devem ser
implementados:

:pushpin: cmd_1. cardapio_ad-<option1>-<option2>-<option3>
Este comando adiciona um item ao cardápio. A opção <option1> deve ser uma
string numérica que informa o código do item, de 01 a 20. A <option 2> deve ser
uma string numérica que informa o preço, em centavos, no formato “XXXXX”. A
<option3> fornece uma descrição para o item. Após a realização do comando
com sucesso, deve retornar uma mensagem “Item adicionado com sucesso”.
Caso o item do cardápio já possua alguma entrada cadastrada, deve retornar
mensagem de “Falha: número de item já cadastrado”. Caso o número de item
fornecido esteja fora do intervalo 01 a 20, retornar “Falha: código de item
inválido”.
Exemplo de uso: para adicionar uma coca-cola como item de código 15 que
custe R$ 4,90, deve ser usado
cardapio_ad-15-00490-coca cola

:pushpin: cmd_2. cardapio_rm-<option1>
Este comando remove um item do cardapio pela <option1> que representa uma
string numérica que informa o código do item, de 01 a 20. Após a realização do
comando deve retornar uma mensagem “Item removido com sucesso”. Caso o
código do item informado não possua nem um cadastro, retornar uma
mensagem “Código informado não possui item cadastrado no cardápio”. Caso o
número de item fornecido esteja fora do intervalo 01 a 20, retornar “Falha: código
de item inválido”.
Exemplo de uso: para remover a coca-cola como item de código 15
cardapio_rm-15

:pushpin: cmd_3. cardapio_list
Este comando deve listar todos os itens cadastrados, na ordem crescente de
códigos cadastrados. A lista deve informar o código, valor e descrição do item.

:pushpin: cmd_4. cardapio_format
Este comando deve apagar todas as entradas do cardápio.

:pushpin: cmd_5. mesa_iniciar-<option1>-<option2>-<option3>
Este comando inicia o atendimento em uma mesa desocupada. A <option1>
deve fornecer o código da mesa, através de uma string numérica XX (01 a 15),
<option 2> deve fornecer o telefone de contato do responsável, no formato
DDDNNNNNNNN e a <option3> deve ser uma string com o nome do
responsável. Após a realização do comando, deve retornar uma mensagem
“Atendimento iniciado com sucesso”. Caso a mesa escolhida já esteja em
atendimento, retornar uma mensagem “Falha: mesa ocupada”. Caso o código da
mesa não seja de 01 a 15, retornar “Falha: mesa inexistente”.
Exemplo de uso: iniciar o serviço na mesa 9 para o cliente Jose Silva
mesa_iniciar-09-08198765432-Jose Silva

  :pushpin: cmd_6. mesa_ad_item-<option1>-<option2>
Este comando adiciona na conta da mesa especificada pela <option1> o item do
cardápio especificado pela <option2>. Após o comando, retornar “Item
adicionado com sucesso”. Caso a mesa especificada não exista, retornar “Falha:
mesa inexistente”. Caso a mesa especificada esteja desocupada, retornar
“Falha: mesa nao iniciou atendimento”. Caso o código do item não tenha sido
cadastrado no cardápio, retornar “Falha: item não cadastrado no cardápio”. Caso
o código do item seja invalido (fora de 01 a 20), retornar “Falha: codigo do item
invalido”.
Exemplo de uso: adicionar o item 10 do cardapio na mesa 9
mesa_ad_item-09-10

:pushpin: cmd_7. mesa_rm_item
Este comando remove da conta da mesa especificada pela <option1> o item do
cardápio especificado pela <option2>. Após o comando, retornar “Item removido
com sucesso”. Caso a mesa especificada não exista, retornar “Falha: mesa
inexistente”. Caso a mesa especificada esteja desocupada, retornar “Falha:
mesa nao iniciou atendimento”. Caso o item não conste no pedido da mesa,
retornar “Falha: item nao consta na conta”. Caso o código do item seja invalido
(fora de 01 a 20), retornar “Falha: codigo do item invalido”.
Exemplo de uso: remover o item 10 do cardapio na mesa 9
mesa_rm_item-09-10

:pushpin: cmd_8. mesa_format
Este comando deve colocar todas as mesas com status “desocupado”,
removendo todos os registros de cada mesa.

:pushpin: cmd_9. mesa_parcial-<option1>
Este comando deve fornecer um relatório de consumo atual, listando cada
pedido e suas respectivas quantidades, o valor total da conta, o saldo total já
pago e o saldo devedor atual por mesa;

:pushpin: cmd_10. mesa_pagar-<option1>-<option2>
Este comando realiza um pagamento parcial na conta da mesa especificada pela
<option1> do valor especificado pela string da <option2>, no formato XXXXXX
em centavos. Após o comando, retornar “Pagamento realizado com sucesso”.
Caso a mesa especificada não exista, retornar “Falha: mesa inexistente”. Caso a
mesa especificada esteja desocupada, retornar “Falha: mesa nao iniciou
atendimento”.

:pushpin: cmd_11. mesa_fechar-<option1>
Este comando deve fechar a mesa. Apenas deve permitir que a mesa seja
fechada caso o saldo devedor atual não seja maior do que zero. Após o
comando, deve retornar uma mensagem “Mesa fechada com sucesso” e a mesa
deve ficar com status “desocupada” e apagar os registros da conta anterior.
Caso a o código da mesa seja inválido (fora de 01 a 10), retornar “Falha: mesa
inexistente”. Caso ainda haja saldo devedor, retornar “Falha: saldo devedor
ainda não quitado. Valor restante: R$ XXXX,XX”, em que o valor restante deve
ser apresentado no formato indicado.

:pushpin: cmd_12. salvar
Deve salvar todas as informações registradas em um arquivo externo. Cabe aos
projetistas do grupo elaborar uma estrutura adequada para o formato do(s)
arquivo(s).

:pushpin: cmd_13. recarregar
Recarrega as informações salvas no arquivo externo na execução atual do
programa. Modificações não salvas serão perdidas e as informações salvas
anteriormente recuperadas.

:pushpin: cmd_14. formatar
Apaga todas as informações da execução atual do programa, deixando todos as
mesas e cardápios vazios. Este comando não deve salvar automaticamente no
arquivo externo, sendo necessário usar posteriormente o comando “salvar” para
registrar a formatação no arquivo externo

</div>

<br>

## Dicas de Acesso :arrow_forward:

<div  align="center">

[Site do Mars e os recursos necessários para usá-lo](http://courses.missouristate.edu/kenvollmar/mars/)

</div>

### Tópicos

<div  align="left">
    
:o: [Contribuidores](#contribuidores)

:o: [Requisitos de Projeto](#requisitos-de-projeto-1)

:o: [Dicas de acesso](#dicas-de-acesso-arrow_forward)

</div>

</div>
</div>
