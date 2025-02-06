{-# OPTIONS_GHC -Wno-unrecognised-pragmas #-}
{-# HLINT ignore "Redundant bracket" #-}
{-# HLINT ignore "Eta reduce" #-}
{-# HLINT ignore "Use sum" #-}
{-# HLINT ignore "Use product" #-}
{-# HLINT ignore "Use concat" #-}
pares20 :: [Int]
pares20 = [x | x <- [1..20], even x]

impares50 :: [Int]
impares50 = [x | x <- [1..50], odd x]

mult3e5 :: [Int]
mult3e5 = [x | x <- [1..100], x `mod` 3 == 0, x `mod` 5 == 0]

div7 :: [Int]
div7 = [x | x <- [1..100], x `mod` 7 == 0]

ehPalindromo :: Int -> Bool
ehPalindromo x 
    | x < 10 = True
    | x < 100 = (x `div` 10 == x `mod` 10)
    | x < 1000 = (x `mod` 10 == x `div` 100)
    | otherwise = False

palindromo :: [Int]
palindromo = [x | x <- [1..1000], ehPalindromo x]

dobrar :: [Int] -> [Int]
dobrar lista = map (*2) lista

pares :: [Int] -> [Int]
pares lista = filter even lista

somatorio :: [Int] -> Int
somatorio lista = foldl(+) 0 lista

paresDobrados :: [Int] -> [Int]
paresDobrados lista = map(*2) (filter even lista)

produtorio :: [Int] -> Int
produtorio lista = foldl (*) 1 lista

filtroSum :: [Int] -> [Int]
filtroSum lista = map(+1) (filter (5<) lista) 

somarPI :: [Int]
somarPI = [x + y | x <- [1..100], even x, y <- [1..100], odd y]

myConcat :: [[a]] -> [a]
myConcat = foldr (++) []

mapish :: [a -> b] -> a -> [b]
mapish funcs x = [f x | f <- funcs]