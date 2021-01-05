from typing import List

def maior_seq_cont_cres(lista:List[int]):
    cont = 1
    cont_coringa = 1
    tamanho = len(lista)
    tamanho = tamanho - 1
    for i in range(0, tamanho):
        if(lista[i] < lista[i+1]):
            cont_coringa = cont_coringa + 1
        else:
            if(cont_coringa > cont):
                cont = cont_coringa
            cont_coringa = 1
    if(cont_coringa > cont):
        cont = cont_coringa
    return cont

def main():
    n = input()
    elemento = 0
    lista:List[int] = []
    elemento = input()
    lista = elemento.split(' ')
    lista = 2*lista
    tamanho = len(lista)
    for i in range(0,tamanho):
        lista[i] = int(lista[i])
    tamanho = len(elemento)
    print(maior_seq_cont_cres(lista))

main()