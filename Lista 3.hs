--Safe Second

import Prelude hiding (Maybe (..))

data Maybe a = Just a |
               Nothing
               deriving(Show)

safeSecond :: [a] -> Maybe a
safeSecond ([]) = Nothing
safeSecond (a:[]) = Nothing
safeSecond (cabeca:cauda) = Just (head cauda)

--Cálculo Seguro

pegaPrimeiro :: String -> String
pegaPrimeiro [] = []
pegaPrimeiro palavra | ((head palavra) <= '9' && (head palavra) >= '0') = (head palavra):pegaPrimeiro(tail palavra)
                     | otherwise                                    = []

tiraOP :: String -> String
tiraOP palavra | ((head palavra) > '9') = tiraOP(tail palavra)
               | otherwise             = pegaPrimeiro(palavra)

pegaSegundo :: String -> String
pegaSegundo palavra | ((head palavra) <= '9' && (head palavra) >= '0') = pegaSegundo(tail palavra)
                    | otherwise                                    = tiraOP(palavra)

pegaOP :: String -> String
pegaOP palavra | ((head palavra) > '9') = (head palavra):pegaOP(tail palavra)
               | otherwise             = []

operacao :: String -> String
operacao palavra | ((head palavra) < '9') = operacao(tail palavra)
                 | otherwise             = pegaOP(palavra)

resolve :: Int -> String -> Int -> Maybe Int
resolve (x) ("sum") (y) = Just (x+y)
resolve (x) ("sub") (y) = Just (x-y)
resolve (x) ("mul") (y) = Just (x*y)
resolve (x) ("div") (0) = Nothing
resolve (x) ("div") (y) = Just (div (x) (y))

safeCalc :: String -> IO ()
safeCalc palavra = putStr(show(resolve (read(pegaPrimeiro(palavra))) (operacao(palavra)) (read(pegaSegundo(palavra)))))