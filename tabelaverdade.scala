object GeradorTabelaVerdadeFuncional {

  // Gera combinações de valores lógicos para 2 variáveis
  def gerarCombinacoes: List[List[Boolean]] = {
    (0 until 4).toList.map { i =>
      i.toBinaryString.reverse.padTo(2, '0').reverse.map(_ == '1').toList
    }
  }

  // Funções puras que representam os operadores lógicos
  def operadorE(a: Boolean, b: Boolean): Boolean = a && b
  def operadorOU(a: Boolean, b: Boolean): Boolean = a || b
  def operadorNao(a: Boolean): Boolean = !a
  def operadorImplica(a: Boolean, b: Boolean): Boolean = !a || b
  def operadorXOR(a: Boolean, b: Boolean): Boolean = a ^ b
  def operadorSSE(a: Boolean, b: Boolean): Boolean = a == b

  // Aplica os operadores a uma combinação de valores
  def aplicarOperadores(combinacao: List[Boolean]): Map[String, Boolean] = {
    val (a, b) = (combinacao(0), combinacao(1))

    Map(
      "A" -> a,
      "B" -> b,
      "A E B" -> operadorE(a, b),
      "A OU B" -> operadorOU(a, b),
      "NÃO A" -> operadorNao(a),
      "A IMPLICA B" -> operadorImplica(a, b),
      "A XOR B" -> operadorXOR(a, b),
      "A SSE B" -> operadorSSE(a, b)
    )
  }

  // Gera a tabela de verdade formatada
  def gerarTabela: String = {
    val cabecalho = List("A", "B", "A E B", "A OU B", "NÃO A", "A IMPLICA B", "A XOR B", "A SSE B")
    val combinacoes = gerarCombinacoes
    val linhas = combinacoes.map(aplicarOperadores)

    // Constrói a tabela como uma string
    val tabela = linhas.map { linha =>
      cabecalho.map(c => linha.getOrElse(c, false).toString).mkString("\t")
    }

    cabecalho.mkString("\t") + "\n" + tabela.mkString("\n")
  }

  def main(args: Array[String]): Unit = {
    println("Tabela Verdade (2 Variáveis):")
    println(gerarTabela)
  }
}
