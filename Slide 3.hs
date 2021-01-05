--Slide 3 Exemplo 1

indiceMassaCorporea :: Double -> Double -> Double
indiceMassaCorporea peso altura = peso/(altura*altura)

--Slide 3 Exemplo 2

eMenor :: Double -> Double -> Double -> Bool
eMenor a b c | (a<b) && (b<c) = True
             | otherwise = False

--Slide 3 Exemplo 3

vendas :: Int -> Int
vendas n = n

totalVendas :: Int -> Int
totalVendas semana | (semana == 0) = 0
                   | otherwise = vendas(semana) + totalVendas(semana-1)

-- Slide 3 Exemplo 4

maxVendas :: Int -> Int
maxVendas semanas | (semanas == 0) = 0
                  | otherwise = max (vendas(semanas)) (maxVendas(semanas-1))

-- Slide 3 Exercício 1

quantasSemanas_aux :: Int -> Int -> Int -> Int
quantasSemanas_aux s n contador | (n == 0) && (s == 0)   = contador+1
                                | (n == 0)               = contador
                                | (s == vendas(n))       = quantasSemanas_aux (s) (n-1) (contador+1)
                                | otherwise              = quantasSemanas_aux (s) (n-1) (contador)

quantasSemanas :: Int -> Int -> Int
quantasSemanas s n = quantasSemanas_aux s n 0

-- Slide 3 Exercício 2

ePrimo_aux :: Int -> Int -> Bool
ePrimo_aux n contador | (n == 1 || n == 0)    = False
                      | (contador == n)       = True
                      | (mod n contador == 0) = False
                      | otherwise             = ePrimo_aux (n) (contador+1)

ePrimo :: Int -> Bool
ePrimo n = ePrimo_aux n 2

-- Slide 3 Exercício 3

primosEntreSi_aux :: Int -> Int -> Int -> Bool
primosEntreSi_aux x y contador | (x == y && x /= 1)                           = False
                               | (x == 1 || y == 1)                           = True
                               | (x == 0 || y == 0)                           = False
                               | (mod x contador == 0 && mod y contador == 0) = False
                               | (contador > x || contador > y)               = True
                               | otherwise                                    = primosEntreSi_aux (x) (y) (contador+1)

primosEntreSi :: Int -> Int -> Bool
primosEntreSi x y = primosEntreSi_aux x y 2

-- Slide 3 Exercício 4

fat :: Int -> Int
fat n | (n == 0 || n == 1) = 1
      | otherwise          = n*(fat (n-1))

-- Slide 3 Exercício 5

allEqual :: Int -> Int -> Int -> Bool
allEqual a b c = (a == b) && (b == c)

all4Equal :: Int -> Int -> Int -> Int -> Bool
all4Equal a b c d = (allEqual (a) (b) (c)) && (a == d)

-- Slide 3 Exercício 6

equalCount :: Int -> Int -> Int -> Int
equalCount a b c | ((allEqual (a) (b) (c)) == True) = 3
                 | (a == b || a == c || b == c)     = 2
                 | otherwise                        = 0