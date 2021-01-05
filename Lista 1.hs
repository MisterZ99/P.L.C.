--Questão 1

split :: String -> String
split "" = ""
split (palavra) | ((head palavra) == ';') || ((head palavra) == ' ') = tail palavra
                | otherwise                                          = split (tail palavra)

pegaMes :: String -> String
pegaMes "" = ""
pegaMes (palavra) | ((head palavra) == ';') = ""
                  | otherwise       = (head palavra):(pegaMes (tail palavra))

pegaValor :: String -> String
pegaValor (palavra) | ((head palavra) == ';') = ""
                    | otherwise               = (head palavra):(pegaValor (tail palavra))

valor :: String -> String -> Double
valor (mes) (fatura) | (pegaMes(split(fatura)) == mes) = read (pegaValor(split(split(split(fatura)))))
                     | otherwise                       = 0

logMes_aux :: String -> String -> [Double]
logMes_aux (mes) [] = []
logMes_aux (mes) (palavra) = (valor (mes) (palavra)):(logMes_aux (mes) ((split(split(split(split(palavra)))))))

logMes :: String -> String -> Double
logMes (mes) [] = 0
logMes (mes) (palavra) = (foldl (+) (0) (logMes_aux (mes) (palavra)))

-- Questão 2

menor :: [Double] -> Double
menor lista = head lista

maior :: [Double] -> Double
maior (nh:nt) | nt == [] = nh
              | otherwise = maior(nt)

lista_dinheiro :: String -> [Double]
lista_dinheiro [] = []
lista_dinheiro palavra = (read (pegaValor(split(split(split(palavra)))))):(lista_dinheiro(split(split(split(split(palavra))))))

quickSort :: [Double] -> [Double]
quickSort [] = []
--quickSort lista = quickSort([a|a<-(tail lista), a<=(head lista)]) ++ [head lista] ++ quickSort([a|a<-(tail lista), a>(head lista)])

minMaxCartao :: String -> (Double, Double)
minMaxCartao [] = (0.0,0.0)
minMaxCartao palavra = (menor(quickSort(lista_dinheiro(palavra)))/100,maior(quickSort(lista_dinheiro(palavra)))/100)

--Questão 3

teste :: String -> Char -> Bool
teste [] (letra) = True
teste (palavra) (letra) | (head palavra) == letra = (teste (tail palavra) (letra))
                        | otherwise               = False

presente :: String -> Char -> Bool
presente [] (letra) = False
presente (palavra) (letra) | (head palavra) == letra = True
                           | otherwise              = presente (tail palavra) (letra)

isReplica :: String -> Int -> Char -> Bool
isReplica ([]) (0) (letra) = True
isReplica ([]) (n) (letra) = False
isReplica (palavra) (n) (letra) | (teste (palavra) (letra) || n==0) == False = False
                                | (n == 0 && ((presente (palavra) (letra)) == False)) = True
                                | (n == 0 && ((presente (palavra) (letra)) /= False)) = False
                                | (tamanho (palavra)) == n = True
                                | otherwise                = False

--Questão 4

compara :: Char -> (Char,Char) -> Bool
compara (letra) (original,traducao) = (letra == original)

traduz :: (Char,Char) -> Char
traduz (x,y) = y

tradutor :: Char -> [(Char, Char)] -> Char
tradutor (letra) (lista) | (compara (letra) (head lista)) = traduz (head lista)
                         | otherwise                      = tradutor (letra) (tail lista)

decEnigma :: String -> [(Char, Char)] -> String
decEnigma ([]) (lista) = []
decEnigma (palavra) (lista) = (tradutor (head palavra) (lista)):(decEnigma (tail palavra) (lista))

--Questão 5

tamanho :: String -> Int
tamanho [] = 0
tamanho palavra = 1 + tamanho (tail palavra)

btoi :: String -> Int
btoi [] = 0
btoi palavra | ((head palavra) == '0') = 0*2^tamanho(tail palavra) + btoi (tail palavra)
             | ((head palavra) == '1') = 1*2^tamanho(tail palavra) + btoi (tail palavra)

--Questão 6

ordenada :: (String, Int) -> Int
ordenada (x,y) = y

som :: (String, Int) -> Bool
som (palavra,valor) = (palavra == "Soma")

mult :: (String, Int) -> Bool
mult (palavra,valor) = (palavra == "Multiplica")

divi :: (String, Int) -> Bool
divi (palavra,valor) = (palavra == "Divide")

subt :: (String, Int) -> Bool
subt (palavra,valor) = (palavra == "Subtrai")

decisao :: [(String, Int)] -> Bool
decisao [] = False
decisao lista | ((head lista) == ("Divide",0)) = True
              | otherwise                      = decisao (tail lista)

execucao :: [(String, Int)] -> Int -> Int
execucao [] (previa) = previa
execucao lista (previa) | som(head lista) = execucao (tail lista) (previa + ordenada(head lista))
                        | mult(head lista) = execucao (tail lista) (previa*ordenada(head lista))
                        | divi(head lista) = execucao (tail lista) (div (previa) (ordenada(head lista)))
                        | subt(head lista) = execucao (tail lista) (previa - ordenada(head lista))

executa :: [(String, Int)] -> Int
executa [] = 0
executa (lista) | decisao (lista) = -666
                | otherwise       = execucao (lista) (0)

--Questão 7

tamanho1 :: [Int] -> Int
tamanho1 [] = 0
tamanho1 lista = 1 + tamanho1(tail lista)

ajuste :: [Int] -> Int -> [Int]
ajuste lista contador | contador == 0 = []
                      | lista == []   = 0:(ajuste ([]) (contador-1))
                      | otherwise     = (head lista):(ajuste (tail lista) (contador-1))

resolve :: [Int] -> [Int] -> [Int]
resolve ([]) ([]) = []
resolve (lista1) (lista2) = ((head lista1)*(head lista2)):(resolve (tail lista1) (tail lista2))

mul2 :: [Int] -> [Int] -> [Int]
mul2 (lista1) (lista2) | (tamanho1 (lista1)) == (tamanho1 (lista2)) = (resolve (lista1) (lista2))
                       | (tamanho1 (lista1)) < (tamanho1 (lista2))  = (resolve (ajuste (lista1) (tamanho1 (lista2))) (lista2))
                       | (tamanho1 (lista2)) < (tamanho1 (lista1))  = (resolve (ajuste (lista2) (tamanho1 (lista1))) (lista1))

