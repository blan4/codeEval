package moderate

/**
 * @see https://www.codeeval.com/open_challenges/200/
 */
object Main extends App {
  val source = scala.io.Source.fromFile(args(0))
  val lines = source.getLines().filter(_.length > 0)

  
  lines.foreach(line => {
    val matrix = new SortMatrixColumns(line.split('|').map(_.trim.split(' ').map(_.toInt)))
    println(matrix)
  })
}

class SortMatrixColumns(rows: Array[Array[Int]]) {
  val columns = rows.indices.map(i => {
    new Column(rows.map(_(i)))
  }).sorted
  
  override def toString: String = {
    columns.indices.map(i => {
      columns.map(_.elements(i)).mkString(" ")
    }).mkString(" | ")
  }
  
  class Column(val elements: Array[Int]) extends Ordered[Column] {
    override def compare(that: Column): Int = {
      (elements, that.elements).zipped.foreach((el: Int, thatEl: Int) => {
        if (el > thatEl) return 1
        if (el < thatEl) return -1
      })
      0
    }
  }
}
