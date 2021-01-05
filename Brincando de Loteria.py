from typing import List

'''def ordenacao_nome(lista):
    coringa:tuple(int, str) = ()
    tamanho = len(lista)
    for i in range(0, tamanho):
        for j in range(i+1, tamanho):
            if(lista[i][0] == lista[j][0]):
                print(lista[i][1], lista[j][1], i, j)
                if(lista[i][1] > lista[j][1]):
                    coringa = lista[j]
                    lista[j] = lista[i]
                    lista[i] = coringa
            else:
                break
    return lista'''

    
def main():
    pessoas:List[(str, List[str])] = []
    pontuacao:List[(int, str)] = []
    dicionario = {}
    pessoa = input()
    while(pessoa != "FIM"):
        pessoa = pessoa.split(' ')
        dicionario[pessoa[0]] = 0
        tamanho = len(pessoas)
        for i in range(0, tamanho):
            if(pessoas[i][0] == pessoa[0]):
                pessoas.pop(i)
                break
        pessoas.append((pessoa[0], pessoa[1:]))
        pessoa = input()
    numeros = input()
    numeros = numeros.split('-')
    for p in pessoas:
        for valor in p[1]:
            for n in numeros:
                if(n == valor):
                    dicionario[p[0]] = dicionario[p[0]] + 1
                    break
    for p in dicionario:
        pontuacao.append((dicionario[p], p))
    pontuacao.sort()
    for nome in pontuacao:
        person = nome[1] + ' '
        num = nome[0]
        if(num == 0):
            print(person)
        else:
            while(num>0):
                person = person + '+'
                num = num - 1
            print(person)
    

main()