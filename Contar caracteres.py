from typing import List

class frase:
    def __init__(self, p:str):
        self.palavra = p

    def espaco_branco(self):
        contador = 0
        for letra in self.palavra:
            if(letra == ' '):
                contador = contador + 1
        return contador

    def quant_a(self):
        contador = 0
        for letra in self.palavra:
            if(letra == 'a' or letra == 'A'):
                contador = contador + 1
        return contador

    def freq(self):
        pares = {}
        tamanho = len(self.palavra)
        tamanho = tamanho - 1
        maior = 0
        for i in range(0, tamanho):
            if(((self.palavra[i] >= 'A' and self.palavra[i] <='Z') or (self.palavra[i] >= 'a' and self.palavra[i] <='z')) and ((self.palavra[i+1] >= 'A' and self.palavra[i+1] <='Z') or (self.palavra[i+1] >= 'a' and self.palavra[i+1] <='z'))):
                sinal = 1
                for j in pares:
                    if(j == self.palavra[i]+self.palavra[i+1]):
                        pares[j] = pares[j] + 1
                        if(pares[j] > maior):
                            maior = pares[j]
                        sinal = 0
                        break
                if(sinal == 1):
                    pares[self.palavra[i]+self.palavra[i+1]] = 1
                    if(pares[self.palavra[i]+self.palavra[i+1]] > maior):
                        maior = pares[self.palavra[i]+self.palavra[i+1]]
        if(maior == 0):
            return print("NENHUM PAR")
        else:
            for j in pares:
                if(pares[j] == maior):
                    print(maior)
                    print(j)
                    break

def main():
    palavra = ""
    palavra = input()
    while(palavra != "NAO QUERO MAIS"):
        palavra = palavra.lower()
        p = frase(palavra)
        print(p.espaco_branco())
        print(p.quant_a())
        p.freq()
        palavra = input()

main()