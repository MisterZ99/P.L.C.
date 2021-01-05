--Robô 2

data Command = Forward Int | Backward Int | TurnLeft | TurnRight 
               deriving (Eq, Show, Read)

data Direction = North | South | West | East
                 deriving (Read, Show)

faces :: Direction -> [Command] -> Direction
faces direcao [] = direcao
faces (North) (TurnLeft:rabo)  = faces (West) (rabo)
faces (North) (TurnRight:rabo)  = faces (East) (rabo)
faces (South) (TurnLeft:rabo)  = faces (East) (rabo)
faces (South) (TurnRight:rabo)  = faces (West) (rabo)
faces (West) (TurnLeft:rabo)  = faces (South) (rabo)
faces (West) (TurnRight:rabo)  = faces (North) (rabo)
faces (East) (TurnLeft:rabo)  = faces (North) (rabo)
faces (East) (TurnRight:rabo)  = faces (South) (rabo)
faces (direcao) (cabeca:rabo)  = faces (direcao) (rabo)

--Altura de árvore
{-
data Tree t = Node t (Tree t) (Tree t) 
              | Nilt
              deriving (Read)

altura_e :: Tree t -> Int
altura_e (Nilt) = 0
altura_e (Node a (e) (d)) = 1 + max (altura_e (e)) (altura_d (d))

altura_d :: Tree t -> Int
altura_d (Nilt) = 0
altura_d (Node a (e) (d)) = 1 + max (altura_e (e)) (altura_d (d))

alturaArvore :: Tree t -> Int
alturaArvore (Nilt) = 0
alturaArvore (Node a (e) (d)) = 1 + max (altura_e (e)) (altura_d (d))
-}

--Calculadora arbórea

{-data Ops = SUM | MUL | SUB
           deriving (Read)

data IntTree = Nilt Int |
               Node Ops IntTree IntTree
               deriving (Read)

evalTree :: IntTree -> Int
evalTree (Nilt n) = n
evalTree (Node SUM (e) (d)) = (evalTree (e)) + (evalTree (d))
evalTree (Node MUL (e) (d)) = (evalTree (e)) * (evalTree (d))
evalTree (Node SUB (e) (d)) = (evalTree (e)) - (evalTree (d))
-}

--Robô 1

resolve :: (Int,Int) -> Direction -> [Command] -> (Int,Int)
resolve (x,y) direcao [] = (x,y)
resolve (x,y) (North) (TurnLeft:rabo)  = resolve (x,y) (West) (rabo)
resolve (x,y) (North) (TurnRight:rabo)  = resolve (x,y) (East) (rabo)
resolve (x,y) (North) ((Forward n):rabo)  = resolve (x,y+n) (North) (rabo)
resolve (x,y) (North) ((Backward n):rabo)  = resolve (x,y-n) (North) (rabo)
resolve (x,y) (South) (TurnLeft:rabo)  = resolve (x,y) (East) (rabo)
resolve (x,y) (South) (TurnRight:rabo)  = resolve (x,y) (West) (rabo)
resolve (x,y) (South) ((Forward n):rabo)  = resolve (x,y-n) (South) (rabo)
resolve (x,y) (South) ((Backward n):rabo)  = resolve (x,y+n) (South) (rabo)
resolve (x,y) (West) (TurnLeft:rabo)  = resolve (x,y) (South) (rabo)
resolve (x,y) (West) (TurnRight:rabo)  = resolve (x,y) (North) (rabo)
resolve (x,y) (West) ((Forward n):rabo)  = resolve (x-n,y) (West) (rabo)
resolve (x,y) (West) ((Backward n):rabo)  = resolve (x+n,y) (West) (rabo)
resolve (x,y) (East) (TurnLeft:rabo)  = resolve (x,y) (North) (rabo)
resolve (x,y) (East) (TurnRight:rabo)  = resolve (x,y) (South) (rabo)
resolve (x,y) (East) ((Forward n):rabo)  = resolve (x+n,y) (East) (rabo)
resolve (x,y) (East) ((Backward n):rabo)  = resolve (x-n,y) (East) (rabo)

