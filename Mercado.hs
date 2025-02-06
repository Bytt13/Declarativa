{-# OPTIONS_GHC -Wno-unrecognised-pragmas #-}
{-# HLINT ignore "Use map" #-}
{-# HLINT ignore "Use foldr" #-}
module Mercado where
    type Nome = String
    type Preco = Int
    type CodigoDeBarras = Int
    type BancoDeDados = [(CodigoDeBarras,Nome,Preco)]

    bd :: BancoDeDados
    bd = [(1001, "Refrigerante", 450),(1002, "Leite", 320), (1003, "Biscoito", 200), (1004, "Suco", 989), (1005, "Arroz", 345), (1006, "Feijao",780)]

    buscarBDaux :: CodigoDeBarras -> BancoDeDados -> (Nome,Preco)
    buscarBDaux_[] = ("Produto nao encontrado", 0)
    buscarBDaux codigo ((c,n,p):resto)
        | codigo == c = (n,p)
        | otherwise = buscarBDaux codigo resto

    buscarBD :: CodigoDeBarras -> (Nome,Preco)
    buscarBD codigo = buscarBDaux codigo bd

    fazerConta :: [CodigoDeBarras] -> [(Nome,Preco)]
    fazerConta [] = []
    fazerConta (codigo:resto) = buscarBD codigo : fazerConta resto

    dividir :: Int -> String
    dividir p
        | mod p 100 < 10 = show (div p 100) ++ "." ++ "0" ++ show (mod p 100)
        | otherwise = show (div p 100) ++ "." ++ show (mod p 100)

    repetir :: Int -> String -> String
    repetir x palavra
        | x == 0 = ""
        | otherwise = palavra ++ repetir (x - 1) palavra

    tamanhoLinha :: Int
    tamanhoLinha = 30

    formatarLinha :: (Nome, Preco) -> String
    formatarLinha (nome,preco) = nome ++ repetir (tamanhoLinha - (length nome + length (dividir preco))) "." ++ dividir preco ++ "\n"

    formatarLinhas :: [(Nome,Preco)] -> String
    formatarLinhas[] = ""
    formatarLinhas (produto:resto) = formatarLinha produto ++ formatarLinhas resto

    calcularTotal :: [(Nome, Preco)] -> Int
    calcularTotal [] = 0
    calcularTotal ((n,p):resto) = p + calcularTotal resto

    formatarTotal :: Int -> String
    formatarTotal total = formatarLinha("Total:", total)

    formatarConta :: [(Nome,Preco)] -> String
    formatarConta [] = ""
    formatarConta produto = formatarLinhas produto ++ formatarTotal (calcularTotal produto) 

    imprimirConta :: [CodigoDeBarras] -> IO()
    imprimirConta lista = putStr(formatarConta (fazerConta lista))