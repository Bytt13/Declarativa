object RelatorioVendas {
  case class Venda(produto: String, quantidade: Int, precoUnitario: Double)

  def calcularTotal(vendas: List[Venda]): Double =
    vendas.map(v => v.quantidade * v.precoUnitario).sum

  def gerarRelatorio(vendas: List[Venda]): String = {
    val detalhes = vendas.map(v => s"${v.produto}: ${v.quantidade} x ${v.precoUnitario} = ${v.quantidade * v.precoUnitario}").mkString("\n")
    s"""
    Relatório de Vendas:
    $detalhes
    -----------------
    Total: ${calcularTotal(vendas)}
    """
  }

  def main(args: Array[String]): Unit = {
    val vendas = List(Venda("Produto A", 10, 5.0), Venda("Produto B", 5, 20.0))
    println(gerarRelatorio(vendas))
  }
}

