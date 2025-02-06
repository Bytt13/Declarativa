{-# OPTIONS_GHC -Wno-unrecognised-pragmas #-}
{-# HLINT ignore "Use map" #-}
{-# HLINT ignore "Use foldr" #-}
module Revisao where
    type Nome = String
    type Preco = Int
    type CodigoDeBarra = Int
    type BancoDeDados = [(CodigoDeBarra, Nome, Preco)]

    bd :: BancoDeDados
    bd = [  (1001, "Refrigerante", 450),
            (1002, "Leite", 320),
            (1003, "Biscoito", 200),
            (1004, "Suco", 989),
            (1005, "Arroz", 345),
            (1006, "Feijao", 780)]

    buscarBDaux :: CodigoDeBarra -> BancoDeDados -> (Nome,Preco)
    buscarBDaux_[] = ("Produto nao encontrado", 0)
    buscarBDaux codigo ((c,n,p):resto)
        | codigo == c = (n,p)
        | otherwise = buscarBDaux codigo resto

    buscarBD :: CodigoDeBarra -> (Nome,Preco)
    buscarBD codigo = buscarBDaux codigo bd

    fazerConta :: [CodigoDeBarra] -> [(Nome,Preco)]
    fazerConta[] = []
    fazerConta(codigo:resto) = buscarBD codigo : fazerConta resto

    dividir :: Int -> String
    dividir preco = show(div preco 100) ++ "." ++ show (mod preco 100)

    repetir :: Int -> String -> String
    repetir 0 _ = ""
    repetir quantidade palavra = palavra ++ repetir (quantidade - 1) palavra 

    tamanhoLinha :: Int
    tamanhoLinha = 30

    formatarLinha :: (Nome,Preco) -> String 
    formatarLinha (n,p) = n ++ repetir (tamanhoLinha - (length n + length (dividir p))) "." ++ dividir p ++ "\n"

    formatarLinhas :: [(Nome,Preco)] -> String
    formatarLinhas[] = ""
    formatarLinhas (a : b) = formatarLinha a ++ formatarLinhas b

    calcularTotal :: [(Nome,Preco)] -> Int
    calcularTotal[] = 0
    calcularTotal ((n,p) : resto) = p + calcularTotal resto

    formatarTotal :: Int -> String
    formatarTotal total = formatarLinha("Total", total)

    formatarConta :: [(Nome,Preco)] -> String
    formatarConta conta = formatarLinhas conta ++ formatarTotal(calcularTotal conta)

    imprimirConta :: [CodigoDeBarra] -> IO()
    imprimirConta lista = putStr (formatarConta(fazerConta lista))

