import json

# Constantes
MAX_MENU_ITEMS = 20
MAX_TABLES = 15
RESTAURANT_NAME = "Restaurante XYZ"

# Dados Iniciais
menu = {}
tables = {}

# Funções Auxiliares
def save_data():
    data = {'menu': menu, 'tables': tables}
    with open('restaurant_data.json', 'w') as file:
        json.dump(data, file)

def load_data():
    try:
        with open('restaurant_data.json', 'r') as file:
            data = json.load(file)
            return data['menu'], data['tables']
    except FileNotFoundError:
        return {}, {}

def format_tables():
    global tables
    tables = {}

# Comandos do Terminal
def show_banner():
    print(f"{RESTAURANT_NAME}-shell>>", end=" ")

def cmd_cardapio_ad(option1, option2, option3):
    code = int(option1)
    price = int(option2) / 100
    description = option3

    if code < 1 or code > MAX_MENU_ITEMS:
        return "Falha: código de item inválido"
    if code in menu:
        return "Falha: número de item já cadastrado"

    menu[code] = {'price': price, 'description': description}
    save_data()
    return "Item adicionado com sucesso"

def cmd_cardapio_rm(option1):
    code = int(option1)

    if code < 1 or code > MAX_MENU_ITEMS:
        return "Falha: código de item inválido"
    if code not in menu:
        return "Código informado não possui item cadastrado no cardápio"

    del menu[code]
    save_data()
    return "Item removido com sucesso"

def cmd_cardapio_list():
    for code in sorted(menu):
        item = menu[code]
        print(f"Item {code:02d}: {item['description']} - R$ {item['price']:.2f}")

def cmd_cardapio_format():
    global menu
    menu = {}
    save_data()

def cmd_mesa_iniciar(option1, option2, option3):
    table_code = int(option1)

    if table_code < 1 or table_code > MAX_TABLES:
        return "Falha: mesa inexistente"
    if table_code in tables:
        return "Falha: mesa ocupada"

    tables[table_code] = {
        'status': 'ocupada',
        'name': option3,
        'phone': option2,
        'orders': {}
    }
    save_data()
    return "Atendimento iniciado com sucesso"

def cmd_mesa_ad_item(option1, option2):
    table_code = int(option1)
    item_code = int(option2)

    if table_code not in tables:
        return "Falha: mesa inexistente"
    if tables[table_code]['status'] == 'desocupada':
        return "Falha: mesa não iniciou atendimento"
    if item_code not in menu:
        return "Falha: item não cadastrado no cardápio"
    if item_code < 1 or item_code > MAX_MENU_ITEMS:
        return "Falha: código do item inválido"

    table = tables[table_code]
    orders = table['orders']
    orders[item_code] = orders.get(item_code, 0) + 1
    save_data()
    return "Item adicionado com sucesso"

def cmd_mesa_rm_item(option1, option2):
    table_code = int(option1)
    item_code = int(option2)

    if table_code not in tables:
        return "Falha: mesa inexistente"
    if tables[table_code]['status'] == 'desocupada':
        return "Falha: mesa não iniciou atendimento"
    if item_code not in menu:
        return "Falha: item não consta na conta"
    if item_code < 1 or item_code > MAX_MENU_ITEMS:
        return "Falha: código do item inválido"

    table = tables[table_code]
    orders = table['orders']
    if item_code not in orders or orders[item_code] == 0:
        return "Falha: item não consta na conta"
    orders[item_code] -= 1
    save_data()
    return "Item removido com sucesso"

def cmd_mesa_format():
    global tables
    format_tables()
    save_data()

def cmd_mesa_parcial(option1):
    table_code = int(option1)

    if table_code not in tables:
        return "Falha: mesa inexistente"
    if tables[table_code]['status'] == 'desocupada':
        return "Falha: mesa não iniciou atendimento"

    table = tables[table_code]
    orders = table['orders']
    total_paid = sum(menu[item_code]['price'] * quantity for item_code, quantity in orders.items())
    total_due = sum(menu[item_code]['price'] * quantity for item_code, quantity in orders.items() if quantity > 0)
    return f"Relatório de consumo da mesa {table_code}:\n"\
           f"Pedidos: {orders}\n"\
           f"Total da conta: R$ {total_paid:.2f}\n"\
           f"Total pago: R$ {(total_paid - total_due):.2f}\n"\
           f"Saldo devedor: R$ {total_due:.2f}"

def cmd_mesa_pagar(option1, option2):
    table_code = int(option1)
    payment = int(option2) / 100

    if table_code not in tables:
        return "Falha: mesa inexistente"
    if tables[table_code]['status'] == 'desocupada':
        return "Falha: mesa não iniciou atendimento"

    table = tables[table_code]
    orders = table['orders']
    total_due = sum(menu[item_code]['price'] * quantity for item_code, quantity in orders.items() if quantity > 0)

    if payment > total_due:
        return f"Falha: pagamento superior ao saldo devedor. Valor restante: R$ {(total_due - payment):.2f}"
    else:
        return "Pagamento realizado com sucesso"

def cmd_mesa_fechar(option1):
    table_code = int(option1)

    if table_code not in tables:
        return "Falha: mesa inexistente"

    table = tables[table_code]
    orders = table['orders']
    total_due = sum(menu[item_code]['price'] * quantity for item_code, quantity in orders.items() if quantity > 0)

    if total_due > 0:
        return f"Falha: saldo devedor ainda não quitado. Valor restante: R$ {total_due:.2f}"
    else:
        table['status'] = 'desocupada'
        table['orders'] = {}
        save_data()
        return "Mesa fechada com sucesso"

def cmd_salvar():
    save_data()
    return "Dados salvos com sucesso"

def cmd_recarregar():
    global menu, tables
    menu, tables = load_data()
    return "Dados carregados com sucesso"

def cmd_formatar():
    format_tables()
    cmd_cardapio_format()
    return "Dados formatados com sucesso"

# Mapeamento de Comandos
commands = {
    'cardapio_ad': cmd_cardapio_ad,
    'cardapio_rm': cmd_cardapio_rm,
    'cardapio_list': cmd_cardapio_list,
    'cardapio_format': cmd_cardapio_format,
    'mesa_iniciar': cmd_mesa_iniciar,
    'mesa_ad_item': cmd_mesa_ad_item,
    'mesa_rm_item': cmd_mesa_rm_item,
    'mesa_format': cmd_mesa_format,
    'mesa_parcial': cmd_mesa_parcial,
    'mesa_pagar': cmd_mesa_pagar,
    'mesa_fechar': cmd_mesa_fechar,
    'salvar': cmd_salvar,
    'recarregar': cmd_recarregar,
    'formatar': cmd_formatar
}

# Programa Principal
def main():
    cmd_recarregar()

    while True:
        show_banner()
        command_line = input().strip()

        if not command_line:
            continue

        command_parts = command_line.split('-')
        command = command_parts[0]

        if command in commands:
            result = commands[command](*command_parts[1:])
            print(result)
        else:
            print("Comando inválido")