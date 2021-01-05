from typing import List

def main():
    idade_maior = 0
    idade = input()
    idade = int(idade)
    cont_loiras_o_verdes = 0
    cont = 0
    while(idade != -1):
        cont = cont + 1
        if(idade > idade_maior):
            idade_maior = idade
        pessoa = input()
        if(pessoa == 'f l v' and idade >= 18 and idade <=35):
            cont_loiras_o_verdes = cont_loiras_o_verdes + 1
        idade = input()
        idade = int(idade)
    p = (cont_loiras_o_verdes/cont) * 100.00
    p = "{0:4.2f}".format(p)
    p = p + '%'
    print('Mais velho:', idade_maior)
    print('Mulheres com olhos verdes, loiras com 18 a 35 anos:', p)


main()