destination :: (Int,Int) -> [Command] -> (Int,Int)
destination (x,y) ([]) = (x,y)
destination (x,y) (lista) = resolve (x,y) (North) (lista)

--Árvore de Busca Binária 2

data Tree t = Nilt |
               Node t (Tree t) (Tree t)
               deriving (Read, Show)

insercao :: Ord t => Tree t -> t -> Tree t
insercao (Nilt) n = Node n (Nilt) (Nilt)
insercao (Node a (e) (d)) n | n < a = (Node a (insercao (e) (n)) (d))
insercao (Node a (e) (d)) n | n > a = (Node a (e) (insercao (d) (n)))

insertList :: Ord t => Tree t -> [t] -> Tree t
insertList (arvore) ([]) = arvore
insertList (arvore) (cabeca:cauda) = insertList (insercao (arvore) (cabeca)) (cauda)

--Editor de Texto

data Cmd = Cursor Int
           | Backspace Int
           | Delete Int
           | Insert String
           deriving (Read)

tamanho :: String -> Int
tamanho [] = 0
tamanho (palavra) = 1 + tamanho (tail palavra)

apaga_inicio :: String -> Int -> String
apaga_inicio [] _ = []
apaga_inicio (palavra) (0) = palavra
apaga_inicio (palavra) (cursor) = apaga_inicio (tail palavra) (cursor-1)

insere_inicio :: String -> String -> Int -> String
insere_inicio (palavra) (s) (cursor) | cursor == 0 = s ++ (palavra)
                                     | otherwise = (head palavra):insere_inicio (tail palavra) (s) (cursor-1)

apaga_esquerda :: String -> Int -> Int -> String
apaga_esquerda (palavra) (inicio_do_corte) (cursor) | inicio_do_corte == 0 = apaga_inicio (palavra) (cursor)
                                                    | otherwise            = (head palavra):apaga_esquerda (tail palavra) (inicio_do_corte-1) (cursor-1)

apaga_direita :: String -> Int -> Int -> String
apaga_direita (palavra) (vai_sair) (cursor) | cursor == 0 = apaga_inicio (palavra) (vai_sair)
                                            | otherwise   = (head palavra):apaga_direita (tail palavra) (vai_sair) (cursor-1)

decide :: Int -> Int
decide a | a <= 0 = 0
         | otherwise = a

decide_2 :: Int -> Int -> Int
decide_2 cursor n | (cursor - n < 0) = 0
                  | otherwise        = (cursor-n)

modificador :: String -> [Cmd] -> Int -> String
modificador palavra [] _ = palavra
modificador (palavra) ((Backspace n):cauda) (cursor) = modificador (apaga_esquerda (palavra) (decide_2 (cursor) (n)) (cursor)) (cauda) (decide(cursor-n))
modificador (palavra) ((Delete n):cauda) (cursor) = modificador (apaga_direita (palavra) (n) (cursor)) (cauda) (cursor)
modificador (palavra) ((Insert s):cauda) (cursor) = modificador (insere_inicio (palavra) (s) (cursor)) (cauda) (cursor)
modificador (palavra) ((Cursor n):cauda) (cursor) = modificador (palavra) (cauda) (cursor+n)

editText :: String -> [Cmd] -> String
editText palavra [] = palavra
editText (palavra) (lista) = modificador (palavra) (lista) (0)

--Árvore de busca binária 1

toList :: Ord t => Tree t -> [t]
toList (Nilt) = []
toList (Node a (e) (d)) = (toList (e)) ++ [a] ++ (toList (d))

isOrdenado :: Ord t => [t] -> Bool
isOrdenado [a] = True
isOrdenado (lista) = ((head lista) < (head (tail lista))) && isOrdenado (tail lista)

isBST :: Ord t => Tree t -> Bool
isBST (Nilt) = True
isBST (Node a (Nilt) (Nilt)) = True
isBST (arvore) = isOrdenado(toList(arvore))