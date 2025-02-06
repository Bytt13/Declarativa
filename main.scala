object ConverterEmail {
  def converterParaEmail(nome: String, dominio: String): String =
    nome.trim.toLowerCase.replaceAll(" ", ".") + s"@$dominio"

  def main(args: Array[String]): Unit = {
    println(converterParaEmail("João da Silva", "gmail.com"))
  }
}
