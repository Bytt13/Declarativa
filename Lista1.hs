{-# OPTIONS_GHC -Wno-unrecognised-pragmas #-}
{-# HLINT ignore "Evaluate" #-}
{-# HLINT ignore "Redundant ==" #-}
{-# HLINT ignore "Use isDigit" #-}
{-# HLINT ignore "Eta reduce" #-}
{-# HLINT ignore "Use even" #-}
import Data.Char

--Questao 1
area :: Float -> Float -> Float
area b h = (b * h) / 2.0

--Questao 2
menor :: Int -> Int -> Int -> Int
menor x y z
    | x < y && x < z = x
    | y < x && y < z = y
    | otherwise = z

--Questao 3
iguais :: Int -> Int -> Int -> Int -> Bool
iguais a b c d = a == b && b == c  && c == d

--Questao 4
diferentes :: Int -> Int -> Int -> Bool
diferentes a b c = a /= b && b /= c && a /= c

--Questao 5
mediaPonderada :: Float -> Float -> Float -> Float -> Float
mediaPonderada a b c d = ((a * 1) + (b * 2) + (c * 3) + (d * 4)) / 10.0

--Questao 6
desconto :: Float -> Float
desconto x = x * 0.2

--Questao 7 
xor :: Bool -> Bool -> Bool
xor p q
    | p == True && q == False = True
    | p == False && q == True = True
    | p == False && q == False = False
    | otherwise = False

--Questao 8
pa :: Float -> Float -> Float
pa r a = a + (r * 9)

--Questao 9 
posnegnul :: Float -> String
posnegnul x
    | x < 0 = "Negativo"
    | x > 0 = "Positivo"
    | otherwise = "nulo"

--Questao 10 
nand :: Bool -> Bool -> Bool
nand p q
    | p && q = False
    | otherwise = True

--Questao 11
digito :: Char -> Bool
digito c = (c >= '0') && (c <= '9')

--Questao 12
converterMaiuscula :: Char -> Char
converterMaiuscula c = toLower c

--Questao 13
converterMinuscula :: Char -> Char
converterMinuscula c = toUpper c

--Questao 14
somaAlgarismo :: Int -> Int
somaAlgarismo x = sum (map digitToInt (show x))

--Questao 15
mediaAritmetica :: Float -> Float -> Float -> Float
mediaAritmetica x y z = (x + y + z) / 3.0

--Questao 16
ladosTriangulo :: Int -> Int -> Int -> Bool
ladosTriangulo a b c
    | ((a + b) > c) && ((b + c) > a) && ((a + c) > b) = True
    | otherwise = False

--Questao 17
paFinita :: Float -> Float -> Float -> Float
paFinita a r n = (a + (a + r*(n-1))) * (n / 2)

--Questao 18
angulo :: Int -> Int -> Int -> String
angulo a b c
    | (a == b && a /= c) || (b == c && b /= a) || (a == c &&  a /= b) = "Isoceles"
    | (a == b) && (b == c) = "Equilatero"
    | otherwise = "Escaleno"

--Questao 19


--Questao 20
mes :: Int -> String
mes n
    | n == 1 = "Janeiro"
    | n == 2 = "Fevereiro"
    | n == 3 = "Março"
    | n == 4 = "Abril"
    | n == 5 = "Maio"
    | n == 6 = "Junho"
    | n == 7 = "Julho"
    | n == 8 = "Agosto"
    | n == 9 = "Setembro"
    | n == 10 = "Outubro"
    | n == 11 = "Novembro"
    | n == 12 = "Dezembro"

--Questao 21
ehPar :: Int -> Bool
ehPar p
    | mod p 2 == 0 = True
    | otherwise = False

--Questao 22

--Questao 23

--Questao 24

--Questao 25

--Questao 26

--Questao 27
proximo :: Char -> Char
proximo c
    | c == 'z' = 'a'
    | c == 'Z' = 'A'
    | otherwise = succ c