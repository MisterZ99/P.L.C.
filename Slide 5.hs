--Slide 5 Exercício 1

double :: [Int] -> [Int]
double [] = []
double (nh:nt) = (2*nh):double(nt)

--Slide 5 Exercício 2

membership :: [Int] -> Int -> Bool
membership ([]) (x) = False
membership (nh:nt) (x) | (nh == x) = True
                       | otherwise = membership (nt) (x)

--Slide 5 Exercício 3

digits :: String -> String
digits [] = []
digits (nh:nt) | (nh >= '0' && nh <= '9') = nh:digits(nt)
               | otherwise                = digits(nt)

--Slide 5 Exercício 4

sumPairs :: [Int] -> [Int] -> [Int]
sumPairs ([]) ([]) = []
sumPairs (nh:nt) (mh:mt) = (nh + mh):(sumPairs (nt) (mt))

--Slide 5 Exercício 5

comprimentoLista :: [Int] -> Int
comprimentoLista [] = 0
comprimentoLista (nh:nt) = 1 + comprimentoLista (nt)

pegaMeio :: [Int] -> Int -> Int -> Int
pegaMeio (nh:nt) (tamanho) (contador) | (contador == (div tamanho 2)) = nh
                                      | otherwise                     = pegaMeio (nt) (tamanho) (contador+1)

setorMenor :: [Int] -> Int -> [Int]
setorMenor ([]) (pivo) = []
setorMenor (nh:nt) (pivo) | (nh < pivo) = nh:(setorMenor (nt) (pivo))
                          | otherwise   = setorMenor (nt) (pivo)

setorMaior :: [Int] -> Int -> [Int]
setorMaior ([]) (pivo) = []
setorMaior (nh:nt) (pivo) | (nh > pivo) = nh:(setorMaior (nt) (pivo))
                          | otherwise   = setorMaior (nt) (pivo)

setorIgual :: [Int] -> Int -> [Int]
setorIgual ([]) (pivo) = []
setorIgual (nh:nt) (pivo) | (nh == pivo) = nh:(setorIgual (nt) (pivo))
                          | otherwise   = setorIgual (nt) (pivo)

quickSort_aux :: [Int] -> Int -> [Int]
quickSort_aux ([]) (tamanho) = []
quickSort_aux (nh:nt) (tamanho) = quickSort(setorMenor (nh:nt) (pegaMeio (nh:nt) (tamanho) (0))) ++ (setorIgual (nh:nt) (pegaMeio (nh:nt) (tamanho) (0))) ++ quickSort(setorMaior (nh:nt) (pegaMeio (nh:nt) (tamanho) (0)))

quickSort :: [Int] -> [Int]
quickSort n = quickSort_aux (n) (comprimentoLista(n))

--Slide 5 Exercício 6

fibonacci :: Int -> Int
fibonacci 0 = 0
fibonacci 1 = 1
fibonacci n = (fibonacci (n-2)) + (fibonacci (n-1))

fibo :: Int -> Int -> [Int]
fibo (n) (contador) | (contador == n) = []
                    | otherwise       = (fibonacci (contador)):(fibo (n) (contador+1))

enePrimeirosFibonacci :: Int -> [Int]
enePrimeirosFibonacci n = fibo (n) (0)

--Slide 5 Exercício 7

somaDigito :: Int -> Int
somaDigito n | (n == 0)        = 0
             | otherwise       = (mod n 10) + somaDigito (div n 10)

listaSomas :: [Int] -> [Int]
listaSomas []      = []
listaSomas (nh:nt) = (somaDigito (nh)):(listaSomas (nt))

battousai :: [Int] -> [Int] -> [Int]
battousai [] (mh:mt) = []
battousai (nh:nt) (mh:mt) | (somaDigito (nh) == mh) = nt
                          | otherwise               = nh:(battousai (nt) (mh:mt))

ordenaPelaSoma_aux1 :: [Int] -> [Int] -> [Int]
ordenaPelaSoma_aux1 ([]) ([])    = []
ordenaPelaSoma_aux1 (nh:nt) (mh:mt) = (ordenaPelaSoma_aux3 (nh:nt) (mh:mt)):(ordenaPelaSoma_aux1 (battousai (nh:nt) (mh:mt)) (mt))

ordenaPelaSoma_aux2 :: [Int] -> [Int]
ordenaPelaSoma_aux2 ([])    = []
ordenaPelaSoma_aux2 (nh:nt) = quickSort(listaSomas ((nh:nt)))

ordenaPelaSoma_aux3 :: [Int] -> [Int] -> Int
ordenaPelaSoma_aux3 (nh:nt) (mh:mt) | (somaDigito (nh) == mh) = nh
                                    | otherwise               = ordenaPelaSoma_aux3 (nt) (mh:mt)


ordenar :: [Int] -> [Int]
ordenar []      = []
ordenar (nh:nt) = ordenaPelaSoma_aux1 (nh:nt) (ordenaPelaSoma_aux2 (nh:nt))