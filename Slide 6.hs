--Slide 6 Exercício 1

menorMaior :: Int -> Int -> Int -> (Int, Int)
menorMaior m n p | ((m <= n) && (n <= p)) = (m,p)
                 | ((n <= m) && (m <= p)) = (n,p)
                 | ((m <= p) && (p <= n)) = (m,n)
                 | ((p <= m) && (m <= n)) = (p,n)
                 | ((p <= n) && (n <= m)) = (p,m)
                 | ((n <= p) && (p <= m)) = (n,m)

--Slide 6 Exercício 2

ordenaTripla :: (Int, Int, Int) -> (Int, Int, Int)
ordenaTripla (m, n, p) | ((m <= n) && (n <= p)) = (m, n, p)
                       | ((n <= m) && (m <= p)) = (n, m, p)
                       | ((m <= p) && (p <= n)) = (m, p, n)
                       | ((p <= m) && (m <= n)) = (p, m, n)
                       | ((p <= n) && (n <= m)) = (p, n, m)
                       | ((n <= p) && (p <= m)) = (n, p, m)

--Slide 6 Exercício 3

type Ponto = (Float, Float)
type Reta = (Ponto, Ponto)

abscissa :: Ponto -> Float
abscissa (x, y) = x

ordenada :: Ponto -> Float
ordenada (x, y) = y

eVertical :: Reta -> Bool
eVertical ((xi, yi), (xf, yf)) | (xf == xi) = True
                               | otherwise  = False

--Slide 6 Exercício 4

pontoY :: Float -> Reta -> Float
pontoY (x) ((xi, yi), (xf, yf)) | (xf == xi) = 0
                                | otherwise  = yf - (((xf - x)*(yf - yi))/(xf - xi))