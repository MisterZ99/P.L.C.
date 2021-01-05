--Slide 7 Exercício 1

type Pessoa = String
type Livro = String
type BancoDados = [(Pessoa,Livro)]

ela_tem_o_livro :: String -> String -> Bool
ela_tem_o_livro (a) (person) | (a == person) = True
                             | otherwise     = False

ela_tem_o_livro2 :: (String, String) -> String -> Bool
ela_tem_o_livro2 (a,b) (book) | (b == book) = True
                              | otherwise     = False

ela_tem_o_livro3 :: (String, String) -> String -> Bool
ela_tem_o_livro3 (a,b) (person) | (a == person) = True
                                | otherwise     = False

membro :: [Int] -> Int -> Bool
membro (lista) (a) | ((head lista) == a)  = True
                   | ((tail lista) == []) = False
                   | otherwise            = membro (tail lista) (a)

livros :: BancoDados -> Pessoa -> [Livro]
livros (bd) (person) = [b|(a,b) <- bd, ela_tem_o_livro (a) (person)]

emprestimos :: BancoDados -> Livro -> [Pessoa]
emprestimos (bd) (book) = [a|(a,b) <- bd, ela_tem_o_livro (b) (book)]

emprestado :: BancoDados -> Livro -> Bool
emprestado (bd) (book) | (ela_tem_o_livro2 (head bd) (book) == True) = True
                       | ((tail bd) == [])                           = False
                       | otherwise                                   = emprestado (tail bd) (book)

qtdEmprestimos_aux :: BancoDados -> Pessoa -> Int -> Int
qtdEmprestimos_aux (bd) (person) (contador) | (bd == [])                                    = contador
                                            | (ela_tem_o_livro3 (head bd) (person) == True) = qtdEmprestimos_aux (tail bd) (person) (contador+1)
                                            | otherwise                                     = qtdEmprestimos_aux (tail bd) (person) (contador)

qtdEmprestimos :: BancoDados -> Pessoa -> Int
qtdEmprestimos (bd) (person) = qtdEmprestimos_aux (bd) (person) (0)

devolver :: BancoDados -> Pessoa -> Livro -> BancoDados
devolver (bd) (person) (book) = [(a,b)|(a,b) <- bd, ((a /= person) || (b /= book))]

--Slide 7 Exercício 2

quickSort :: [Int] -> [Int]
quickSort [] = []
quickSort (pivo:cauda) = quickSort([n|n <- (cauda), (n <= pivo)]) ++ [pivo] ++ quickSort([n|n <- (cauda), (n > pivo)])