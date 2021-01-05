--Questão 1

botaEsp :: Int -> String
botaEsp n | n == 0    = ""
          | otherwise = " " ++ botaEsp(n-1)

addEspOnStr :: String -> Int -> String
addEspOnStr palavra n | palavra == ""      = []
                      | n       == 0       = palavra
                      | tail palavra == "" = (head palavra) : []
                      | otherwise          = ((head palavra) : (botaEsp(n))) ++ (addEspOnStr (tail palavra) (n))

--Questão 2

quantDig :: Int -> Int -> Int
quantDig p d | (p == 0) = 0
             | ((p `mod` 10) == d) = 1 + (quantDig (div p 10) d)
             |  otherwise = (quantDig (div p 10) d)

loop :: Int -> Int -> Int -> Int
loop p n d | (p<=n) = (quantDig p d) + (loop (p+1) n d)
           | otherwise = 0

quantidade :: Int -> Int -> Int
quantidade 0 0 = 1
quantidade 0 _ = 0
quantidade n d = loop 1 n d

--Questão 3

divisao :: Int -> Int
divisao n | n == 0          = 0
          | (mod n 10) == 1 = (divisao(div n 10))
          | otherwise       = ((divisao(div n 10))*10 + (mod n 10))

tiraUm :: Int -> [Int]
tiraUm n | n == 1          = []
         | n == 11         = []
         | n == 111        = []
         | n == 1111       = []
         | n == 11111      = []
         | n == 111111     = []
         | n == 1111111    = []
         | n == 11111111   = []
         | n == 111111111  = []
         | n == 1111111111 = []
         | otherwise = [divisao(n)]

limpaUm :: [Int] -> [Int]
limpaUm lista | lista == []  = []
              | otherwise    = (tiraUm (head lista))++(limpaUm(tail lista))

--Questão 4

inverter :: String -> String
inverter palavra | (tail palavra) == "" = (head palavra):[]
                 | otherwise = inverter(tail palavra)++(head palavra:[])

minuscula :: String -> String
minuscula "" = ""
minuscula palavra | (head palavra) == 'A' = 'a':minuscula(tail palavra)
                  | (head palavra) == 'B' = 'b':minuscula(tail palavra)
                  | (head palavra) == 'C' = 'c':minuscula(tail palavra)
                  | (head palavra) == 'D' = 'd':minuscula(tail palavra)
                  | (head palavra) == 'E' = 'e':minuscula(tail palavra)
                  | (head palavra) == 'F' = 'f':minuscula(tail palavra)
                  | (head palavra) == 'G' = 'g':minuscula(tail palavra)
                  | (head palavra) == 'H' = 'h':minuscula(tail palavra)
                  | (head palavra) == 'I' = 'i':minuscula(tail palavra)
                  | (head palavra) == 'J' = 'j':minuscula(tail palavra)
                  | (head palavra) == 'K' = 'k':minuscula(tail palavra)
                  | (head palavra) == 'L' = 'l':minuscula(tail palavra)
                  | (head palavra) == 'M' = 'm':minuscula(tail palavra)
                  | (head palavra) == 'N' = 'n':minuscula(tail palavra)
                  | (head palavra) == 'O' = 'o':minuscula(tail palavra)
                  | (head palavra) == 'P' = 'p':minuscula(tail palavra)
                  | (head palavra) == 'Q' = 'q':minuscula(tail palavra)
                  | (head palavra) == 'R' = 'r':minuscula(tail palavra)
                  | (head palavra) == 'S' = 's':minuscula(tail palavra)
                  | (head palavra) == 'T' = 't':minuscula(tail palavra)
                  | (head palavra) == 'U' = 'u':minuscula(tail palavra)
                  | (head palavra) == 'V' = 'v':minuscula(tail palavra)
                  | (head palavra) == 'W' = 'w':minuscula(tail palavra)
                  | (head palavra) == 'X' = 'x':minuscula(tail palavra)
                  | (head palavra) == 'Y' = 'y':minuscula(tail palavra)
                  | (head palavra) == 'Z' = 'z':minuscula(tail palavra)                  
                  | otherwise = (head palavra):minuscula(tail palavra)

isPalindromo :: String -> Bool
isPalindromo "" = True
isPalindromo palavra | (minuscula(palavra) == minuscula(inverter(palavra))) = True
                     | otherwise = False

--Questão 5

strlen :: String -> Int
strlen "" = 0
strlen palavra = 1 + strlen(tail palavra)

btoi :: String -> Int
btoi "" = 0
btoi palavra | (head palavra) == '1' = 2^(strlen(palavra)-1) + btoi(tail palavra)
             | otherwise             = 0 + btoi(tail palavra)

--Questão 6

tamanho :: [Int] -> Int
tamanho lista2 | lista2 == [] = 0
               | otherwise   = 1 + tamanho (tail lista2)

passar :: Int -> Int -> [Int] -> [Int]
passar p n lista3 | p <= (div n 2) = (head lista3):(passar (p+1) (n) (tail lista3))
                  | otherwise      = []

pass1r :: Int -> Int -> [Int] -> [Int]
pass1r p n lista4 | p <= (div n 2) = pass1r (p+1) (n) (tail lista4)
                  | otherwise      = lista4

metade :: [Int] -> ([Int], [Int])
metade lista1 | lista1 == [] = ([],[])
              | otherwise    = ((passar (1) (tamanho(lista1)) (lista1)), pass1r (1) (tamanho(lista1)) (lista1))

--Questão 7

verifi :: String -> Char -> Int
verifi palavra2 letra1 | palavra2 == [] = 0
                       | head palavra2 == letra1 = 1 + (verifi (tail palavra2) letra1)
                       | otherwise               = 0

isReplica :: String -> Int -> Char -> Bool
isReplica palavra1 quant letra | (strlen(palavra1) == (verifi palavra1 letra)) && (strlen(palavra1) == quant) = True
                               | otherwise                                                                    = False

--Questão 8

primeiro :: (Char, Char) -> Char
primeiro (pri, seg) = pri

segundo :: (Char, Char) -> Char
segundo (pri1, seg1) = seg1

decEnigma :: String -> [(Char, Char)] -> String
decEnigma palavra3 trad | palavra3 == "" = ""
                        | otherwise      = segundo(head trad):decEnigma (tail palavra3) (tail trad)

--Questão 9

pegaPalavra :: String -> String
pegaPalavra palavra4 | (head palavra4 == ' ') || (head palavra4 == ';') = ""
                     | otherwise = (head palavra4):(pegaPalavra (tail palavra4))

descarte :: String -> String
descarte palavra5 | (head palavra5 == ' ') || (head palavra5 == ';') = tail palavra5
                  | otherwise = descarte(tail palavra5)

trans :: String -> Bool
trans a | a == "Aprovada" = True
        | otherwise = False

clearData :: String -> [(Int, String, String, Double, Bool)]
clearData palavra6 | palavra6 == "" = []
                   | otherwise = ((map read [pegaPalavra(palavra6)] :: [Int]) !! 0, pegaPalavra(descarte(palavra6)), pegaPalavra(descarte(descarte(palavra6))), (map read [pegaPalavra(descarte(descarte(descarte(palavra6))))] :: [Double]) !! 0, trans(pegaPalavra(descarte(descarte(descarte(descarte(palavra6))))))):clearData(descarte(descarte(descarte(descarte(descarte(palavra6))))))
