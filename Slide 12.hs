--Slide 12 Exercício 1

data Shape = Circulo Float |
             Retangulo Float Float

area :: Shape -> Float
area (Circulo raio) = 2*3.14*raio
area (Retangulo base altura) = base*altura

--Slide 12 Exercício 2

data Expr = Lit Int       |
            Add Expr Expr |
            Sub Expr Expr |
            Mul Expr Expr |
            Di  Expr Expr

eval :: Expr -> Int
eval (Lit n) = n
eval (Add e1 e2) = eval(e1) + eval(e2)
eval (Sub e1 e2) = eval(e1) - eval(e2)
eval (Mul e1 e2) = eval(e1) * eval(e2)
eval (Di  e1 e2) = eval(e1) `div` eval(e2)

showExpr :: Expr -> String
showExpr (Lit n) = show (n)
showExpr (Add e1 e2) = "(" ++ showExpr(e1) ++ ")" ++ "+" ++ "(" ++ showExpr(e2) ++ ")"
showExpr (Sub e1 e2) = "(" ++ showExpr(e1) ++ ")" ++ "-" ++ "(" ++ showExpr(e2) ++ ")"
showExpr (Mul e1 e2) = "(" ++ showExpr(e1) ++ ")" ++ "*" ++ "(" ++ showExpr(e2) ++ ")"
showExpr (Di  e1 e2) = "(" ++ showExpr(e1) ++ ")" ++ "/" ++ "(" ++ showExpr(e2) ++ ")"

--Slide 12 Exercício 3

data List t = Nil             |
              Cons t (List t)
              deriving (Show)

toList :: List t -> [t]
toList (Nil) = []
toList (Cons n (l)) = n:(toList(l))

--Slide 12 Exercício 4

fromList :: [t] -> List t
fromList [] = (Nil)
fromList (lista) = Cons (head lista) (fromList (tail lista))

--Slide 12 Exercício 5

data Tree t = NilT                     |
              Node t (Tree t) (Tree t)
              deriving (Eq, Show)

altura_e :: Tree t -> Int
altura_e (NilT) = 0
altura_e (Node a (e) (d)) = 1 + max (altura_e (e)) (altura_d (d))

altura_d :: Tree t -> Int
altura_d (NilT) = 0
altura_d (Node a (e) (d)) = 1 + max (altura_e (e)) (altura_d (d))

depth :: Tree t -> Int
depth (NilT) = 0
depth (Node a (e) (d)) = 1 + max (altura_e (e)) (altura_d (d))

--Slide 12 Exercício 6

collapse :: Tree t -> [t]
collapse (NilT) = []
collapse (Node a (e) (d)) = [a] ++ collapse (e) ++ collapse (d)

--Slide 12 Exercício 7

mapTree :: (t -> u) -> Tree t -> Tree u
mapTree (f) (NilT) = (NilT)
mapTree (f) (Node a (e) (d)) = Node (f(a)) (mapTree (f) (e)) (mapTree (f) (d))