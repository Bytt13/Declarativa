object NumeroPorExtenso {
  private val unidades = List(
    "", "um", "dois", "três", "quatro", "cinco", "seis", "sete", "oito", "nove"
  )
  private val dezenas = List(
    "", "", "vinte", "trinta", "quarenta", "cinquenta", "sessenta", "setenta", "oitenta", "noventa"
  )
  private val especiais = List(
    "dez", "onze", "doze", "treze", "quatorze", "quinze", "dezesseis", "dezessete", "dezoito", "dezenove"
  )
  private val centenas = List(
    "", "cem", "duzentos", "trezentos", "quatrocentos", "quinhentos",
    "seiscentos", "setecentos", "oitocentos", "novecentos"
  )

  def numeroPorExtenso(numero: Int): String = {
    def extensoDeCentena(n: Int): String = {
      val (c, d, u) = (n / 100, (n % 100) / 10, n % 10)

      val centenaTexto = if (c == 1 && (d > 0 || u > 0)) "cento" else centenas(c)
      val dezenaTexto = if (d == 1) especiais(u) else dezenas(d)
      val unidadeTexto = if (d == 1) "" else unidades(u)

      List(centenaTexto, dezenaTexto, unidadeTexto).filter(_.nonEmpty).mkString(" e ")
    }

    if (numero == 0) "zero"
    else if (numero < 1000) extensoDeCentena(numero)
    else throw new IllegalArgumentException("Números maiores que 999 não são suportados.")
  }

  def main(args: Array[String]): Unit = {
    println(numeroPorExtenso(123)) // Saida: cento e vinte e três
    println(numeroPorExtenso(305)) // Saida: trezentos e cinco
    println(numeroPorExtenso(10))  // Saida: dez
    println(numeroPorExtenso(0))   // Saida: zero
    println(numeroPorExtenso(999)) // Saida: novecentos e noventa e nove
  }
}
