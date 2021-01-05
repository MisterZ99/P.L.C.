from typing import List

def etapa_1(palavra:str):
    et1 = []
    p1 = ""
    for letra in palavra:
        if((letra >= 'a' and letra <= 'z') or (letra >= 'A' and letra <= 'Z')):
            et1.append(str(chr(ord(letra)+3)))
        else:
            et1.append(letra)
    for letra in et1:
        p1 = p1 + letra
    return p1

def etapa_2(palavra:str):
    return palavra[::-1]

def etapa_3(palavra:str):
    tamanho = len(palavra)
    limiar = int(tamanho/2)
    et3 = []
    for i in range(0, limiar):
        et3.append(palavra[i])
    for i in range(limiar,tamanho):
        letra = palavra[i]
        et3.append(str(chr(ord(letra)-1)))
    p3 = ""
    for letra in et3:
        p3 = p3 + letra
    return p3

def main():
    palavra = ""
    n = input()
    n = int(n)
    while(n>0):
        palavra = input()
        palavra = etapa_1(palavra)
        palavra = etapa_2(palavra)
        palavra = etapa_3(palavra)    
        print(palavra)
        n = n-1

main()