from typing import List

def main():
    n = input()
    n = int(n)
    dicionario = {}
    traducao = ""
    t = []
    while(n>0):
        traducao = input()
        t = traducao.split(' ')
        dicionario[t[0]] = t[2]
        n = n - 1
    frase = input()
    while(frase != "*"):
        texto_traduzido = ""
        t = frase.split(' ')
        tamanho = len(t) - 1
        for i in range(0, tamanho):
            texto_traduzido = texto_traduzido + dicionario[t[i]] + ' '
        texto_traduzido = texto_traduzido + dicionario[t[tamanho]]
        print(texto_traduzido)
        frase = input()

main()