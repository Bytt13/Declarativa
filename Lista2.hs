import Distribution.CabalSpecVersion (CabalSpecVersion(CabalSpecV1_10))
--Questao 1

somarPares :: Int -> Int
somarPares n
    | n == 0 = 0
    | even n = n + somarPares (n - 2)
    | odd n = somarPares (n-1)


--Questao 2
potencia :: Int -> Int -> Int
potencia x y
    |y == 0 = 1
    |otherwise = x * potencia x (y - 1)

--Questao 3
somar :: Int -> Int -> Int
somar a b 
    | b == a = a
    | otherwise = b + somar a (b - 1)

--Questao 4
digitos :: Int -> Int
digitos n 
    | mod n 10 == n = n
    | otherwise = mod n 10 + digitos (div n 10)

--Questao 5
somaquadrada :: Int -> Int
somaquadrada n
    | n == 0 = 0
    | otherwise = (n * n) + somaquadrada (n - 1)

--Questao 6
somaFat :: Int -> Int
somaFat n 
    | n == 0 = 1
    | otherwise = n * somaFat (n - 1)