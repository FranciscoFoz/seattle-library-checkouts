#COLETANDO DADOS DA BIBLIOTECA DE SEATTLE

#Bibliotecas
import requests
import os


#Caminho do diretório onde o arquivo será salvo
diretorio = 'datasets'

#Definindo primeira linha dos arquivos
primeira_linha = ['UsageClass', 'CheckoutType', 'MaterialType', 'CheckoutYear', 'CheckoutMonth', 
                  'Checkouts', 'Title', 'ISBN', 'Creator', 'Subjects', 'Publisher', 'PublicationYear']

# Criar um loop para extrair os dados
limite = 0

while limite < 42033208:
    # Criar a URL com o limite
    url = f'https://data.seattle.gov/resource/tmmm-ytt6.json?$limit=50000&$offset={limite}'
    # Fazer a requisição
    response = requests.get(url)
    dados = response.json()

    # Abrir o arquivo
    caminho_arquivo = os.path.join(diretorio, f'arquivo{limite}.csv')

    with open(caminho_arquivo, 'w') as arquivo:
        arquivo.write(';;'.join(primeira_linha) + '\n')
        for linha in dados:
            arquivo.write(';;'.join(str(valor) for valor in linha.values()) + '\n')

    # Atualizar o limite
    limite += 50000