--Slide 4 Exercício 1

addEspacos :: Int -> String
addEspacos n = addEspacos_aux (n) (1)

addEspacos_aux :: Int -> Int -> String
addEspacos_aux n contador | (n == 0)  = ""
                          | (contador > n) = ""
                          | otherwise = ' ':(addEspacos_aux (n) (contador+1))

--Slide 4 Exercício 2

paraDireita :: Int -> String -> String
paraDireita n palavra = (addEspacos (n)) ++ (palavra)

--Slide 4 Exercício 3

cabecalho :: String
cabecalho = "Semana Venda\n"

venda :: Int -> Int
venda n = n*n+7

imprimeSemVen_aux :: Int -> Int -> String
imprimeSemVen_aux n contador | (contador < n) = "  "++(show (contador))++"      "++(show(venda (contador)))++"\n"++(imprimeSemVen_aux (n) (contador+1))
                             | otherwise = ""

imprimeSemVen :: Int -> String
imprimeSemVen n = imprimeSemVen_aux (n) (0)

totalVendas_aux :: Int -> Int
totalVendas_aux n | (n < 0) = 0
                  | (n == 0) = venda (0)
                  | otherwise = (venda (n)) + (totalVendas_aux (n-1))

totalVendas :: Int -> Int
totalVendas n = totalVendas_aux (n-1)

imprimeTotal :: Int -> String
imprimeTotal n = "Total    " ++ (show (totalVendas (n))) ++ "\n"

media :: Int -> Float
media n = (fromIntegral (totalVendas (n)))/(fromIntegral (n))

imprimeMedia :: Int -> String
imprimeMedia n = "Média    " ++ (show (media(n))) ++ "\n"

imprimeTabela_aux :: Int -> String
imprimeTabela_aux n = cabecalho ++ (imprimeSemVen (n)) ++ (imprimeTotal (n)) ++ (imprimeMedia (n))

imprimeTabela :: Int -> IO()
imprimeTabela n = putStr(imprimeTabela_aux (n))

--Teste da função read

trans :: String -> Float
trans n = read (n)