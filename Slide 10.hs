--Slide 10 Exercício 1

funcao :: t -> u -> v
funcao (a) (b) = funcao (a) (b)

composta :: (u -> t -> t) -> (t -> u -> u) -> (t -> u -> v) -> (u -> t -> v)
composta (funcao_1) (funcao_2) g = (\b a -> g (funcao_1 (b) (a)) (funcao_2 (a) (b)))