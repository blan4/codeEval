package easy

/**
 * @see https://www.codeeval.com/open_challenges/147/
 */
object LettercasePersentageRatio extends App {
  val source = scala.io.Source.fromFile(args(0))
  val lines = source.getLines().filter(_.length > 0)
  
  run(lines).foreach(println(_))
  
  def run(lines: Iterator[String]): Iterator[String] = {
    lines.map(line => {
      val totalCount = line.length.toDouble / 100.0
      val uppercase = line.count(_.isUpper) / totalCount
      val lowercase = 100.0 - uppercase
      
      f"lowercase: $lowercase%2.2f uppercase: $uppercase%2.2f"
    })
  }
}
