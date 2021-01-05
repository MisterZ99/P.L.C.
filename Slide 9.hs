--Slide 9 Exercício 1

doido :: Int -> Int
doido n = -1*n*n

isCrescent :: (Int -> Int) -> Int -> Bool
isCrescent (funcao) (n) | (n == 0) = True
                        | (funcao (n) < funcao(n-1)) = False
                        | otherwise = isCrescent (funcao) (n-1)

--Slide 9 Exercício 2

sqr :: Double -> Double
sqr (a) = a*a

mapping :: [Double] -> [Double]
mapping lista = map (sqr) (lista)

soma :: [Double] -> Double
soma [] = 0.0
soma lista = (head lista) + soma(tail lista)

folding :: ([Double] -> Double) -> ([Double] -> [Double]) -> [Double] -> Double
folding (funcao_soma) (funcao_geral_ao_quadrado) (lista) = funcao_soma(funcao_geral_ao_quadrado(lista))

filtering :: [Double] -> [Double]
filtering lista = [a|a<-lista, a>0]

--Slide 9 Exercício 3

--Slide 9 Exercício 4

pegaUltimo :: [Int] -> Int
pegaUltimo (nh:nt) | (nt == []) = nh
                   | otherwise  = pegaUltimo (nt)

maiores :: [[Int]] -> [Int]
maiores [] = []
maiores (nh:nt) = (pegaUltimo(quickSort(nh))):(maiores (nt))

quickSort :: [Int] -> [Int]
quickSort []    = []
quickSort lista = (quickSort([a|a<-(tail lista), a<=(head lista)]))++[head lista]++(quickSort([a|a<-(tail lista), a>(head lista)]))

--Slide 9 Exercício 5 

takeWhil :: (t -> t -> Bool) -> t -> [t] -> [t]
takeWhil (funcao) (parametro) (lista) | (funcao (head lista) (parametro)) = (head lista):(takeWhil (funcao) (parametro) (tail lista))
                                      | otherwise = []

dropWhil :: (t -> t -> Bool) -> t -> [t] -> [t]
dropWhil (funcao) (parametro) (lista) | (funcao (head lista) (parametro)) = (dropWhil (funcao) (parametro) (tail lista))
                                      | otherwise = (lista)

--Slide 9 Exercício 6

getWord :: String -> String
getWord palavra = takeWhil (/=) (' ') (palavra)

dropWord :: String -> String
dropWord palavra = dropWhil (/=) (' ') (palavra)

dropSpace :: String -> String
dropSpace palavra = dropWhil (==) (' ') (palavra)