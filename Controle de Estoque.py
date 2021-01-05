from typing import List

def main():
    dicionario = {}
    n = input()
    n = n.split(' ')
    n[0] = int(n[0])
    while(n[0] != 9999):
        n[1] = int(n[1])
        dicionario[n[0]] = n[1]
        n = input()
        n = n.split(' ')
        n[0] = int(n[0])
    n = input()
    n = n.split(' ')
    n[0] = int(n[0])
    while(n[0] != 9999):
        n[1] = int(n[1])
        n[2] = int(n[2])
        if(dicionario[n[1]] >= n[2]):
            dicionario[n[1]] = dicionario[n[1]] - n[2]
            print('OK')
        else:
            print('ESTOQUE INSUFICIENTE')
        n = input()
        n = n.split(' ')
        n[0] = int(n[0])
    for codigo in dicionario:
        if(dicionario[codigo] < 0):
            dicionario[codigo] = 0
        print(codigo, dicionario[codigo])

main()