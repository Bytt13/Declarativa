{-# OPTIONS_GHC -Wno-unrecognised-pragmas #-}
import GHCi.Message (THResultType)
import Text.Read (Lexeme(String))
{-# HLINT ignore "Use foldr" #-}
{-# HLINT ignore "Use map" #-}
type Ponto = (Float, Float)

distPonto :: Ponto -> Ponto -> Float
distPonto (x1,y1) (x2,y2) = sqrt (x*x + y*y)
    where
        x = x1 - x2
        y = y1 - y2

minMax :: Int -> Int -> Int -> (Int, Int)
minMax a b c
    | a > c && b < c = (b,a)
    | b > c && a < c = (a,b)
    | a > b && c < b = (c,a)
    | c > b && a < b = (a,c)
    | b > a && c < a = (c,b)
    | otherwise = (b,c)

tamanhoLista :: [Int] -> Int
tamanhoLista [] = 0
tamanhoLista(_:resto) = 1 + tamanhoLista resto

somarLista :: [Int] -> Int
somarLista[] = 0
somarLista(x:resto) = x + somarLista resto

dobrarLista :: [Int] -> [Int]
dobrarLista [] = []
dobrarLista (x:resto) = (2 * x) : dobrarLista resto

mapear :: Int -> [Int] -> Bool
mapear _ [] = False
mapear chave (head:tail) 
    | chave == head = True
    | otherwise = mapear chave tail

quickSort :: [Int] -> [Int]
quickSort[] = []
quickSort (pivo:resto) =
    let menoresOuIguais = [a | a <- resto, a <= pivo]
        maiores = [a | a <- resto, a > pivo]
    in quickSort menoresOuIguais ++ [pivo] ++ quickSort maiores

tirarEspacos :: String -> String
tirarEspacos [] = []
tirarEspacos (head:tail)
    | head == ' ' = tirarEspacos tail
    | otherwise = tirarEspacos tail