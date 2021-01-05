--Slide 8 Exercício 1

agrupar_aux :: Eq t => [t] -> [(t,Int)]
agrupar_aux [] = []
agrupar_aux (n) = (head (n),(contagem (n) (head (n)))):(agrupar_aux (battousai (n) (head (n))))

agrupar :: Eq t => [[t]] -> [(t,Int)]
agrupar [] = []
agrupar n = agrupar_aux (fusao (n))

contagem :: Eq t => [t] -> t -> Int
contagem [] (parametro) = 0
contagem (nh:nt) (parametro) | (nh == parametro) = 1 + contagem (nt) (parametro)
                             | otherwise         = contagem (nt) (parametro)

fusao :: [[t]] -> [t]
fusao [] = []
fusao (nh:nt) = nh ++ (fusao (nt))

battousai :: Eq t => [t] -> t -> [t]
battousai [] (parametro) = []
battousai (n) (parametro) = ([a|a <- (n), a /= parametro])