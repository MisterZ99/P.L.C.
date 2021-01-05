{-
iter :: Int -> (t -> t) -> (t -> t)
iter 0 f = id
iter n f = (iter (n-1) f).f

multiply :: Int -> Int -> Int
multiply a b = a*b

doubleList :: [Int] -> [Int]
doubleList = map (multiply 2)
-}

whiteSpace = " "
elem :: Char -> [Char] -> Bool
elem (ch) (whiteSpace)
\ch -> elem ch whiteSpace
filter (\ch -> not(elem ch whitespace))

{-
filter (a -> Bool) -> [a] -> [a]
not (Bool -> Bool)
a ---> Bool
filter (\ch -> not(elem ch whitespace)) :: [Bool] -> [Bool]
-}

maisdificil = map.foldr

{-
Pedir na aula
map (a->b) -> [a] -> [b]
foldr (a -> b -> b) -> b -> t a -> b


-}