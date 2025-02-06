object SistemaBiblioteca {
  case class Livro(titulo: String, autor: String, disponivel: Boolean)

  def buscarPorTitulo(livros: List[Livro], titulo: String): Option[Livro] =
    livros.find(_.titulo.equalsIgnoreCase(titulo))

  def emprestarLivro(livros: List[Livro], titulo: String): List[Livro] =
    livros.map {
      case livro if livro.titulo.equalsIgnoreCase(titulo) && livro.disponivel => livro.copy(disponivel = false)
      case livro => livro
    }

  def listarLivros(livros: List[Livro]): String =
    livros.map(l => s"${l.titulo} - Autor: ${l.autor}, Disponível: ${l.disponivel}").mkString("\n")

  def main(args: Array[String]): Unit = {
    val biblioteca = List(
      Livro("Scala Programming", "Martin Odersky", true),
      Livro("Functional Programming", "Paul Chiusano", true)
    )
    val atualizado = emprestarLivro(biblioteca, "Scala Programming")
    println(listarLivros(atualizado))
  }
}

