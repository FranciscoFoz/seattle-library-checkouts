#VERIFICANDO DADOS

'''
Esse script tem como objetivo visualizar em linhas gerais as características do 
conjunto de dados "Checkouts_by_Title.csv"

'''

import pandas as pd

#Leitura de dados
df = pd.read_csv(r'Datasets\Checkouts_by_Title.csv',nrows=1000000)

#Infos gerais do dataset
df.info()

df.head()

df.duplicated().sum() #Verificando duplicatas

#Verificando colunas


def descricao_elementos_coluna(coluna):
    '''
    Esta função tem como objetivo verificar a quantidade de elementos únicos, 
    número máximo de caracteres em cada elemento e a quantidade de elementos
    nulos em cada coluna.
    '''
    print('Elementos = ',df[coluna].unique())
    print('Máximo de caracteres = ', max([len(i) for i in df[coluna].unique()]))
    print('Quantidade de elementos nulos = ', df[coluna].isna().sum())

#Coluna MaterialType
set(df.MaterialType.unique())

#UsageClass
descricao_elementos_coluna('UsageClass')

#CheckoutType
descricao_elementos_coluna('CheckoutType')

#MaterialType
descricao_elementos_coluna('MaterialType')

'''
Em algumas colunas que há mais do que um valor por linha é necessário separá-los e 
agrupá-los em apenas uma única coluna.
'''
material_type_elementos = df['MaterialType'].str.split(',',expand=True).melt()['value']

print('Elementos = ',material_type_elementos.unique())
print('Máximo de caracteres = ', max([len(i) for i in material_type_elementos.unique() if i is not None]))
print('Quantidade de elementos nulos = ', material_type_elementos.isna().sum())

#CheckoutYear
print('Elementos = ',df.CheckoutYear.unique())
print('Quantidade de elementos nulos = ',df.CheckoutYear.isna().sum())

#CheckoutMonth
print('Elementos = ',df.CheckoutMonth.unique())
print('Quantidade de elementos nulos = ',df.CheckoutMonth.isna().sum())

#Checkouts
print('Elementos = ',df.Checkouts.unique())
print('Número máximo = ',max(df.Checkouts.unique()))
print('Quantidade de elementos nulos = ',df.Checkouts.isna().sum())

#Title
descricao_elementos_coluna('Title')

#ISBN
df.ISBN = df.ISBN.astype('str')
df.ISBN.replace({'nan':None},inplace=True)

print('Elementos = ',df.ISBN.unique())
print('Máximo de caracteres = ', max([len(i) for i in df.ISBN.unique() if i is not None]))
print('Quantidade de elementos nulos = ',df.ISBN.isna().sum())

#Subjects
subjects_elementos = df['Subjects'].str.split(',',expand=True).melt()['value']
subjects_elementos = subjects_elementos.astype('str')

print('Elementos = ',subjects_elementos.unique())
print('Máximo de caracteres = ', max([len(i) for i in subjects_elementos.unique() if i is not None]))
print('Quantidade de elementos nulos = ', subjects_elementos.isna().sum())

#Publisher
df.Publisher = df.Publisher.astype('str')

print('Elementos = ',df.Publisher.unique())
print('Máximo de caracteres = ', max([len(i) for i in df.Publisher.unique() if i is not None]))
print('Quantidade de elementos nulos = ', df.Publisher.isna().sum())

#PublicationYear
df.PublicationYear = df.PublicationYear.astype('str')

print('Elementos = ',df.PublicationYear.unique())
print('Máximo de caracteres = ', max([len(i) for i in df.PublicationYear.unique() if i is not None]))
print('Quantidade de elementos nulos = ', df.PublicationYear.isna().sum())